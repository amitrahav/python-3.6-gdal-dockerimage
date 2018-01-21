FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update ; apt-get --assume-yes install binutils libproj-dev gdal-bin python-gdal

RUN wget http://download.osgeo.org/geos/geos-3.6.2.tar.bz2
RUN tar -xjf geos-3.6.2.tar.bz2
RUN cd geos-3.6.2; ./configure; make; make install

RUN wget http://download.osgeo.org/gdal/1.11.5/gdal-1.11.5.tar.gz
RUN tar -xzf gdal-1.11.5.tar.gz
RUN cd gdal-1.11.5; ./configure; make; make install


ENV GDAL_LIBRARY_PATH=/usr/local/lib/libgdal.so

CMD ["python"]
