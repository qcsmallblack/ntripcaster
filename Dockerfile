FROM gcc:13.2.0 
ARG BUILDPATH=/ntripcaster 
ARG INSTALLPATH=/usr/local/ntripcaster 

RUN apt-get update && \
    apt-get install -y vim libmariadb-dev libmariadb-dev-compat && \
    rm -rf /var/lib/apt/lists/*
    
RUN git clone -b login https://github.com/qcsmallblack/ntripcaster.git \ 
&& cd ${BUILDPATH} && ./configure && make && make install \ 
&& cd ${INSTALLPATH} && mv conf/ntripcaster.conf.dist conf/ntripcaster.conf && mv conf/sourcetable.dat.dist conf/sourcetable.dat 

EXPOSE 50024
WORKDIR /usr/local/ntripcaster/bin 
ENTRYPOINT ["./ntripcaster"] 
CMD []