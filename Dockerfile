FROM alpine:edge

ENV BUILDPKGS "git libtool automake make clang m4 sudo autoconf alpine-sdk"

RUN apk --no-cache add --virtual build-dependencies $BUILDPKGS && \
\
  mkdir -p /opt/multics_install  && \
  cd /opt/multics_install  && \
  wget https://github.com/libuv/libuv/archive/v1.x.zip  && \
  unzip v1.x && \
  cd libuv-1.x && \
  sh autogen.sh && \
  ./configure && \
  make -j $(nproc) && \
  sudo make install && \
  cd /opt/multics_install && \
\
  wget https://sourceforge.net/projects/dps8m/files/Release%201.0/source.tgz && \
  tar xfz source.tgz && \
  cd dps8m-code && \
  make -j $(nproc) && \
  sudo make install && \
  \
  cd /opt  && \
  rm -R /opt/multics_install && \
\
  mkdir -p /opt/multics && \
  cd /opt/multics && \
  wget https://s3.amazonaws.com/eswenson-multics/public/releases/MR12.6f/QuickStart_MR12.6f.zip && \
  unzip QuickStart_MR12.6f.zip && \
  rm QuickStart_MR12.6f.zip && \
  mv QuickStart_MR12.6f qs && \
\
  apk del build-dependencies && \
  rm -rf /var/cache/apk/*
  
EXPOSE 6180

WORKDIR /opt/multics/qs

ENTRYPOINT ["dps8", "MR12.6f_boot.ini"]
