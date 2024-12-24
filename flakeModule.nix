{
  config,
  lib,
  inputs,
  flake-parts-lib,
  ...
}:
let
  inherit (lib)
    mkOption
    types
    ;
  inherit (flake-parts-lib)
    mkSubmoduleOptions
    ;
in
{
  options = {

    nix-config = mkOption {
      type = types.submoduleWith {
        modules = (import ./modules/all-modules.nix) ++ [
          { _module.args.inputs = inputs; }
        ];
      };
    };
  };
}
