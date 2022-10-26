FROM python:3.10.5-alpine
RUN apk update && apk add build-base python3-dev linux-headers
WORKDIR /usr/app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
