
# Install NTP
ntp:
  pkg.installed


# Configure NTP
# set which ntp server should be listed first
{% set servers = pillar['time_servers'] %}
  
# Deploy NTP Configuration File
deploy the ntp.conf file:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp.conf
    - template: jinja
    - defaults:
        ntp_servers: {{ servers }}


# initializes using ntpdate

# ensure the service is stopped to prepare for running the time sync command
ntpd_stop:
  service.dead:
    - name: ntpd

# run this command to force a time sync
'ntpdate 0.centos.pool.ntp.org':
  cmd.run


# Start the NTP Service
ntpd:
  service.running:
    - enable: True
