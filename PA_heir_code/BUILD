# A library build target that encapsulates the HEIR-generated code.
cc_library(
    name = "dot_product_codegen",
    srcs = ["dot_product/heir_output.cpp"],
    hdrs = ["dot_product/heir_output.h"],
    deps = ["@openfhe//:pke"],
)

# An executable build target that contains your main function and links
# against the above.
cc_binary(
    name = "dot_product_main",
    srcs = ["dot_product/dot_product_main.cpp"],
    deps = [
        ":dot_product_codegen",
        "@openfhe//:pke",
        "@openfhe//:core",
    ],
)

#------------------------------------------------------------

# A library build target that encapsulates the HEIR-generated code.
cc_library(
    name = "age_verification_codegen",
    srcs = ["age_verification/heir_output.cpp"],
    hdrs = ["age_verification/heir_output.h"],
    deps = ["@openfhe//:pke"],
)

# main
cc_binary(
    name = "age_verification_main",
    srcs = ["age_verification/age_verification_main.cpp"],
    deps = [
        ":age_verification_codegen",
        "@openfhe//:pke",
        "@openfhe//:core",
    ],
)

# init
cc_binary(
    name = "age_verification_init",
    srcs = ["age_verification/age_verification_init.cpp"],
    deps = [
        ":age_verification_codegen",
        "@openfhe//:pke",
        "@openfhe//:core",
    ],
)

#encrypt
cc_binary(
    name = "age_verification_decrypt",
    srcs = ["age_verification/age_verification_decrypt.cpp"],
    deps = [
        ":age_verification_codegen",
        "@openfhe//:pke",
        "@openfhe//:core",
    ],
)

#decrypt
cc_binary(
    name = "age_verification_encrypt",
    srcs = ["age_verification/age_verification_encrypt.cpp"],
    deps = [
        ":age_verification_codegen",
        "@openfhe//:pke",
        "@openfhe//:core",
    ],
)

#--------------------------------------------

load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library") # from chat gpt
load("//bazel:lit.bzl", "glob_lit_tests") # from tests
package(default_applicable_licenses = ["@heir//:license"]) # from tests

genrule(
    name = "generate_add_rs",
    srcs = ["add/add.mlir"],
    outs = ["add/add.rs"],
    cmd = "heir-translate $(location add/add.mlir) --emit-tfhe-rust --use-levels > $@",
    tools = ["@heir_tools//:heir-translate"],
)

rust_library(
    name = "add_lib",
    srcs = ["add/add.rs"],
    edition = "2021",
    crate_type = "lib",
    deps = [
        "@crates_io//:tfhe",
    ],
)

rust_binary(
    name = "add_main",
    srcs = ["add/add_main.rs"],
    edition = "2021",
    deps = [
        ":add_lib",
        "@crates_io//:clap",
        "@crates_io//:tfhe",
    ],
)
