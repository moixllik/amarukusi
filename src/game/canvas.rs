use super::Game;
use crate::game::pieces::{STATE_MOON, STATE_SUN};
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
impl Game {
    pub fn canvas_resize(&mut self) -> Result<(), JsValue> {
        let window = web_sys::window().expect("Window");
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

        // Piece Sun
        let state_sun = self.piece_state_get(1)?;

        self.piece_draw(8.0, 8.0, "white", state_sun)?;
        self.board_text(&STATE_SUN[state_sun], 8.5, 8.5, "black", 0.20)?;

        self.piece_draw(4.0, 8.0, "white", 0)?;

        // Piece Moon
        let state_moon = self.piece_state_get(2)?;

        self.piece_draw(0.0, 0.0, "black", state_moon)?;
        self.board_text(&STATE_MOON[state_moon], 0.5, 0.5, "white", 0.20)?;

        self.piece_draw(4.0, 0.0, "black", 0)?;

        Ok(())
    }
}
