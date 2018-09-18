FROM dyne/decodeos

WORKDIR /code

RUN apt-get install -y python3-pip python3-setuptools && \
    pip3 install rsocks

COPY chainspace.toml .
COPY entrypoint.sh .

CMD /code/entrypoint.sh
