all:
    @just --list

game:
    simple-http-server -io ./

pdf LANG:
    typst watch ./doc/{{ LANG }}/laws.typ

tools:
    cargo install -q typst-cli simple-http-server
