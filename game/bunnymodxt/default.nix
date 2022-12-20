let
	pkgs = import <nixpkgs> {
    		system = "i686-linux";
  	};

in
with pkgs;

pkgs.mkShell rec {
	# inherit src;

	# game is 32bit
	system = "i686-linux";
	name = "BunnymodXT";


	nativeBuildInputs = [
		boost
		libcxx
	];

	buildInputs = [
		gnumake
		cmake
		rustc # DO NOT USE RUSTUP 
		cargo
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
