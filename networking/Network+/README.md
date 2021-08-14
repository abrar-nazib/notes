# Networking notes from CompTIA network+

## 3.1.1 OSI Model

* **Full Form:** Open System Interconnect Model
* Osi Model Has 7 Layers. It's just a reference model btw.
  | L   | Name         | Usage/Description                         | Protocol Data unit    | Device/Protocol | Memory Aid         |
  | --- | ------------ | ----------------------------------------- | --------------------- | --------------- | ------------------ |
  | 7   | Application  |                                           |                       | HTTP/HTTPS      | Away==All          |
  | 6   | Presentation | To show how data should be formatted      |                       | JPG/PNG         | Pizza==People      |
  | 5   | Session      | Used to setup voice/videoCall             |                       | SIP             | Sausage==Seem      |
  | 4   | Transport    | Concerned with network connections        | Segments              | TCP, UDP        | Throw==To          |
  | 3   | Network      | Forwarding desicions are made based on IP | Packets(or Datagrams) | Routers         | Not==Need          |
  | 2   | Data Link    | Desicions are made based on mac addresses | Frames                | Ethernet Switch | Do==Data           |
  | 1   | Physical     | Concerned with getting bits on the wire   | bits                  | Data Cable      | Please==Processing |

* **MAC**(Media Access Control) Addresses is a 48 bit address burned in to a NIC
* **P**rotocol **D**ata **U**nit: The name given to data at specific layers of the **OSI** model.
* TCP(Transmission Control Protocol) is reliable and connection based protocol.
* UDP(User Datagram Protocol) is unreliable and it is not connection based.
* HTTP: port 80, HTTPS: port 443

## 4.1.2 TCP:IP Model

* TCP:IP model has 4/5 Layers depending on the implementation
    | Layer  | Name           | Replaced OSI       | Memory Aid |
    | ------ | -------------- | ------------------ | ---------- |
    | Layer4 | Application    | 5+6+7              |            |
    | Layer3 | Transport      | Transport          |            |
    | Layer2 | Internet Layer | Network            |            |
    | Layer1 | Network Access | Physical+Data Link |            |
* Layer1 is also called 
  * Network Interface
  * Link
  * Physical+Data Link
  * Physical+Network Interface