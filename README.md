This repo contains the code to build/run a Docker container with SWI-Prolog (incl. graphical debugger) for Prolog development.

If you a looking for a minimal SWI-Prolog image, for example for running Prolog servers, check out [swipl/swipl](https://hub.docker.com/r/swipl/swipl/)


## Run
Prerequisite: Docker](docker.io)  should be installed.

Use the `swipl` script to run the latest image from docker.io (or the one produced by 'Build', see below) 

```
Welcome to SWI-Prolog (Multi-threaded, 64 bits, Version 7.3.19)
Copyright (c) 1990-2015 University of Amsterdam, VU Amsterdam
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software,
and you are welcome to redistribute it under certain conditions.
Please visit http://www.swi-prolog.org for details.

For help, use ?- help(Topic). or ?- apropos(Word).

?- 
```
Type `guitracer.` at the promt.
```
% The graphical front-end will be used for subsequent tracing
true

?- 
```
Type `trace, A is 1.` to invoke the graphical debugger.
You should see the debugger window pop-up and a `A = 1.` response in the console.

Tips:
- By default the current working directory is available in the container at /cwd.
If you want to persist code/data between session make sure to use /cwd.
- Visit [SWI Prolog Program Development Tools](http://www.swi-prolog.org/IDE.html) for more GUIness

### Linux
`swipl` script is provided to run SWI-Prolog (you may want to link or copy it to `/usr/bin`)

### Mac
TODO Add instructions to run under MacOS

### Windows
- run a Xserver like XMobiTerm, VcXsrv etc.
- lookup host ip address via ipconfig
- determen your volume mapping: 
  - docker in a vagrant box: `$(pwd):/cwd`
  - docker toolbox: `/c/Users/%USERNAME%:/cwd` (not tested)

`docker run -ti --rm -e DISPLAY=<host ip address>:0 -v <your volume mapping> pietere/swipl`
TODO Add swipl.bat 

## Build
Run `version=7.3.31 make all` produces a pietere/swipl image.

To push the image first login `make login` and then `version=7.3.31 make push` to tag the image and push it to docker.io



