# -*- coding: utf-8  -*-
# @Author  : Duguce 
# @Email   : zhgyqc@163.com
# @Time    : 2023/3/4 15:47
# @File    : sprites.py
# @Software: PyCharm
import random
import pygame

# 定义常量
SCREEN_RECT = pygame.Rect(0, 0, 480, 700)
FRAME_PER_SEC = 60
CREATE_ENEMY_EVENT = pygame.USEREVENT
PLANE_FIRE_EVENT = pygame.USEREVENT + 1


# 定义基类
class GameSprite(pygame.sprite.Sprite):
    def __init__(self, image_name, speed=1):
        super().__init__()
        self.image = pygame.image.load(image_name)
        self.rect = self.image.get_rect()
        self.speed = speed

    def update(self):
        self.rect.y += self.speed


class Background(GameSprite):
    def __init__(self, is_alt=False):
        super().__init__('./images/background.png')
        if is_alt:
            self.rect.y = -self.rect.height

    def update(self):
        super().update()
        if self.rect.y >= SCREEN_RECT.height:
            self.rect.y = -self.rect.height


class Enemy(GameSprite):
    def __init__(self):
        super().__init__('./images/enemy1.png')
        self.speed = random.randint(2, 4)
        self.rect.bottom = 0
        max_x = SCREEN_RECT.width - self.rect.width
        self.rect.x = random.randint(0, max_x)

    def update(self):
        super().update()
        if self.rect.y >= SCREEN_RECT.height:
            self.kill()


class Plane(GameSprite):
    def __init__(self):
        super().__init__('./images/me1.png', 0)
        self.rect.centerx = SCREEN_RECT.centerx
        self.rect.bottom = SCREEN_RECT.bottom - 120
        self.bullets = pygame.sprite.Group()
        self.speed = 8

    def update(self, direction=0):
        if direction == 1:
            if self.rect.top > 0:
                self.rect.top -= self.speed
            else:
                self.rect.top = 0
        elif direction == 2:
            if self.rect.bottom < SCREEN_RECT.bottom:
                self.rect.top += self.speed
            else:
                self.rect.bottom = SCREEN_RECT.bottom
        elif direction == 3:
            if self.rect.left > 0:
                self.rect.left -= self.speed
            else:
                self.rect.left = 0
        elif direction == 4:
            if self.rect.right < SCREEN_RECT.right:
                self.rect.left += self.speed
            else:
                self.rect.right = SCREEN_RECT.right

    def fire(self):
        bullet = Bullet()
        bullet.rect.bottom = self.rect.y - 20
        bullet.rect.centerx = self.rect.centerx
        self.bullets.add(bullet)


class Bullet(GameSprite):
    def __init__(self):
        super().__init__('./images/bullet1.png', -5)

    def update(self):
        super().update()
        if self.rect.bottom < 0:
            self.kill()
