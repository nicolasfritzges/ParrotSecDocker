FROM parrotsec/core:rolling
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.11-2

# Install components
RUN apt-get update; apt-get -y dist-upgrade calendar- cpp- gcc- bsdmainutils- ncal-;apt-get -y install parrot-pico aircrack-ng- at-spi*- dconf*- gsettings*- gtk*- hicolor*- mesa-*- pyqt5*- qt5-*- qtbase5*- samba-common-;apt-get -y install parrot-mini parrot-tools-cloud zulucrypt- sirikali- apache2*- nginx*- at-spi*- dconf*- gsettings*- gtk*- hicolor*- mesa-*- pyqt5*- qt5-*- qtbase5*- samba-common- alsa*- xserver*- zaproxy- burpsuite- xdg*-  wine*- i965-va-driver-  parrot-drivers wireshark-qt- x11*-; rm -rf /var/lib/apt/lists/*

# install graphics
RUN apt-get install -y x11vnc xvfb 

RUN apt-get update && apt-get install --no-install-recommends -y keyboard-configuration \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install --no-install-recommends -y gnome-icon-theme tightvncserver xorg xserver-xorg \
    xserver-xorg-video-dummy \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install --no-install-recommends -y xfce4 xfce4-goodies iceweasel \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir ~/.vnc
#change password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
COPY entrypoint.sh /entrypoint.sh


VOLUME /data
WORKDIR /data
ENTRYPOINT ["/entrypoint.sh"]

