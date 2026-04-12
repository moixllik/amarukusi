{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    # Herramientas
    nativeBuildInputs = with pkgs; [
        python3
    ];
    # Librerías
    buildInputs = with pkgs; [
    ];
    # Configuración
    shellHook = ''
    '';
}