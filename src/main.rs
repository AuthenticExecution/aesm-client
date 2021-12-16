use std::env;

static AESM_PORT_ENV : &str  = "AESM_PORT";
static AESM_DEFAULT_PORT : u16 = 13741;

fn main() {
    let aesm_port = env::var(AESM_PORT_ENV)
        .map_or(AESM_DEFAULT_PORT, |x| x.parse::<u16>().unwrap_or(AESM_DEFAULT_PORT));

    ctrlc::set_handler(|| { std::process::exit(0); }).expect("Error setting Ctrl-C handler");

    sgx_attestation::start_client(aesm_port).unwrap();
}
