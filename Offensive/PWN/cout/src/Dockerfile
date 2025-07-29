FROM ubuntu:20.04

# Disable interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    socat \
    gcc \
    g++ \
    python3 \
    python3-pip \
    make \
    gdb \
    file \
    netcat \
    curl \
    nano \
    vim \
    libc6-dev \
    libseccomp-dev \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user (optional but good for CTF challenges)
RUN useradd -m ctf

# Set working directory
WORKDIR /app
USER ctf

# Expose the port typically used in challenges
EXPOSE 8000

# Default command
CMD ["/bin/bash"]
