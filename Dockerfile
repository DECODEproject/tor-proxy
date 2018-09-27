FROM dyne/decodeos

WORKDIR /code

RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install setuptools && \
    pip3 install rsocks

COPY chainspace.toml .
COPY entrypoint.sh .

CMD /code/entrypoint.sh
