FROM python:3.10.5-alpine as static-assets-builder
RUN apk update && apk add build-base python3-dev linux-headers
WORKDIR /usr/app
ENV STATIC_ROOT=/usr/app/static/
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
RUN python manage.py collectstatic

FROM nginx:1.23-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
COPY --from=static-assets-builder /usr/app/static/ /usr/app/static/
