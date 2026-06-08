use crate::game::pieces::{STATE_MOON, STATE_SUN};

use super::Game;
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
impl Game {
    pub fn notation_get(&self) -> Result<String, JsValue> {
        let player = self.player_active_get()?;
        let sun_kills = self.player_kills_get(1)?;
        let moon_kills = self.player_kills_get(2)?;
        let sun_pieces = self.player_pieces_get(1)?;
        let moon_pieces = self.player_pieces_get(2)?;
        let board = self.notation_encode()?;
        let result = format!(
            "{};{}/{};{}/{};{}",
            player, sun_kills, moon_kills, sun_pieces, moon_pieces, board
        );

        Ok(result)
    }

    pub fn notation_encode(&self) -> Result<String, JsValue> {
        let mut content = String::new();

        for i in 0..49 {
            let value = self.board[i];

            if value > 0 {
                let piece = match value {
                    1..=4 => STATE_SUN[value - 1],
                    5..=8 => STATE_MOON[value - 5],
                    _ => "?",
                };

                content.push_str(piece);
            }
        }

        Ok(content)
    }

    pub fn notation_load(&self) {}

    pub fn notation_save(&self) -> Result<(), JsValue> {
        let content = self.notation_get()?;
        web_sys::console::log_1(&content.clone().into());
        self.storage.set_item("notation", &content)?;

        Ok(())
    }
}
