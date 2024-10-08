FROM nginx

COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80