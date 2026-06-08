use super::Game;
use wasm_bindgen::prelude::*;

pub const PLAYER_NAME: [&str; 3] = ["", "sun", "moon"];

#[wasm_bindgen]
impl Game {
    pub fn player_name(&self, player: usize) -> String {
        PLAYER_NAME[player].to_string()
    }

    pub fn player_active_set(&mut self, player: usize) -> Result<(), JsValue> {
        let name = self.player_name(player);

        self.storage.set_item("player-active", &name)?;

        Ok(())
    }

    pub fn player_active_get(&self) -> Result<usize, JsValue> {
        if let Some(name) = self.storage.get_item("player-active")? {
            return match name.as_str() {
                "sun" => Ok(1),
                "moon" => Ok(2),
                _ => Ok(0),
            };
        }

        Ok(0)
    }

    pub fn player_pieces_set(&mut self, player: usize, pieces: usize) -> Result<(), JsValue> {
        let key = format!("player-{}-pieces", player);

        self.storage.set_item(&key, &pieces.to_string())?;

        Ok(())
    }

    pub fn player_kills_get(&self, player: usize) -> Result<usize, JsValue> {
        let key = format!("player-{}-kills", player);

        if let Some(value) = self.storage.get_item(&key)? {
            return Ok(value.parse().unwrap_or(0));
        }

        Ok(0)
    }

    pub fn player_kills_set(&mut self, player: usize, kills: usize) -> Result<(), JsValue> {
        let key = format!("player-{}-kills", player);

        self.storage.set_item(&key, &kills.to_string())?;

        Ok(())
    }

    pub fn player_pieces_get(&self, player: usize) -> Result<usize, JsValue> {
        let key = format!("player-{}-pieces", player);

        if let Some(value) = self.storage.get_item(&key)? {
            return Ok(value.parse().unwrap_or(7));
        }

        Ok(7)
    }
}
