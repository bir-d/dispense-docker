FROM gcc:11.3

RUN apt update
RUN apt -y install libncurses-dev libmodbus-dev libsqlite3-dev libident-dev python-is-python3

RUN git clone https://gitlab.ucc.asn.au/UCC/OpenDispense2.git /usr/src/OpenDispense2
RUN make -C /usr/src/OpenDispense2/src/
RUN rm /usr/src/OpenDispense2/dispsrv.conf
RUN curl https://gist.githubusercontent.com/bir-d/ad799fc46c5ace71949a7a4dd860e44d/raw/96019aa8b3a9b9149c10ae24c00b7742fc0253d0/gistfile1.txt > /usr/src/OpenDispense2/dispsrv.conf

RUN curl https://bootstrap.pypa.io/get-pip.py > get-pip.py; chmod +x get-pip.py; ./get-pip.py
RUN python3 -m pip install npyscreen twisted
RUN git clone https://gitlab.ucc.asn.au/UCC/virtualcoke.git /usr/src/virtualcoke

WORKDIR /usr/src/OpenDispense2
CMD ["../virtualcoke/virtualcoke.py&"]
CMD ["./dispsrv"]
