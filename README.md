# Flake-Templates
All of my flake templates made available to use.


# Features 
- Flake templates are available in github. 
- Includes templates for favourite languages and frameworks.
- Flake templates are written in nix and are easy to understand.
- Flake templates are easy to use.

# To get started

# Template Names

- Fenix: `rust.fenix`
- Rust Overlay: `rust.rust-overlay`
- Poetry: `python.poetry`
- Python: `python` or `python.default`

# Install template using cli
Get started by using the cli to install a template from github.
Replace `<template-name>` with the [name of the template](#template-names) you want to install.
```bash
nix flake init -t github:eveeifyeve/Flake-Templates#<template-name>
```

# Add it to your config using flake. 

Add the following to your flake.nix
```nix
{
    inputs = {
        eveeifyeve-flake-templates = {
            url = "github:eveeifyeve/Flake-Templates";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, eveeifyeve-flake-templates, ... }:
    {
        templates = inputs.eveeifyeve-flake-templates.templates;
    }
}
```

Then use 
```sh
nix flake init ./path/to/config/flake.nix -t #<template-name>
```