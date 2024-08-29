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
    };
  };
}