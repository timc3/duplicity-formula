duplicity-formula
=================

Salt Stack formula for duplicity

This formula is for deploying duplicity to one or more salt minions. The configuration for what gets backed up and where it gets backed up to will be placed in Pillar files.

I am presuming that SSH keys and GPG keys are created before running highstate. This is half because manually managing keys might be a good thing, but also to keep the complixity down of running GPG from Salt.

The resource I have been using, https://www.digitalocean.com/community/articles/how-to-use-duplicity-with-gpg-to-securely-automate-backups-on-ubuntu has an excellent write up on how to setup your keys. But in essence:

	* sudo su
	* passwd
	* ssh-keygen -t rsa
	* ssh-copy-id root@backuphost

Then create the GPG keys (keep the password safe and make a note of the key), in the file put the contents PASSPHRASE="passphrase_for_GPG":

	* gpg --gen-key
	* cd /root
	* editor .passphrase
	* chmod 700 /root/.passphrase

Then run duplicity.

The backup paths are configured using the pillar system and you can create daily, weekly or monthly backups and select the full flag if you like.

To Do
-------

Here are some things that I might improve at some point:

* Add more possible flags such as include and exclude options.
* SSH key exchange.
* Setting up the backup host
	
