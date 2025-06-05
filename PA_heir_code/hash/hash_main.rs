use clap::Parser;
use tfhe::boolean::prelude::*;

mod hash;

#[derive(Parser, Debug)]
struct Args {
    #[arg(id = "input_1", index = 1)]
    input1: i16,

    #[arg(id = "input_2", index = 2)]
    input2: i16,

    #[arg(id = "input_3", index = 3)]
    input3: u8,
}

fn main() {
    let flags = Args::parse();

    //  let parameters = get_parameters_from_message_and_carry((1 << flags.message_bits) - 1, flags.carry_bits);
    let (client_key, server_key) = tfhe::boolean::gen_keys(); //tfhe::shortint::gen_keys(parameters);

    // Encrypt input1 and input2 bit-by-bit
    let ct_vec1: Vec<Ciphertext> = (0..16)
        .map(|i| client_key.encrypt((flags.input1 >> i) & 1 != 0))
        .collect();
    println!("encrypt ct_vec1");

    let ct_vec2: Vec<Ciphertext> = (0..16)
        .map(|i| client_key.encrypt((flags.input2 >> i) & 1 != 0))
        .collect();
    println!("encrypt ct_vec2");

    let ct_3 = client_key.encrypt(flags.input3 == 1u8);
    println!("encrypt ct_3");

    let result = hash::hash(&server_key, &ct_vec1, &ct_vec2, &ct_3);
    println!("circuit time");

    // Decrypt and reconstruct i16
    let decrypted_bits: Vec<bool> = result.iter().map(|bit| client_key.decrypt(bit)).collect();
    println!("decrypt result");

    let mut final_value: i16 = 0;
    for (i, bit) in decrypted_bits.iter().enumerate() {
        if *bit {
            final_value |= 1 << i;
        }
    }

    println!("{}", final_value);
}
