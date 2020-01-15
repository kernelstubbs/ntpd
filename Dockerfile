# Install Alpine
FROM alpine:latest

# Install ntpd
RUN apk add --no-cache openntpd

# Expose NTP port
EXPOSE 123/udp

# Terminate on status error
HEALTHCHECK CMD ntpctl -s status || exit 1

# Start ntpd with verbose logging
ENTRYPOINT [ "/bin/sh", "usr/sbin/ntpd -vds" ]
