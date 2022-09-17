# it does not JUST work yet because of some weird rust dependency handling
# for now, it is better to just shell into this and build

let
	pkgs = import <nixpkgs> {
    	system = "i686-linux";
  	};

	src = pkgs.fetchgit {
		url = "https://github.com/YaLTeR/BunnymodXT.git";
		rev = "bf13720ca48808b752badb0f7a06f34dea5e726f";
		sha256 = "ltaO3DJZbTF5k6gIi5oKAKW0+Swdc1e9tmn3gphNLFc=";
		fetchSubmodules = true;
	};
in
with pkgs;

pkgs.stdenv.mkDerivation rec {
	inherit src;

	# game is 32bit
	system = "i686-linux";
	name = "BunnymodXT";

	nativeBuildInputs = [
		gcc
		boost
		libcxx
	];

	buildInputs = [
		gnumake
		cmake
		rustc
		cargo
		libGL
		ninja
	];

	permittedInsecurePackages = [
		"libgcrypt_1_5"
  	];

	installPhase = ''
		mkdir $out
		cp * $out
	'';
	
	# for now, it doesnot work on its own so nix-shell then install is the best
  # and rust stuff so just install rust or link cargo folder into this instead
	CARGO_HOME = "~/.cargo";
}
