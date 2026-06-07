all:
    @just --list

dev:
    simple-http-server -io ./

build: format test
    wasm-pack build --release --target web --out-name app --no-typescript --no-pack
    rm ./pkg/.gitignore

test:
    cargo test

pdf LANG:
    typst watch ./doc/{{ LANG }}/laws.typ

tools:
    cargo install -q typst-cli simple-http-server wasm-pack

format:
    cargo fmt
