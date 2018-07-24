# Ensure ntp package is installed
ntp:
  pkg.installed

# Ensure ntpd service is running
ntpd:
  service.running:
    - enable: True

# set which ntp server should be listed first
{% set servers = ['0.centos.pool.ntp.org','1.centos.pool.ntp.org','2.centos.pool.ntp.org','3.centos.pool.ntp.org']  %}

# Deploy NTP Configuration File
deploy the ntp.conf file:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp.conf
    - template: jinja
    - defaults:
        ntp_servers: {{ servers }}
