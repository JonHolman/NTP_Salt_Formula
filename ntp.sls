ntp:
  pkg.installed

ntpd:
  service.running:
    - enable: True

