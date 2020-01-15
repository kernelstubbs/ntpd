# Install Alpine
FROM alpine:latest

# Install ntpd
RUN apk add --no-cache openntpd

# Terminate on status error
HEALTHCHECK CMD ntpctl -s status || exit 1


# Expose NTP port
EXPOSE 123/udp
#VOLUME /etc/ntpd.conf

# Start ntpd with verbose logging
ENTRYPOINT [ "/bin/sh", "/usr/sbin/ntpd -vds" ]