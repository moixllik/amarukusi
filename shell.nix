{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    # Herramientas
    nativeBuildInputs = with pkgs; [
        typst typstyle tinymist # typst
        python3 # python3 -m http.server
    ];
    # Librerías
    buildInputs = with pkgs; [
    ];
    # Configuración
    shellHook = ''
    '';
}