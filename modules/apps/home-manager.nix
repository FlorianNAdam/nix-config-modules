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
