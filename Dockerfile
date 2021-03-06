FROM python:3.6.8-alpine

WORKDIR /app

RUN apk add --no-cache tesseract-ocr \
                       tesseract-ocr-data-por \
                       imagemagick \
                       imagemagick-dev \
                       postgresql-dev \
                       sqlite \
                       gcc \
                       zlib-dev \
                       jpeg-dev \
                       musl-dev && \
    rm -rf /var/cache/apk/*

COPY requirements.txt .
COPY requirements-victor.txt .

RUN pip install -r requirements.txt
RUN pip install -r requirements-victor.txt
RUN mkdir /tmp/ocrtmp
