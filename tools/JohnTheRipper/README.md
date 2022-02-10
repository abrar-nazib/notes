# Commands I used with JohnTheRipper

## ssh2john

- `ssh2john id_rsa > id_rsa.hash` converts ssh private key file into something john can understand

## Available Options

- `--wordlist=FILEPATH` for dictionary attack
- `--format=HASHTYPE` specify hash type
  - descrypt/bsdicrypt/md5crypt/bcrypt/LM/AFS/tripcode/dummy/crypt
-

## Commands to copy

- `john --wordlist=/opt/SecLists/Passwords/Leaked-Databases/rockyou.txt id_rsa.hash `
- `john --wordlist=../../wordlists/rockyou.txt --format=format hashfile`

## Hash Formats

```
john --list=formats
descrypt, bsdicrypt, md5crypt, md5crypt-long, bcrypt, scrypt, LM, AFS,
tripcode, AndroidBackup, adxcrypt, agilekeychain, aix-ssha1, aix-ssha256,
aix-ssha512, andOTP, ansible, argon2, as400-des, as400-ssha1, asa-md5,
AxCrypt, AzureAD, BestCrypt, bfegg, Bitcoin, BitLocker, bitshares, Bitwarden,
BKS, Blackberry-ES10, WoWSRP, Blockchain, chap, Clipperz, cloudkeychain,
dynamic_n, cq, CRC32, sha1crypt, sha256crypt, sha512crypt, Citrix_NS10,
dahua, dashlane, diskcryptor, Django, django-scrypt, dmd5, dmg, dominosec,
dominosec8, DPAPImk, dragonfly3-32, dragonfly3-64, dragonfly4-32,
dragonfly4-64, Drupal7, eCryptfs, eigrp, electrum, EncFS, enpass, EPI,
EPiServer, ethereum, fde, Fortigate256, Fortigate, FormSpring, FVDE, geli,
gost, gpg, HAVAL-128-4, HAVAL-256-3, hdaa, hMailServer, hsrp, IKE, ipb2,
itunes-backup, iwork, KeePass, keychain, keyring, keystore, known_hosts,
krb4, krb5, krb5asrep, krb5pa-sha1, krb5tgs, krb5-17, krb5-18, krb5-3,
kwallet, lp, lpcli, leet, lotus5, lotus85, LUKS, MD2, mdc2, MediaWiki,
monero, money, MongoDB, scram, Mozilla, mscash, mscash2, MSCHAPv2,
mschapv2-naive, krb5pa-md5, mssql, mssql05, mssql12, multibit, mysqlna,
mysql-sha1, mysql, net-ah, nethalflm, netlm, netlmv2, net-md5, netntlmv2,
netntlm, netntlm-naive, net-sha1, nk, notes, md5ns, nsec3, NT, o10glogon,
o3logon, o5logon, ODF, Office, oldoffice, OpenBSD-SoftRAID, openssl-enc,
oracle, oracle11, Oracle12C, osc, ospf, Padlock, Palshop, Panama,
PBKDF2-HMAC-MD4, PBKDF2-HMAC-MD5, PBKDF2-HMAC-SHA1, PBKDF2-HMAC-SHA256,
PBKDF2-HMAC-SHA512, PDF, PEM, pfx, pgpdisk, pgpsda, pgpwde, phpass, PHPS,
PHPS2, pix-md5, PKZIP, po, postgres, PST, PuTTY, pwsafe, qnx, RACF,
RACF-KDFAES, radius, RAdmin, RAKP, rar, RAR5, Raw-SHA512, Raw-Blake2,
Raw-Keccak, Raw-Keccak-256, Raw-MD4, Raw-MD5, Raw-MD5u, Raw-SHA1,
Raw-SHA1-AxCrypt, Raw-SHA1-Linkedin, Raw-SHA224, Raw-SHA256, Raw-SHA3,
Raw-SHA384, ripemd-128, ripemd-160, rsvp, Siemens-S7, Salted-SHA1, SSHA512,
sapb, sapg, saph, sappse, securezip, 7z, Signal, SIP, skein-256, skein-512,
skey, SL3, Snefru-128, Snefru-256, LastPass, SNMP, solarwinds, SSH, sspr,
Stribog-256, Stribog-512, STRIP, SunMD5, SybaseASE, Sybase-PROP, tacacs-plus,
tcp-md5, telegram, tezos, Tiger, tc_aes_xts, tc_ripemd160, tc_ripemd160boot,
tc_sha512, tc_whirlpool, vdi, OpenVMS, vmx, VNC, vtp, wbb3, whirlpool,
whirlpool0, whirlpool1, wpapsk, wpapsk-pmk, xmpp-scram, xsha, xsha512, ZIP,
ZipMonster, plaintext, has-160, HMAC-MD5, HMAC-SHA1, HMAC-SHA224,
HMAC-SHA256, HMAC-SHA384, HMAC-SHA512, sha1crypt-opencl, KeePass-opencl,
oldoffice-opencl, PBKDF2-HMAC-MD4-opencl, PBKDF2-HMAC-MD5-opencl,
PBKDF2-HMAC-SHA1-opencl, rar-opencl, RAR5-opencl, TrueCrypt-opencl,
lotus5-opencl, AndroidBackup-opencl, agilekeychain-opencl, ansible-opencl,
axcrypt-opencl, axcrypt2-opencl, bcrypt-opencl, BitLocker-opencl,
bitwarden-opencl, blockchain-opencl, cloudkeychain-opencl, md5crypt-opencl,
sha256crypt-opencl, sha512crypt-opencl, dashlane-opencl, descrypt-opencl,
diskcryptor-opencl, diskcryptor-aes-opencl, dmg-opencl,
electrum-modern-opencl, EncFS-opencl, enpass-opencl, ethereum-opencl,
ethereum-presale-opencl, FVDE-opencl, geli-opencl, gpg-opencl, iwork-opencl,
keychain-opencl, keyring-opencl, keystore-opencl, krb5pa-md5-opencl,
krb5pa-sha1-opencl, krb5asrep-aes-opencl, lp-opencl, lpcli-opencl, LM-opencl,
mscash-opencl, mscash2-opencl, mysql-sha1-opencl, notes-opencl, NT-opencl,
ntlmv2-opencl, o5logon-opencl, ODF-opencl, office-opencl,
OpenBSD-SoftRAID-opencl, PBKDF2-HMAC-SHA256-opencl,
PBKDF2-HMAC-SHA512-opencl, pem-opencl, pfx-opencl, pgpdisk-opencl,
pgpsda-opencl, pgpwde-opencl, PHPass-opencl, pwsafe-opencl, RAKP-opencl,
raw-MD4-opencl, raw-MD5-opencl, raw-SHA1-opencl, raw-SHA256-opencl,
raw-SHA512-free-opencl, raw-SHA512-opencl, salted-SHA1-opencl, sappse-opencl,
7z-opencl, SL3-opencl, solarwinds-opencl, ssh-opencl, sspr-opencl,
strip-opencl, telegram-opencl, tezos-opencl, vmx-opencl, wpapsk-opencl,
wpapsk-pmk-opencl, XSHA512-free-opencl, XSHA512-opencl, ZIP-opencl, dummy,
crypt

```
