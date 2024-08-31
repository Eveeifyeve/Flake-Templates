{lib, stdenv, fetchFromGitHub, zig}:
stdenv.mkDerivation rec {
  pname = "examplePackage";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "ziglang";
    repo = "zig";
    rev = "v${version}";
    hash = lib.fakeHash;
  };

  nativeBuildInputs = [
    zig.hook
  ];

  zigBuildFlags = [ "-Dman-pages=true" ];

  dontUseZigCheck = true;
}