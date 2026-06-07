use super::Game;
use wasm_bindgen::prelude::*;
use web_sys::PointerEvent;

const CHAKANA: &[i32] = &[
    0, 3, 6, 9, 11, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 37, 39, 42, 45, 48,
];

#[wasm_bindgen]
impl Game {
    pub fn board_draw(&self) -> Result<(), JsValue> {
        for i in 0..49 {
            let x = (i / 7) as f64 + 1.0;
            let y = (i % 7) as f64 + 1.0;

            let color = if CHAKANA.contains(&i) {
                "#B58863"
            } else {
                "#F0d9b5"
            };

            self.board_cell(x, y, color);
        }

        let marks = ["a", "b", "c", "d", "e", "f", "g"];
        let font_color = "#F0d9b5";
        let font_size = 0.15;

        for (i, mark) in marks.iter().enumerate() {
            let x = i as f64;
            let scale = (i + 1).to_string();

            self.board_text(mark, 1.15 + x, 0.9, font_color, font_size)?;
            self.board_text(&scale, 0.9, 1.15 + x, font_color, font_size)?;

            self.board_text(mark, 7.85 - x, 8.1, font_color, font_size)?;
            self.board_text(&scale, 8.1, 7.8 - x, font_color, font_size)?;
        }

        Ok(())
    }

    fn board_cell(&self, x: f64, y: f64, color: &str) {
        let size = self.size;

        self.context.set_fill_style_str(color);
        self.context.set_stroke_style_str("#B58863");
        self.context.fill_rect(size * x, size * y, size, size);
        self.context.stroke_rect(size * x, size * y, size, size);
    }

    fn board_text(
        &self,
        text: &str,
        x: f64,
        y: f64,
        color: &str,
        text_size: f64,
    ) -> Result<(), JsValue> {
        let size = self.size;
        let text_size = text_size * size;

        self.context.set_fill_style_str(color);

        self.context.set_font(&format!("{}px monospace", text_size));
        self.context.set_text_align("center");
        self.context.set_text_baseline("middle");

        self.context.fill_text(text, x * size, y * size)?;

        Ok(())
    }

    pub fn board_update(&mut self, event: PointerEvent) -> Result<(), JsValue> {
        let size = self.size;
        let event_name = event.type_();
        let rect = self.canvas.get_bounding_client_rect();
        let mouse_x =
            (event.client_x() as f64 - rect.left()) * (self.canvas.width() as f64 / rect.width());
        let mouse_y =
            (event.client_y() as f64 - rect.top()) * (self.canvas.height() as f64 / rect.height());
        let x = (mouse_x / size).floor() as i32;
        let y = (mouse_y / size).floor() as i32;

        match event_name.as_str() {
            "pointerdown" => {}
            "pointerup" => match (x, y) {
                (8, 8) => {
                    // TODO: state sol
                }
                (0, 0) => {
                    // TODO: state luna
                }
                (8, 4) => {
                    // TODO: active sol
                }
                (0, 4) => {
                    // TODO: active luna
                }
                _ => {}
            },
            "pointerleave" => {}
            "pointermove" => {}
            _ => {}
        }

        Ok(())
    }

    /* TODO:
     *  - dibujar flecha en el tablero
     *  - señalar que hay una seleccion de casillas
     */
}
