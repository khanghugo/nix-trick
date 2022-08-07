with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        nodejs
        nodePackages.npm
        nodePackages.pm2
        yarn
        docker
        docker-compose
        python39
        gtk2
        gtk3
        libnotify
        pkgconf
        nss
        xvfb-run
        xorg.xauth
    ];
    # apt-get install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
    shellHook = ''
        export PATH="$PWD/node_modules/.bin/:$PATH"
        export CYPRESS_INSTALL_BINARY=0
        export CYPRESS_RUN_BINARY=${pkgs.cypress}/bin/Cypress
    '';
}
