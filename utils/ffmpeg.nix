let
	pkgs = import <nixpkgs> {};
	my_ffmpeg = pkgs.ffmpeg.overrideAttrs (oldAttrs: rec {
    # upstream has yet to turn flip the switch
		configureFlags = oldAttrs.configureFlags ++ [ "--enable-libaom" ];
		buildInputs = oldAttrs.buildInputs ++ [ pkgs.libaom ];
	});
in pkgs.mkShell {
	buildInputs = [
		my_ffmpeg
	];
}
