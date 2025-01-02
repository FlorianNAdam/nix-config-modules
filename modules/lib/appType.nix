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
    enablePredicate = mkOption {
      type = types.functionTo types.bool;
      default = { host, app, ... }: if (app.enable != null) then app.enable else false;
      description = lib.mdDoc ''
        Predicate used to determine if the given app should be enabled on the given host.
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
