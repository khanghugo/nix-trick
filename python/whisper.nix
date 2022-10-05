let
  pkgs = import <nixpkgs> {};
  unstable = import <nixos-unstable> {};

in
with pkgs;
with pkgs.python3Packages;

buildPythonPackage rec {
  pname = "whisper";
  version = "unstable-2022-09-21";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "openai";
    repo = pname;
    rev = "6e3be77e1a105e59086e3e21ff5f609fd6fa89a5";
    hash = "sha256-z1dVzm3iEEustP28FkXi3yrUb8zizl2ksLvdy46PT6M=";
  };

  postPatch = ''
    # Rely on the ffmpeg path already patched into the ffmpeg-python library
    substituteInPlace whisper/audio.py \
      --replace 'run(cmd="ffmpeg",' 'run('
  '';

  propagatedBuildInputs = [
    numpy
    unstable.python3Packages.torch-bin # for cuda
    tqdm
    more-itertools
    transformers
    ffmpeg-python
  ];

  preCheck = ''
    export HOME=$TMPDIR
  '';

  checkInputs = [
    pytestCheckHook
  ];

  disabledTests = [
    # requires network access to download models
    "test_transcribe"
  ];

  meta = with lib; {
    description = "General-purpose speech recognition model";
    homepage = "https://github.com/openai/whisper";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}

