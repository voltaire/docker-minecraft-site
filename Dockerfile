FROM voltairemc/minecraft-site
MAINTAINER Jon Chen <bsd@voltaire.sh>

EXPOSE 8080
VOLUME ["/srv/db/", "/var/log/voltairemc"]

ADD config.py /srv/http/config.py

RUN /srv/http/manage.py db init
RUN /srv/http/manage.py db upgrade
RUN /srv/http/manage.py runserver -h 0.0.0.0 -p 8080 -R -D
