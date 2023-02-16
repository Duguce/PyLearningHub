# Linux学习笔记

Abstract：本文是根据作者日常学习Linux（Ubuntu20.04）整理的一些常用指令、技巧等，主要目的是为了方便日常的工作学习。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-02-15 18:15 —— 2022-02-16 23:12

## 1 常用指令

### 1.1 基础指令

**调出终端** 按【*Ctrl+Alt+T*】或者【*鼠标右键*】打开终端

**将当前目录的全路径名称（从根目录）写入标准输出** pwd

**Ubuntu内软件安装常用步骤**

```shell
$ sudo apt update # 更新apt源
$ sudo apt install net-tools # 安装软件net-tools
$ ifconfig # 查看相应的ip地址
```

**Ubuntu修改镜像源**

```shell
cd /etc/apt/ # 进入/etc/apt/路径
cp -a sources.list sources.backup.list # 将sources.list备份保存为sources.backup.list
sudo vim /etc/apt/sources.list # 使用vim打开sources.list，修改并保存后推出
sudo apt-get update # 更新apt源
```

**配置GitHub环境**

- 安装配置Git服务器

  - 安装ssh

  ```shell
  sudo apt-get install openssh-server openssh-client
  ```

  - 启动ssh服务

  ```shell
  sudo /etc/init.d/ssh restart
  ```

  - 安装Git服务器

  ```shell
  sudo apt-get install git-core
  ```

- 配置ssh公钥

  - 本地生成ssh公钥

  ```shell
  ssh-keygen -C '[#邮箱地址#]' -t rsa
  ```

  - 查看Git公钥

  ```shell
  cat ~/.ssh/id_rsa.pub # 显示的公钥即为需要上传到GitHub账户上的
  ls ~/.ssh # 查看密钥文件夹的内容
  ```

  - 检查ssh连接情况

  ```shell
  ssh -T [#邮箱地址#]
  ```


- 创建一个新仓库并提交文件

```shell
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:Duguce/test_ubuntu.git
git push -u origin main
```

### 1.2 用户配置

**Linux下的用户类型**

- 超级用户：可以在Linux系统下做任何事情，不受限制。
- 普通用户：只能在Linux下做有限的事情。

*区分：超级用户的命令提示符是”#“，普通用户的命令提示符是”$“。*

**切换用户**

```shell
su [#用户名#]
```

**添加用户(普通)**

```shell
useradd [#用户名#]
useradd -m user1 -s /bin/bash
```

其中，加`-m`才会创建目录，`-s`的作用是指定使用的脚本解析器。

**删除用户(普通)**

```shell
userdel [#用户名#]
userdel -r [#用户名#]
```

其中，加`-r`才会删除家目录。

**设置密码**

```shell
passwd [#用户名#]
```

### 1.2 目录及文件操作

**查看文件或目录**

```
ls [#选项#] [#目录或文件#]
ls .. # 查看上一级目录（相对路径，不是以/开头的）
ls /home 查找/home路径下的文件信息（绝对路径，以/开头）
```

其中，对于目录，该命令列出当前目录下的所有子目录和文件。对于文件，将列出文件名以及其他信息。另外，还有`ls`命令还有一些常用的选项：

- `-a`显示指定目录下所有子目录和文件（显示隐藏文件）。例如，列出“/home/light”目录下的所有子目录和文件，则使用`ls -a /home/light`；
- `-l`列出指定目录下所有子目录及文件的详细信息。例如，列出 “/home/luke”目录下的所有子目录及文件，则使用`ls -l /home/light`，列出的每一行的详细信息依次是：

```
文件类型与权限 连接数 文件所有者 文件所属组 文件大小 最近修改时间 文件名称
```

文件类型包括：`-`：普通文件；`d`：目录；`l`：符号链接；`p`：命名管道

使用`ls -l`命令显示的信息中，开头是由10个字符构成的字符串，后9个字符表示文件的访问权限，分为3组，每组3位。第一组表示文件创建者的权限，第二组表示同组用户的权限，第三组表示其他用户的权限。

**改变工作目录**

```shell
cd [#目录名#]
cd .. # 切换到上一级目录
cd / # 切换到根目录
cd ~ # 到用户主目录下
cd - # 到上一次目录
```

**显示当前工作目录**

```shell
pwd
```

**创建目录**

```shell
mkdir dirname
```

**删除目录**

```shell
rmdir dirname
```

**拷贝文件或目录**

```shell
cp [#选项#] [#源文件或目录#] [#目标文件或目录#]
cp ./test /home/light/test_ubuntu/test01
```

其中，`cp`命令还有一些常用的参数：

- `-f`若目标目录中存在于源文件同名的文件，则直接覆盖，不提示；
- `-i`若目标文件中存在于源文件同名的文件，copy 时系统会提示是否进行覆盖；
- `-r`若要拷贝的是一个目录，此时将同时拷贝该目录下的子目录和文件 。 此时目标文件必须为一 个。

**移动文件或目录**

```shell
mv [#选项#] [#源文件或目录#] [#目标文件或目录#]
```

其中，`mv`命令还有一些常用的参数：

- `-f`若目标目录中存在于源文件同名的文件，则直接覆盖，不提示；
- `-i`若目标文件中存在于源文件同名的文件，copy 时系统会提示是否进行覆盖。

**删除文件或目录**

```shell
rm [#选项#] [#文件或目录#]
```

- `-f`删除过程中不会给出提示；
- `-i`删除过程中会给出交互式提示；
- `-r`若删除的是一个目录，则将该目录下的目录及子目录均删除掉。

**显示文件或目录**

```shell
tree
```

**改变目录或文件的权限**

- 文字设定法

```shell
chmod [who][+|-|=][mode] [#文件名#]
```

- 数字设定法

```shell
chmod 777 test.txt
```

