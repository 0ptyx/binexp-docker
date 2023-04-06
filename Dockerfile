FROM ubuntu:latest
RUN apt update && apt install -y gdbserver xinetd qemu-user iproute2 vim
COPY target/ target/
COPY service.conf /service.conf
COPY banner_fail /banner_fail
COPY wrapper /wrapper
RUN useradd ctf
RUN chmod +x /wrapper
RUN chown -R ctf:ctf target/
WORKDIR target/
USER ctf


