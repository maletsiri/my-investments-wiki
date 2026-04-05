FROM squidfunk/mkdocs-material:9.5.18

WORKDIR /docs

COPY mkdocs.yml .
COPY docs/ docs/

EXPOSE 8080

CMD ["serve", "--dev-addr=0.0.0.0:8080"]
