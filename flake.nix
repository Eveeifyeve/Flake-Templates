{
  inputs.dotfiles.url = "github:eveeifyeve/dotfiles";
  outputs = inputs: {
    templates = builtins.warn "templates are deprecated on eveeifyeve/flake-templates please use eveeifyeve/dotfiles: https://github.com/eveeifyeve/dotfiles" inputs.dotfiles.templates;
  };
}
