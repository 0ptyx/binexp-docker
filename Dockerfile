FROM ubuntu:latest
RUN dpkg --add-architecture i386 && apt update &&  \
  apt install -y gdbserver xinetd qemu-user git iproute2 vim libc6:i386  \
  libncurses5:i386 libstdc++6:i386
COPY target/ target/
COPY service.conf /service.conf
COPY banner_fail /banner_fail
COPY wrapper /wrapper
RUN chmod +x /wrapper
WORKDIR target/
RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh

