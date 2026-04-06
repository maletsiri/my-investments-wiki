# Stage 1 — build the static site
FROM squidfunk/mkdocs-material:9.5.18 AS builder
WORKDIR /docs
COPY mkdocs.yml .
COPY docs/ docs/
RUN mkdocs build --site-dir /site

# Stage 2 — serve with nginx
FROM nginx:alpine
COPY --from=builder /site /usr/share/nginx/html
COPY wiki-nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
