use flutter_rust_bridge::frb;
use uuid::Uuid;

#[frb(sync)]
pub fn gen_uuid() -> String {
    Uuid::now_v7().to_string()
}

#[frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
