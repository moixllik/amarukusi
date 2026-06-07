mod game;

pub use game::new_game;
use wasm_bindgen::prelude::*;

#[wasm_bindgen(start)]
pub fn start() {
    // web_sys::console::log_1(&"Hi".into());
}
