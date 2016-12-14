FROM ubuntu:14.04
RUN apt-get update && apt-get install -y python-pip git

RUN pip install -U pip
RUN pip install envtpl webob simplejson eventlet

WORKDIR /usr/src
RUN git clone https://github.com/jdoe0/ankisyncd
WORKDIR /usr/src/ankisyncd
RUN git checkout ndl-patches
RUN git reset --hard c398ccdb
RUN git submodule update --init

RUN ./patch_libanki.sh

COPY ankisyncd.conf.tpl ankisyncd.conf.tpl
COPY start.sh start.sh

ENV ANKI_ALLOWED_HOSTS 0.0.0.0
ENV ANKI_USER ''
ENV ANKI_PASSWORD ''

ENV ANKI_SSL_CERT ''
ENV ANKI_SSL_KEY ''

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

EXPOSE 27701

CMD ["/bin/bash", "./start.sh"]
