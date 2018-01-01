# Python 3.6 Geo Docker Image
> [this repo on dockerhub](https://hub.docker.com/r/amitrahav/python-3.6-gdal-dockerimage/)

this Docker image is for python 3.6 based apps using geo location libraries.
it uses:
* [python:3.6](https://hub.docker.com/_/python/) offical image
* [OSGEOS ](http://www.osgeo.org/) download server for:
    * [Gdal](http://www.gdal.org/) - v 1.11.5
    * [GEOS](http://geos.osgeo.org/) - v 3.6.2


## Usage
### Local
pull docker by:
```
docker pull amitrahav/python-2.7.13-gdal-dockerimage
```

use it within docker file or run it with:
```
docker run amitrahav/python-2.7.13-gdal-dockerimage
```
docker CMD is python so you can run your own py code using it.
### On Production

you can use it for build processes or inside a Beanstalk app.

## Build
this repo is AWS ready.
it comes with a buildspec.yml file so it could be a part of CD process using CodeBuild to create this image and upload it into ECR - with several variables you should assign:
1. IMAGE_REPO_NAME - image name at AWS - ECR (Elacsic Container Repo)
2. IMAGE_TAG - mostly leatest
3. AWS_DEFAULT_REGION - AWS default region for ECR login and usage
4. AWS_ACCOUNT_ID - AWS account ID for ECR usage
