gpg_key: 12345678
daily_backups:
    backup1:
        local_path: /srv
        remote_path: sftp://root@backuphost//remotebackup/duplicitydroplet  

weekly:
    backup1:
        full: true
        local_path: /srv
        remote_path: sftp://root@backuphost//remotebackup/duplicitydroplet  
