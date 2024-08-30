{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, rust-overlay, ... }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;
      overlays = [ (import rust-overlay) ];
      perSystem = {
        pkgs,
        config,
        lib,
        ...
      }: 
      let 
      # Required Frameworks needed for macOS
      inherit (pkgs.darwin.apple_sdk.frameworks);
      rustToolchain = pkgs.rust-bin.stable.latest.default.override {
        extensions = ["rustfmt" "cargo" "clippy" "rustc"]; # Programs
        targets = [""]; # Targets
      };
      in
      {
        devShells.default = pkgs.mkShell
        {
          nativeBuildInputs = with pkgs; [
            pkg-config
          ] ++ [
            rustToolchain
          ] ++ lib.optionals stdenv.isLinux [
            openssl
            # Additional Dependencies here for Linux.
          ] ++ lib.optionals stdenv.isDarwin [
            # Frameworks here
          ];
        };
      };
    };
}