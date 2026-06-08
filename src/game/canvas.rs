use super::Game;
use crate::game::pieces::{STATE_MOON, STATE_SUN};
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
impl Game {
    pub fn canvas_resize(&mut self) -> Result<(), JsValue> {
        let window = web_sys::window().expect("Error: Window");
        let width = window.inner_width()?.as_f64().unwrap();
        let height = window.inner_height()?.as_f64().unwrap();

        self.size = (width.min(height) / 9.0).floor();

        let size = (self.size * 9.0) as u32;

        self.canvas.set_width(size);
        self.canvas.set_height(size);

        self.canvas_draw()
    }

    pub fn canvas_draw(&self) -> Result<(), JsValue> {
        let size = self.size * 9.0;

        self.context.clear_rect(0.0, 0.0, size, size);

        // Board
        self.board_draw()?;

        // Player
        let player = self.player_active_get()?;

        match player {
            1 => {
                self.piece_draw(3.0, 8.0, "white", 0)?;
                self.piece_draw(4.0, 0.0, "black", 0)?;
            }
            2 => {
                self.piece_draw(4.0, 8.0, "white", 0)?;
                self.piece_draw(5.0, 0.0, "black", 0)?;
            }
            _ => {
                self.piece_draw(4.0, 8.0, "white", 0)?;
                self.piece_draw(4.0, 0.0, "black", 0)?;
            }
        }

        // Sun Piece
        let sun_state = self.piece_state_get(1)?;

        self.piece_draw(8.0, 8.0, "white", sun_state)?;
        self.board_text(&STATE_SUN[sun_state], 8.5, 8.5, "black", 0.20)?;

        // Moon Piece
        let moon_state = self.piece_state_get(2)?;

        self.piece_draw(0.0, 0.0, "black", moon_state)?;
        self.board_text(&STATE_MOON[moon_state], 0.5, 0.5, "white", 0.20)?;

        // Sun Information
        let sun_kills = self.player_kills_get(1)?;
        let sun_pieces = self.player_pieces_get(1)?;

        self.board_text(&sun_kills.to_string(), 8.5, 7.5, "black", 0.7)?; // Kills
        self.board_text(&sun_pieces.to_string(), 7.5, 8.5, "white", 0.7)?; // Pieces

        // Moon Information
        let moon_kills = self.player_kills_get(2)?;
        let moon_pieces = self.player_pieces_get(2)?;

        self.board_text(&moon_kills.to_string(), 0.5, 1.5, "white", 0.7)?; // Kills
        self.board_text(&moon_pieces.to_string(), 1.5, 0.5, "black", 0.7)?; // Pieces

        Ok(())
    }
}
