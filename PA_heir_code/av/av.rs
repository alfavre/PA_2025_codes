
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

pub fn av(
  v0: &ServerKey,
  v1: &[Ciphertext; 16],
  v2: &[Ciphertext; 16],
) -> [Ciphertext; 8] {
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

  let v3 : bool = false;
  let v4 = 0;
  let v5 = 1;
  let v6 = 2;
  let v7 = 3;
  let v8 = 4;
  let v9 = 5;
  let v10 = 7;
  let v11 = 6;
  let v12 = 8;
  let v13 = 9;
  let v14 = 10;
  let v15 = 11;
  let v16 = 12;
  let v17 = 13;
  let v18 = 14;
  let v19 = 15;
  luts.insert("v20", v0.generate_lookup_table(|x| (20 >> x) & 1));
  luts.insert("v21", v0.generate_lookup_table(|x| (9 >> x) & 1));
  luts.insert("v22", v0.generate_lookup_table(|x| (128 >> x) & 1));
  luts.insert("v23", v0.generate_lookup_table(|x| (8 >> x) & 1));
  luts.insert("v24", v0.generate_lookup_table(|x| (16 >> x) & 1));
  luts.insert("v25", v0.generate_lookup_table(|x| (6 >> x) & 1));
  luts.insert("v26", v0.generate_lookup_table(|x| (150 >> x) & 1));
  luts.insert("v27", v0.generate_lookup_table(|x| (4 >> x) & 1));
  luts.insert("v28", v0.generate_lookup_table(|x| (144 >> x) & 1));
  luts.insert("v29", v0.generate_lookup_table(|x| (105 >> x) & 1));
  luts.insert("v30", v0.generate_lookup_table(|x| (178 >> x) & 1));
  luts.insert("v31", v0.generate_lookup_table(|x| (43 >> x) & 1));
  luts.insert("v32", v0.generate_lookup_table(|x| (113 >> x) & 1));
  luts.insert("v33", v0.generate_lookup_table(|x| (13 >> x) & 1));
  luts.insert("v34", v0.generate_lookup_table(|x| (208 >> x) & 1));
  let v35 = v0.create_trivial(v3 as u64);
  temp_nodes.insert(38, v35.clone());
  temp_nodes.insert(39, v2[v4].clone());
  temp_nodes.insert(40, v1[v4].clone());
  static LEVEL_0_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 41), &[Tv(38)]), ((LSH(1), 42), &[Tv(39)]), ];
  static LEVEL_0_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 43), &[Tv(41), Tv(42)]), ];
  static LEVEL_0_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 44), &[Tv(43), Tv(40)]), ];
  static LEVEL_0_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v27"), 45), &[Tv(44)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_0_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_0_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_0_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_0_3);
  temp_nodes.insert(46, v2[v5].clone());
  temp_nodes.insert(47, v1[v5].clone());
  static LEVEL_1_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 48), &[Tv(46)]), ((LSH(1), 49), &[Tv(47)]), ];
  static LEVEL_1_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 50), &[Tv(48), Tv(49)]), ];
  static LEVEL_1_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 51), &[Tv(50), Tv(45)]), ];
  static LEVEL_1_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v30"), 52), &[Tv(51)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_1_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_1_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_1_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_1_3);
  temp_nodes.insert(53, v2[v6].clone());
  temp_nodes.insert(54, v1[v6].clone());
  static LEVEL_2_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 55), &[Tv(53)]), ((LSH(1), 56), &[Tv(54)]), ];
  static LEVEL_2_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 57), &[Tv(55), Tv(56)]), ];
  static LEVEL_2_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 58), &[Tv(57), Tv(52)]), ];
  static LEVEL_2_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v30"), 59), &[Tv(58)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_2_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_2_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_2_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_2_3);
  temp_nodes.insert(60, v2[v7].clone());
  temp_nodes.insert(61, v1[v7].clone());
  static LEVEL_3_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 62), &[Tv(60)]), ((LSH(1), 63), &[Tv(61)]), ];
  static LEVEL_3_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 64), &[Tv(62), Tv(63)]), ];
  static LEVEL_3_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 65), &[Tv(64), Tv(59)]), ];
  static LEVEL_3_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v30"), 66), &[Tv(65)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_3_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_3_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_3_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_3_3);
  temp_nodes.insert(67, v2[v8].clone());
  temp_nodes.insert(68, v1[v8].clone());
  static LEVEL_4_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 69), &[Tv(67)]), ((LSH(1), 70), &[Tv(68)]), ];
  static LEVEL_4_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 71), &[Tv(69), Tv(70)]), ];
  static LEVEL_4_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 72), &[Tv(71), Tv(66)]), ];
  static LEVEL_4_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v30"), 73), &[Tv(72)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_4_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_4_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_4_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_4_3);
  temp_nodes.insert(74, v2[v9].clone());
  temp_nodes.insert(75, v1[v9].clone());
  static LEVEL_5_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 76), &[Tv(74)]), ((LSH(1), 77), &[Tv(75)]), ];
  static LEVEL_5_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 78), &[Tv(76), Tv(77)]), ];
  static LEVEL_5_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 79), &[Tv(78), Tv(73)]), ];
  static LEVEL_5_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v30"), 80), &[Tv(79)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_5_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_5_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_5_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_5_3);
  temp_nodes.insert(81, v1[v10].clone());
  temp_nodes.insert(82, v2[v10].clone());
  static LEVEL_6_0 : [((OpType, usize), &[GateInput]); 1] = [((LSH(1), 83), &[Tv(81)]), ];
  static LEVEL_6_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 84), &[Tv(41), Tv(83)]), ];
  static LEVEL_6_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 85), &[Tv(84), Tv(82)]), ];
  static LEVEL_6_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v27"), 86), &[Tv(85)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_6_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_6_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_6_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_6_3);
  temp_nodes.insert(87, v2[v11].clone());
  temp_nodes.insert(88, v1[v11].clone());
  static LEVEL_7_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 89), &[Tv(86)]), ((LSH(1), 90), &[Tv(87)]), ];
  static LEVEL_7_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 91), &[Tv(89), Tv(90)]), ];
  static LEVEL_7_2 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 92), &[Tv(91), Tv(88)]), ((LSH(1), 94), &[Tv(88)]), ];
  static LEVEL_7_3 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 95), &[Tv(41), Tv(94)]), ((LUT3("v33"), 93), &[Tv(92)]), ];
  static LEVEL_7_4 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 96), &[Tv(95), Tv(87)]), ((LSH(2), 98), &[Tv(93)]), ((LSH(1), 99), &[Tv(80)]), ];
  static LEVEL_7_5 : [((OpType, usize), &[GateInput]); 2] = [((LUT3("v21"), 97), &[Tv(96)]), ((ADD, 100), &[Tv(98), Tv(99)]), ];
  static LEVEL_7_6 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 101), &[Tv(100), Tv(97)]), ];
  static LEVEL_7_7 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v34"), 102), &[Tv(101)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_7_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_7_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_7_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_7_3);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_7_4);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_7_5);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_7_6);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_7_7);
  temp_nodes.insert(103, v1[v12].clone());
  temp_nodes.insert(104, v2[v12].clone());
  static LEVEL_8_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(1), 109), &[Tv(82)]), ((LSH(1), 105), &[Tv(103)]), ];
  static LEVEL_8_1 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 110), &[Tv(41), Tv(109)]), ((ADD, 106), &[Tv(41), Tv(105)]), ];
  static LEVEL_8_2 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 107), &[Tv(106), Tv(104)]), ((ADD, 111), &[Tv(110), Tv(81)]), ];
  static LEVEL_8_3 : [((OpType, usize), &[GateInput]); 2] = [((LUT3("v21"), 108), &[Tv(107)]), ((LUT3("v27"), 112), &[Tv(111)]), ];
  static LEVEL_8_4 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 113), &[Tv(108)]), ((LSH(1), 114), &[Tv(112)]), ];
  static LEVEL_8_5 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 115), &[Tv(113), Tv(114)]), ];
  static LEVEL_8_6 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 116), &[Tv(115), Tv(102)]), ];
  static LEVEL_8_7 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v24"), 117), &[Tv(116)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_8_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_8_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_8_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_8_3);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_8_4);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_8_5);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_8_6);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_8_7);
  temp_nodes.insert(118, v1[v13].clone());
  temp_nodes.insert(119, v2[v13].clone());
  static LEVEL_9_0 : [((OpType, usize), &[GateInput]); 1] = [((LSH(1), 120), &[Tv(118)]), ];
  static LEVEL_9_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 121), &[Tv(41), Tv(120)]), ];
  static LEVEL_9_2 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 122), &[Tv(121), Tv(119)]), ((LSH(1), 129), &[Tv(119)]), ];
  static LEVEL_9_3 : [((OpType, usize), &[GateInput]); 2] = [((LUT3("v27"), 123), &[Tv(122)]), ((ADD, 130), &[Tv(41), Tv(129)]), ];
  static LEVEL_9_4 : [((OpType, usize), &[GateInput]); 3] = [((LSH(2), 124), &[Tv(123)]), ((LSH(1), 125), &[Tv(104)]), ((ADD, 131), &[Tv(130), Tv(118)]), ];
  static LEVEL_9_5 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 126), &[Tv(124), Tv(125)]), ((LUT3("v27"), 132), &[Tv(131)]), ];
  static LEVEL_9_6 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 127), &[Tv(126), Tv(103)]), ((LSH(2), 133), &[Tv(132)]), ((LSH(1), 134), &[Tv(117)]), ];
  static LEVEL_9_7 : [((OpType, usize), &[GateInput]); 2] = [((LUT3("v33"), 128), &[Tv(127)]), ((ADD, 135), &[Tv(133), Tv(134)]), ];
  static LEVEL_9_8 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 136), &[Tv(135), Tv(128)]), ];
  static LEVEL_9_9 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v33"), 137), &[Tv(136)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_3);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_4);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_5);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_6);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_7);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_8);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_9_9);
  temp_nodes.insert(138, v1[v14].clone());
  temp_nodes.insert(139, v2[v14].clone());
  static LEVEL_10_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 140), &[Tv(137)]), ((LSH(1), 141), &[Tv(138)]), ];
  static LEVEL_10_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 142), &[Tv(140), Tv(141)]), ];
  static LEVEL_10_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 143), &[Tv(142), Tv(139)]), ];
  static LEVEL_10_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v31"), 144), &[Tv(143)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_10_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_10_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_10_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_10_3);
  temp_nodes.insert(145, v1[v15].clone());
  temp_nodes.insert(146, v2[v15].clone());
  static LEVEL_11_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 147), &[Tv(145)]), ((LSH(1), 148), &[Tv(144)]), ];
  static LEVEL_11_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 149), &[Tv(147), Tv(148)]), ];
  static LEVEL_11_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 150), &[Tv(149), Tv(146)]), ];
  static LEVEL_11_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v32"), 151), &[Tv(150)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_11_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_11_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_11_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_11_3);
  temp_nodes.insert(152, v1[v16].clone());
  temp_nodes.insert(153, v2[v16].clone());
  static LEVEL_12_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 154), &[Tv(151)]), ((LSH(1), 155), &[Tv(152)]), ];
  static LEVEL_12_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 156), &[Tv(154), Tv(155)]), ];
  static LEVEL_12_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 157), &[Tv(156), Tv(153)]), ];
  static LEVEL_12_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v31"), 158), &[Tv(157)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_12_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_12_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_12_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_12_3);
  temp_nodes.insert(159, v1[v17].clone());
  temp_nodes.insert(160, v2[v17].clone());
  static LEVEL_13_0 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 161), &[Tv(158)]), ((LSH(1), 162), &[Tv(159)]), ];
  static LEVEL_13_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 163), &[Tv(161), Tv(162)]), ];
  static LEVEL_13_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 164), &[Tv(163), Tv(160)]), ];
  static LEVEL_13_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v30"), 165), &[Tv(164)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_13_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_13_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_13_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_13_3);
  temp_nodes.insert(166, v2[v18].clone());
  temp_nodes.insert(167, v1[v18].clone());
  static LEVEL_14_0 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 201), &[Tv(41), Tv(49)]), ];
  static LEVEL_14_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 202), &[Tv(201), Tv(46)]), ];
  static LEVEL_14_2 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v21"), 203), &[Tv(202)]), ];
  static LEVEL_14_3 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 204), &[Tv(203)]), ((LSH(1), 205), &[Tv(40)]), ];
  static LEVEL_14_4 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 194), &[Tv(41), Tv(90)]), ((ADD, 206), &[Tv(204), Tv(205)]), ];
  static LEVEL_14_5 : [((OpType, usize), &[GateInput]); 4] = [((ADD, 195), &[Tv(194), Tv(88)]), ((LSH(2), 197), &[Tv(81)]), ((ADD, 207), &[Tv(206), Tv(39)]), ((LSH(1), 220), &[Tv(139)]), ];
  static LEVEL_14_6 : [((OpType, usize), &[GateInput]); 4] = [((LUT3("v27"), 196), &[Tv(195)]), ((ADD, 198), &[Tv(197), Tv(109)]), ((LUT3("v28"), 208), &[Tv(207)]), ((ADD, 221), &[Tv(41), Tv(220)]), ];
  static LEVEL_14_7 : [((OpType, usize), &[GateInput]); 4] = [((ADD, 199), &[Tv(198), Tv(196)]), ((LSH(1), 209), &[Tv(208)]), ((ADD, 222), &[Tv(221), Tv(138)]), ((LSH(1), 224), &[Tv(146)]), ];
  static LEVEL_14_8 : [((OpType, usize), &[GateInput]); 5] = [((LUT3("v29"), 200), &[Tv(199)]), ((ADD, 210), &[Tv(41), Tv(209)]), ((ADD, 213), &[Tv(41), Tv(125)]), ((LUT3("v27"), 223), &[Tv(222)]), ((ADD, 225), &[Tv(147), Tv(224)]), ];
  static LEVEL_14_9 : [((OpType, usize), &[GateInput]); 4] = [((ADD, 211), &[Tv(210), Tv(200)]), ((ADD, 214), &[Tv(213), Tv(103)]), ((LSH(2), 216), &[Tv(118)]), ((ADD, 226), &[Tv(225), Tv(223)]), ];
  static LEVEL_14_10 : [((OpType, usize), &[GateInput]); 4] = [((LUT3("v23"), 212), &[Tv(211)]), ((LUT3("v27"), 215), &[Tv(214)]), ((ADD, 217), &[Tv(216), Tv(129)]), ((LUT3("v26"), 227), &[Tv(226)]), ];
  static LEVEL_14_11 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 218), &[Tv(217), Tv(215)]), ((LSH(2), 228), &[Tv(212)]), ((LSH(1), 229), &[Tv(227)]), ];
  static LEVEL_14_12 : [((OpType, usize), &[GateInput]); 3] = [((LUT3("v26"), 219), &[Tv(218)]), ((ADD, 230), &[Tv(228), Tv(229)]), ((ADD, 233), &[Tv(41), Tv(56)]), ];
  static LEVEL_14_13 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 231), &[Tv(230), Tv(219)]), ((ADD, 234), &[Tv(233), Tv(53)]), ];
  static LEVEL_14_14 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 191), &[Tv(41), Tv(63)]), ((LUT3("v24"), 232), &[Tv(231)]), ((LUT3("v25"), 235), &[Tv(234)]), ];
  static LEVEL_14_15 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 192), &[Tv(191), Tv(60)]), ((LSH(2), 236), &[Tv(232)]), ((LSH(1), 237), &[Tv(235)]), ];
  static LEVEL_14_16 : [((OpType, usize), &[GateInput]); 3] = [((LUT3("v25"), 193), &[Tv(192)]), ((ADD, 188), &[Tv(41), Tv(70)]), ((ADD, 238), &[Tv(236), Tv(237)]), ];
  static LEVEL_14_17 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 189), &[Tv(188), Tv(67)]), ((ADD, 239), &[Tv(238), Tv(193)]), ];
  static LEVEL_14_18 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 185), &[Tv(41), Tv(77)]), ((LUT3("v25"), 190), &[Tv(189)]), ((LUT3("v24"), 240), &[Tv(239)]), ];
  static LEVEL_14_19 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 186), &[Tv(185), Tv(74)]), ((LSH(2), 241), &[Tv(240)]), ((LSH(1), 242), &[Tv(190)]), ];
  static LEVEL_14_20 : [((OpType, usize), &[GateInput]); 2] = [((LUT3("v25"), 187), &[Tv(186)]), ((ADD, 243), &[Tv(241), Tv(242)]), ];
  static LEVEL_14_21 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 244), &[Tv(243), Tv(187)]), ];
  static LEVEL_14_22 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v24"), 245), &[Tv(244)]), ];
  static LEVEL_14_23 : [((OpType, usize), &[GateInput]); 1] = [((LSH(1), 246), &[Tv(245)]), ];
  static LEVEL_14_24 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 247), &[Tv(41), Tv(246)]), ];
  static LEVEL_14_25 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 248), &[Tv(247), Tv(97)]), ((LSH(1), 250), &[Tv(108)]), ];
  static LEVEL_14_26 : [((OpType, usize), &[GateInput]); 2] = [((LUT3("v23"), 249), &[Tv(248)]), ((ADD, 251), &[Tv(41), Tv(250)]), ];
  static LEVEL_14_27 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 252), &[Tv(251), Tv(249)]), ];
  static LEVEL_14_28 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 179), &[Tv(41), Tv(155)]), ((ADD, 182), &[Tv(41), Tv(141)]), ((LUT3("v23"), 253), &[Tv(252)]), ];
  static LEVEL_14_29 : [((OpType, usize), &[GateInput]); 4] = [((LSH(1), 169), &[Tv(167)]), ((ADD, 180), &[Tv(179), Tv(153)]), ((ADD, 183), &[Tv(182), Tv(139)]), ((LSH(1), 254), &[Tv(253)]), ];
  static LEVEL_14_30 : [((OpType, usize), &[GateInput]); 5] = [((ADD, 173), &[Tv(41), Tv(162)]), ((ADD, 176), &[Tv(41), Tv(169)]), ((LUT3("v21"), 181), &[Tv(180)]), ((LUT3("v21"), 184), &[Tv(183)]), ((ADD, 255), &[Tv(41), Tv(254)]), ];
  static LEVEL_14_31 : [((OpType, usize), &[GateInput]); 4] = [((ADD, 174), &[Tv(173), Tv(160)]), ((ADD, 177), &[Tv(176), Tv(166)]), ((ADD, 256), &[Tv(255), Tv(184)]), ((LSH(1), 258), &[Tv(181)]), ];
  static LEVEL_14_32 : [((OpType, usize), &[GateInput]); 4] = [((LUT3("v21"), 175), &[Tv(174)]), ((LUT3("v21"), 178), &[Tv(177)]), ((LUT3("v23"), 257), &[Tv(256)]), ((ADD, 259), &[Tv(41), Tv(258)]), ];
  static LEVEL_14_33 : [((OpType, usize), &[GateInput]); 4] = [((LSH(2), 168), &[Tv(166)]), ((ADD, 260), &[Tv(259), Tv(257)]), ((LSH(2), 262), &[Tv(175)]), ((LSH(1), 263), &[Tv(178)]), ];
  static LEVEL_14_34 : [((OpType, usize), &[GateInput]); 3] = [((ADD, 170), &[Tv(168), Tv(169)]), ((LUT3("v23"), 261), &[Tv(260)]), ((ADD, 264), &[Tv(262), Tv(263)]), ];
  static LEVEL_14_35 : [((OpType, usize), &[GateInput]); 2] = [((ADD, 171), &[Tv(170), Tv(165)]), ((ADD, 265), &[Tv(264), Tv(261)]), ];
  static LEVEL_14_36 : [((OpType, usize), &[GateInput]); 2] = [((LUT3("v30"), 172), &[Tv(171)]), ((LUT3("v22"), 266), &[Tv(265)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_3);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_4);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_5);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_6);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_7);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_8);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_9);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_10);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_11);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_12);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_13);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_14);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_15);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_16);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_17);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_18);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_19);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_20);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_21);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_22);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_23);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_24);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_25);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_26);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_27);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_28);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_29);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_30);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_31);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_32);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_33);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_34);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_35);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_14_36);
  temp_nodes.insert(267, v1[v19].clone());
  temp_nodes.insert(268, v2[v19].clone());
  static LEVEL_15_0 : [((OpType, usize), &[GateInput]); 1] = [((LSH(1), 269), &[Tv(267)]), ];
  static LEVEL_15_1 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 270), &[Tv(41), Tv(269)]), ];
  static LEVEL_15_2 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 271), &[Tv(270), Tv(268)]), ];
  static LEVEL_15_3 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v21"), 272), &[Tv(271)]), ];
  static LEVEL_15_4 : [((OpType, usize), &[GateInput]); 2] = [((LSH(2), 273), &[Tv(272)]), ((LSH(1), 274), &[Tv(172)]), ];
  static LEVEL_15_5 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 275), &[Tv(273), Tv(274)]), ];
  static LEVEL_15_6 : [((OpType, usize), &[GateInput]); 1] = [((ADD, 276), &[Tv(275), Tv(266)]), ];
  static LEVEL_15_7 : [((OpType, usize), &[GateInput]); 1] = [((LUT3("v20"), 277), &[Tv(276)]), ];
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_15_0);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_15_1);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_15_2);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_15_3);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_15_4);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_15_5);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_15_6);
  run_level(v0, &mut temp_nodes, &mut luts, &LEVEL_15_7);
  let mut v275 : HashMap<(usize), Ciphertext> = HashMap::new();
  v275.insert((v4 as usize), temp_nodes[&277].clone());
  v275.insert((v5 as usize), v35.clone());
  v275.insert((v6 as usize), v35.clone());
  v275.insert((v7 as usize), v35.clone());
  v275.insert((v8 as usize), v35.clone());
  v275.insert((v9 as usize), v35.clone());
  v275.insert((v11 as usize), v35.clone());
  v275.insert((v10 as usize), v35.clone());
  core::array::from_fn(|i0| v275.get(&(i0)).unwrap().clone())
}
