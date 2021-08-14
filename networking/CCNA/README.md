# Networking notes From davidBombal CCNA

## Class-9

RJ45 connector -> unsheilded twisted pair ethernet cable(the one used in router in my house)
CAT5 ethernet -> ethernet cable(twisted pair)
Protocol -> Set of rules to communication(like a language)
Port numbers -> specific label to identify the set of rules and to follow the instructions

## Class-10

Copper Crossover cables let talk to two devices directly
Mac Address -> twelve digit number in hexadecimal xxxx.xxxx.xxxx

## Class 11

Hub does not understand anything. It just amplifies the signal
Switch has intelligence. Mac address table configuration. Delivers data on destination mac address
Bridge = learns mac addresses in softwares
Switch = learn mac addresses from hardwares using Application Specific Integrated Circuits

## Class 13

OSI model: 7 Layers -> All, People, Sleeping, Through, Networking, Don't, Pass
                    -> (7)Application, (6)Presentation, (5)Session, (4)Transport, (3)Network, (2)Data link, (1)Physical
Tcp/Ip Model:       -> (5-7)Application, (4)Transport, (3)Network, (2)Data link, (1)Physical

## Class 14

TCP: Transmission Control Protocol
UDP: User Datagram Protocol
RFC: Request For Comments

|    Layer    |             Device             |
| :---------: | :----------------------------: |
| Application | HTTP, HTTPS, Telnet, FTP, TFTP |
|  Transport  |            TCP/UDP             |
|   Network   |             Router             |
|  Data link  |             Switch             |
|  Physical   |              Hub               |

## Class 15

Representation of data in different layers:

|    Layer    | Data Representation |
| :---------: | :-----------------: |
| Application |    Applications     |
|  Transport  |       Segment       |
|   Network   |       Packets       |
|  Data link  |       Frames        |
|  Physical   |        Bits         |

## Class 16

ARP -> Address Resolution Protocol\
ffff:ffff:ffff -> broadcast frame used for ARP (ex: Who Has this IP address?)\
PDU -> Protocol Data Unit\
**Type feild in Layer2**\
-> 0x0800 -> http(ipv4)\
-> 0x0806 -> arp\
Ipv4 is layer3 Protocol\
**Protocol field in Layer3**\
(Search for ipv4 protocol numbers)\
-> 0x06 -> TCP
-> 17 -> UDP

## Class 17

HTTP port -> 80(tcp)\
DNS server port -> 53(tcp/udp)\
FTP server port -> 21\
TFTP server port -> 69\
Telnet -> 23\
SSH -> 22\
SMTP -> 25\
0-1023 -> system port numbers\
1024-49151 -> user port numbers\
49152-65535 -> Private/dinamic port number\

## Class 19

Binary and Ip addresses
Needed in Subnetting and access list
IPV4 has four octates -> four bytes
