let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { /*config = {}; overlays = [];*/ };
in

pkgs.mkShellNoCC {
#all this dose is run uv init in the cwd then creates a virtual eniroment for python 3.12, then runs the echo
	shellHook =
	  ''
    	    uv init .
	    uv venv .venv --python 3.12
	    echo "Hello shell"

	'';
	
  #packages = with pkgs; [];
}
