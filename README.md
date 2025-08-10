# uvnixshell

uv nix shell template

Hello, I am new to nixos but this is what i was able to come up with for python development on NixOs. We are using buildFHSenv because python packages have dependacies in C libraries. Some of those packages have hard coded FHS paths to dependacies and because NixOs dose not follow FHS we have errors when we import those packages. buildFHSenv makes a shell with a FHS compatible file system which we use here to fix our dependace issues.
______________________________________________________________________________
makes a FHS compatible shell for python development with uv package managment
______________________________________________________________________________
Dependancies

  nothin!!

_______________________________________________________________________________
To Use

do the following IN YOUR TERMINAL!!!

make your project directory

clone this repo in to your project directory or copy this shell.nix file into a shell.nix file in your project direcotry

run nix-shell in your terminal in the project directory

open your IDE from this terminal window. 

  I belive this makes the ide think it is in a fhs system and loads the dynamic linkers correctly

then change your interpreter to /.venv/bin/python3.*
_________________________________________________
everytime you open your project you will need to 
  
  open your project direcotry in your terminal
  run nix-shell
  open you ide

__________________________________________________
Key Notes

[direnv](https://direnv.net/) | will not work with this shell, it gets caught in a infinit cycle of trying changing into the virtual enviroment.
  i think this is because it dosent recognize buildFHSenv as a virtual enviroment but it sees the .envrc and shell.nix file so it goes to create a virtual enviroment, then once that virtual enviroment is created, it goes on in an infinit cycle of not reconizing the virtual enviroment then creating a virtual enviroment.
  i will need to work this out later.

  to exit this shell you will need to close the terminal window, direnv would be usefull here but we dont have it wokring
  
