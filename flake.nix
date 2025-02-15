{
  description = "A fluorescent terminal colorscheme salvaged from the briny depths of the ocean.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    {
      lib = {
        wezterm = (builtins.fromTOML (builtins.readFile ./wezterm/abyssal.toml)).colors;
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nil
            nixd
            nixfmt-rfc-style
            statix
            deadnix
            taplo
          ];
        };
      }
    );
}
