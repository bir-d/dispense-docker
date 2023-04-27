FROM gcc:11.3
RUN apt update
RUN apt -y install libncurses-dev libmodbus-dev libsqlite3-dev libident-dev 
RUN git clone https://gitlab.ucc.asn.au/UCC/OpenDispense2.git /usr/src/OpenDispense2
RUN make -C /usr/src/OpenDispense2/src/
WORKDIR /usr/src/OpenDispense2
CMD ["./dispsrv"]
