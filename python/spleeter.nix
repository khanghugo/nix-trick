// then install spleeter imperatively with `pip install spleeter`

let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs = [
    pkgs.python39
    pkgs.python39.pkgs.requests
	pkgs.python39.pkgs.pip
	pkgs.python39.pkgs.setuptools
	pkgs.python39.pkgs.wheel
	pkgs.libsndfile
  ];
  shellHook = ''
    # Tells pip to put packages into $PIP_PREFIX instead of the usual locations.
    # See https://pip.pypa.io/en/stable/user_guide/#environment-variables.
    export PIP_PREFIX=$(pwd)/_build/pip_packages
    export PYTHONPATH="$PIP_PREFIX/${pkgs.python39.sitePackages}:$PYTHONPATH"
    export PATH="$PIP_PREFIX/bin:$PATH"
    export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib/:${pkgs.libsndfile.out}/lib/
    unset SOURCE_DATE_EPOCH
  '';
}
