FROM gitpod/workspace-full

USER root
RUN apt-get update && apt-get install -y \
          binutils \
          git \
          gnupg2 \
          libc6-dev \
          libcurl4 \
          libedit2 \
          libgcc-9-dev \
          libpython2.7 \
          libsqlite3-0 \
          libstdc++-9-dev \
          libxml2 \
          libz3-dev \
          pkg-config \
          tzdata \
          uuid-dev \
          zlib1g-dev \
          && rm -rf /var/lib/apt/lists/*

USER gitpod
RUN wget https://swift.org/builds/swift-5.5-release/ubuntu2004/swift-5.5-RELEASE/swift-5.5-RELEASE-ubuntu20.04.tar.gz \
    && wget https://swift.org/builds/swift-5.5-release/ubuntu2004/swift-5.5-RELEASE/swift-5.5-RELEASE-ubuntu20.04.tar.gz.sig \
    && wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - \
    && gpg --keyserver hkp://keyserver.ubuntu.com --refresh-keys Swift \
    && gpg --verify swift-5.5-RELEASE-ubuntu20.04.tar.gz.sig \
    && tar xzf swift-5.5-RELEASE-ubuntu20.04.tar.gz -C ~ \
    && echo "PATH=~/swift-5.5-RELEASE-ubuntu20.04/usr/bin:$PATH" >> ~/.bashrc
    
