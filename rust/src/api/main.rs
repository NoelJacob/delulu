use flutter_rust_bridge::frb;
use uuid::Uuid;

// use url::Url;

#[frb(sync)]
pub fn create_uuid() -> Uuid {
    Uuid::now_v7()
}

#[derive(Default)]
pub struct Article {
    pub id: u16,
    pub title: String,
    pub image: Vec<u8>,
    pub url: String,
    pub publisher: String,
    pub publisher_favicon: Vec<u8>,
}

pub fn load_articles(page: &str) -> Article {
    Article::default()
}

#[frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
