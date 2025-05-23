#!/bin/bash
FROM alpine
RUN apk update ; apk upgrade ; apk add samba 

EXPOSE 445
ARG USERNAME
ARG PASSWORD

RUN mkdir -p /mnt/share/media /mnt/share/temp
VOLUME /mnt/share
COPY ./smb.conf /etc/samba/
RUN sed -i "s/<USERNAME>/$USERNAME/g" /etc/samba/smb.conf

RUN adduser -H -s /bin/false -u 1000 -D $USERNAME
RUN printf "$PASSWORD\n$PASSWORD\n" | smbpasswd -s -a $USERNAME

ENTRYPOINT ["/usr/sbin/smbd", "--no-process-group", "-F"]
CMD ["--debuglevel=3", "--debug-stdout"] 
