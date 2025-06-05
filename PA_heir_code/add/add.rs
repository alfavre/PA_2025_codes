
use rayon::prelude::*;
use std::collections::HashMap;
use tfhe::shortint::prelude::*;

use tfhe::shortint::server_key::LookupTableOwned;

enum GateInput {
    Tv(usize), // key in a global hashmap
}

use GateInput::*;

enum OpType<'a> {
    LUT3(&'a str), // key in a global hashmap
    ADD,
    LSH(u8), // shift value
}

use OpType::*;

pub fn add(
  v0: &ServerKey,
  v1: &Ciphertext,
  v2: &Ciphertext,
) -> Ciphertext {
  let mut temp_nodes : HashMap<usize, Ciphertext> = HashMap::new();
  let mut luts : HashMap<&str, LookupTableOwned> = HashMap::new();

  let lut3 = |args: &[&Ciphertext], lut: &LookupTableOwned, server_key: &ServerKey| -> Ciphertext {
      return server_key.apply_lookup_table(args[0], lut);
  };

  let add = |args: &[&Ciphertext], server_key: &ServerKey| -> Ciphertext {
      return server_key.unchecked_add(args[0], args[1]);
  };

  let left_shift = |args: &[&Ciphertext], shift: u8, server_key: &ServerKey| -> Ciphertext {
      return server_key.scalar_left_shift(args[0], shift);
  };

  let mut run_level = |
    server_key: &ServerKey,
    temp_nodes: &mut HashMap<usize, Ciphertext>,
    luts: &mut HashMap<&str, LookupTableOwned>,
    tasks: &[((OpType, usize), &[GateInput])]
  | {
      let updates = tasks
          .into_par_iter()
          .map(|(k, task_args)| {
              let (op_type, result) = k;
              let task_args = task_args.into_iter()
                .map(|arg| match arg {
                  Tv(ndx) => &temp_nodes[&ndx],
                }).collect::<Vec<_>>();
              let op = |args: &[&Ciphertext]| match op_type {
                LUT3(lut) => lut3(args, &luts[lut], server_key),
                ADD => add(args, server_key),
                LSH(shift) => left_shift(args, *shift, server_key)
              };
              ((result), op(&task_args))
          })
          .collect::<Vec<_>>();
      updates.into_iter().for_each(|(id, v)| {
        temp_nodes.insert(*id, v);
      });
  };

  temp_nodes.insert(1, v1.clone());
  temp_nodes.insert(2, v2.clone());
  static LEVEL_0_0 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 6), &[Tv(1), Tv(2)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_0_0);
  temp_nodes[&6].clone()
}
