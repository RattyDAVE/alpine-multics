FROM rattydave/alpine-multics:latest as builder

FROM scratch		
		
WORKDIR /opt/multics/qs	
COPY --from=builder /opt/multics/qs .		
		
EXPOSE 6180
ENTRYPOINT ["dps8", "MR12.6f_boot.ini"]
