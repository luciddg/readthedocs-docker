Dockerfile for ReadTheDocs
==========================

This project provides a Dockerfile for building a self-hosted
[readthedocs](http://readthedocs.org) instance.

Features
--------

Based on the official [`library/python:2.7`](https://github.com/docker-library/python/blob/15798abb6cfb145344462a345db4b572227fb859/2.7/Dockerfile)
image from the [Docker Hub](https://hub.docker.com/_/python/) and the latest
pull from [github](https://github.com/rtfd/readthedocs.org). The image currently
includes the [uWSGI](http://uwsgi-docs.readthedocs.org) application server and
a sample NGiNX [configuration](files/nginx.conf) file as an example of how one
might run a production-like setup. To drive this example a little further, we
have provided a [`docker-compose`](docker-compose.yml) configuration with some
defaults.

Usage
-----

Using the built in Django webserver

```shell
$ docker run -d --name readthedocs \
    -p 8000:8000 \
    luciddg/readthedocs \
    ./manage.py runserver
```

Using the uWSGI HTTP server/router

```shell
$ docker run -d --name readthedocs \
    -p 8000:8000 \
    luciddg/readthedocs \
    uwsgi --http :8000 --module readthedocs.wsgi --env DJANGO_SETTINGS_MODULE=readthedocs.settings.sqlite
```

If you choose to run it behind a fully capable webserver such as NGiNX, you
may choose to configure your container to speak the uwsgi protocol natively.
This is basically the same as above, but with the `--socket` switch in place of
`--http`. In this case, you will most likely link this container to an NGiNX
container, so there is no need to proxy the exposed port externally.

```shell
$ docker run -d --name readthedocs luciddg/readthedocs \
    uwsgi --socket 0.0.0.0:8000 --module readthedocs.wsgi --env DJANGO_SETTINGS_MODULE=readthedocs.settings.sqlite
$ docker run -d --name nginx-proxy  \
    -v ${PWD}/files/nginx.conf:/etc/nginx/conf.d/default.conf:ro \
    --link readthedocs:rtd \
    -p 80:80 \
    library/nginx
```

The same result may be accomplished with the provided `docker-compose.yml` for
convenience. The uWSGI settings provided as command line arguments above are
provided as environment variables in our `docker-compose.yml`

    $ docker-compose up
