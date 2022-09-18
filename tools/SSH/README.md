# All ssh commands I used so far

## SSH

- `eval "$(ssh-agent -s)"` will start ssh agent if not started yet
- `ssh -T git@github.com` -T for test connection
- `ssh username@ip` for connecting to a specific ip address
- `ssh john@$(cat ip) -i id_rsa` for connecting with private key

## SCP

```bash
scp important.txt ubuntu@192.168.1.30:/home/ubuntu/transferred.txt # Copying from local to remote
scp ubuntu@192.168.1.30:/home/ubuntu/documents.txt notes.txt       # Downloading from remote to local
```

## KEY Generation

```bash
ssh-keygen -t rsa -b 4096 -C "thunder"
    # -t for type, rsa is the most popular protocol for key generation
    # -b for bit size, how big the key should be
    # -C for comment, optional stuff
###### this command will generate and save ssh key inside ~/.ssh/id_rsa
ssh-add id_rsa
#### adds id_rsa as private key of the device
```

- `ssh-keygen`
  - Normally requires a password while using
