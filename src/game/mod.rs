mod board;
mod canvas;
mod notation;
mod pieces;
mod player;

use wasm_bindgen::prelude::*;
use web_sys::{CanvasRenderingContext2d, HtmlCanvasElement};

#[wasm_bindgen]
pub struct Game {
    canvas: HtmlCanvasElement,
    context: CanvasRenderingContext2d,
    size: f64,
}

#[wasm_bindgen]
pub fn new_game(canvas: HtmlCanvasElement, context: CanvasRenderingContext2d) -> Game {
    Game {
        canvas,
        context,
        size: 0.0,
    }
}
