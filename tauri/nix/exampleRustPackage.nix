{ lib, fetchFromGitHub, rustPlatform, cargo-tauri, pkg-config, openssl, glib-networking, libsoup, webkitgtk, darwin, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "name";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "";
    repo = pname;
    rev = version;
    hash = lib.fakeHash;
  };

  cargoHash = lib.fakeHash;

  nativeBuildInputs = [
    cargo-tauri.hook
    pkg-config
    # Setup a JS Frontend using npm, yarn, pnpm & bun (Coming soon)
  ];


    buildInputs =
    [ openssl ]
    ++ lib.optionals stdenv.isLinux [
      glib-networking # Most Tauri apps need networking
      libsoup
      webkitgtk
    ]
    ++ lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
      [
        AppKit
        CoreServices
        Security
        WebKit
      ]
    );

  meta = with lib; {
    description = "";
    homepage = "url";
    license = licenses.unlicense;
    maintainers = [];
  };
}
