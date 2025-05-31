{
  inputs = {
		eveeifyeve-dotfiles.url = "github:eveeifyeve/dotfiles/flake-parts";
  };


  outputs = { self, eveeifyeve-dotfiles }:
  {
    templates = builtins.warn "templates are deprecated on eveeifyeve/flake-templates please use eveeifyeve/dotfiles: https://github.com/eveeifyeve/dotfiles" eveeifyeve-dotfiles.templates;
  };
}
