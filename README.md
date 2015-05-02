Dockerfile for ReadTheDocs
==========================

This project provides a Dockerfile for building a self-hosted 
[readthedocs](http://readthedocs.org) instance.

Features
--------

Uses a base of the `python:2.7` image and the latest pull from 
[github](https://github.com/rtfd/readthedocs.org).  It currently uses the
built-in Django webserver.

Usage
-----

   docker run -d --name readthedocs -p 8000:8000 registry.luciddg.com/luciddg/readthedocs
