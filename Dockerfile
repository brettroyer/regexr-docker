FROM ubuntu:latest

# Dockerfile Maintainer
MAINTAINER Brett Royer "brettroyer@gmail.com"

# Install Dependancys
RUN apt-get -qq -y update && \
    apt-get -qq -y install git \
	nodejs \
	npm \
	python2 \
	&& update-alternatives --install /usr/bin/python python /usr/bin/python2 2 \
	&& update-alternatives --install /usr/bin/python python /usr/bin/python3 1 \
	# http://www.linux-commands-examples.com/update-alternatives
	&& update-alternatives --set python /usr/bin/python2 \ 
	&& apt-get autoremove -y \
    && apt-get clean -y

# Pull latest repository
RUN git clone https://github.com/gskinner/regexr.git /opt/regexr \
    && cd /opt/regexr
	
#COPY regexr-3.6.1.tar.gz /opt 

#RUN cd /opt && \
	#tar xvzf regexr-3.6.1.tar.gz && \
	#mv regexr-3.6.1 regexr && \
	#rm regexr-3.6.1.tar.gz
	
WORKDIR /opt/regexr
RUN npm install -g gulp http-server
RUN npm install

RUN gulp build dev-html
		
EXPOSE 8080

# Run Server
CMD [ "http-server", "deploy" ]
# To keep container running
#CMD tail -f /dev/null