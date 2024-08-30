{ lib, buildNpmPackage, fetchFromGitHub }:

buildNpmPackage rec {
  pname = "name";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "";
    repo = pname;
    rev = "v${version}";
    hash = lib.fakeHash;
  };

  npmDepsHash = lib.fakeHash;

  # The prepack script runs the build script, which we'd rather do in the build phase.
  # npmPackFlags = [ "--ignore-scripts" ];

  # NODE_OPTIONS = "--openssl-legacy-provider";

  meta = with lib; {
    description = "";
    homepage = "url";
    license = licenses.unlicense;
    maintainers = [];
  };
}