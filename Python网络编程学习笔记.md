# Python网络编程学习笔记

Abstract：本文是根据作者日常学习Python网络编程相关知识所作的笔记，主要目的是为了方便日常的工作学习。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-03-06 22:45 —— 2022-03-11 21:35

----------

- [1 UDP与TCP通信](#1-udp与tcp通信)
  - [1.1 网络通信概述](#11-网络通信概述)
  - [1.2  IP地址概述](#12--ip地址概述)
  - [1.3 端口](#13-端口)
  - [1.4 socket简介](#14-socket简介)
  - [1.5 UDP简介](#15-udp简介)
  - [1.6 TCP简介](#16-tcp简介)
  - [1.7 TCP/IP协议](#17-tcpip协议)
  - [1.8 DDos攻击](#18-ddos攻击)
  - [1.9 epoll](#19-epoll)
- [2 多进程编程](#2-多进程编程)
  - [2.1 进程以及状态](#21-进程以及状态)
  - [2.2 进程的创建](#22-进程的创建)
  - [2.3 进程间通信-Queue](#23-进程间通信-queue)
  - [2.4 进程池Pool](#24-进程池pool)
- [3 多线程编程](#3-多线程编程)
  - [3.1 多任务的概念](#31-多任务的概念)
  - [3.2 线程的概念](#32-线程的概念)
  - [3.3 锁的概念](#33-锁的概念)
- [4 协程](#4-协程)
  - [4.1 协程的概念](#41-协程的概念)
  - [4.2 greenlet](#42-greenlet)
  - [4.3 gevent](#43-gevent)
  - [4.4 迭代器](#44-迭代器)
  - [4.5 生成器](#45-生成器)
- [5 进程、线程和协程对比](#5-进程线程和协程对比)

----------------------


## 1 UDP与TCP通信

### 1.1 网络通信概述

网络就是一种辅助双方或者多方能够连接在一起的工具，然后可以进行数据传输。所谓的网络编程就是，让在不同的电脑上的软件能够进行数据传递，即进程之间的通信。

使用网络的目的是为了连通多方然后进行通信用的，即把数据从一方传递给另外一方。为了让不同的电脑上运行的软件，之间可以互相传递数据，就需要借助网络的功能。

### 1.2  IP地址概述

**IP地址的概念**

IP地址是一种网络协议，用于标识连接到互联网的设备和计算机的地址。它是由32位二进制数字组成的数字序列，通常被分成四个数字段，并用点号分隔，每个数字段的值在0到255之间。例如，192.168.0.1就是一个常见的IP地址。

**IP地址的作用**

IP地址用于在互联网上找到其他设备和计算机。每个连接到互联网的设备都需要一个唯一的IP地址，这样它才能够与其他设备进行通信。使用IP地址，设备可以通过互联网向其他设备发送和接收数据，例如网页、电子邮件、音频和视频等。

**IP地址的分类**

在IP地址中，有两种类型的地址：IPv4和IPv6。IPv4是32位二进制数字，可以表示大约42亿个地址，而IPv6是128位二进制数字，可以表示更多的地址，以满足日益增长的互联网设备需求。

每一个IP地址包括两部分：**网络地址**和**主机地址**。网络地址指的是一个网络的标识符，而主机地址是该网络中每个设备或主机的标识符。在计算机网络中，网络地址用于标识特定的网络，而主机地址用于标识网络中的每个设备。网络地址和主机地址的长度和格式取决于所使用的IP地址版本。

在IPv4中，网络地址和主机地址分别占用IP地址的前几位和后几位。网络地址和主机地址的位数可以根据网络的规模和需求而变化。在IPv4中，网络地址通常由子网掩码来指定，子网掩码是一个32位的数字序列，用于确定哪些位是网络地址，哪些位是主机地址。

> 例如，如果一个IPv4地址为192.168.1.1，子网掩码为255.255.255.0，则前三个数字（192.168.1）是网络地址，最后一个数字（1）是主机地址。这意味着这个设备属于192.168.1这个网络，而1是该网络中的主机标识符。

在IPv6中，网络地址和主机地址的划分是不同的，它们都由一组16进制数字组成，由冒号分隔。

> 例如，如果一个IPv6地址为2001:0db8:85a3:0000:0000:8a2e:0370:7334，前缀长度为64，则前64个位（2001:0db8:85a3:0000）是网络地址，而最后64位（0000:8a2e:0370:7334）是主机地址。

IP地址被分为5个类别，分别是A类、B类、C类、D类和E类。每个类别的IP地址有不同的网络和主机地址的位数和分配方式。以下是每个类别的地址范围：

- A类地址范围：0.0.0.0 - 127.255.255.255
- B类地址范围：128.0.0.0 - 191.255.255.255
- C类地址范围：192.0.0.0 - 223.255.255.255
- D类地址范围：224.0.0.0 - 239.255.255.255
- E类地址范围：240.0.0.0 - 255.255.255.255

A类地址：A类地址的第一位始终为0，后面的7位为网络地址，剩余的24位为主机地址。A类地址通常用于大型网络，可以容纳大约16,777,214个主机。范围从1.0.0.0到126.255.255.255。

B类地址：B类地址的前两位始终为10，后面的14位为网络地址，剩余的16位为主机地址。B类地址通常用于中型网络，可以容纳大约65,534个主机。范围从128.0.0.0到191.255.255.255。

C类地址：C类地址的前三位始终为110，后面的21位为网络地址，剩余的8位为主机地址。C类地址通常用于小型网络，可以容纳大约254个主机。范围从192.0.0.0到223.255.255.255。

D类地址：D类地址的前四位始终为1110，后面的28位用于多播地址。D类地址用于多播（向多个主机发送数据），而不是点对点通信。范围从224.0.0.0到239.255.255.255。

E类地址：E类地址的前五位始终为11110，后面的27位保留。E类地址被保留，不用于一般的网络通信，而是用于实验和研究目的。范围从240.0.0.0到255.255.255.255。

这些IP地址类别的分配方式由Internet Assigned Numbers Authority（IANA）管理。

**掩码和广播地址**

**子网掩码**是一种用于确定IP地址中哪些位用于网络地址，哪些位用于主机地址的方法。子网掩码也是一个32位的二进制数，与IP地址进行逐位的“与”运算，可以得到该IP地址所属的网络地址。

例如，如果我们有一个IP地址为192.168.1.100，子网掩码为255.255.255.0的设备，通过将IP地址与子网掩码进行逐位“与”运算，可以得到该设备所属的网络地址为192.168.1.0。

**广播地址**是一种特殊的IP地址，用于将数据广播到同一网络上的所有设备。在IPv4中，广播地址的格式通常为某个网络地址后面所有主机位都为1的IP地址。例如，对于192.168.1.0/24网络，其广播地址为192.168.1.255。

需要注意的是，在一些特定的网络中，例如VLAN或者子网划分后的网络中，广播地址并不一定是网络地址后面所有位都为1的地址，而是在该网络中分配的特定广播地址。

**Linux中查看网关**

查看或配置网卡信息：`ifconfig`

测试远程主机连通性：`ping`

路由查看：`route -n`

### 1.3 端口

**端口的概念**

在计算机网络中，**端口（Port）**是一种用于区分不同网络应用程序或服务的数字标识符。一个端口可以被看做是一扇门，用于允许数据在计算机上的不同进程之间流通。计算机中的每个进程都有自己的唯一标识符，称为进程ID（PID），而端口则用于标识进程中的不同应用程序或服务。在Linux系统中，端口可以有65536个之多。操作系统为了统一管理，进行了编号，这就是端口号。

**端口号**

端口是通过端口号来标记的，**端口号**是一个16位的**整数**，它的范围是0到65535。其中，0到1023的端口号被称为“well-known”端口号，用于标识一些常用的网络服务，例如HTTP服务（端口号80）、FTP服务（端口号21）等。1024到49151的端口号被称为“registered”端口号，用于标识一些自定义的网络应用程序。49152到65535的端口号被称为“dynamic”端口号，用于临时分配给某个应用程序。

*注：端口数不一样的unix/linux系统，还可以手动修改*

**端口是如何分配的**

在计算机中，端口的分配是由操作系统进行管理的。当一个进程需要与其他进程通信时，它可以向操作系统请求分配一个未被占用的端口号。如果端口号已经被占用，则操作系统会拒绝分配该端口，并提示错误信息。

**知名端口**（Well-Known Ports）是众所周知的端口，范围从0到1023。它们已经被固定地分配给一些常用的网络服务，例如HTTP服务（端口号80）、FTP服务（端口号21）、ssh服务（端口号22）、https（端口号443）等。这些端口号是由Internet Assigned Numbers Authority (IANA)进行管理的，并且已经被广泛使用，因此应用程序需要按照约定使用这些端口号，以便网络中的其他设备能够正确识别和处理数据。

**注册端口**（Registered Ports），范围从1024到49151。它们可以被应用程序动态地分配和使用。在启动应用程序时，操作系统会为其分配一个未被占用的端口号。如果应用程序需要与其他进程通信，则它可以将自己的端口号告知其他进程，以便其他进程能够将数据发送到该端口。

**动态端口**（Dynamic Ports），范围从49152到65535。它们可以被操作系统分配给客户端程序使用。当一个客户端程序需要与远程服务器建立连接时，操作系统会为其分配一个未被占用的动态端口号，并在通信结束后释放该端口号。这种方式可以避免客户端程序使用已被其他应用程序占用的端口号，从而提高了应用程序的稳定性和可靠性。

**怎么查看端口**

查看端口状态：`netstat -an`

列出当前系统中正在使用TCP或UDP协议的2425端口的进程信息：`sudo lsof -i [tcp/udp]:2425`

查看哪一个进程使用了22端口：`sudo lsof -i tcp:22`

查看某个进程是否还在：`ps -elf |grep udp_server`

**端口的作用**

端口是为了实现网络通信而在计算机中开放的一组数字，用于区分不同的网络应用程序或服务。在TCP/IP协议中，每个应用程序或服务都可以被分配一个端口号，从而可以实现多个应用程序或服务在同一计算机上同时运行，互不干扰。具体作用如下：

- 区分不同应用程序或服务

每个应用程序或服务都可以被分配一个端口号，不同的端口号代表不同的应用程序或服务。例如，HTTP服务器默认使用80端口，FTP服务器默认使用21端口，SMTP服务器默认使用25端口等。

- 提供数据传输的入口

当数据包到达计算机时，需要通过端口号找到相应的应用程序或服务来处理数据。例如，当浏览器请求一个网页时，数据会通过80端口传输到计算机上运行的Web服务器，Web服务器接收到数据后再返回相应的网页数据。

- 实现多进程或多线程并发

端口号可以使多个应用程序或服务在同一计算机上同时运行，实现并发处理。例如，一个Web服务器可以在同一时间处理多个用户的请求，通过不同的端口号来区分不同的用户请求。

### 1.4 socket简介

**不同电脑上的进程之间如何通信？**

首先要解决的问题是如何唯一标识一个进程，否则通信无从谈起。在一台电脑上可以通过进程号（PID）来唯一标识一个进程，但是在网络中这是行不通的。但其实TCP/IP协议已经帮我们解决了这个问题，网络层的“IP地址”可以唯一标识网络中的主机，而传输层的“协议+端口”可以唯一标识主机中的应用进程。这样利用协议，IP地址，端口就可以标识主机中的应用进程了，网络中的进程通信就可以利用这个标志和其他进程进行交互。

- 进程是指运行的程序以及运行时用到的资源这个整体称之为进程；
- 进程间通信指的是：运行程序之间的数据共享。

**socket的概念**

socket（简称：套接字）是进程间通信的一种方式，它与其他进程间通信的一个主要不同在于，它能实现不同主机间的进程间通信，我们网络上各种各样的服务大多都是基于socket来完成通信的。例如，浏览器、QQ聊天、收发email等。

**创建socket**

在Python中，使用socket模块的函数socket可以实现：

```python
import socket
socket.socket(AddressFamily, Type)
```

函数`socket.socket()`创建一个socket，该函数带有两个参数：

- AddressFamily：可以选择AF_INET（用于Internet进程间通信）或者AF_UNIX（用于同一台机器进程间通信），实际工作中常用AF_INET。
- Type：套接字类型，可以是SOCK_STREAM（流式套接字，主要用于TCP协议）或者SOCK_DGRAM（数据报套接字，主要用于UDP协议）。

注：套接字使用流程和文件的使用流程类似

- 创建套接字；
- 使用套接字收/发数据；
- 关闭套接字。

### 1.5 UDP简介

**UDP**（User Datagram Protocol）是一种无连接、无状态的传输层协议，它不像TCP那样提供可靠的数据传输和错误检测机制，而是提供了一种简单的数据传输机制，可以快速地发送数据包。UDP通信具有传输快速、开销小的优点，适用于对数据可靠性要求不高的场合，例如音视频数据传输、DNS查询等。

UDP通信的特点如下：

- 无连接：UDP不需要在数据传输前建立连接，数据包可以直接发送到目的地。
- 无状态：UDP不保存之前传输的数据包信息，每个数据包都是独立的，即使数据包丢失也不会对之前和之后的数据包产生影响。
- 快速：UDP没有TCP的重传机制和拥塞控制机制，因此传输速度快。
- 不可靠：UDP不提供数据传输的可靠性保证，数据包可能会丢失、重复、乱序等。
- 支持广播和多播：UDP支持将数据包发送给多个目的地，可以用于广播和多播通信。

UDP协议通信时，每个数据包都包含源端口和目的端口，用于标识数据包的发送方和接收方。**UDP没有连接建立和断开的过程**，因此数据包发送和接收的过程非常快速和简单。然而，由于UDP不提供可靠性保证，因此在实际应用中需要进行一些额外的机制设计，以保证数据传输的正确性和完整性。

<p align="center"><img src=".\images\UDP通信结构图.JPG" width="50%">
<p align="center">图1-1 UDP通信结构图</p>


如图1-1所示是UDP通信结构图，创建一个基于UDP的网络程序流程具体步骤如下：

- 创建客户端套接字；
- 发送/接收数据；
- 关闭套接字。

下面是Python中使用UDP协议实现服务器端和客户端的代码简述。

- 服务器端

```python
import socket

# 创建UDP socket对象
server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# 绑定IP地址和端口号
server_address = ('', 2000)
server_socket.bind(server_address)

while True:
    # 接收数据
    data, client_address = server_socket.recvfrom(1024)

    # 处理数据
    processed_data = process_data(data.decode('utf-8'))

    # 发送响应数据
    server_socket.sendto(processed_data, client_address)
```

- 客户端

```python
import socket

# 创建UDP套接字
client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# 目标服务器地址和端口号
server_address = ('localhost', 2000)

# 发送数据
message = 'Hello, server!'
client_socket.sendto(message.encode('utf-8'), server_address)

# 接收响应数据
response, server_address = client_socket.recvfrom(1024)
print(f"Received response: {response.decode('utf-8')}")

# 关闭UDP套接字
client_socket.close()
```

- 一个UDP网络程序，可以不绑定，此时操作系统会随机分配一个端口，如果重新运行此程序端口可能会发送变化；
- 一个UDP网络程序，也可以绑定信息（IP地址，端口号），如果绑定成功，那么操作系统用这个端口号来进行区别收到的网络数据是否此进程。

**发生端口占用怎么办？**

1. `ps -elf`查看进程
2. `kill -9 进程id`

**UDP发送数据的特点**

`sendto()`一次，内核里边放了一个队列节点，`recvfrom()`就拿一个节点，拿的时候内核就删除了，`recvfrom()`的大小要大于`sendto()`发送的报文大小，否则在获取时就会丢失（Windows是报异常）。

### 1.6 TCP简介

**TCP**（Transmission Control Protocol）是一种常用的互联网传输协议，它是互联网协议栈中的一部分，用于在网络中传输数据。TCP是一种面向连接的协议，它提供可靠的、有序的、基于字节流的数据传输服务，适用于各种不同类型的应用程序。

TCP通过建立连接、传输数据和断开连接三个步骤来进行通信。在建立连接时，TCP使用**三次握手**的方式进行，确保双方都能够正常收发数据。在传输数据时，TCP将数据划分为若干个数据段，并对每个数据段进行编号和校验，以保证数据的可靠性和有序性。在断开连接时，TCP使用**四次握手**的方式进行，以确保数据传输的完整性。

TCP协议广泛应用于各种不同类型的应用程序，例如网页浏览、文件传输、电子邮件、远程登录等等。TCP协议是一个非常重要的互联网协议，它的可靠性和稳定性为各种网络应用程序的正常运行提供了保障。

**TCP的特点**

- **面向连接**。通信双方必须先建立连接才能进行数据的传输，双方都必须为该连接分配必要的系统内核资源，以管理连接的状态和连接上的传输。双方间的数据传输都可以通过这个连接进行。完成数据交换后，双方必须断开此链接，以释放系统资源。这种连接是一对一的，因此TCP不适用于广播的应用程序，基于广播的应用程序需使用UDP协议。
- **可靠传输**。
  - **TCP采用发送应答机制**。TCP发送的每一个报文段都必须得到接收方的应答才能认为收到方的应答才能认为这个TCP报文段传输成功，每一个报文都有一个序列号。
  - **超时重传**。发送端发出一个报文段之后就启动定时器，如果在定时时间内每一收到应答就重新发送这个报文段。TCP为了不发生丢包，就给每一个包一个序列号，同时序列号也保证了传送到接收端实体的包的按序接受。然后接收端实体对已成功收到的包发回一个相应的确认（ACK）；如果发送端实体在合理的往返时延（RTT）内未收到确认，那么对应的数据包就被假设为已丢失将会被进行重传。
- **错误校验**。TCP用一个校验和函数来检验数据是否有错误；在发送和接受时都要计算校验和。
- **流量控制和阻塞管理**。
  - 滑动窗口：控制双方的发送接受速度。
  - 流量控制用来避免主机发送得过快而使接收方来不及完全收下。

**TCP与UDP的不同点**

- 面向连接（确认有创建三方交握，连接已创建才作传输。）
- 有序数据传输
- 重发丢失的数据包
- 舍弃重复的数据包
- 无差错的数据传输
- 阻塞/流量控制

<p align="center"><img src=".\images\image-20230307230049285.png" width="40%">
<p align="center">图1-2 TCP通信结构图</p>


下面是Python中使用TCP协议实现服务器端和客户端的代码简述。

- 服务器端

```python
import socket

# 创建socket
tcp_server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# 本地信息
address = ('', 2000)
# 绑定
tcp_server_socket.bind(address)
# 激活listen端口
tcp_server_socket.listen(10)
# accpet完成了三次握手，建立了链接
client_socket, client_address = tcp_server_socket.accept()
print(client_address)
# 接收对方发送过来的数据
recv_data = client_socket.recv(1024)
print(f"接收到的数据为：{recv_data.decode('utf-8')}")
# 发送一些数据到客户端
client_socket.send("thank you!".encode('utf-8'))
# 断开与客户端的链接
client_socket.close()
# 停止对端口的监听
tcp_server_socket.close()
```

- 客户端

```python
import socket

# 创建socket
tcp_client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = ('10.89.221.210', 2000)
# 链接服务器
tcp_client_socket.connect(server_address)
# 发送数据
tcp_client_socket.send('I am tcp_client'.encode('utf-8'))
tcp_client_socket.send('I am tcp_client2'.encode('utf-8'))
# 接收数据
recv_data = tcp_client_socket.recv(1024)
print(recv_data.decode('utf-8'))
# 断开连接
tcp_client_socket.close()
```

**TCP注意事项**

- TCP服务器需要绑定，否则客户端找不到这个服务器；
- TCP客户端不绑定，因为是主动链接服务器，所以只要确定好服务器的IP、PORT等信息，本地客户端可以随机；
- TCP服务器中通过listen可以将socket创建出来的主动套接字变为被动的，这是做TCP服务器时必须要做的；
- 当客户端需要链接服务器时，就需要使用connect进行链接，UDP是不需要链接的而是直接发送，但是TCP必须先链接，只有链接成功才能通信；
- 当一个TCP客户端链接服务器时，服务器端会有一个新的套接字，这个套接字用来标记这个客户端，单独为这个客户端服务；
- listen后的套接字是被动套接字，用来接收新的客户端的链接请求的，而accept返回的新的套接字是标记这个新客户端的；
- 关闭listen后的套接字意味着被动套接字关闭了，会导致新的客户端不能够链接服务器，但是之前的已经链接成功的客户端正常通信；
- 关闭accept返回的套接字意味着这个客户端已经服务完毕；
- 当客户端的套接字调用close后，服务器端会recv解堵塞，并且返回的长度为0，因此服务器可以通过返回数据的长度来区别客户端是否已经下线。

**TCP的三次握手**

TCP的三次握手是TCP建立连接的过程，其流程如下：

1. 第一次握手（SYN）：客户端发送一个SYN（同步）数据包，其中包含自己的初始序列号（ISN），并设置SYN标志位为1。此时，客户端进入SYN_SEND状态。
2. 第二次握手（SYN+ACK）：服务器收到客户端发送的SYN数据包后，会向客户端回复一个ACK（确认）数据包，其中包含服务器的初始序列号（ISN），并将SYN和ACK标志位都设置为1。此时，服务器进入SYN_RECV状态。
3. 第三次握手（ACK）：客户端收到服务器的SYN+ACK数据包后，会向服务器回复一个ACK数据包，其中将ACK标志位设置为1。此时，客户端进入ESTABLISHED状态，表示连接已经建立。

需要注意的是，在这个过程中，如果某个阶段的数据包丢失或超时，会触发TCP的重传机制，直到连接建立成功或失败。而如果客户端和服务器在建立连接前有数据传输，那么在连接建立后，之前传输的数据包将被丢弃并需要重新发送。

<p align="center"><img src=".\images\tcp的三次握手.JPG" width="50%">
<p align="center">图1-3 TCP的三次握手</p>


为什么两次握手不行呢？

比如是A（client）机要连到B（server）机，结果发送的连接信息由于某种原因没有到达B机；于是，A机又发了一次，结果这次B收到了，于是就发送信息回来，两机就连接。传完东西后断开。结果这个时候，原先没有到达的连接信息突然又传到了B机，于是B机发信息给A，然后B机就以为和A连上了，这个时候B机就在等待A传东西过去。永远的等待在recv接口上。

**TCP的四次挥手**

<p align="center"><img src=".\images\tcp的四次挥手.JPG" width="50%">
<p align="center">图1-4 TCP的四次挥手</p>


有4个缓冲区，所以需要4个缓冲区

**TCP短连接（无状态）**

<p align="center"><img src=".\images\短连接的操作步骤.JPG" width="50%">
<p align="center">图1-5 短连接的操作步骤</p>


模拟一种TCP短连接的情况：

- client向server发送连接请求
- server接收到请求，双方建立连接
- client向server发送消息
- server回应client
- 一次读写完成，此时双方任何一个都可以发起close操作

**TCP长连接（游戏，即时通信）**

<p align="center"><img src=".\images\长连接的操作步骤.JPG" width="50%">
<p align="center">图1-6 长连接的操作步骤</p>


再模拟一种长连接的情况：

- client向server发送连接请求
- server接收到请求，双方建立连接
- client向server发送消息
- server回应client
- 一次读写完成，连接不关闭
- 后续读写操作...
- 长时间操作之后client发起关闭请求

**TCP长/短连接的优缺点**

- 长连接可以省去较多的TCP建立和关闭的操作，减少浪费，节约时间。对于频繁请求资源的客户端来说，较适用长连接；
- client与server之间的连接如果一直不关闭的话，会存在一个问题，随着客户端连接越来越多，server早晚有扛不住的时候，这时候server端需要采取一些策略，如关闭一些长时间没有读写事件发生的连接，这样可以避免一些恶意连接导致server端服务受损；如果条件允许就可以以客户端机器为颗粒度，限制每个客户端的最大长连接数，这样就可以完全避免某个客户端连累后端服务；
- 短连接对于服务器来说管理较为简单，存在的链接都是有用的链接，不需要额外的控制手段；
- 但如果客户端请求频繁，将在TCP的建立和关闭操作上浪费时间和带宽。

**TCP长/短连接的应用场景**

- 长连接多用于操作频繁，点对点的通讯，而且连接数不能太多情况。每个TCP连接都需要三次握手，这需要时间，如果每个操作都是先连接，再操作的话那么处理速度会降低很多，所以每个操作完后都不断开，再次处理时直接发送数据包就OK了，不用建立TCP连接。例如：数据库的连接用长连接，如果用短连接频繁的通信会造成socket错误，而且频繁的socket创建也是对资源的浪费。
- 而像WEB网站的http服务一般都用短链接，因为长连接对于服务端来说会耗费一定的资源，而像WEB网站这么频繁的成千上万甚至上亿客户端的连接用短连接会更省一些资源，如果用长连接，而且同时有成千上万的用户，如果每个用户都占用一个连接的话，那可想而知吧。所以并发量大，但每个用户无需频繁操作情况下需用短连好。

### 1.7 TCP/IP协议

TCP/IP协议是Internet上最常用的协议族之一，也是计算机网络通信的基础。TCP/IP协议族包括了一系列协议，其中最常用的有TCP（传输控制协议）和IP（互联网协议），因此也称为TCP/IP协议栈。

TCP/IP协议是一种分层协议，分为四层：应用层、传输层、网络层和数据链路层。每一层都有自己的功能和协议。

- 应用层

应用层是TCP/IP协议的最高层，它为应用程序提供了接口，应用程序可以使用该接口进行网络通信。常见的应用层协议有HTTP、FTP、SMTP、POP3等。

- 传输层

传输层是TCP/IP协议的第二层，主要负责提供可靠的数据传输服务。它包括TCP协议和UDP协议两种。TCP协议提供了可靠的数据传输服务，可以保证数据的完整性、顺序性和可靠性；而UDP协议则提供了不可靠的数据传输服务，但是速度更快。

- 网络层

网络层是TCP/IP协议的第三层，它主要负责数据包的路由和转发。该层的协议主要是IP协议，它定义了数据包的格式和传输方式。IP协议可以实现不同网络之间的通信，同时也可以在同一网络内实现数据包的传输。

- 数据链路层

数据链路层是TCP/IP协议的最底层，它主要负责将数据包转换为比特流，并在物理媒介上传输。该层的协议有以太网协议、令牌环协议等。

总体来说，TCP/IP协议族提供了一个可靠、通用的网络协议，使得不同类型的计算机和网络可以相互通信和交流。它是现代计算机网络通信的基础。

### 1.8 DDos攻击

**DDoS**（Distributed Denial of Service）攻击，又称分布式拒绝服务攻击，是一种通过大量的流量、请求或数据包来淹没目标计算机或网络，使其无法正常工作的网络攻击行为。

DDoS攻击一般由大量的计算机或设备组成的“僵尸网络”发起，这些计算机或设备被黑客控制，并被指令攻击目标。攻击者通过在这些计算机或设备上安装特定的恶意软件，使它们自动向目标服务器发送大量的请求或数据包。这些请求或数据包会占用目标服务器的网络带宽、处理能力或存储空间等资源，导致目标服务器无法正常响应合法的请求，从而使得正常用户无法访问或使用该服务。

DDoS攻击具有以下特点：

- 攻击范围广泛：可以针对任何拥有网络连接的目标进行攻击，包括网站、服务器、路由器等。
- 攻击手段多样：可以利用各种协议和技术进行攻击，如TCP协议、UDP协议、ICMP协议等。
- 攻击方式复杂：攻击者可以通过伪造IP地址、利用反射攻击、构造大量的数据包等方式来增强攻击效果。

DDoS攻击对互联网和企业的安全和稳定性造成了严重威胁。防御DDoS攻击的方法包括增加网络带宽、使用反DDoS设备和软件、合理规划网络架构等。同时，网络管理员也需要定期更新安全措施，以确保网络的安全和稳定性。

### 1.9 epoll

在 Python 网络编程中，**epoll** 是一种高效的 I/O **多路复用技术**，它可以同时监视多个文件描述符的 I/O 事件，从而实现高并发的网络编程。相比较 select 和 poll，epoll 的优势在于支持单个进程监视的文件描述符数量更大，且不会随着文件描述符数量的增加而出现性能下降。

epoll是边缘触发/水平触发的，只适用于Unix/Linux操作系统。

epoll使用的一般步骤：

1. Create an epoll object
2. Tell the epoll object to monitor specific events on specific sockets
3. Ask the epoll object which sockets may have had the specified event since the last query
4. Perform some action on those sockets
5. Tell the epoll object to modify the list of sockets and/or events to monitor
6. Repeat steps 3 through 5 until finished
7. Destroy the epoll object

下面是Python中使用TCP协议并结合epoll实现服务器端和客户端的代码简述。

- 服务器端

```python
import socket
import select
import sys

# 创建套接字
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 设置 server_socket 选项，允许地址复用
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# 绑定端口并开始监听
server_socket.bind(('', 2000))
server_socket.listen(10)

# 创建 epoll 对象，并将 stdin 和 server_socket 套接字注册到其中
epoll = select.epoll()
epoll.register(sys.stdin.fileno(), select.EPOLLIN)
epoll.register(server_socket.fileno(), select.EPOLLIN)

while True:
    # 等待事件发生
    events = epoll.poll(-1)
    for event in events:
        # 有新的连接请求
        if event[0] == server_socket.fileno():
            # 接受连接请求，获取客户端套接字和地址
            client_socket, client_address = server_socket.accept()
            print(f"{client_address}连接成功...")

            # 将客户端套接字注册到 epoll 中
            epoll.register(client_socket.fileno(), select.EPOLLIN)

        # 标准输入有输入
        elif event[0] == sys.stdin.fileno():
            input_data = input()
            client_socket.send(input_data.encode('utf8'))
        # 客户端有数据发送
        elif event[0] == client_socket.fileno():
            # 接收客户端发送的数据
            recv_data = client_socket.recv(1000)
            if recv_data:
                print(recv_data.decode('utf8'))
            else:
                # 客户端断开连接
                print(f"{client_address}断开了...")
                # 从 epoll 中取消客户端套接字的注册
                epoll.unregister(client_socket.fileno())
                # 关闭客户端套接字
                client_socket.close()
                # 跳出当前循环，继续处理下一个事件
                break
```

- 客户端

```python
import socket
import select
import sys

if len(sys.argv) != 2:  # 确保脚本参数数量为2，即指定了服务器的IP地址
    print('错误的参数')
    exit(-1)

# 创建一个客户端 server_socket，并连接到指定的服务器地址和端口
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = (sys.argv[1], 2000)  # 将第一个脚本参数作为服务器IP地址
client_socket.connect(server_address)

# 创建一个 epoll 对象，并将标准输入和客户端 server_socket 的文件描述符注册到 epoll 中
epoll = select.epoll()
epoll.register(sys.stdin.fileno(), select.EPOLLIN)
epoll.register(client_socket.fileno(), select.EPOLLIN)

# 进入主循环，等待 epoll 返回事件
while True:
    events = epoll.poll(-1, 2)
    for event in events:
        # 如果客户端 server_socket 有数据可读，就将数据接收并打印
        if event[0] == client_socket.fileno():
            if recv_data := client_socket.recv(1000):
                print(recv_data.decode('utf8'))
            else:  # 如果服务端 server_socket 关闭，就退出程序
                print('再见！')
                client_socket.close()
                exit(0)
        # 如果标准输入有数据可读，就将数据发送给服务器
        elif event[0] == sys.stdin.fileno():
            input_data = input()
            client_socket.send(input_data.encode('utf8'))
```

**即时聊天实现**

基于TCP实现即时聊天需要使用Socket模块。以下是实现的基本步骤：

- 创建服务器和客户端的socket对象：服务器需要绑定一个IP地址和端口号，客户端需要指定要连接的服务器的IP地址和端口号。
- 建立连接：客户端通过connect()函数与服务器建立连接，服务器通过listen()函数监听客户端的连接请求，一旦有连接请求，就通过accept()函数接受连接请求，建立连接。
- 数据传输：连接建立后，客户端和服务器之间可以通过send()和recv()函数进行数据传输，其中send()函数将消息发送到对方，recv()函数接收消息。
- 实现多客户端聊天：为了支持多客户端聊天，服务器需要通过线程或进程等方式，同时处理多个客户端的连接请求和数据传输请求。

需要注意以下几点：

- 在传输数据时，需要将消息编码为二进制格式，传输后需要解码。
- 可以使用标志位或特定字符等方式来分隔消息，以便正确解析。

**非阻塞编程**

**非阻塞编程**是一种编程模型，它允许应用程序在等待某些事件的同时，仍然可以继续执行其他操作，而不必停止等待事件的完成。在非阻塞编程中，当一个操作需要一段时间才能完成时，程序会立即返回一个结果，而不会阻塞程序的执行，以便程序可以执行其他任务。

通常，非阻塞编程可以通过异步编程来实现。在异步编程中，应用程序可以在一个事件正在处理时，同时处理其他事件。这种方式可以大大提高应用程序的并发性和吞吐量，特别是在处理I/O密集型应用程序时。

非阻塞编程通常与事件驱动的编程方式结合使用，通过回调函数来处理事件。当事件发生时，系统会自动调用相应的回调函数，以便程序可以及时响应事件。与传统的阻塞编程方式相比，非阻塞编程可以避免由于等待事件完成而产生的阻塞，提高应用程序的效率和性能。

Python中，可以使用异步编程框架（如 asyncio、Twisted、Tornado等）来实现非阻塞编程。这些框架提供了一些高级工具和函数，可以方便地实现异步操作，同时保证程序的高效性和可靠性。

**Python理解大小端**

大小端（Endianness）是一种数据存储格式，它决定了在内存中多字节数据的字节顺序。在计算机系统中，通常使用两种不同的大小端格式，分别是大端序（Big Endian）和小端序（Little Endian）。

大端序是指将高位字节存储在低地址，低位字节存储在高地址的方式。也就是说，数据的高位字节排在前面，低位字节排在后面。例如，十六进制数值 `0x12345678` 在大端序中存储时，字节序列的顺序为 `12 34 56 78`。

小端序是指将低位字节存储在低地址，高位字节存储在高地址的方式。也就是说，数据的低位字节排在前面，高位字节排在后面。例如，十六进制数值 `0x12345678` 在小端序中存储时，字节序列的顺序为 `78 56 34 12`。

在Python中，可以使用 `sys.byteorder` 来获取当前系统的字节序格式。该函数返回字符串 `"little"` 表示小端序，返回字符串 `"big"` 表示大端序。此外，在Python中还可以使用 `struct` 模块来进行字节序的转换。`struct` 模块提供了 `pack()` 和 `unpack()` 函数，可以将Python中的数据类型（如int、float等）转换为字节序列，或将字节序列转换为Python中的数据类型。在进行字节序转换时，可以通过指定大小端序格式来控制字节序的转换。

常见的芯片在字节序上的选择并不相同，下面是一些常见芯片的字节序信息：

- 小端序（Little Endian）：Intel x86、x64、ARM Cortex、PowerPC、MIPS、Atmel AVR、Microchip PIC、TI MSP430、Freescale ColdFire等；
- 大端序（Big Endian）：IBM Power、Motorola 68k、SPARC、NEC V850、Fujitsu FR-V等。

需要注意的是，在不同的芯片架构之间进行数据传输时，需要进行字节序转换，以保证数据传输的正确性。此外，在一些应用中，也可以采用网络字节序（Network Byte Order）作为统一的字节序格式，以便跨平台数据传输。在网络字节序中，使用大端序（Big Endian）作为标准字节序，因此在进行网络通信时，需要将本地字节序转换为网络字节序，再将接收到的数据从网络字节序转换为本地字节序。在Python中，可以使用 `socket` 模块中的 `htonl()`、`htons()`、`ntohl()`、`ntohs()` 函数来进行字节序的转换。

## 2 多进程编程

### 2.1 进程以及状态

**进程的概述**

**程序：**例如 ×××.py 这是一个程序，是一个静态的

**进程：**一个程序运行起来以后，**代码+用到的资源**称之为进程，它是**操作系统分配资源的基本单元**。

CPU，内存，文件，socket对象不仅可以通过线程完成多任务，进程也是可以的。

**进程的状态**

工作中，任务数往往大于CPU的核数，即一定有一些任务正在执行，而另外一些任务在等待CPU进行执行，因此导致了有不同的状态。

<p align="center"><img src=".\images\image-20230309223721277.png" width="70%">
<p align="center">图2-1 进程的状态</p>

- 就绪态：运行的条件都已满足，正在等待CPU执行；
- 执行态：CPU正在执行其功能；
- 等待态：等待某些条件满足，例如一个程序sleep了，此时就处于等待态。

**Linux下的进程管理**

|   命令    |                             含义                             |                            示例                            |
| :-------: | :----------------------------------------------------------: | :--------------------------------------------------------: |
|    ps     |                     查看当前进程状态信息                     |                 `ps -ef` 查看所有进程信息                  |
|    top    |                       动态显示进程信息                       |                   `top` 显示实时进程信息                   |
|   kill    |                           终止进程                           |                  `kill PID` 终止指定进程                   |
|   pkill   |                杀死与指定进程名匹配的所有进程                |    `pkill process_name` 杀死与指定进程名匹配的所有进程     |
|  killall  |                杀死与指定进程名匹配的所有进程                |   `killall process_name` 杀死与指定进程名匹配的所有进程    |
|  pstree   |                          显示进程树                          |                    `pstree` 显示进程树                     |
|   htop    |      动态显示进程信息，功能类似top，但是更加直观和易用       |      `htop` 显示实时进程信息，同时提供交互式操作界面       |
|   nice    |                       改变进程的优先级                       | `nice -n 10 command` 运行command命令，并将其优先级调整为10 |
|  renice   |                   改变已经运行进程的优先级                   |       `renice -n 10 PID` 将指定进程的优先级调整为10        |
| systemctl |          系统服务管理器，用于管理系统服务和守护进程          |        `systemctl status service_name` 查看服务状态        |
|  service  |          系统服务管理器，用于管理系统服务和守护进程          |         `service service_name status` 查看服务状态         |
|   jobs    |                  查看当前 shell 的作业列表                   |              `jobs` 查看当前 shell 的作业列表              |
|    fg     |                      将作业放到前台运行                      |       `fg %job_id` 将指定 job_id 的作业放到前台运行        |
|    bg     |                      将作业放到后台运行                      |       `bg %job_id` 将指定 job_id 的作业放到后台运行        |
|   nohup   |                在后台运行命令，并忽略挂起信号                | `nohup command &` 在后台运行 command 命令，并忽略挂起信号  |
|  screen   | 为终端提供一个多窗口环境，用于在多个窗口或终端上运行多个命令 |                  `screen` 打开一个新窗口                   |
|   tmux    | 为终端提供一个多窗口环境，用于在多个窗口或终端上运行多个命令 |             `tmux new-session` 打开一个新会话              |

**设置定时任务**

`crontab -e` 设置当前用户定时任务

`vim /etc/crontab` 设置定时任务

`crontab -l` 查看当前自己设置的定时任务

如果目录是777，任何用户都可以创建文件，并且删除其他用户的文件。如果目录有t权限，那么删除文件时，每个人只能删除属于自己的文件。

### 2.2 进程的创建

multiprocessing模块是跨平台版本的多进程模块，提供了一个Process类来代表一个进程对象，这个对象可以理解为是一个独立的进程，可以执行另外的事情。

下面是一个使用多进程的两个while循环一起执行的代码示例：

```python
import time
from multiprocessing import Process


def run_proc():
    """子进程要执行的代码"""
    while True:
        print('------2------')
        time.sleep(1)


if __name__ == '__main__':
    p = Process(target=run_proc)
    p.start()
    while True:
        print('------1------')
        time.sleep(1)
```

备注：创建子进程时，只需要传入一个执行函数和函数的参数，创建一个Process实例，用start()方法启动。

- 孤儿进程——父进程退出（kill杀死父进程），子进程变为孤儿；
- 僵尸进程——子进程退出，父进程在忙碌，没有回收它（要避免僵尸）。

Python进程变为僵尸进程后，名字会改变。

**获取进程pid**

- `os.getpid()` 获得当前进程的进程号
- `os.getppid()` 获得父进程的进程号

**Process语法结构**

Process(group, target, name, args, kwargs)

- target: 如果传递了函数的引用，可以让这个子进程就执行这里的代码；
- args: 给target指定的函数传递的参数，以元组的方式传递；
- kwargs: 给target指定的函数传递命名参数，keyword参数；
- name: 给进程指定一个名字（可选）；
- group: 指定进程组（大多数情况下用不到）。

Process创建的实例对象的常用方法：

- start(): 启动子进程实例（创建子进程）；
- is_alive(): 判断进程子进程是否还活着；
- join([timeout]): 是否等待子进程执行结束，或者等待多少秒——回收子进程；
- terminate(): 不管任务是否完成，立即终止子进程。

Process创建的实例对象的常用属性：

- name: 当前进程的别名，默认为Process-N，N为从1开始递增的整数；
- pid: 当前进程的进程号

进程间**不共享**全局变量

### 2.3 进程间通信-Queue

Process之间有时需要通信，操作系统提供了很多机制来实现进程间的通信（queue、管道、共享内存等）。

**Queue的使用**

可以使用multiprocessing模块的Queue实现多进程之间的数据传递，Queue本身是一个消息列队程序。下面是一个简单的代码示例：

```python
import time
from multiprocessing import Queue, Process


def write(q):
    for i in "beautiful":
        print(f"I'm writer put {i}")
        q.put(i)
        time.sleep(1)


def read(q):
    while True:
        time.sleep(1)
        if not q.empty():
            print(f"I'm reader get {q.get()}")
        else:
            break


if __name__ == '__main__':
    q = Queue()
    pw = Process(target=write, args=(q,))
    pr = Process(target=read, args=(q,))
    pw.start()
    time.sleep(1)
    pr.start()
    pw.join()
    pr.join()
```

初始化Queue()对象时，若括号中没有指定最大可接受的消息数量，或者数量为负值，那么就代表可以接受的消息数量没有上限（直到内存的尽头）：

- `Queue.qsize()`: 返回当前队列包含的消息数量；
- `Queue.empty()`: 如果队列为空，返回 True，反之 False；
- `Queue.full()`: 如果队列满了，返回 True，反之 False；
- `Queue.get([block[, timeout]])`: 获取队列中的一条消息，然后将其从列队中移除，block默认值为True。
  - 如果block使用默认值，且没有设置timeout（单位秒），消息列队如果为空，此时程序将被阻塞（停在读取状态），直到从消息列队读到消息为止，如果设置了timeout，则会等待timeout秒，若还没有读取到任何信息，则抛出“Queue.Empty”异常；
  - 如果block值为 False，消息列队如果为空，则会立刻抛出“Queue.Empty”异常。
- `Queue.get_nowait()`: 相当于Queue.get(block=False)；
- `Queue.put(item, [block[, timeout]])`: 将item消息写入队列，block默认值为 True ；
- `Queue.put_nowait()`: 相当于Queue.put(item, False)。

### 2.4 进程池Pool

当需要创建的子进程数量不多时，可以直接利用multiprocessing中的Process动态成生多个进程，但如果是上百甚至上千个目标，手动的去创建进程的工作量巨大，此时就可以用到multiprocessing模块提供的Pool方法。
初始化Pool时，可以指定一个最大进程数，当有新的请求提交到Pool中时，如果池还没有满，那么就会创建一个新的进程用来执行该请求；但如果池中的进程数已经达到指定的最大值，那么该请求就会等待，直到池中有进程结束，才会用之前的进程来执行新的任务。

下面是一个代码实例：

```python
mport time, os
from multiprocessing import Manager, Pool


def write(q):
    print("writer启动(%s),父进程为(%s)" % (os.getpid(), os.getppid()))
    for i in "beautiful":
        print(f"I'm writer put {i}")
        q.put(i)
        time.sleep(1)


def read(q):
    print("reader启动(%s),父进程为(%s)" % (os.getpid(), os.getppid()))
    while True:
        time.sleep(1)
        if not q.empty():
            print(f"I'm reader get {q.get()}")
        else:
            break


if __name__ == '__main__':
    q = Manager().Queue()
    pool = Pool()
    pool.apply_async(write, (q,))
    time.sleep(1)
    pool.apply_async(read, (q,))
    pool.close()
    pool.join()
    print("(%s) End" % os.getpid())
```

multiprocessing.Pool常用函数解析：

- apply_async(func[，args[，kwds]])：使用非阻塞方式调用func（并行执行，堵塞方式必须等待上一个进程退出才能执行下一个进程），args为传递给func的参数列表，kwds为传递给func的关键字参数列表；
- close()：关闭Pool，使其不再接受新的任务；
- terminate()：不管任务是否完成，立即终止；
- join()：主进程阻塞，等待子进程的退出，必须在close或terminate之后使用。

## 3 多线程编程

### 3.1 多任务的概念

多任务是指操作系统上可以同时运行多个任务。现在，多核CPU已经非常普及了，但是，即时过去的单核CPU，也可以执行多任务。由于CPU执行代码都是顺序执行的，那么，单核CPU是怎么执行多任务的呢？对于单核CPU是通过操作系统轮流让各个任务交替执行，任务1执行0.01秒，切换到任务2，任务2执行0.01秒，在切换到任务3，执行0.01秒......这样反复执行下去。表面上看，每个任务都是交替执行的，但是，由于CPU的执行速度非常快，给我们的感觉就像是所有任务同时在执行。

真正的并行执行多任务只能是在多核CPU上实现的，但由于任务数量远远多余CPU的核心数量，所以操作系统也会自动把很多任务轮流调度到每个核心上执行。

备注：

- **并发**指的是任务数多于CPU核数，通过操作系统的各种任务调度算法，实现用多个任务“一起”执行（实际上总有一些任务不在执行，因为切换任务的速度相当快，看上去一起执行而已）——时间片轮转；
- 两个进程，两个核，同时去写一个文件（磁盘并发），或者同时去写一个client_socket（网络并发），这就是并发，需要加锁；
- **并行**是指任务数小于等于CPU核数，即任务真的是一起执行的。

### 3.2 线程的概念

Python的thread模块是比较底层的模块，Python的threading模块是对thread做了一些包装，可以更加方便被使用。一个Python进程中的多个线程是不可以迁移到多个核的。

```
ps -elLf|grep [#线程名#] # 查看线程的方法
top
```

下面是用Python实现的一个多线程的示例：

```python
import threading, time


def sing():
    for i in range(3):
        print(f"正在唱歌...{i}")
        time.sleep(1)


def dance():
    for i in range(3):
        print(f"正在跳舞...{i}")
        time.sleep(1)


if __name__ == '__main__':
    print(f"----开始----：{time.ctime()}")
    t1 = threading.Thread(target=sing)
    t2 = threading.Thread(target=dance)
    t1.start()
    t2.start()
    while True:
        length = len(threading.enumerate())
        print(f"当前运行的线程数为：{length}")
        if length <= 1:
            break
        time.sleep(0.5)
    print(f"----结束----：{time.ctime()}")
```

**线程的注意点**

- **线程执行执行代码封装。**通过使用threading模块能完成多任务的程序开发，为了让每个线程的封装性更完美，所以使用threading模块时，往往会定义一个新的子类class，只要继承threading.Thread就可以了，然后重写run方法。

下面是一个代码示例：

```python
import threading
import time

class MyThread(threading.Thread):
    def run(self):
        for i in range(3):
            time.sleep(1)
            msg = "I'm " + self.name + ' @ ' + str(i) 
            print(msg)




if __name__ == '__main__':
    t = MyThread()
    t.start()
    print(t.is_alive())
    t.join()
```

- Python的threading.Thread类有一个run方法，用于定义线程的功能函数，可以在自己的线程类中覆盖该方法。而创建自己的线程实例后，通过Thread的start方法，可以启动该线程，交给Python虚拟机进行调度，当该线程获得执行的机会时，就会调用run方法执行线程。
- 多线程的执行顺序是不确定的。当执行到sleep语句时，线程被阻塞（Blocked），到sleep结束后，线程进入就绪（Runnable）状态，等待调度。而线程调度将自行选择一个线程执行。

**备注**

- 每个线程默认有一个名字，Python会自动为线程指定一个名字；
- 当线程的run()方法结束时，该线程完成；
- 无法控制线程调度程序，但可以通过别的方式俩影响线程调度的方式；
- 在一个进程内的所有线程共享全局变量，很方便在多个线程之间共享数据；
- 线程是对全局变量随意篡改可能造成多线程之间对全局变量的混乱（即线程非安全）；
- 如果多个线程同时对同一个全局变量操作，会出现资源竞争的问题，从而数据结构会不正确。

### 3.3 锁的概念

同步就是协同步调，按预定的先后次序进行运行。当多个线程几乎同时修改某个共享数据的时候，需要进行同步控制。线程同步能够保证多个线程安全访问竞争资源，最简单的同步机制是引入互斥锁。

互斥锁为资源引入了一个状态：锁定/非锁定。

某个线程要更改共享数据时，先将其锁定，此时资源的状态为锁定，其他线程不能更改；直到该线程释放资源，将线程的状态变成“非锁定”，其他的线程才能再次锁定该资源。互斥锁保证了每次只有一个线程进行写入操作，从而保证了多线程情况下数据的正确性。

threading模块定义了Lock类，可以方便处理锁定

```python
# 创建锁
mutex = threading.Lock()
# 锁定
mutex.acquire()
# 释放
mutex.release()
```

备注：

- 如果这个锁之前是没有上锁的，那么acquire不会堵塞；
- 如果在调用acquire对这个锁上锁之前，它已经被其他线程上了锁，那么此时acquire会堵塞，直到这个锁被解锁为止。

锁的优点：

- 确保了某段关键代码只能由一个线程从头到尾完整地执行。

锁的缺点：

- 阻止了多线程并发执行，包含锁的某段代码实际上只能以单线程模式执行，效率就大大地下降了；
- 由于可以存在多个锁，不同的线程持有不同的锁，并试图获取对方持有的锁时，可能会造成死锁。

**死锁**

在线程间共享多个资源的时候，如果两个线程分别占有一部分资源并且同时等待对方的资源，就会造成死锁。尽管死锁很少发生，但一旦发生就会造成应用的停止响应。

## 4 协程

### 4.1 协程的概念

协程（Coroutine），又称微线程，纤程。协程是Python中另外一种实现多任务的方式，只不过比线程占用更小的执行单元。**协程自带CPU上下文**，只要在合适的时机，就可以把一个协程切换到另一个协程。只要这个过程中保存或恢复CPU上下文，那么程序还是可以运行的。

**协程和线程的差异**

在实现多任务时，线程切换从系统层面远不止保存和恢复CPU上下文那么简单。操作系统为了程序运行的高效性，每个线程都有自己**缓存Cache**等等数据，操作系统还会帮助恢复这些数据。所以线程的切换非常消耗性能。但实施协程的切换只是单纯的操作CPU的上下文，所以**一秒钟切换上百万次**都是可以的。

下面是一个通过yield实现协程的简单示例：

```python
import  time

def work1():
    while True:
        print('---work1---')
        yield
        time.sleep(0.5)

def work2():
    while True:
        print('---work2---')
        yield
        time.sleep(0.5)

if __name__ == '__main__':
    w1=work1()
    w2=work2()
    while True:
        next(w1)
        next(w2)
```

### 4.2 greenlet

为了更好使用协程来完成多任务，Python中的greenlet模块对其进行了封装，从而使切换任务变得更加简单。

下面是一个通过greenlet模块实现协程的简单示例：

```python
from greenlet import greenlet
import time

def work1():
    while True:
        print('---work1---')
        gr2.switch()
        time.sleep(0.5)

def work2():
    while True:
        print('---work2---')
        gr1.switch()
        time.sleep(0.5)


gr1 = greenlet(work1)
gr2 = greenlet(work2)

gr1.switch()
```

### 4.3 gevent

greenlet已经实现了协程，但还是需要人工切换。Python还有一个比greenlet更强大的并且能够实现自动切换任务的模块gevent。其原理是当一个greenlet遇到I/O操作时，比如访问网络阻塞，就自动切换到其他的协程，等到IO操作完成，再在适合的时候切换回来继续执行。

由于I/O操作非常耗时，经常使程序处于等待状态，通过gevent为我们自动切换协程，就能保证总有协程在运行，而不是等待I/O操作。

下面是一个通过gevent模块实现协程的简单示例：

```python
import gevent
import time

def f(n):
    for i in range(n):
        print(gevent.getcurrent(), i)
        # 用来模拟一个耗时操作，注意不是time模块中的sleep
        gevent.sleep(1)

g1 = gevent.spawn(f,5)
g2 = gevent.spawn(f,5)
g3 = gevent.spawn(f,5)
g1.join()
g2.join()
g3.join()
```

**monkey补丁**

monkey patch指的是在执行时动态替换，通常是在startup的时候。在最开头的地方gevent.monkey.patch_all()，把标准库中的thread/socket等给替换掉，让后边使用socket的时候能够跟寻常的一样使用，不论什么代码都无需改动。

下面是一个使用monkey补丁的简单示例：

```python
from gevent import monkey
import gevent
import random
import time
# 有耗时操作时需要
monkey.patch_all()  # 将程序中用到的耗时操作的代码，换为gevent中自己实现的模块

def coroutine_work(coroutine_name):
    for i in range(10):
        print(coroutine_name, i)
        time.sleep(random.random()) # 随机出0-1之间的浮点数

gevent.joinall([
        gevent.spawn(coroutine_work, "work1"),
        gevent.spawn(coroutine_work, "work2")
])
```

### 4.4 迭代器

**迭代器的概念**

**迭代**是访问集合元素的一种方式。**迭代器**是一个可以记住遍历的位置的对象。迭代器对象从集合的第一个元素开始访问，直到所有的元素被访问完结束。迭代器只能往前不会后退。

在Python中，迭代器是支持迭代协议（iteration protocol）的对象，即实现了`__iter__()`和`__next__()`方法的对象。`__iter__()`方法返回迭代器对象本身，而`__next__()`方法返回集合中的下一个元素。当迭代器到达集合的末尾时，`__next__()`方法会引发StopIteration异常，告诉调用者迭代已经完成。

**可迭代对象**

在Python中，可迭代对象（iterable）是指实现了`__iter__()`方法的对象，该方法返回一个迭代器对象，使得该对象可以通过迭代协议（iteration protocol）进行迭代。

简单来说，如果一个对象可以通过`for`循环进行遍历，那么该对象就是可迭代的。Python中的可迭代对象包括但不限于以下类型：

- 序列类型（如列表、元组、字符串等）
- 映射类型（如字典）
- 集合类型（如集合、frozenset等）
- 文件对象
- 生成器（包括生成器函数和生成器表达式）
- 用户自定义的实现了`__iter__()`方法的对象

值得注意的是，可迭代对象并不等同于迭代器。迭代器是用于访问可迭代对象中元素的一种特殊对象，而可迭代对象只是一个接口，用于表明该对象可以被迭代。如果一个对象不是可迭代对象，但是希望其可以进行迭代操作，可以通过实现`__iter__()`方法来使其成为可迭代对象。`__iter__()`方法需要返回一个迭代器对象，该迭代器对象实现了`__next__()`方法，用于返回可迭代对象中的下一个元素。

**for...in...循环的本质**

在Python中，`for-in`循环实际上是通过迭代器协议（iteration protocol）来实现的。其本质是对可迭代对象进行遍历，获取其中的每个元素，并将每个元素赋值给`for-in`循环中定义的变量。

具体来说，`for-in`循环的内部操作如下：

1. 调用可迭代对象的`__iter__()`方法获取一个迭代器对象。
2. 反复调用迭代器对象的`__next__()`方法获取下一个元素，直到迭代器到达结束位置（即引发StopIteration异常）为止。
3. 在每次循环迭代时，将`__next__()`方法返回的元素赋值给`for-in`循环中定义的变量，并执行循环体语句块中的代码。

### 4.5 生成器

在Python中，生成器（generator）是一种用于构建迭代器的特殊函数或语法结构，它可以在遍历过程中动态地生成值，而不需要将所有的值一次性存储到内存中。

生成器的语法结构有两种：生成器函数和生成器表达式。

生成器函数是一种使用`yield`语句的函数，当函数调用被执行时，它会返回一个生成器对象，而不是实际的值。每次调用生成器对象的`__next__()`方法时，函数将继续执行，直到遇到`yield`语句，返回一个值并挂起函数的执行。在下一次调用`__next__()`方法时，函数将从上次挂起的位置继续执行，直到再次遇到`yield`语句或函数执行完毕。

以下是一个简单的生成器函数的示例：

```python
def fib(n):
    current = 0
    num1, num2 = 0, 1
    while current < n:
        num = num1
        num1, num2 = num2, num1+num2
        current += 1
        yield num
    return 'done'

F = fib(5)
for i in F:
    print(i)

F = fib(5)  # 重新创建一个生成器对象
print(list(F))  # 将生成器对象转换成列表并打印出来
```

**yield关键字**

`yield`是Python中非常重要的关键字，它常常用于定义生成器函数，以实现惰性求值的效果。

当函数中包含`yield`关键字时，这个函数就成为了一个生成器函数。在生成器函数中，`yield`语句会把一个值返回出去，并且暂停函数的执行，直到下一次调用`next()`函数或遍历生成器对象时再继续执行函数的剩余部分。

**生成器和迭代器**

生成器和迭代器是Python中非常重要的概念，两者之间存在着紧密的关系。

首先，生成器是一种特殊的迭代器，它可以动态地生成一系列的值，并且只在需要的时候才生成这些值，从而避免了将所有的值都存储在内存中的问题。

其次，生成器和迭代器都可以通过`yield`语句来实现惰性求值的效果，只在需要的时候才计算值，从而节省了内存和计算资源。

最后，生成器和迭代器都可以通过`next()`函数来获取下一个值，并且在遍历完所有值之后会抛出`StopIteration`异常。因此，生成器和迭代器都可以通过`for-in`循环来遍历它们所生成的值。

总之，生成器是一种特殊的迭代器，它可以动态地生成一系列的值，并且只在需要的时候才生成这些值，从而实现了惰性求值的效果。同时，生成器和迭代器都可以通过`yield`语句来实现惰性求值的效果，并且都可以通过`next()`函数来获取下一个值，并且在遍历完所有值之后会抛出`StopIteration`异常。

## 5 进程、线程和协程对比

- 进程是资源分配的单元；
- 线程是操作系统内核调度的基本单元；
- 进程切换需要的资源很大，效率很低；
- 线程切换需要的资源一般，效率一般；
- 协程切换需要的资源很小，效率较高；
- 多进程、多线程根据CPU核数不一样可能是并行的，但是协程是在一个线程中，所以是并发。

**进程**和**线程**都是操作系统中用于实现多任务的概念，它们的主要区别如下：

- 定义：进程是指在操作系统中正在运行的一个程序，它是操作系统资源分配的基本单位。而线程是进程中的一个执行单元，是操作系统调度的基本单位。
- 资源占用：进程是一个独立的内存区域，包含程序代码、数据和堆栈等，它们之间互相独立，相互之间的通信需要使用操作系统提供的IPC（进程间通信）机制。而线程是共享进程中的数据和资源，不同线程之间可以直接访问共享的数据，因此相对于进程来说，线程更加轻量级。
- 调度：进程是由操作系统进行调度和管理的，不同进程之间的调度需要进行上下文切换。而线程是由进程进行调度，线程之间的切换相对于进程来说更加快速。
- 系统开销：由于进程之间相互独立，因此它们的系统开销比较大，包括内存空间的分配、磁盘读写等。而线程之间共享进程的资源，因此它们的系统开销相对来说比较小。
