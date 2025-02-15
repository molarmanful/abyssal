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
        stylix = {
          base00 = "#000000";
          base01 = "#141f1f";
          base02 = "#1f3030";
          base03 = "#294040";
          base04 = "#527a7a";
          base05 = "#c2d6d6";
          base06 = "#c6d8d8";
          base07 = "#c9dada";
          base08 = "#f85c7f";
          base09 = "#f89950";
          base0A = "#fac358";
          base0B = "#54ef84";
          base0C = "#38ebd0";
          base0D = "#98b0fa";
          base0E = "#ad7bfa";
          base0F = "#c19ffc";
        };
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
