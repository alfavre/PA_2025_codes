# PA 2025 codes

## Author

```
Alban Favre
```

## Content

This is the repository holding all the codes and circuits that have been written for the 2025 PA.

### PA_HE_Auth

This holds the webserver code. To start it, you will need to run these commands:

```bash
cd PA_HE_Auth/he_auth_app
python3 app.py # or python app.py
```

This will start the app with the default DB that hold two users:

| username | password |
| -------- | -------- |
| a        | a        |
| k        | k        |

and default public, private, rotation keys. If you want to generate new keys, run:

```bash
cd PA_HE_Auth/he_auth_app
cbin/age_verification_init
```

If you want to register new user, a list of example passport are available at `PA_HE_Auth/he_auth_app/db_general/passports_clear.json`

You are expected to copy paste the passport json in the field in the app:

```json
    {
        "first_name": "Kyle",
        "last_name": "Kennedy",
        "birthdate": 18449,
        "hash": "b64417a50c635a4692d595045881969720b84a5f55f6c2c04667ce9df032e9b8",
        "signature": "6635f2f77e0a50cc42cc5f2f047b3248ac8a0b09a782a2a2946e32e7635225d8b340af33ba7264bdb43e3b27acdbd9b1fab5bfb817789037b9e01674dd7366f9a079d448abdd40884ab58775399101c5b43e8746dd7b846293c71bd2f60b8138248dc5f2f0bc4c8f79685dcbcaa788fcafaa490a7f983d3d77996c8b1de8249c491f0ef67c2833d0c77306184a8356ce75c6c8a95e72ea6f95fd5d23d13a04407e8cc2c7df4047a02a53940844365412610a45fb4975c2cf60985e6b03478fb9b4da21b4f1ebfe2a7f9b4d5c63abbb0f2c6f5b28357b95a5db3a41886985a19730baf91881cc5246a010ef98010e69e3d72c105e877fba8f341bc06f4c22092a"
    }
```

There is some helper code in `PA_HE_Auth/he_auth_app/helper_code` If you want to create a new passeport.

### PA_heir_code

This folder holds all the code written and needed by heir to generate the binaries, including some scripts. (Most of) These file need the full heir pipeline to be usable, but as the heir pipeline takes a lot of space, it is not availaible here, check: https://heir.dev/ for heir.

### PA_polygeist_code

This folder holds all the code written and needed by Polygeist to generate MLIR, including some scripts. (Most of) These file need the Polygeist binaries to be usable, but as these need to be compiled, they are not available here, check: https://polygeist.llvm.org/ for Polygeist.

