use super::Game;
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

        // Pieces
        self.piece_draw(8.0, 8.0, "white", 0)?;
        self.piece_draw(4.0, 8.0, "white", 0)?;

        self.piece_draw(0.0, 0.0, "black", 0)?;
        self.piece_draw(4.0, 0.0, "black", 0)?;
        Ok(())
    }

    /* TODO:
     * -
     */
}
