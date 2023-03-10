# Linux基础学习笔记

Abstract：本文是根据作者日常学习Linux（Ubuntu20.04）整理的一些常用指令、技巧等，主要目的是为了方便日常的工作学习。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-02-15 18:15 —— 2022-02-23 22:58

## 1 常用指令

### 1.1 基础指令

**调出终端** 按【*Ctrl+Alt+T*】或者【*鼠标右键*】打开终端

**将当前目录的全路径名称（从根目录）写入标准输出** pwd

**Ubuntu内软件安装常用步骤**

```
$ sudo apt update # 更新apt源
$ sudo apt install net-tools # 安装软件net-tools
$ ifconfig # 查看相应的ip地址
```

**Ubuntu修改镜像源**

```
cd /etc/apt/ # 进入/etc/apt/路径
cp -a sources.list sources.backup.list # 将sources.list备份保存为sources.backup.list
sudo vim /etc/apt/sources.list # 使用vim打开sources.list，修改并保存后推出
sudo apt-get update # 更新apt源
```

**配置GitHub环境**

- 安装配置Git服务器

  - 安装ssh

  ```
  sudo apt-get install openssh-server openssh-client
  ```

  - 启动ssh服务

  ```
  sudo /etc/init.d/ssh restart
  ```

  - 安装Git服务器

  ```
  sudo apt-get install git-core
  ```

- 配置ssh公钥

  - 本地生成ssh公钥

  ```
  ssh-keygen -C '[#邮箱地址#]' -t rsa
  ```

  - 查看Git公钥

  ```
  cat ~/.ssh/id_rsa.pub # 显示的公钥即为需要上传到GitHub账户上的
  ls ~/.ssh # 查看密钥文件夹的内容
  ```

  - 检查ssh连接情况

  ```
  ssh -T [#邮箱地址#]
  ```


- 创建一个新仓库并提交文件

```
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

```
su [#用户名#]
```

**添加用户(普通)**

```
useradd [#用户名#]
useradd -m user1 -s /bin/bash
```

其中，加`-m`才会创建目录，`-s`的作用是指定使用的脚本解析器。

**删除用户(普通)**

```
userdel [#用户名#]
userdel -r [#用户名#]
```

其中，加`-r`才会删除家目录。

**设置密码**

```
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
- `-h`显示文件的大小更加直观；
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
rm -rf # 删除
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

**文件查找**

```
find [#起始目录#] [#查找条件#] [#操作对象#] # 该命令的功能是在指定目录结构中搜索文件，并执行指定的操作
```

该命令的查找条件可以是一个逻辑运算符not、and、or组成的复合条件。

- and：逻辑与，在命令中用`-a`表示，表示只有当所有给的条件都满足时，查找条件才满足。例如，在“/home/light”目录下查找名为test类型是一个目录的文件。则使用命令`find /home/light -name test -a -type d`；
- or：逻辑或，在命令中用`-o`表示，表示只要有一个所给的条件满足，查找条件才满足。例如，在“/home/light”目录下查找名为test或test01的文件。则使用命令`find /home/light -name test -o -name test01`；
- not：逻辑非，在命令中用`!`表示，表示查找不满足所给条件的文件。例如，在“/home/light”目录下查找名字不是test的文件。则使用命令`find /home/light ! -name test`。

常用的查找条件有：

- 根据名称和文件属性查找
  - `-name '字串'`查找文件名匹配所给字串的所有文件，字串内可用通配符`*`、`?`、`[]`。
    - `*`表示零个或者任意多个字符；
    - `?`单个字符；
    - `[]`某个范围。
  - `- gid n`查找属于 ID号为n的用户组的所有文件。
  - `-uid n`查找属于 ID 号为 n 的用户的所有文件。
  - `-group '字串'`查找属于用户组名为所给字串的所有的文件。
  - `-user '字串'`查找属于用户名为所给字串的所有的文件。
  - `-empty`查找大小为 0 的文件或者是空目录。
  - `-perm 权限`查找具有指定权限的文件和目录，权限的表示可以如 711，644。
  - ` -size n[bckw]`查找指定文件大小的文件，n后面的字符表示单位，缺省为b，代表512字节的块。（一定要加 +， - 是小于） 
  - `-type x`查找类型为x的文件，x为下列字符之一。
- 根据时间查找
  - `- mmin n`查找n分钟以前文件内容被修改过的所有文件（用加减号）。
  - `- mtime n`查找n天以前文件内容被修改过的所有文件。
- 可执行的操作
  - `- exec 命令名称 {}`对符合条件的文件执行所给的Linux 命令，而不询问用户是否需要执行该命令。{}表示命令的参数即为所找到的文件；命令的末尾必须以“ \;”结束。例如，在“/home/light“目录下查找名为test文件并显示这些文件的详细信息，则使用命令`find /home/light -name test -exec ls -l {} \;`。
  - 工作时一般不采用exec，而是使用xargs，例如上面的操作可用改为`find /home/light -name test|xargs ls -l`。
  - 工作时一般不采用exec命令，而是使用xargs，例如

**列出文件系统的整体磁盘空间使用情况**

```
df [#选项#] [#文件名#]
```

其中，-h：--human-readable，以人们易读的GB、MB、KB等格式显示操作发现目录的每一级都显示，如果只想显示当前目录，`du -h --max-depth=0 /home/light`。

### 1.3 文件查看及处理命令

**查看文件内容**

```
cat [#选项#] [#文件名#] # 查看目标文件的内容
```

其中，该命令有一些参数： 

- `-b`对非空输出行编号
- `-E`在每行结束处显示$
- `-n`对输出的所有行编号
- `-s`不输出多行空行

标准的输入输出与重定向：

- 标准输入：一般指键盘，描述符为：0
- 标准输出：一般指屏幕输出，描述符为：1
- 错误输出：也是屏幕，描述符为：2
- 重定向符号：`<`重定向输入、`>`重定向输出、`>>`添加输出、`2>`错误重定向、`&>`错误和信息重定向

Linux中创建空文件的四种方式：`echo -n >a.txt`；`touch b.txt`；`cat >c.txt`按ctrl+c组合键退出；`vi d.txt`进入之后，`:wq`退出。

**显示文件内容的前几行**

```
head -n [#行数值#] [#文件名#] # 显示目标文件的前几行
head -n 10 test.txt
```

**显示文件内容的后几行**

```
tail -n [#行数值#] [#文件名#] # 显示目标文件的前几行
tail -n 10 test.txt
```

**单页浏览文件**

more或者less命令（按q退出）

**对文件内容进行排序**

```
sort [#文件名#]
```

**查看文件内容类型**

```
file [#文件名#] # 根据文件内容，判别文件类型
```

**报告或删除文件中重复的行**

```
uniq [#文件名#]
```

其中，该命令有一些参数：

- `-c`在输出行前面加上每行在输入文件中出现的次数。
- `-d`仅显示重复行。
- `-u`仅显示不重复的。

**统计指定文件中的字节数、字数、行数**

```
wc [#文件名#]
```

其中，该命令有一些参数：

- `-c`统计字节数。
- `-l`统计行数。
- `-m`统计字符数。这个标志不能与`-c`标志一起使用。
- `-w`统计字数。一个字被定义为由空白、跳格或换行字符分隔的字符串。

**汉字编码转换**

```
iconv -f [#原始文件编码#] -t [#输出编码#] [#文件名#]>[#文件名#]
iconv -f utf-8 -t gb2312 test>test1
```

**搜索文件内容grep**

```
grep [#选项#] [#查找模式#] [#文件名1，文件名2，...#] # grep 过滤器查找指定字符模式的文件，并显示含有此模式的所有行。被寻找的模式称为正则表达式。
```

其中，该命令有一些参数：

- `-F`每个模式作为固定的字符串对待。
- `-c`只显示匹配行的数量。
- `-i`比较式不区分大小写。
- `-n`在输出前加上匹配串所在的行号。

### 1.4 其他命令

**管道和命令替换**

管道是重定向的一种，就像一个导管一样，将一个程序或命 令的输出作为另一个程序或命令的输入。例如，`ls|wc -l`

命令替换和重定向有点相似，但区别在于命令替换是将一个命令的输出作为另一个命令的参数 。常用的格式为：command1 `command2`或command1 $(command2)。

**文件或目录的创建掩码**

umask指文件（0666）或目录（0777）创建时在全部权限中要去掉的一些权限，普通用户缺省时 umask的值为002，超级用户为022。

**文档管理**

```
tar [#主选项+辅选项#] [#目标文档#] [#源文件或目录#] # tar可以为文件和目录创建档案（是一个整体，可以压缩的，也是非压缩的）。
```

利用tar，用户可以为某一特定文件创建档案（备份文件），也可以在档案中改变文件，或者向档 案中加入新的文件。tar 最初被用来在磁带上创建档案， 现在， 用户可以在任何设备上创建档案，如磁盘。

其中，该命令有一些参数：

c：创建新的档案文件。 r: 要把存档的文件追加到档案文件的末尾。x：从档案文件中释放文件。 f：使用档案文件或设备。 v：在归档过程中显示处理的文件。 z：用 gzip 来压缩/解压缩文件，后缀名为.gz，加上该选项后可以将档案文件进行压缩。例如，需要把“/home/light/test”下的所有后缀为.txt的归档到source.tar，则使用`tar cvf source.tar /home/light/test/*.txt`。如果在归档的过程中还要进行压缩，则使用`tar czvf source.tar.gz /home/light/test/*.txt`。如果要将归档的文件source.tar释放掉，则使用`tar xvf source.tar`。

**文件压缩解压**

```
gzip/bzip2 [#选项#] [#压缩或解压缩的文件名#]
```

其中，该命令有一些参数：

- `-d`：将压缩文件进行解压。
- `-v`：在压缩或解压过程中显示解压或压缩的文件。

**scp远程copy文件命令**

```
scp [#文件名#] username@ip:path
scp test user@192.168.0.1:~/ # 从本机copy到其他机器
scp user@192.168.0.1:~/test # 从其他机器copy到本机
```

如果scp的是文件夹，需要加-r

**查看和配置网络设备**

```
ifconfig # 查看网络
sudo /etc/init.d/networking restart # 重启网络
sudo service networking restart # 重启网络
```

**查看与设置路由**

```
route -n
```

**ubuntu设置固定IP**

```
sudo vim /etc/network/interfaces
# 将下面内容写到interfaces
auto lo
iface lo inet loopback
auto ens33
iface ens33 inet static
address 192.168.73.132
gateway 192.168.73.2
netmask 255.255.2
============================================
sudo /etc/init.d/networking restart # 重启网络
```

**无秘钥登录**

```
ssh-keygen # 生成公钥和私钥
ssh-copy-id user@192.168.0.1 # 秘钥复制到服务器的authorized_k
```

## 2 VIM编辑器

### 2.1 VIM的两种状态

> vim(vimsual)是Linux/UNIX系统OS中通用的全屏编辑器。vim分为两种状态，即命令状态和编辑状态，在命令状态下，所键入的字符系统均作命令来处理，如`:q`代表退出，而编辑状态则是用来编辑文本资料的，键盘上敲入的每一个是所见即所得。 当你进入vim时，会首先进入命令状态。在命令状态下，按”i”(插入)或”a”(添加)可以进入编辑状态，在编辑状态，按ESC键进入命令状态。

在命令状态下，有一些常用命令如下：

- a 从光标后面开始添加文本
- A 从光标所在行的末尾开始添加文本
- i 从光标前面开始插入文本
- I 从光标所在行的开始处插入文本

2.2 VIM内常用的命令操作

**删除与修改**

- x 删除光标处的字符
- dd 删除光标所在的整行
- 2dd 删除光标所在行以下面的一行（删除2行）
- D 删除光标到行尾的文本，常用于删除注释语句（d$）
- yy 复制光标所在的整行
- [#n#]yy 从光标开始往下复制n行
- p 将复制后的文本粘贴到光标处
- u 撤销上次操作

**光标移动**

- ^ 光标移动到行首
- $ 光标移动到行尾
- gg 光标定位到文档头
- G 光标定位到文档尾
- H 光标定位到当前页首
- L 光标定位到当前页的最后一行的行首
- w 光标往后移一个字
- b 光标往前移一个字
- [#n#]G 光标定位到第n行行首
- 快捷键修改单个字母：先按r，再按要替换的内容

**查找与替换**

- `/[str]` 查找字符串str，[str]表示要查找的字符串回车后会加亮显示所有找到的字符串，接着命令n移动到下一个找到的字符串，命令N移动到上一个找到的字符串；
- `:s/[src]/[dst] /i` 忽略大小写/g全部匹配，eg：`:s/hello/world/ig`替换一行；
- `:%s/[src]/[dst]/g` 将文档中所有src的字符串替换为dst；
- `:%s/^ //g` 将文档每一行的行首的空格去掉。

**块操作**

v 可视化块选择状态，选中块之后，可以对块进行删除(d)，复制(y)，剪切(x)

Ctrl +v 竖向选择模式，主要用于批量注释代码，输入步骤如下：

1. 按 ctrl+v，竖选选中要注释的行；
2. 输入 I，然后输入#；
3. 再输入 Esc，就会看到选中的行被注释了。

**文档保存及退出**

- `:q` 在未修改文档的情况下退出
- `:q!` 放弃文档的修改，强行退出
- `:w` 文档存盘
- `:wq` 文档存盘退出

**修改vim配置**

- 在~目录下执行`vim .bashrc`；
- 将以下内容写入并保存；

```shell
set nu
set cursorline
set hlsearch
set tabstop=4
set fileencodings=utf-8,gbk,gb2312
```

- 执行`source .bashrc`，再次打开vim编辑器就可以看到配置生效了。

**vim外使用到的命令**

```
sed: 管道查找替换程序

cat test.txt | sed 's/hello/world/' >test01.txt # 将test.txt中的hello替换成word并重定向输出到test01.txt中。
```

## 3 Linux效率提升技巧

### 3.1 封装短命令

为提高日常使用Linux进行工作的效率，我们可以封装一些短命令。这里我以封装一个"快速将内容复制到服务器上去"的短命令为例，展示短命令封装操作的基本步骤：

- `vim qscp` # vim [#命令名称#]
- 在vim编辑器中写入命令内容

```
scp -r $1 ubuntu@192.168.0.1:~/test
```

- 创建一个~/bin目录，并将qscp命令放到该目录下，同时添加可执行权限
- 修改环境变量。首先，`vim ~/.bashrc`，然后，在适当的位置添加"PATH=~/bin:$PATH"

### 3.2 便捷配置

**软连接实现python指向python3**

```
sudo rm /usr/bin/python # 若系统中没有该命令配置，则不需要该操作
sudo ln -s /usr/bin/python3.10 /usr/bin/python # 其中 3.10，可以替换为自己所使用的Ubuntu上python的版本号
```

**常用压缩解压命令总结**

1. 压缩命令

- `tar`：使用 tar 命令可以将多个文件或目录打包成一个归档文件，常用于文件备份和压缩。tar 可以配合其他压缩工具（例如 gzip 或 bzip2）一起使用来实现压缩效果。常用选项包括 `-c`（创建归档文件）、`-v`（显示详细信息）、`-f`（指定输出文件名）、`-z`（使用 gzip 压缩）等。

```
tar -cvf example.tar example_dir
```

- `zip`：zip 命令用于将多个文件和目录压缩成一个 zip 格式的压缩文件。常用选项包括 `-r`（递归处理子目录）、`-v`（显示详细信息）、`-q`（静默操作）、`-j`（仅压缩文件，不包括目录）等。

```
zip -r example.zip example_dir
```

- `gzip`：gzip 命令用于压缩文件，通常与 tar 命令结合使用。gzip 压缩后的文件名为原文件名加上 `.gz` 后缀。常用选项包括 `-v`（显示压缩比和压缩信息）、`-f`（强制覆盖已存在的文件）、`-d`（解压缩）等。

```
gzip example_file.txt
```

- `bzip2`：bzip2 命令也用于压缩文件，压缩比较高，但压缩速度较慢。通常与 tar 命令结合使用。bzip2 压缩后的文件名为原文件名加上 `.bz2` 后缀。常用选项包括 `-v`（显示压缩比和压缩信息）、`-f`（强制覆盖已存在的文件）、`-d`（解压缩）等。

```
bzip2 example_file.txt
```

2. 解压命令

- `tar`：使用 tar 命令可以解压缩 tar 格式的归档文件。常用选项包括 `-x`（解包）、`-v`（显示详细信息）、`-f`（指定归档文件名）、`-z`（使用 gzip 解压缩）等。

```
tar -xvf example.tar
```

- `unzip`：unzip 命令用于解压缩 zip 格式的压缩文件。常用选项包括 `-l`（列出压缩文件内容）、`-t`（测试压缩文件完整性）、`-o`（覆盖已存在的文件）、`-q`（静默操作）等。

```
unzip example.zip
```

- `gzip`：gzip 命令用于解压缩以 gzip 格式压缩的文件。常用选项包括 `-d`（解压缩）、`-v`（显示解压缩信息）等。

```
gzip -d example_file.txt.gz
```

- `bzip2`：bzip2 命令用于解压缩以 bzip2 格式压缩的文件。常用选项包括 `-d`（解压缩）、`-v`（显示解压缩信息）等。

```
bzip2 -d example_file.txt.bz2
```

**Linux下运行Python代码**

```
#!/usr/bin/python
```

这段代码是 Python 脚本文件的开头行，通常称为 shebang 行。这行代码告诉操作系统应该使用哪个解释器来执行这个脚本文件。在这个例子中，`#!/usr/bin/python` 告诉操作系统使用 Python 解释器来执行这个脚本文件。

在 Linux 和其他类 Unix 操作系统中，shebang 行是一个常见的用法。使用 shebang 行可以让脚本文件在运行时像可执行程序一样执行，而不需要在命令行中显式地指定解释器。

例如，如果有一个名为 test.py 的 Python 脚本文件，有了 shebang 行，可以直接在终端中执行 ./test.py 命令来运行该脚本文件，而不需要在命令行中指定解释器。如果没有 shebang 行，需要在命令行中使用 python test.py 命令来运行该脚本文件。

因此，shebang 行的应用场景是：在类 Unix 系统中，用来告诉操作系统应该使用哪个解释器来执行该脚本文件，从而使脚本文件可以像可执行程序一样执行。

当在Windows系统上用IDE写好并放到Linux服务器上，使用vim修改py文件后，运行报错如下时：

> /usr/bin/python^M: bad interpreter: No such file or directory

这可能是由于在多个环境上编写，可能会因为字符、缩进等不一致导致的错误。

解决方案如下，用vim打开文件，进入python脚本，执行如下操作，保存并退出。

```
:set ff=unix
```

