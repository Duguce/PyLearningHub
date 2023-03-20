# -*- coding: utf-8  -*-
# @Author  : Duguce 
# @Email   : zhgyqc@163.com
# @Time    : 2023/3/8 18:53
# @File    : server.py.py
# @Software: PyCharm
import socket
import os, struct, shutil
from multiprocessing import Pool


class MiniNetDiskServer:
    def __init__(self, host, post):
        self.host = host
        self.post = post
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.cwd = os.getcwd()
        self.server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    def start(self):
        self.server_socket.bind((self.host, self.post))
        self.server_socket.listen(100)
        print(f"Server listening on {self.host}:{self.post}")
        pool = Pool(processes=3)
        while True:
            client_socket, client_address = self.server_socket.accept()
            print(f"New client connected: {client_address}")
            pool.apply_async(self.handle_client, args=(client_socket,))

    def handle_client(self, client_socket):
        try:
            while True:
                command = self.recv_data(client_socket)
                self.deal_cmd(command, client_socket)
        except Exception as e:
            print(f"Exception: {e}")
        finally:
            client_socket.close()

    def deal_cmd(self, command, client_socket):
        if command[:2] == 'ls':
            self.ls(client_socket)
        elif command[:2] == 'cd':
            self.cd(command, client_socket)
        elif command[:2] == 'rm':
            self.rm(command, client_socket)
        elif command[:3] == 'pwd':
            self.pwd(client_socket)
        elif command[:4] == 'gets':
            self.gets(command, client_socket)
        elif command[:4] == 'puts':
            self.puts(client_socket)
        else:
            self.send_data(client_socket, "Unknown command...")

    def send_data(self, socket, data):
        data_bytes = data.encode('utf-8') if not isinstance(data, bytes) else data
        data_len = len(data_bytes)
        socket.send(struct.pack('I', data_len))
        socket.send(data_bytes)

    def recv_data(self, socket):
        header_len = 4
        header_bytes = socket.recv(header_len)
        if not header_bytes:
            return None
        data_len = struct.unpack('I', header_bytes)[0]
        data_bytes = socket.recv(data_len)
        return data_bytes.decode('utf-8')

    def ls(self, client_socket):
        table_header = f"| {'filename':<30} | {'filetype':<10} | {'filesize':<10} |"
        separator = "-" * len(table_header)
        table_content = "\n".join(
            f"| {file:<30} | {'d' if os.path.isdir(file) else '-':<10} | {os.stat(file).st_size:>10} |"
            for file in os.listdir(self.cwd)
        )
        data = f"{separator}\n{table_header}\n{separator}\n{table_content}\n{separator}"
        self.send_data(client_socket, data)

    def cd(self, cmd, client_socket):
        os.chdir(cmd[3:])
        self.cwd = os.getcwd()
        data = self.cwd
        self.send_data(client_socket, data)

    def pwd(self, client_socket):
        data = self.cwd
        self.send_data(client_socket, data)

    def rm(self, cmd, client_socket):
        file_path = cmd[3:]
        if os.path.isdir(file_path):
            shutil.rmtree(file_path)  # 删除文件夹（含非空）
        else:
            os.remove(file_path)  # 删除文件
        self.send_data(client_socket, 'It has been deleted successfully!')

    def gets(self, cmd, client_socket):
        file_name = cmd[5:]
        self.send_data(client_socket, file_name)
        f = open(file_name, 'rb')
        file_content = f.read()
        self.send_data(client_socket, file_content)

    def puts(self, client_socket):
        file_name = self.recv_data(client_socket)
        header_len = 4  # The header is always 4 bytes long
        header_bytes = client_socket.recv(header_len)  # Receive the header
        if not header_bytes:
            return None
        content_len = struct.unpack('I', header_bytes)[0]
        total = 0
        with open(file_name, 'wb') as f:
            while total < content_len:
                content = client_socket.recv(content_len - total)
                total += len(content)
                f.write(content)


if __name__ == '__main__':
    test_server = MiniNetDiskServer('', 2000)
    test_server.start()
