{ pkgs, ... } @ args:

let
  customNodePackages = import ./default.nix args;
in
customNodePackages // {
  "@bradymadden97/freephite-cli" = customNodePackages."@bradymadden97/freephite-cli".override (oldAttrs: {
    buildInputs = oldAttrs.buildInputs ++ (with pkgs; [
      nodePackages.node-gyp-build
      pkg-config
      pixman
      cairo
      pango
    ]);
  });
}
