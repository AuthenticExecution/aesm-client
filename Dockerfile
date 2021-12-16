FROM authexec/docker-sgx-tools:latest
COPY Cargo.toml .
COPY src src
RUN cargo install --path .


FROM authexec/docker-sgx-base:latest
COPY --from=0 /usr/local/cargo/bin/aesm_client /usr/bin/aesm_client
CMD ["aesm_client"]
