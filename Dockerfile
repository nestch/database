FROM mysql:9.4

CMD ["mysqld", "--bind-address=0.0.0.0", "--port=3306"]
