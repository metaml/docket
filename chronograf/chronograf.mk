DEB = chronograf_0.12.0_amd64.deb

install:
	cd /var/tmp \
	&& wget https://s3.amazonaws.com/get.influxdb.org/chronograf/${DEB} \
	&& dpkg -i chronograf_0.12.0_amd64.deb \
	&& rm -f ${DEB}
