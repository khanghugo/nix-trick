# it does not JUST work yet because of some weird rust dependency handling
# for now, it is better to just shell into this and build

let
	pkgs = import <nixpkgs> {
    		system = "i686-linux";
  	};

  	unstable = import <nixos-unstable> {
  		# system = "i686-linux";
  	};

  	unstable_i686 = import <nixos-unstable> {
  		system = "i686-linux";
  	};

  	really_old = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/19.09.tar.gz") {
  		system = "i686-linux";
  	};

	# src = pkgs.fetchgit {
	# 	url = "https://github.com/YaLTeR/BunnymodXT.git";
	# 	rev = "bf13720ca48808b752badb0f7a06f34dea5e726f";
	# 	sha256 = "ltaO3DJZbTF5k6gIi5oKAKW0+Swdc1e9tmn3gphNLFc=";
	# 	fetchSubmodules = true;
	# };
in
with pkgs;

pkgs.mkShell rec {
	# inherit src;

	# game is 32bit
	system = "i686-linux";
	name = "BunnymodXT";

	permittedInsecurePackages = [
		# "libgcrypt-1.5.6"
		# "libgcrypt_1_5"
  	];


	nativeBuildInputs = [
		boost
		libcxx
	];

	buildInputs = [
		gnumake
		cmake
		unstable_i686.rustc
		unstable_i686.cargo
		# unstable.rustup # ONLY rustup and vscode in a different environment for IDE features
		libGL
		ninja
		libgcrypt_1_5
		SDL2
		pkg-config
		gcc
		ocl-icd
		x264
	];
}
