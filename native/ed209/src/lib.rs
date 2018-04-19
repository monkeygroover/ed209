#[macro_use] extern crate rustler;
#[macro_use] extern crate lazy_static;
extern crate sha2;
extern crate ed25519_dalek;

use rustler::{NifEnv, NifTerm, NifResult, NifEncoder};

mod atoms {
    rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler_export_nifs! {
    "Elixir.Ed209",
    [("verify_signature", 3, verify_signature)],
    None
}

fn verify_signature<'a>(env: NifEnv<'a>, args: &[NifTerm<'a>]) -> NifResult<NifTerm<'a>> {
    use ed25519_dalek::{PublicKey, Signature};

    let public_key_bytes: &[u8] = args[0].into_binary()?.as_slice();
    let signature_bytes: &[u8] = args[1].into_binary()?.as_slice();
    let message_bytes: &[u8] = args[2].into_binary()?.as_slice();

    let verified: bool = match PublicKey::from_bytes(public_key_bytes) {
       Ok(public_key) => {
            match Signature::from_bytes(signature_bytes) {
                Ok(signature) => public_key.verify::<sha2::Sha512>(message_bytes, &signature),
                _ => false,
            }
       }
       _ => false,
    };

     Ok((atoms::ok(), verified).encode(env))
}
