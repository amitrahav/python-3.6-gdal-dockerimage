FROM python:2.7.13

RUN apt-get update \
    && apt-get install -y \
    wget \ 
    tar \ 
    zip \
    apt-utils \
    sudo \
    && apt-get autoremove -y \
    && apt-get clean

#install gdal
RUN wget http://download.osgeo.org/gdal/1.11.2/gdal-1.11.2.tar.gz \
    && tar xzf gdal-1.11.2.tar.gz \
    && cd gdal-1.11.2 \
    && ./configure \
    && make \
    && sudo make install
    
RUN export GDAL_LIBRARY_PATH = '~/local/lib/libgdal.so'


CMD ["python"]
