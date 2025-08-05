let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
	shellHook =
	  ''
	    echo "Hello shell"
      uv init .
	    uv venv .venv --python 3.12
	  '';
	
  #packages = with pkgs; [];
}
