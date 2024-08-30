{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "name";
  version = "12.1.1";

  src = fetchFromGitHub {
    owner = "";
    repo = pname;
    rev = version;
    hash = lib.fakeHash;
  };

  cargoHash = lib.fakeHash;

  meta = with lib; {
    description = "";
    homepage = "url";
    license = licenses.unlicense;
    maintainers = [];
  };
}