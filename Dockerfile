FROM ubuntu
RUN apt update
RUN apt install -y apt-utils
RUN apt install -y curl wget vim git build-essential net-tools
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup update
COPY . .
RUN cargo build
EXPOSE 7878
CMD /main
