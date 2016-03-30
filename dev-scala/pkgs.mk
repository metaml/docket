PKGS = binutils gcc g++ gfortran cmake git python-dev cython python-pip
PKGS += python-tk python-pmw python-imaging python-matplotlib ruby automake
PKGS += libtool libssl-dev libpcre3-dev openssl libssl-dev libmsgpack-dev libyaml-dev libopenblas-dev
PKGS += liblapack-dev libatlas-dev libtiff-dev libpng12-dev libjpeg-dev libfreetype6-dev libwebp-dev
PKGS += libwebpmux1 libgmp-dev libmpfr-dev libmpc-dev libisl-dev libfreetype6-dev
PKGS += net-tools iputils-ping telnet netcat lsof less dnsutils tk
PKGS += rlwrap

install: pkgs

pkgs:; apt-get install -y ${PKGS}
