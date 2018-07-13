#FROM alpine:edge as builder
FROM alpine:edge

RUN mkdir -p /opt/multics && \
  cd /opt/multics && \
  wget https://s3.amazonaws.com/eswenson-multics/public/releases/MR12.6f/QuickStart_MR12.6f.zip && \
  unzip QuickStart_MR12.6f.zip && \
  rm QuickStart_MR12.6f.zip && \
  mv QuickStart_MR12.6f qs && \
\
  cd qs && \
  wget https://github.com/RattyDAVE/alpine-multics/blob/master/minimal/Linux_dps8.tgz && \
  tar -xvzf Linux_dps8.tgz

#FROM scratch		
		
WORKDIR /opt/multics/qs	
#COPY --from=builder /opt/multics/qs .		
		
EXPOSE 6180
ENTRYPOINT ["dps8", "MR12.6f_boot.ini"]
