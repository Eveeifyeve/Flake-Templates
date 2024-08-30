{stdenv, lib, pnpm_9, fetchFromGitHub, nodejs}:
let
  pnpm = pnpm_9;
in
stdenv.mkDerivation rec {
  pname = "name";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "owner";
    repo = pname;
    rev = "v${version}";
    hash = lib.fakeHash;
  };

  pnpmDeps = pnpm.fetchDeps {
    inherit pname src version;
    hash = lib.fakeHash;
  };

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];

}