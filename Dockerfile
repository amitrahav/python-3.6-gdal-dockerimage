FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update ; apt-get --assume-yes install curl \
     binutils \
     libproj-dev \
     gdal-bin \
     python-gdal \
     software-properties-common \
     lsb-core


RUN wget http://download.osgeo.org/geos/geos-3.6.2.tar.bz2
RUN tar -xjf geos-3.6.2.tar.bz2
RUN cd geos-3.6.2; ./configure; make; make install

RUN wget http://download.osgeo.org/gdal/1.11.5/gdal-1.11.5.tar.gz
RUN tar -xzf gdal-1.11.5.tar.gz
RUN cd gdal-1.11.5; ./configure; make; make install

ENV GDAL_LIBRARY_PATH=/usr/local/lib/libgdal.so

#install dependencies for aws login and docker for build
RUN pip install awscli && aws --version \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && apt-get update && add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable \
       " \
    && apt-get update && apt-get install docker    

WORKDIR /var/app
CMD [  ]
ENTRYPOINT ["python manage.py runserver"]
