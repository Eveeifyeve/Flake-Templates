{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  };


  outputs = { self, nixpkgs }:
  {
    templates = {
      python = {
        path = ./python;
        description = "Python template";
      };
      poetry = {
        path = ./poetry;
        description = "Python template with poetry";
      };
      rust = {
        fenix = {
          path = ./rust/fenix;
          description = "Rust template with fenix";
        };
        rust-overlay = {
          path = ./rust/rust-overlay;
          description = "Rust template with rust-overlay";
        };
      };
    };
  };
}