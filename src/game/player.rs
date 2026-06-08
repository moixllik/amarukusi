use super::Game;
use wasm_bindgen::prelude::*;

pub const PLAYER_NAME: [&str; 3] = ["", "sun", "moon"];

#[wasm_bindgen]
impl Game {
    pub fn player_name(&self, player: usize) -> String {
        PLAYER_NAME[player].to_string()
    }
}
