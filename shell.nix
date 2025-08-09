{
  pkgs ? import <nixpkgs> { },
}:
let
namez = "python development environment";
in
(pkgs.buildFHSEnv {
  name =  namez;#"simple-x11-env";
  targetPkgs =
    pkgs:
    (with pkgs; [
        libz
        uv
        udev #device manager lib
        alsa-lib #sound managment lib
    ])
    ++ (with pkgs.xorg; [ #xorg libraries that could be required add any x11 libraries here
      libX11
      libX11.dev
      libXcursor
      libXrandr
    ]);
  multiPkgs =
    pkgs:
    (with pkgs; [
      udev
      alsa-lib
    ]);
        #the runscript creates the uv project and venv to use uv to manage the project
		#change the python version by changing 3.12 to something else
		#change bash at the end to your terminal of choice
  runScript = "
              uv init .
              uv venv --python 3.12

              echo '${namez}'
              bash";
}).env
