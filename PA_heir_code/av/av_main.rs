use clap::Parser;
use tfhe::shortint::parameters::PARAM_MESSAGE_2_CARRY_2;
//use tfhe::shortint::*;
//use tfhe::shortint::{gen_keys, Ciphertext, ClientKey, ServerKey};
use tfhe::shortint::prelude::*;
use rayon::prelude::*;


mod av;

#[derive(Parser, Debug)]
struct Args {
    #[arg(id = "input_1", index = 1)]
    input1: u16,

    #[arg(id = "input_2", index = 2)]
    input2: u16,
}

fn main() {
    let args = Args::parse();

    // TFHE configuration and key generation
    let (client_key, server_key) = gen_keys(PARAM_MESSAGE_2_CARRY_2);

    // Convert u16s to 16-bit vectors
    let bits_input1: [bool; 16] = (0..16)
        .map(|i| (args.input1 >> i) & 1 != 0)
        .collect::<Vec<_>>()
        .try_into()
        .unwrap();
    let bits_input2: [bool; 16] = (0..16)
        .map(|i| (args.input2 >> i) & 1 != 0)
        .collect::<Vec<_>>()
        .try_into()
        .unwrap();

    // Convert u16s to bits
    let bits_input1: [bool; 16] = (0..16)
        .map(|i| (args.input1 >> i) & 1 != 0)
        .collect::<Vec<_>>()
        .try_into()
        .unwrap();

    let bits_input2: [bool; 16] = (0..16)
        .map(|i| (args.input2 >> i) & 1 != 0)
        .collect::<Vec<_>>()
        .try_into()
        .unwrap();

    // Encrypt inputs
    let enc_input1: [Ciphertext; 16] =
        std::array::from_fn(|i| client_key.encrypt(bits_input1[i] as u64));
    let enc_input2: [Ciphertext; 16] =
        std::array::from_fn(|i| client_key.encrypt(bits_input2[i] as u64));

    // Call the function
    let result = av::av(&server_key, &enc_input1, &enc_input2);

    let decrypted: Vec<u8> = result.iter().map(|c| client_key.decrypt(c) as u8).collect();

    let result_byte: u8 = decrypted
        .iter()
        .enumerate()
        .map(|(i, bit)| bit << i)
        .sum();

    println!("Result bits (8 LSBs): {:?}", decrypted);
    println!("Result as u8: {}", result_byte);
}
