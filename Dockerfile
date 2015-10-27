FROM library/python:2.7
MAINTAINER Lucid Operations "http://github.com/luciddg"

# install readthedocs
ENV rtd_home /var/www/readthedocs.org
RUN mkdir /var/www \
  && git clone https://github.com/rtfd/readthedocs.org.git ${rtd_home}
WORKDIR ${rtd_home}
RUN pip install -r requirements.txt
RUN python manage.py syncdb --noinput \
  && python manage.py makemigrations \
  && python manage.py migrate \
  && python manage.py collectstatic --noinput

# install uwsgi
RUN pip install uwsgi

EXPOSE 8000
CMD ["python", "manage.py", "print_settings"]
