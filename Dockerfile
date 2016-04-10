FROM python:2.7

RUN apt-get update \
    && apt-get install -y lftp librsync-dev gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir boto lockfile paramiko pycryptopp urllib3 requests requests_oauthlib PyDrive python-swiftclient python-keystoneclient
RUN pip install --no-cache-dir azure-storage==0.20.3

RUN cd /tmp \
    && wget https://code.launchpad.net/duplicity/0.7-series/0.7.07/+download/duplicity-0.7.07.tar.gz \
    && tar xf duplicity-0.7.07.tar.gz \
    && cd duplicity-0.7.07 && python2 setup.py install \
    && cd / && rm -rf /tmp/*
