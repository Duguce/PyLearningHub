# -*- coding: utf-8  -*-
# @Author  : Duguce 
# @Email   : zhgyqc@163.com
# @Time    : 2023/3/8 18:53
# @File    : client.py
# @Software: PyCharm
import socket
import sys
import struct


class MiniNetDiskClient:
    def __init__(self, host, post):
        self.host = host
        self.post = post
        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def start(self):
        server_address = (self.host, self.post)
        self.client_socket.connect(server_address)

    def send_data(self, data):
        data_bytes = data.encode('utf-8') if not isinstance(data, bytes) else data
        data_len = len(data_bytes)
        self.client_socket.send(struct.pack('I', data_len))  # Send header (4 bytes) containing the length of the data
        self.client_socket.send(data_bytes)  # Send data

    def recv_data(self):
        header_len = 4  # The header is always 4 bytes long
        header_bytes = self.client_socket.recv(header_len)  # Receive the header
        if not header_bytes:
            return None
        data_len = struct.unpack('I', header_bytes)[0]
        data_bytes = self.client_socket.recv(data_len)
        return data_bytes.decode('utf-8')

    # def recv_file(self):
    #     header_len = 4  # The header is always 4 bytes long
    #     header_bytes = self.client_socket.recv(header_len)  # Receive the header
    #     if not header_bytes:
    #         return None
    #     content_len = struct.unpack('I', header_bytes)[0]
    #     total = 0
    #     while total < content_len:
    #         return self.client_socket.recv(content_len - total)

    def gets(self):
        file_name = self.recv_data()
        header_len = 4  # The header is always 4 bytes long
        header_bytes = self.client_socket.recv(header_len)  # Receive the header
        if not header_bytes:
            return None
        content_len = struct.unpack('I', header_bytes)[0]
        total = 0
        with open(file_name, 'wb') as f:
            while total < content_len:
                content = self.client_socket.recv(content_len - total)
                total += len(content)
                f.write(content)

    def puts(self, cmd):
        file_name = cmd[5:]
        self.send_data(file_name)
        f = open(file_name, 'rb')
        file_content = f.read()
        self.send_data(file_content)

    def use_cmd(self):
        while True:
            # Send the command to the server
            command = input("Please enter a command: ")
            self.send_data(command)
            if command[:4] == 'gets':
                self.gets()
            elif command[:4] == 'puts':
                self.puts(command)
            else:
                # Receive the response from the server
                data = self.recv_data()
                # Print the response to the console
                print(data)


if __name__ == '__main__':
    test_client = MiniNetDiskClient('<host>', 2000)
    test_client.start()
    test_client.use_cmd()
