mod board;
mod canvas;
mod notation;
mod pieces;
mod player;

use wasm_bindgen::prelude::*;
use web_sys::{CanvasRenderingContext2d, HtmlCanvasElement, Storage};

#[wasm_bindgen]
pub struct Game {
    canvas: HtmlCanvasElement,
    context: CanvasRenderingContext2d,
    size: f64,
    storage: Storage,
    board: [usize; 49],
    selected: (usize, usize),
}

#[wasm_bindgen]
pub fn new_game(canvas: HtmlCanvasElement, context: CanvasRenderingContext2d) -> Game {
    let storage = web_sys::window()
        .unwrap()
        .local_storage()
        .unwrap()
        .expect("Error: localStorage");

    Game {
        canvas,
        context,
        size: 0.0,
        storage,
        board: [0; 49],
        selected: (0, 0),
    }
}
