use super::Game;
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
impl Game {
    pub fn piece_draw(&self, x: f64, y: f64, color: &str, state: usize) -> Result<(), JsValue> {
        let size = self.size;
        let piece_radius = size * 0.4;
        let hole = [[0.0, -0.2], [-0.2, 0.0], [0.0, 0.2], [0.2, 0.0]][state];

        self.context.begin_path();
        self.context.set_fill_style_str(color);
        self.context.arc(
            (x + 0.5) * size,
            (y + 0.5) * size,
            piece_radius,
            0.0,
            2.0 * std::f64::consts::PI,
        )?;
        self.context.arc(
            (x + 0.5 + hole[0]) * size,
            (y + 0.5 + hole[1]) * size,
            piece_radius * 0.25,
            0.0,
            2.0 * std::f64::consts::PI,
        )?;
        self.context
            .fill_with_canvas_winding_rule(web_sys::CanvasWindingRule::Evenodd);
        Ok(())
    }

    /* TODO:
     * -
     */
}
