let
        pkgs = import <nixpkgs> {};
in pkgs.mkShell {
        buildInputs = [
                pkgs.qmk
                pkgs.qmk-udev-rules
                pkgs.python39
                pkgs.python39Packages.pillow
        ];
}
