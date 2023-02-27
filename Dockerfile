FROM ubuntu:22.04

# Non-interactive mode for apt-get
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update
RUN apt-get install -y git 
RUN apt-get install -y curl 

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN apt-get install -y build-essential


# Set the working directory 
WORKDIR /home/youtube-dl-rs

# Set cargo home to a folder in the working directory this will make rebuild 
# faster as it allows the cargo cache to be saved between docker runs. 
ENV CARGO_HOME=/home/youtube-dl-rs/cargo_home

CMD ["/bin/bash"]
