# Docker container for RE/BinExp
Docker resources to help with reverse engineering and binary exploitation. Mainly for CTFs.

# How to use
Requires:
* Docker
* docker-compose
By default this is meant to run programs that are to be interactied with via stdin and stdout. However, you can modify `docker-compose.yml` to fit programs 
that bind directly to interfaces & ports or any other configuration.

First clone down this project and `cd` into it. Then create the `target` folder with `mkdir target` & copy your target binary into it. Docker will copy this folder onto the image during build.
If you have other files, like a `flag.txt` file for a ctf, copy them into the project's root directory.
Finally, run the following command, replacing `[target name]` with the name of your target binary.
```
sudo BIN_TARGET=[target name] docker-compose up -d --build
```

Now that it's running, the program will be availble on port 31337 of the local host interface. In addition to that, you can run the program with gdb server and connect to it for remote debugging.
To do that first login to the container: 

```
sudo docker exec -it binexp_docker-target-1 /bin/bash
```
Then, run `gdbserver --multi localhost:8000 target/[target name]` replacing `[target name]` with the name of your target binary.
After that you can connect to it on localhost:8000 with GDB.



