FROM rust:1.57

WORKDIR /usr/src/myapp

COPY ./my-first-contract .

RUN cargo build --target-dir /tmp

CMD ["cargo", "test", "--target-dir", "/tmp"]