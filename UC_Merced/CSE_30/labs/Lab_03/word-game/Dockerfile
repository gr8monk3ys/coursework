FROM ubuntu:18.04

RUN apt update \
	&& apt install -y \
		build-essential \
		libboost-all-dev 

WORKDIR /opt/crowapp

COPY . .

RUN make

EXPOSE 18080

CMD [ "bin/server", "-t", "templates", "-s", "static" ]
