all:
    @just --list

game:
    simple-http-server -io ./

pdf LANG:
    typst watch ./doc/{{ LANG }}/laws.typ ./doc/{{ LANG }}/laws.pdf

tools:
    cargo install -q typst-cli simple-http-server