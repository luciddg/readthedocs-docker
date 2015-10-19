FROM python:2.7

MAINTAINER Lucid Operations "http://github.com/luciddg"

# install readthedocs
RUN mkdir /var/www \
  && git clone https://github.com/rtfd/readthedocs.org.git /var/www/readthedocs.org
RUN pip install -r /var/www/readthedocs.org/requirements.txt
RUN /var/www/readthedocs.org/manage.py syncdb --noinput \
  && /var/www/readthedocs.org/manage.py makemigrations \
  && /var/www/readthedocs.org/manage.py migrate

# install uwsgi and supervisord
RUN pip install supervisor
ADD files/supervisord.conf /etc/supervisord.conf

EXPOSE 8000
CMD ["supervisord"]
