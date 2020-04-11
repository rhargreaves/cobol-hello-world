FROM debian:buster
RUN apt-get -y update && \
	apt-get -y install open-cobol
ENTRYPOINT ["/usr/bin/cobc"]
