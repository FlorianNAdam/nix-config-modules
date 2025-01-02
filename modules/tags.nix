{ config, lib, ... }:
let
  inherit (lib)
    mkOption
    types
    ;
  cfg = config;
  hostSubmodule = types.submodule (
    { config, ... }:
    {
      options = {
        tags = mkOption {
          type = types.attrsOf types.bool;
          default = { };
          description = ''
            Boolean tags to indicate whether certain features should be enabled or disabled.
          '';
          apply = tags: tags;
        };
      };
    }
  );
in
{
  options = {
    hosts = mkOption {
      type = types.attrsOf hostSubmodule;
    };
  };
}
