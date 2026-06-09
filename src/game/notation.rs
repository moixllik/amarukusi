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

    pub fn notation_set(&mut self, notation: &str) -> Result<(), JsValue> {
        let parts: Vec<&str> = notation.split(';').collect();

        if parts.len() != 4 {
            return Err("Invalid notation".into());
        }

        if let Some(player) = parts[0].parse::<usize>().ok() {
            self.player_active_set(player)?;
        }

        if let Some((sun, moon)) = parts[1].split_once("/") {
            self.player_kills_set(1, sun.parse().unwrap_or(0))?;
            self.player_kills_set(2, moon.parse().unwrap_or(0))?;
        }

        if let Some((sun, moon)) = parts[2].split_once("/") {
            self.player_pieces_set(1, sun.parse().unwrap_or(0))?;
            self.player_pieces_set(2, moon.parse().unwrap_or(0))?;
        }

        self.notation_decode(parts[3])?;

        self.canvas_draw()?;

        Ok(())
    }

    pub fn notation_encode(&self) -> Result<String, JsValue> {
        let mut content = String::new();
        let mut sep = 0;

        for y in 0..7 {
            for x in 0..7 {
                let i = x + y * 7;
                let value = self.board[i];

                if value > 0 {
                    if sep > 0 {
                        content.push_str(&sep.to_string());
                        sep = 0;
                    }
                    let piece = match value {
                        1..=4 => STATE_SUN[value - 1],
                        5..=8 => STATE_MOON[value - 5],
                        _ => "?",
                    };

                    content.push_str(piece);
                } else {
                    sep += 1;
                }
            }

            sep = 0;
            content.push('/');
        }

        Ok(content)
    }

    pub fn notation_decode(&mut self, content: &str) -> Result<(), JsValue> {
        for (y, row) in content.split("/").enumerate() {
            let mut i = y * 7;

            for piece in row.chars() {
                let value = match piece {
                    'K'..='N' => piece as usize - 'K' as usize + 1,
                    'P'..='S' => piece as usize - 'P' as usize + 5,
                    '1'..='6' => {
                        i += piece.to_string().parse::<usize>().unwrap_or(0);
                        continue;
                    }
                    _ => continue,
                };

                self.board[i] = value;
                i += 1;
            }
        }

        Ok(())
    }

    pub fn notation_load(&mut self) -> Result<(), JsValue> {
        if let Some(notation) = self.storage.get_item("notation")? {
            self.notation_set(&notation)?;
        }

        Ok(())
    }

    pub fn notation_save(&self) -> Result<(), JsValue> {
        let content = self.notation_get()?;

        self.storage.set_item("notation", &content)?;

        Ok(())
    }
}
