let
	pkgs = import <nixpkgs> {};
in
with pkgs;

pkgs.mkShell rec {
	name = "bspguy";

	# https://github.com/wootguy/bspguy
	# https://github.com/ocornut/imgui/releases/tag/v1.81

	# sudo apt install build-essential git cmake libx11-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev libgl1-mesa-dev xorg-dev libglfw3-dev libglew-dev
	nativeBuildInputs = [
		xorg.libX11
		xorg.libXrandr
		xorg.libXinerama
		xorg.libXcursor
		xorg.libXi
		xorg.libXxf86vm
		libGL
		glew
		glfw
	];

	buildInputs = [
		gnumake
		cmake
	];
}
