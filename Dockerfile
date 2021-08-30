 
FROM alpine:edge

#ENV BUILDPKGS "git libtool automake make clang m4 sudo autoconf alpine-sdk"
ENV BUILDPKGS "git cmake make clang build-base llvm-static llvm-dev clang-static clang-dev  m4 sudo autoconf alpine-sdk libtool automake"

RUN apk --no-cache add --virtual build-dependencies $BUILDPKGS && \
\
  mkdir -p /opt/multics_install  && \
  cd /opt/multics_install  && \
\
  git clone https://github.com/libuv/libuv.git && \
  cd libuv && \
  git checkout v1.23.0 && \
  sh autogen.sh && \
  ./configure && \
  make -j $(nproc) && \
  make install && \
\
  cd /opt/multics_install && \
  git clone https://gitlab.com/dps8m/dps8m && \
\
  cd /opt/multics_install/dps8m  && \
  #git checkout R2.0 && \
  #git checkout R1.0 && \
  #git checkout R2.0.1_rc2 && \
  make -j $(nproc) && \
  make install&& \
\
  #RUN  cd /opt  && \
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
