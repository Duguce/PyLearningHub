# Django学习笔记

Abstract：本文是根据作者学习Django数据库相关知识所作的笔记，主要目的是为了方便日常的工作学习。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-03-16 20:12 —— 2022-03-19 11:31

**Django官方文档**：https://docs.djangoproject.com/en/4.1/

**Django-REST-framework**：https://www.django-rest-framework.org/

## 1 Django

### 1.1 Django简介

Django是一个基于MVC（Model-View-Controller）的Web框架，它采用了一些现代化的编程技术，如ORM（对象关系映射）、URL分发、模板渲染、表单处理等等，使得Web开发更加高效和易于维护。

Django的核心组件包括：

- 模型层（Model）：这是与数据库交互的组件，它提供了一种方便的方式来定义数据模型和数据之间的关系，Django使用ORM来处理数据库操作，使得数据库访问更加容易。
- 视图层（View）：这是处理用户请求和生成响应的组件，它接收HTTP请求并将其转换为相应的响应，Django支持多种视图类型，如函数视图和类视图。
- 模板层（Template）：这是用于渲染HTML页面的组件，它允许开发人员使用Django模板语言（DTL）编写模板，并使用模板标签和过滤器来生成动态内容。
- 表单层（Form）：这是用于处理Web表单的组件，它提供了一种方便的方式来验证表单数据并保存表单数据到数据库中。
- Admin后台管理：Django还提供了一个自动生成的Admin后台管理界面，它允许管理员轻松地管理应用程序的数据。

此外，Django还提供了一些其他的功能，如中间件、信号、缓存、分页、静态文件处理等等，这些都使得Django成为一个功能强大且易于使用的Web框架。

### 1.2 安装配置

下面是在Ubuntu系统下安装和配置Django的基本步骤。

- 安装虚拟环境

虚拟环境可以帮助我们隔离应用程序依赖库和系统依赖库，从而避免因不同的Python应用程序所需的依赖库冲突而导致的问题。在Ubuntu系统中，可以使用以下命令创建虚拟环境：

```
sudo apt-get install python3-venv
python3 -m venv myenv
```

其中，“myenv”是虚拟环境的名称。然后使用以下命令激活虚拟环境：

```
source myenv/bin/activate
```

- 安装Django

在虚拟环境中，使用以下命令安装Django：

```
pip install Django
```

- 创建Django项目

使用以下命令在当前目录中创建Django项目：

```
django-admin startproject myproject
```

其中，“myproject”是项目的名称。

- 运行Django项目

在终端中进入项目的根目录，使用以下命令启动开发服务器：

```
python manage.py runserver
```

然后在Web浏览器中访问http://localhost:8000/，即可看到Django的默认欢迎页面。

- 创建应用程序

```
python manage.py startapp snippets
```

其中，“snippets”是应用程序的名称。

### 1.3 项目结构

下面是一个Django项目的基本结构：

```
projectname/
├── manage.py
├── projectname/
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── appname/
│   ├── migrations/
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
└── db.sqlite3
```

其中，“projectname”是项目的名称，“appname”是应用的名称。

- manage.py：Django项目管理文件，用于启动开发服务器、创建数据库和执行其他管理任务。
- projectname/：项目目录，包含了项目的配置和管理文件，以及应用程序的配置和静态文件。
  - \__init__.py：表示该目录是Python包。
  - asgi.py：ASGI应用程序入口点。
  - settings.py：项目的主要配置文件，包含了数据库、静态文件和模板路径等设置。
  - urls.py：项目的主要URL配置文件，包含了应用程序的URL路由配置。
  - wsgi.py：WSGI应用程序入口点。
- appname/：应用目录，包含了应用程序的模型、视图、模板和静态文件等。
  - migrations/：包含数据库迁移文件。
  - \__init__.py：表示该目录是Python包。
  - admin.py：定义应用程序的后台管理界面。
  - apps.py：定义应用程序的配置信息。
  - models.py：应用程序的模型文件，包含了应用程序的数据模型定义。
  - tests.py：应用程序的测试文件。
  - urls.py：应用程序的URL配置文件，包含了应用程序的URL路由配置。
  - views.py：应用程序的视图文件，包含了应用程序的视图函数定义。
- db.sqlite3：数据库文件，存储项目使用的关系型数据库的数据。

### 1.4 模型

Django中的模型是用于定义数据结构的类，它们会自动映射到数据库中的表，可以用于实现数据的持久化存储和检索。Django的模型系统是基于ORM（Object-Relational Mapping，对象关系映射）的，它把数据库表映射成Python中的类，将表中的记录映射成Python对象。在Django中，我们通常会将每个模型定义为一个类，这个类继承自`django.db.models.Model`类。

在一个 Django 应用程序中，通常会有多个模型，每个模型代表一个数据表。例如，我们可以创建一个简单的文章模型来存储博客文章：

```python
from django.db import models

class Article(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    def update(self, title=None, content=None):
        if title:
            self.title = title
        if content:
            self.content = content
        self.save()

    class Meta:
        abstract = True

class ArticleManager(models.Manager):
    def create_article(self, title, content):
        article = self.create(title=title, content=content)
        return article

    def search(self, keyword):
        return self.filter(title__contains=keyword)

class PublishedArticle(Article):
    objects = ArticleManager()

    class Meta:
        proxy = True

    def delete(self, *args, **kwargs):
        super().delete(*args, **kwargs)
```

上面的代码中，我们定义了一个名为 `Article` 的模型，它有四个字段：`title`，`content`，`created_at` 和 `updated_at`。其中，`title` 和 `content` 字段分别用于存储文章的标题和内容，`created_at` 和 `updated_at` 字段分别用于存储文章的创建时间和最近修改时间。在 `Article` 模型中，我们还定义了一个 `__str__` 方法，用于返回该文章的标题，方便在程序中进行调试和测试。

除了上面定义的字段之外，Django 模型还支持多种类型的字段，包括整数类型、日期类型、布尔类型等等。每种类型的字段都可以定义各种参数，用于指定该字段的约束条件、默认值等。

在 Django 中，我们通常会将每个模型定义为一个类，这个类继承自 `django.db.models.Model` 类。通过继承该类，我们就可以使用 Django 提供的模型 API 来实现数据的增删改查等操作，例如：

上面的代码展示了如何通过模型管理类来对模型进行增删查改等操作，同时也展示了如何创建代理模型。

- 首先，创建了一个抽象基类 `Article`，其中定义了一个 `update` 方法用于更新文章的标题和内容。为了让其他的模型类继承该类的字段和方法，将其定义为一个抽象基类，这意味着它本身不会被实例化。
- 接着，定义了一个 `ArticleManager` 模型管理器类，其中包含了两个方法：`create_article` 用于创建一篇新的文章，`search` 用于按关键字搜索文章。
- 然后，创建了一个名为 `PublishedArticle` 的代理模型，将 `ArticleManager` 模型管理器类指定为其管理器。代理模型的作用是不会创建新的数据库表，而是使用原来的表来做一些特殊的操作。
- 最后，代理模型 `PublishedArticle` 重写了基类的 `delete` 方法，并调用了基类的 `delete` 方法，这是因为代理模型无法进行删除操作，需要通过基类来完成。同时，代理模型 `PublishedArticle` 可以继承基类 `Article` 的所有字段和方法，包括抽象基类中定义的 `update` 方法。

### 1.5 视图

视图是Django中用来处理HTTP请求并返回HTTP响应的函数或方法，主要负责处理URL映射、数据处理和模板渲染等任务。

视图配置的整体流程如下：

1. 创建一个视图函数或方法，接收请求对象(request)作为参数，进行数据处理和逻辑处理，并返回一个响应对象(response)。
2. 在应用的urls.py文件中，导入视图函数或方法，并配置URL映射关系。
3. 在Django的全局urls.py文件中，将应用的urls.py文件包含进来。

下面是一个简单的示例：

- 创建视图函数

```python
from django.http import HttpResponse

def hello(request):
    return HttpResponse("Hello, World!")
```

- 配置URL映射

在应用的urls.py文件中，可以使用path()函数或re_path()函数配置URL映射关系，例如：

```python
from django.urls import path
from . import views

urlpatterns = [
    path('hello/', views.hello, name='hello'),
]
```

上述代码中，当用户请求/hello/路径时，会调用hello视图函数处理请求。

- 包含应用的urls.py文件

在Django的全局urls.py文件中，使用include()函数将应用的urls.py文件包含进来，例如：

```python
from django.urls import include, path

urlpatterns = [
    path('myapp/', include('myapp.urls')),
]
```

上述代码中，当用户请求/myapp/路径时，会将请求交给myapp应用的urls.py文件进行处理。

### 1.6 模板

在Django中，模板是使用类似于HTML的语言编写的，称为Django模板语言（Django Template Language，简称DTL）。DTL提供了一些标签和过滤器，可以方便地渲染动态内容和控制HTML输出。

在Django中，每个应用程序都可以有自己的模板文件夹，其中包含所有该应用程序的模板。可以在应用程序目录中创建一个名为`templates`的文件夹来保存模板。在模板中，可以使用Django模板引擎的内置标签和过滤器来编写动态内容和控制HTML输出。

模板可以使用模板继承来共享模板块和减少重复。模板继承允许创建一个基本模板，该模板包含应用程序的公共部分，例如页眉和页脚。然后，可以创建子模板，这些子模板继承基本模板并添加应用程序特定的内容。

为了使用模板，需要在视图中渲染它们。可以使用Django的`render()`函数来加载模板并将其渲染为HTML响应。在渲染模板时，可以将上下文传递给模板，以便在模板中使用该上下文。

Django中的模板主要由以下三个部分组成：

- 模板标记（Template Tags）：一些带有特殊语法的关键字或语句，用于在模板中添加逻辑判断、循环、过滤等控制逻辑。
- 模板过滤器（Template Filters）：用于处理模板变量的函数，可以将一个变量经过处理后输出到模板中，如对变量进行格式化、排序、筛选等。
- 模板变量（Template Variables）：模板中使用的动态变量，可以是模型对象的属性或方法，也可以是自定义的变量或函数。

Django的模板系统还提供了模板继承（Template Inheritance）的功能，可以方便地实现模板的复用和维护。模板继承允许一个模板定义一个页面的基本结构，而其他模板只需继承这个模板，并且可以在基础上添加或修改内容。

模板的使用流程如下：

1. 在Django项目中创建模板目录，一般放在应用的templates目录下。
2. 编写模板文件，可以使用模板标记、模板过滤器和模板变量。
3. 在视图函数中将模板文件渲染成HTML格式的响应，可以使用Django提供的渲染器或自定义渲染器。
4. 在路由配置中将URL与视图函数绑定。

下面是一个简单的例子，演示如何在Django中使用模板：

- 配置模板目录和静态文件目录

在项目的settings.py文件中，配置TEMPLATES和STATICFILES_DIRS：

```python
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')], # 模板目录
        'APP_DIRS': True,
        'OPTIONS': {
            # ...
        },
    },
]

STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static') # 静态文件目录
]
```

- 编写模板文件

在应用的templates目录下，创建一个名为index.html的文件，内容如下：

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{ title }}</title>
</head>
<body>
    <h1>Hello, {{ name }}!</h1>
</body>
</html>
```

- 视图函数渲染

```python
from django.shortcuts import render

def hello(request):
    context = {'title': 'Hello World', 'name': 'John'}
    return render(request, 'hello.html', context)
```

## 2 Django-REST-Framework

待补充...
