FROM python:2.7
MAINTAINER Lucid Operations "http://github.com/luciddg"

# install readthedocs
ENV rtd_home /var/www/readthedocs.org
RUN mkdir /var/www \
  && git clone https://github.com/rtfd/readthedocs.org.git ${rtd_home}
WORKDIR ${rtd_home}
RUN pip install -r requirements.txt
RUN ./manage.py syncdb --noinput \
  && ./manage.py makemigrations \
  && ./manage.py migrate

# install uwsgi
RUN pip install uwsgi

EXPOSE 8000
CMD ["./manage.py", "check"]
