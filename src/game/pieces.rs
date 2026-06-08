use super::Game;
use wasm_bindgen::prelude::*;

pub const STATE_SUN: [&str; 4] = ["K", "L", "M", "N"];
pub const STATE_MOON: [&str; 4] = ["P", "Q", "R", "S"];

#[wasm_bindgen]
impl Game {
    pub fn piece_draw(&self, x: f64, y: f64, color: &str, state: usize) -> Result<(), JsValue> {
        let size = self.size;
        let piece_radius = size * 0.4;
        let hole = [[0.0, -0.25], [-0.25, 0.0], [0.0, 0.25], [0.25, 0.0]][state];

        self.context.begin_path();
        self.context.set_fill_style_str(color);
        self.context.set_stroke_style_str("black");

        self.context.arc(
            (x + 0.5) * size,
            (y + 0.5) * size,
            piece_radius,
            0.0,
            2.0 * std::f64::consts::PI,
        )?;

        let hole_x = (x + 0.5 + hole[0]) * size;
        let hole_y = (y + 0.5 + hole[1]) * size;
        let hole_radius = piece_radius * 0.25;

        self.context.move_to(hole_x + hole_radius, hole_y);

        self.context
            .arc(hole_x, hole_y, hole_radius, 0.0, 2.0 * std::f64::consts::PI)?;

        self.context
            .fill_with_canvas_winding_rule(web_sys::CanvasWindingRule::Evenodd);

        self.context.stroke();

        Ok(())
    }

    pub fn piece_state_get(&self, player: usize) -> Result<usize, JsValue> {
        let key = format!("{}-state", self.player_name(player));

        if let Some(state_str) = self.storage.get_item(&key)? {
            let state_pack = match player {
                1 => STATE_SUN,
                2 => STATE_MOON,
                _ => return Ok(0),
            };

            return Ok(state_pack.iter().position(|x| *x == state_str).unwrap());
        }

        Ok(0)
    }

    pub fn piece_state_set(&self, player: usize, state: usize) -> Result<(), JsValue> {
        let key = format!("{}-state", self.player_name(player));
        let state_str = match player {
            1 => STATE_SUN[state],
            2 => STATE_MOON[state],
            _ => return Ok(()),
        };

        self.storage.set_item(&key, state_str)?;

        Ok(())
    }
}
