FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update ; apt-get install -y --no-install-recommends \
    curl \
    binutils \
    libproj-dev \
    gdal-bin \
    python-gdal \
    software-properties-common \
    lsb-core \
    apt-transport-https \
    gnupg2 \
    ca-certificates

#install dependencies for aws login and docker for build
RUN pip install awscli && aws --version \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" \
    && apt-get update && apt-get install  -y --no-install-recommends docker-ce   

RUN wget http://download.osgeo.org/geos/geos-3.6.2.tar.bz2 \
    && tar -xjf geos-3.6.2.tar.bz2 \
    && cd geos-3.6.2; ./configure; make; make install

RUN wget http://download.osgeo.org/gdal/1.11.5/gdal-1.11.5.tar.gz \
    && tar -xzf gdal-1.11.5.tar.gz \
    && cd gdal-1.11.5; ./configure; make; make install

ENV GDAL_LIBRARY_PATH=/usr/local/lib/libgdal.so


WORKDIR /var/app
CMD [ "/bin/bash" ]
ENTRYPOINT ["python manage.py runserver"]
