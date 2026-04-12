{
  description = "GO devenv for development";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux"; # Change to "aarch64-darwin" for Apple Silicon
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
        ruby
        # native dependencies
        gcc
        gnumake
        pkg-config
        zlib
        openssl
        libyaml
        gmp
        readline
        rustc
	
        ];
      shellHook = ''
        echo "Rails dev environment ready"

        # garante que gems vão para o projeto
        export GEM_HOME=$PWD/.gems
        export GEM_PATH=$GEM_HOME
        export PATH=$GEM_HOME/bin:$PATH
      '';
      };
    };
}
