# We need some home-manager integrations for users on NixOS
# systems. This is optionally enabled when you want to use
# home-manger.
{ inputs, ... }:
{
  config = {
    apps.hm-single-user-integration = {
      nixos =
        { host, ... }:
        {
          imports = [
            inputs.home-manager.nixosModules.home-manager
          ];

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit host;
            };
            users.${host.username} = {
              imports = host._internal.homeModules;
            };
          };
        };
    };
  };
}
