
# record to a variable if the ntpd service is currently running, so that it can be
# stopped and then restarted at the end to not interfere with the command running
{% set ntpd_running = salt['service.status']('ntpd') %}

# ensure the service is stopped to prepare for running the time sync command
ntpd_stop:
  service.dead:
    - name: ntpd

# run this command to force a time sync
'ntpdate 0.centos.pool.ntp.org':
  cmd.run

# restart the ntpd service if it was running at the start of this salt state
{% if ntpd_running %}
  
ntpd_start:
  service.running:
    - name: ntpd

{% endif %}
