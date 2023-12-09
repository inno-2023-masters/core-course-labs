+++ after: /etc/apt/sources.list.d/docker.list
@@ -0,0 +1 @@
+deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.asc] https://download.docker.com/linux/ubuntu jammy stable

changed: [[IP EXPLUNGED]]

TASK [docker : Ensure unnecessary, unofficial or old packages are removed] *****
ok: [[IP EXPLUNGED]]

TASK [docker : Install docker] *************************************************
The following packages were automatically installed and are no longer required:
  apport-symptoms bc bolt fwupd fwupd-signed gir1.2-packagekitglib-1.0
  libappstream4 libarchive13 libatasmart4 libblockdev-fs2 libblockdev-loop2
  libblockdev-part-err2 libblockdev-part2 libblockdev-swap2 libblockdev-utils2
  libblockdev2 libdw1 libflashrom1 libftdi1-2 libfwupd2 libfwupdplugin5
  libgcab-1.0-0 libglib2.0-bin libgpgme11 libgstreamer1.0-0 libgudev-1.0-0
  libgusb2 libintl-perl libintl-xs-perl libjcat1 libjson-glib-1.0-0
  libjson-glib-1.0-common libmbim-glib4 libmbim-proxy libmm-glib0
  libmodule-find-perl libmodule-scandeps-perl libmspack0 libnspr4 libnss3
  libpackagekit-glib2-18 libparted-fs-resize0 libproc-processtable-perl
  libqmi-glib5 libqmi-proxy libsmbios-c2 libsort-naturally-perl libstemmer0d
  libtcl8.6 libterm-readkey-perl libudisks2-0 libxmlb2 libxmlsec1
  libxmlsec1-openssl libxslt1.1 lxd-agent-loader modemmanager needrestart
  open-vm-tools packagekit packagekit-tools python3-automat python3-bcrypt
  python3-blinker python3-chardet python3-click python3-colorama
  python3-configobj python3-constantly python3-debconf python3-debian
  python3-distro-info python3-distupgrade python3-hamcrest python3-hyperlink
  python3-incremental python3-jeepney python3-jwt python3-keyring
  python3-lazr.uri python3-oauthlib python3-problem-report python3-pyasn1
  python3-pyasn1-modules python3-pyparsing python3-secretstorage
  python3-service-identity python3-systemd python3-twisted
  python3-update-manager python3-wadllib python3-zope.interface sbsigntool
  secureboot-db squashfs-tools tcl tcl8.6 udisks2 unattended-upgrades
  usb-modeswitch usb-modeswitch-data zerofree
Use 'sudo apt autoremove' to remove them.
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
Recommended packages:
  docker-ce-rootless-extras libltdl7 pigz docker-compose-plugin
The following NEW packages will be installed:
  containerd.io docker-buildx-plugin docker-ce docker-ce-cli
0 upgraded, 4 newly installed, 0 to remove and 198 not upgraded.
changed: [[IP EXPLUNGED]]

TASK [docker : Install docker-compose] *****************************************
changed: [[IP EXPLUNGED]]

PLAY RECAP *********************************************************************
[IP EXPLUNGED]             : ok=7    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
