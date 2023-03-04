# -*- coding: utf-8  -*-
# @Author  : Duguce 
# @Email   : zhgyqc@163.com
# @Time    : 2023/3/4 15:55
# @File    : main.py
# @Software: PyCharm
import pygame
from sprites import *
import time


class Game:
    def __init__(self):
        self.screen = pygame.display.set_mode(SCREEN_RECT.size)  # 创建游戏窗口
        self.clock = pygame.time.Clock()  # 创建游戏时钟
        self.__create_sprites()  # 调用私有方法，精灵和精灵组的创建,也是初始化
        pygame.time.set_timer(CREATE_ENEMY_EVENT, 1000)  # 设置定时器事件 - 创建敌机　设定敌机的刷新时间为1s
        pygame.time.set_timer(PLANE_FIRE_EVENT, 300)  # 英雄子弹事件的刷新频率为0.5秒

    def __create_sprites(self):
        # 创建背景精灵和精灵组
        bg1 = Background()
        bg2 = Background(True)
        self.back_group = pygame.sprite.Group(bg1, bg2)
        self.enemy_group = pygame.sprite.Group()  # 创建敌机的精灵组
        # 创建玩家飞机的精灵和精灵组
        self.plane = Plane()
        self.plane_group = pygame.sprite.Group(self.plane)

    def start_game(self):
        print("游戏开始...")
        while True:
            self.clock.tick(FRAME_PER_SEC)  # 设置刷新帧率
            self.__event_handler()  # 事件监听
            self.__check_collide()  # 碰撞检测
            self.__update_sprites()  # 更新/绘制精灵组
            pygame.display.update()  # 更新显示

    def __event_handler(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:  # 判断是否退出游戏
                Game.__game_over()
            elif event.type == CREATE_ENEMY_EVENT:
                enemy = Enemy()  # 创建敌机精灵
                self.enemy_group.add(enemy)  # 将敌机精灵添加到敌机精灵组
            elif event.type == PLANE_FIRE_EVENT:
                self.plane.fire()
        # 使用键盘提供的方法获取键盘按键 - 按键元组
        keys_pressed = pygame.key.get_pressed()
        # 判断元组中对应的按键索引值 1
        if keys_pressed[pygame.K_UP]:
            self.plane.update(1)
        if keys_pressed[pygame.K_DOWN]:
            self.plane.update(2)
        if keys_pressed[pygame.K_LEFT]:
            self.plane.update(3)
        if keys_pressed[pygame.K_RIGHT]:
            self.plane.update(4)

    def __check_collide(self):
        pygame.sprite.groupcollide(self.plane.bullets, self.enemy_group, True, True)  # 子弹摧毁敌机
        enemies = pygame.sprite.spritecollide(self.plane, self.enemy_group, True)  # 敌机撞毁玩家飞机
        if len(enemies) > 0:  # 判断列表时候有内容
            # 让角色飞机牺牲
            self.plane.kill()
            time.sleep(2)
            Game.__game_over()  # 结束游戏

    def __update_sprites(self):
        self.back_group.update()
        self.back_group.draw(self.screen)

        self.enemy_group.update()
        self.enemy_group.draw(self.screen)

        self.plane_group.update()
        self.plane_group.draw(self.screen)

        self.plane.bullets.update()
        self.plane.bullets.draw(self.screen)

    @staticmethod
    def __game_over():
        print("游戏结束...")

        pygame.quit()
        exit()  # 进程结束


if __name__ == '__main__':
    # 创建游戏对象
    pygame.init()
    game = Game()
    # 启动游戏
    game.start_game()
