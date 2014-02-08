#jinja
# This depends on the following:
#
#  * SSH keys setup and working on the host. (ssh-keygen -t rsa; ssh-copy-id username@backupserver)
#  * Follow https://www.digitalocean.com/community/articles/how-to-use-duplicity-with-gpg-to-securely-automate-backups-on-ubuntu 
#  * make a .passphrase file which contains the PASSPHRASE value. 

packages:
    pkg.installed:
        - names:
            - python-paramiko

duplicity:
    pkg.installed

/root/.passphrase:
    file.exists

/root/.ssh/id_rsa.pub:
    file.exists

{% if salt['pillar.get']('daily_backups', {}) != {} %} 
/etc/cron.daily/duplicity:
    file.managed:
        - user: root
        - group: root
        - mode: 755
        - source: salt://duplicity/files/cron.daily
        - template: jinja
{% endif %}

{% if salt['pillar.get']('weekly_backups', {}) != {} %} 
/etc/cron.weekly/duplicity:
    file.managed:
        - user: root
        - group: root
        - mode: 755
        - source: salt://duplicity/files/cron.weekly
        - template: jinja
{% endif %}

{% if salt['pillar.get']('montly_backups', {}) != {} %} 
/etc/cron.monthly/duplicity:
    file.managed:
        - user: root
        - group: root
        - mode: 755
        - source: salt://duplicity/files/cron.monthly
        - template: jinja
{% endif %}
