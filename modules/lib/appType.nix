{ lib, ... }:
let
  inherit (lib)
    attrValues
    listToAttrs
    mkOption
    types
    ;

in
types.submodule {
  _file = __curPos.file;

  options = {
    enable = mkOption {
      type = types.nullOr types.bool;
      default = null;
      description = ''
        If set, enables or disables the given app. This overrides tag behavior.
      '';
    };
    home = mkOption {
      type = types.deferredModule;
      default = { };
      description = lib.mdDoc ''
        `home-manager` configurations. See the [home-manager manual](https://nix-community.github.io/home-manager/)
         for more information.
      '';
    };
    nixos = mkOption {
      type = types.deferredModule;
      default = { };
      description = lib.mdDoc ''
        NixOS configurations. See the [NixOS manual](https://nixos.org/manual/nixos/stable/#ch-configuration)
        for more information.
      '';
    };
    nixpkgs = mkOption {
      type = types.deferredModule;
      default = { };
      description = lib.mdDoc ''
        Nixpkgs configurations. See `./modules/nixpkgs.nix` for more details.
      '';
    };
  };
}
