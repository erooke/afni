{
  system ? builtins.currentSystem,
  pins ? import ./nix/npins,
  nixpkgs ? import pins.nixpkgs { inherit system; },
}:
let
  pkgs = nixpkgs;
  python = pkgs.python3.withPackages ( ps: [ ps.setuptools ] );
in
pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.npins
    pkgs.cmake

    python
    pkgs.zlib
    pkgs.libx11
    pkgs.libxt
    pkgs.motif
    pkgs.libjpeg
    pkgs.libGLU
    pkgs.gsl
    pkgs.glib
    pkgs.expat
    pkgs.libxmu
    pkgs.libxi
    pkgs.libxpm
  ];

  NPINS_DIRECTORY = "./nix/npins/";
}
