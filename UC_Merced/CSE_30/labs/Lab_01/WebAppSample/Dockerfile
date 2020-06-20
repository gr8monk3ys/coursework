FROM ubuntu:18.04

RUN apt update \
	&& apt install -y \
		build-essential \
		libboost-all-dev \
	&& mkdir /opt/crowapp

WORKDIR /opt/crowapp

COPY crow_all.h .
COPY Makefile .
COPY myLib.cpp .
COPY myLib.h .
COPY server.cpp .

RUN make

EXPOSE 18080

CMD [ "./server" ]
