# Python高级学习笔记

Abstract：本文主要记录了作者在日常学习Python过程中所掌握的一些高级功能特性，例如正则表达式、装饰器等内容，并对其进行了总结和归纳。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-03-21 20:40 —— 2022-03-25 17:04

## 1 正则表达式

> 正则表达式是一种用于匹配、搜索、替换文本的工具。正则表达式通常由一些特殊字符和常规字符组成，可以用来表示文本模式。

正则表达式通常用于文本处理任务，如搜索、替换、解析和验证文本。它们可以被用于各种编程语言和工具中，如Perl、Python、Java、JavaScript、sed、grep、awk等等。

正则表达式可以用于：

- 匹配一个文本模式，如匹配一个特定的字符串。
- 匹配一组字符串，如匹配所有以特定字符串开头的字符串。
- 匹配一些字符集合，如匹配所有数字或所有字母。
- 替换文本中的一个模式，如将所有特定字符串替换为另一个字符串。
- 分割文本，如将一个长字符串分割成一组短字符串。
- 验证文本，如检查一个字符串是否符合特定的格式要求。

### 1.1 re模块简介

在 Python 中，可以使用内置模块 `re` 来进行正则表达式的操作。

常用的函数有：

- `re.search(pattern, string)`：在字符串 `string` 中搜索匹配正则表达式 `pattern` 的第一个位置，并返回一个包含匹配信息的 `Match` 对象，如果匹配不成功，则返回 `None`。
- `re.match(pattern, string)`：从字符串 `string` 的起始位置开始匹配正则表达式 `pattern`，如果匹配成功，则返回一个包含匹配信息的 `Match` 对象，否则返回 `None`。
- `re.findall(pattern, string)`：搜索字符串 `string` 中所有匹配正则表达式 `pattern` 的子串，并返回一个列表，如果没有匹配成功，则返回空列表。
- `re.sub(pattern, repl, string)`：在字符串 `string` 中搜索匹配正则表达式 `pattern` 的所有子串，并用 `repl` 替换掉，返回替换后的字符串。
- `re.search(pattern, string, flags=0)`：`search`函数会在字符串 `string` 中从左到右搜索，找到第一个与正则表达式匹配的位置。如果在字符串中找不到匹配项，则返回`None`。

### 1.2 匹配单个字符

| 字符 |                功能                |
| :--: | :--------------------------------: |
| `.`  |    匹配除了换行符以外的任意字符    |
| `[]` |         匹配[]中列举的字符         |
| `\w` |       匹配字母、数字、下划线       |
| `\d` |              匹配数字              |
| `\s` | 匹配空格、制表符、换行符等空白字符 |
| `\W` |   匹配非字母、数字、下划线的字符   |
| `\D` |          匹配非数字的字符          |
| `\S` |           匹配非空白字符           |

### 1.3 匹配多个字符

|  字符   |                功能                |
| :-----: | :--------------------------------: |
|   `*`   |   匹配前面的字符或组合零次或多次   |
|   `+`   |   匹配前面的字符或组合一次或多次   |
|   `?`   |   匹配前面的字符或组合零次或一次   |
|  `{m}`  | 匹配前面的字符或组合恰好出现 m 次  |
| `{m,}`  | 匹配前面的字符或组合至少出现 m 次  |
| `{m,n}` | 匹配前面的字符或组合出现 m 到 n 次 |

例如，`*` 字符可以匹配前面的字符或组合出现零次或多次，如 `r"a*"` 可以匹配零个或多个 `a` 字符。`+` 字符可以匹配前面的字符或组合出现一次或多次，如 `r"a+"` 可以匹配至少一个 `a` 字符。`?` 字符可以匹配前面的字符或组合出现零次或一次，如 `r"a?"` 可以匹配零个或一个 `a` 字符。`{m}`、`{m,}` 和 `{m,n}` 则可以用来匹配特定数量的字符或组合。

另外需要注意的是，以上匹配多个字符的字符通常都是贪婪匹配，即会尽可能多地匹配字符。例如，对于字符串 `"aaaa"`，使用 `r"a*"` 进行匹配时会匹配整个字符串，而不是只匹配一个 `a`。如果想要进行非贪婪匹配，可以在这些字符后面添加一个 `?`，例如，`r"a*?"` 可以进行非贪婪匹配。

### 1.4 匹配开头结尾

| 字符 |                             功能                             |
| :--: | :----------------------------------------------------------: |
| `^`  |                       匹配字符串的开头                       |
| `$`  |                       匹配字符串的结尾                       |
| `\A` | 匹配字符串的开头（与 `^` 的区别在于，`\A` 不会匹配多行字符串的每一行的开头） |
| `\Z` | 匹配字符串的结尾（与 `$` 的区别在于，`\Z` 不会匹配多行字符串的每一行的结尾） |
| `\b` |           匹配单词边界，即单词与非单词字符的交界处           |
| `\B` |                        匹配非单词边界                        |

### 1.5 匹配分组

|    字符     |                            功能                            |
| :---------: | :--------------------------------------------------------: |
|     ()      |      匹配并捕获括号内的表达式，将匹配结果保存在分组中      |
|    (?:)     |         匹配但不捕获括号内的表达式，不保存匹配结果         |
| (?P\<name>) | 匹配并捕获括号内的表达式，将匹配结果保存在指定名称的分组中 |
|  (?P=name)  |           匹配与之前指定名称的分组匹配的相同文本           |
|    (?#)     |              注释，不影响正则表达式的匹配结果              |

其中，匹配并捕获括号内的表达式的语法为 `()`，例如 `(hello)` 会匹配并捕获字符串中的 `hello`，将其保存在分组中。可以通过数字来引用分组，例如 `\1` 引用第一个分组的匹配结果。如果需要匹配但不捕获括号内的表达式，则可以使用 `(?:)`，例如 `(?:hello)` 只会匹配 `hello`，但不会将其保存在分组中。

如果希望将匹配结果保存在指定名称的分组中，可以使用 `(?P<name>)` 的语法，例如 `(?P<name>hello)` 会将 `hello` 保存在名为 `name` 的分组中。可以通过 `(?P=name)` 来引用指定名称的分组匹配的相同文本。

最后，如果需要在正则表达式中添加注释，可以使用 `(?#)`，例如 `(?#This is a comment)hello` 不会匹配任何内容，但不会影响正则表达式的匹配结果。

### 1.6 贪婪与非贪婪匹配

在正则表达式中，贪婪匹配和非贪婪匹配是指匹配操作对待重复匹配符号（如星号和加号）的不同处理方式。

贪婪匹配指的是尽可能多地匹配字符串，也就是匹配到最后一个匹配符号为止。例如，对于正则表达式 `a.*b`，当匹配字符串 `aabab` 时，贪婪匹配会匹配整个字符串 `aabab`，而不是只匹配 `aab`。

非贪婪匹配（也称为懒惰匹配或最小匹配）指的是尽可能少地匹配字符串，也就是在第一个匹配符号处停止匹配。例如，对于正则表达式 `a.*?b`，当匹配字符串 `aabab` 时，非贪婪匹配会匹配 `aab`，而不是整个字符串 `aabab`。

在正则表达式中，可以通过在匹配符号后添加问号来实现非贪婪匹配，例如，`*?` 表示匹配零个或多个字符（非贪婪匹配），而 `*` 表示匹配零个或多个字符（贪婪匹配）。

## 2 GIL

> GIL（Global Interpreter Lock）是在Python解释器中使用的一种锁机制，它是为了保证线程安全而存在的。

在Python中，解释器的内存管理不是线程安全的，这意味着当多个线程同时访问共享内存时，可能会出现数据竞争的情况。为了避免这种情况，Python引入了GIL锁。

GIL锁的作用是在同一时刻只有一个线程能够执行Python字节码，这保证了Python解释器的线程安全。换句话说，GIL锁会在任意时刻只允许一个线程执行Python解释器中的字节码。

虽然GIL锁能够保证线程安全，但同时也会带来一些限制。由于同一时刻只能有一个线程执行Python字节码，所以多线程的性能可能会受到影响。特别是当线程需要执行CPU密集型任务时，由于GIL锁的存在，多线程并不能带来多核CPU的优势。

需要注意的是，GIL锁只存在于CPython解释器中。在使用Jython、IronPython、PyPy等其他Python解释器时，可能不存在GIL锁或者GIL锁的实现方式不同。

## 3 深浅拷贝

在Python中，拷贝一个对象可以使用赋值、浅拷贝和深拷贝等方式。其中，浅拷贝和深拷贝是最常用的两种拷贝方式。

- **赋值**操作是最简单的一种拷贝方式，**只是将对象的引用复制给一个新的变量**，新变量和原对象指向**同一块内存地址**。因此，如果修改其中一个变量的值，另一个变量的值也会发生改变。
- **浅拷贝**是指**创建一个新对象**，其中**包含原对象中的所有元素**的副本。对于不可变类型（例如数字、字符串、元组等），浅拷贝会创建一个全新的对象。**对于可变类型**（例如列表、字典等），浅拷贝**只会拷贝对象的引用**，而不是对象本身。这意味着，如果修改浅拷贝后的对象中的可变类型元素，原对象中对应的元素也会发生改变。

浅拷贝可以使用Python内置的copy模块中的copy()函数实现。

- **深拷贝**是指**创建一个新对象**，其中**包含原对象中所有元素的完整拷贝**。无论元素是不可变类型还是可变类型，都会创建一个全新的对象。因此，修改深拷贝后的对象不会影响原对象。

深拷贝可以使用Python内置的copy模块中的deepcopy()函数实现。需要注意的是，深拷贝可能会比浅拷贝慢，因为需要创建完整的副本。此外，如果对象包含嵌套的对象，深拷贝可能会导致递归的拷贝过程，消耗更多的内存和计算资源。

```python
a = [1, 2, 3]
b = a
b.append(4)
print(a)  # 输出 [1, 2, 3, 4]
-----------------------------------------------
import copy

a = [1, [2, 3]]
b = copy.copy(a)
b[0] = 4
b[1].append(4)
print(a)  # 输出 [1, [2, 3, 4]]
-----------------------------------------------
import copy

a = [1, [2, 3]]
b = copy.deepcopy(a)
b[0] = 4
b[1].append(4)
print(a)  # 输出 [1, [2, 3]]
```

## 4 import导入模块

### 4.1 import搜索路径

在 Python 中，当你使用 `import` 语句导入一个模块时，Python 解释器会按照一定的规则去搜索该模块所在的位置。这些规则被称为 "import 搜索路径"，它们指定了 Python 解释器在哪些位置去查找你想要导入的模块。

默认情况下，Python 解释器将会按照以下顺序来搜索模块：

1. 当前目录（即包含当前程序文件的目录）；
2. 环境变量 `PYTHONPATH` 中指定的目录（如果已设置）；
3. 标准库安装路径中的默认目录；
4. Python 解释器内置的默认路径。

可以使用 `sys.path` 查看 Python 解释器当前的 import 搜索路径。例如，以下代码将输出 Python 解释器的 import 搜索路径：

```python
import sys
print(sys.path)
```

也可以通过添加自定义路径到搜索路径中来扩展它。例如，以下代码将添加 `/my/custom/path` 到 import 搜索路径：

```python
import sys
sys.path.append('/my/custom/path')
```

需要注意的是，不推荐修改 `sys.path` 中的默认路径，因为这可能会影响到其他 Python 模块的导入行为，导致一些不可预料的错误。因此，如果需要添加自定义路径，最好将其添加到环境变量 `PYTHONPATH` 中。

### 4.2 重新导入模块

在 Python 中，如果你在程序中**重新导入一个已经导入的模块**，Python 解释器**不会重新执行**该模块，而是**直接使用已经加载的模块**。这是因为 Python 的导入机制中，每个模块只会在第一次导入时被执行一次，之后的导入都只是返回已经加载的模块对象的引用。

然而，有时候我们可能希望在运行时强制重新加载某个模块，以便在调试、开发和测试等场景下更方便地修改和测试代码。在 Python 中，你可以使用 `importlib` 模块中的 `reload` 函数来重新导入一个已经导入的模块。

以下是一个例子，展示了如何使用 `importlib.reload` 函数重新导入模块：

```python
import my_module   # 第一次导入 my_module

# 在代码中修改 my_module 的内容

import importlib
importlib.reload(my_module)  # 重新导入 my_module
```

需要注意的是，重新导入模块可能会引入一些意想不到的问题，比如可能会打破模块之间的依赖关系，导致代码出现错误。因此，在实际开发中，应该谨慎使用重新导入模块功能，仅在必要的情况下使用。

## 5 面向对象编程

### 5.1 工厂模式

在 Python 中，工厂模式是一种常见的设计模式，它通过定义一个用于创建对象的接口，让子类来决定实例化哪个类。工厂模式可以隐藏对象的创建细节，使代码更加简洁和可维护。

下面是一个简单的示例，展示了如何使用工厂模式来创建不同类型的汽车对象：

```python
class Car:
    def drive(self):
        pass

class Sedan(Car):
    def drive(self):
        print("Driving a sedan")

class SUV(Car):
    def drive(self):
        print("Driving an SUV")

class CarFactory:
    def create_car(self, car_type):
        if car_type == 'sedan':
            return Sedan()
        elif car_type == 'suv':
            return SUV()
        else:
            raise ValueError(f'Invalid car type: {car_type}')

# 创建一个工厂对象
factory = CarFactory()

# 使用工厂对象创建不同类型的汽车
sedan = factory.create_car('sedan')
suv = factory.create_car('suv')

# 驾驶不同类型的汽车
sedan.drive()
suv.drive()
```

在上面的代码中，我们定义了一个 `Car` 基类和两个子类 `Sedan` 和 `SUV`，它们分别代表轿车和SUV。我们还定义了一个 `CarFactory` 类，该类具有一个 `create_car` 方法，根据传入的参数来创建不同类型的汽车对象。

通过这种方式，我们可以使用工厂对象来创建不同类型的汽车对象，而无需了解创建对象的具体细节，这使得代码更加灵活和可扩展。如果需要添加新的汽车类型，只需要修改工厂类的实现即可。

### 5.2 多继承

> 多继承允许一个类从多个父类中继承属性和方法。在多继承的情况下，一个类可以同时继承多个父类，并继承它们的属性和方法，从而实现更加灵活和复杂的类层次结构。

多继承的语法是在类定义时在括号内列出所有父类，例如：

```python
class Base1:
    def method1(self):
        print("Base1 method1")

class Base2:
    def method2(self):
        print("Base2 method2")

class MyClass(Base1, Base2):
    def method3(self):
        print("MyClass method3")

# 创建 MyClass 实例并调用方法
my_obj = MyClass()
my_obj.method1()   # 输出 "Base1 method1"
my_obj.method2()   # 输出 "Base2 method2"
my_obj.method3()   # 输出 "MyClass method3"
```

在上面的例子中，`MyClass` 继承了 `Base1` 和 `Base2` 两个父类，并分别继承了它们的方法。因此，`MyClass` 实例可以调用 `Base1` 和 `Base2` 类中的方法，以及它自己定义的方法。

需要注意的是，多继承也可能会导致一些问题，例如命名空间冲突和方法重载等。因此，在使用多继承时应该小心谨慎，避免出现不必要的问题。另外，如果可能，也应该尽量使用组合等其他方法来替代多继承。

### 5.3 实例方法、静态方法和类方法

- 实例方法（Instance Method）

实例方法是定义在类中的普通方法，它的第一个参数通常是 `self`，代表当前实例对象。实例方法可以通过实例对象调用，也可以通过类名调用，但是需要显式传入一个实例对象作为第一个参数。

```python
class MyClass:
    def instance_method(self, x):
        print(f"instance_method: self={self}, x={x}")

# 创建一个 MyClass 实例
my_obj = MyClass()

# 调用实例方法
my_obj.instance_method(1)  # 输出 "instance_method: self=<__main__.MyClass object at 0x7fa3a6f82b50>, x=1"

# 通过类名调用实例方法，需要显式传入一个实例对象
MyClass.instance_method(my_obj, 2)  # 输出 "instance_method: self=<__main__.MyClass object at 0x7fa3a6f82b50>, x=2"
```

- 静态方法（Static Method）

静态方法是定义在类中的特殊方法，它不需要访问类或实例的任何属性或方法，因此它没有 `self` 参数。静态方法可以通过类名调用，也可以通过实例对象调用，但是不需要传入任何参数。

```python
class MyClass:
    @staticmethod
    def static_method(x):
        print(f"static_method: x={x}")

# 调用静态方法
MyClass.static_method(1)  # 输出 "static_method: x=1"

# 通过实例对象调用静态方法
my_obj = MyClass()
my_obj.static_method(2)   # 输出 "static_method: x=2"
```

- 类方法（Class Method）

类方法是定义在类中的特殊方法，它的第一个参数通常是 `cls`，代表当前类对象。类方法可以通过类名调用，也可以通过实例对象调用，但是需要显式传入当前类对象作为第一个参数。

```python
class MyClass:
    cls_var = "class variable"

    @classmethod
    def class_method(cls, x):
        print(f"class_method: cls={cls}, x={x}, cls_var={cls.cls_var}")

# 调用类方法
MyClass.class_method(1)  # 输出 "class_method: cls=<class '__main__.MyClass'>, x=1, cls_var=class variable"

# 通过实例对象调用类方法，需要显式传入当前类对象
my_obj = MyClass()
my_obj.class_method(2)   # 输出 "class_method: cls=<class '__main__.MyClass'>, x=2, cls_var=class variable"
```

需要注意的是，不同类型的方法在使用时有不同的适用场景。实例方法通常用于访问和修改实例的属性和状态，静态方法通常用于与类或实例无关的操作，类方法通常用于访问和修改类级别的属性和状态。

### 5.4 property属性

在 Python 中，`property` 属性是一种特殊的属性，它允许我们使用类似于访问实例属性的方式来访问和修改类的属性，但实际上它是一个方法，它包含 getter、setter 和 deleter 方法。

在 Python 中使用 `property` 属性有两种方法：使用装饰器或使用类的方式定义。下面分别介绍这两种方法：

- 使用装饰器

使用装饰器的方式可以将一个普通的实例方法转换为一个 `property` 属性。在装饰器中使用 `@property` 修饰符将实例方法转换为属性的 getter 方法，然后可以使用 `@<property_name>.setter` 和 `@<property_name>.deleter` 修饰符来分别定义属性的 setter 和 deleter 方法。

```python
class MyClass:
    def __init__(self, x):
        self._x = x

    @property
    def x(self):
        print("getter method called")
        return self._x

    @x.setter
    def x(self, value):
        print("setter method called")
        self._x = value

    @x.deleter
    def x(self):
        print("deleter method called")
        del self._x

# 创建 MyClass 实例
my_obj = MyClass(10)

# 通过属性访问和修改 MyClass 实例的 x 属性
print(my_obj.x)    # 输出 "getter method called" 和 "10"
my_obj.x = 20      # 输出 "setter method called"
print(my_obj.x)    # 输出 "getter method called" 和 "20"
del my_obj.x       # 输出 "deleter method called"
```

- 使用类的方式定义

使用类的方式定义 `property` 属性需要在类中定义一个带有 getter、setter 和 deleter 方法的类方法，并使用 `property` 函数将它们封装成一个 `property` 属性。

```python
class MyClass:
    def __init__(self, x):
        self._x = x

    def get_x(self):
        print("getter method called")
        return self._x

    def set_x(self, value):
        print("setter method called")
        self._x = value

    def del_x(self):
        print("deleter method called")
        del self._x

    x = property(get_x, set_x, del_x)

# 创建 MyClass 实例
my_obj = MyClass(10)

# 通过属性访问和修改 MyClass 实例的 x 属性
print(my_obj.x)    # 输出 "getter method called" 和 "10"
my_obj.x = 20      # 输出 "setter method called"
print(my_obj.x)    # 输出 "getter method called" 和 "20"
del my_obj.x       # 输出 "deleter method called"
```

需要注意的是，`property` 属性在 Python 中经常用于隐藏对象的属性，控制属性的访问和修改。通过 `property` 属性，我们可以将对象的属性作为公共 API 暴露出来，而将属性的实际实现隐藏起来。同时，`property` 属性也可以用于根据对象的属性值动态计算其他属性的值。

### 5.5 魔法属性

在 Python 中，魔法属性（Magic Attributes），也称为特殊属性（Special Attributes），是指具有特殊用途的属性，其名称以双下划线（__）开头和结尾。这些属性不需要用户显式地定义，而是由 Python 解释器提供的特殊属性，用于控制类的行为和操作。

以下是常用的一些魔法属性：

- `__init__`: 类的构造函数，用于初始化对象。
- `__str__`: 用于将对象转换为字符串表示形式，可通过 `str()` 函数或 `print()` 函数调用。
- `__repr__`: 用于将对象转换为可打印的字符串表示形式，可通过 `repr()` 函数调用。
- `__len__`: 返回对象的长度，可通过 `len()` 函数调用。
- `__getitem__` 和 `__setitem__`: 用于访问对象中的元素，可以像访问列表或字典一样通过索引来访问。
- `__getattr__` 和 `__setattr__`: 用于访问对象中不存在的属性，可以在访问不存在的属性时触发自定义的操作，如返回默认值或抛出异常。
- `__call__`: 使对象可以像函数一样调用，可以在对象被调用时触发自定义的操作。

下面是一个示例，演示了如何使用常见的魔法属性：

```python
class MyClass:
    def __init__(self, name):
        self.name = name
        self.data = []

    def __str__(self):
        return f"{self.name}: {len(self.data)} items"

    def __repr__(self):
        return f"MyClass('{self.name}')"

    def __len__(self):
        return len(self.data)

    def __getitem__(self, index):
        return self.data[index]

    def __setitem__(self, index, value):
        self.data[index] = value

    def __getattr__(self, name):
        return f"{name} is not a valid attribute"

    def __setattr__(self, name, value):
        if name == "data":
            self.__dict__[name] = value
        else:
            self.__dict__[name.upper()] = value

    def __call__(self, *args, **kwargs):
        print(f"Calling {self.name} with args: {args} and kwargs: {kwargs}")


# 创建 MyClass 实例
my_obj = MyClass("My Object")

# 调用 __str__ 魔法属性
print(my_obj)  # 输出 "My Object: 0 items"

# 调用 __repr__ 魔法属性
print(repr(my_obj))  # 输出 "MyClass('My Object')"

# 调用 __len__ 魔法属性
print(len(my_obj))  # 输出 0

# 调用 __getitem__ 魔法属性
my_obj.data = ["item1", "item2", "item3"]
print(my_obj[1])  # 输出 "item2"

# 调用 __setitem__ 魔法属性
my_obj[1] = "new item"
print(my_obj.data)  # 输出 ["item1", "new item", "item3"]

# 调用 __getattr__ 魔法属性
print(my_obj.some_attr)  # 输出 "some_attr is not a valid attribute"

# 调用 __setattr__ 魔法属性
my_obj.my_attr = "my value"
print(my_obj.MY_ATTR)  # 输出 "my value"

# 调用 __call__ 魔法属性
my_obj(1, 2, 3, a="hello", b="world")  # 输出 "Calling My Object with args: (1, 2, 3) and kwargs: {'a': 'hello', 'b': 'world'}"
```

需要注意的是，魔法属性是一种高级的编程技巧，在设计和实现类时应该谨慎使用。虽然它们可以方便地控制对象的行为和操作，但滥用魔法属性可能会导致代码难以维护和理解。

### 5.6 上下文管理器

上下文管理器是 Python 中一个重要的概念，它用于控制资源的获取和释放，以确保代码在运行时能够正确地处理资源，避免出现资源泄漏和错误。在 Python 中，上下文管理器通常用于文件操作、数据库连接、网络通信等需要手动管理资源的场景。

Python 中的上下文管理器可以通过两种方式实现：使用 `with` 语句或实现 `__enter__` 和 `__exit__` 魔法方法。下面是一个使用 `with` 语句的示例，演示了如何使用上下文管理器处理文件：

```python
with open("myfile.txt", "r") as f:
    data = f.read()
    print(data)
```

在这个示例中，`open("myfile.txt", "r")` 返回的是一个上下文管理器对象，可以使用 `with` 语句进行管理。当 `with` 语句开始执行时，会调用上下文管理器的 `__enter__` 方法获取资源（这里是打开文件），并将其赋值给 `as` 关键字后的变量 `f`。然后执行 `with` 语句块中的代码，完成文件的读取操作。当 `with` 语句块结束时，会自动调用上下文管理器的 `__exit__` 方法释放资源（这里是关闭文件），确保资源被正确地处理。

另外，也可以自定义一个上下文管理器类，实现 `__enter__` 和 `__exit__` 方法来管理资源。下面是一个自定义上下文管理器类的示例，演示了如何使用上下文管理器处理数据库连接：

```python
import sqlite3

class DatabaseConnection:
    def __init__(self, db_name):
        self.db_name = db_name
        self.conn = None

    def __enter__(self):
        self.conn = sqlite3.connect(self.db_name)
        return self.conn

    def __exit__(self, exc_type, exc_val, exc_tb):
        if self.conn:
            self.conn.commit()
            self.conn.close()

with DatabaseConnection("mydb.sqlite") as conn:
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM mytable")
    data = cursor.fetchall()
    print(data)
```

在这个示例中，`DatabaseConnection` 类实现了上下文管理器的功能，它的 `__enter__` 方法打开了一个数据库连接并返回了连接对象，而 `__exit__` 方法在上下文管理器退出时关闭了连接并提交了事务。使用上下文管理器时，我们只需要实例化 `DatabaseConnection` 对象并使用 `with` 语句即可，`with` 语句块中的代码可以直接使用返回的连接对象进行数据库操作。当 `with` 语句块结束时，会自动调用上下文管理器的 `__exit__` 方法释放资源。

`contextmanager` 是 Python 标准库 `contextlib` 模块中的一个装饰器函数，它也可以用于将一个生成器函数转化为一个上下文管理器。

上下文管理器是一种在 Python 中管理资源的方法，它可以确保资源在使用后自动关闭和释放，避免出现资源泄漏和错误。使用上下文管理器，我们可以通过 `with` 语句创建一个上下文，然后在这个上下文中使用资源，并在上下文结束时自动关闭和释放资源。

`contextmanager` 装饰器可以帮助我们快速创建上下文管理器，它接收一个生成器函数作为参数，并返回一个上下文管理器，这个上下文管理器可以用于 `with` 语句中。

下面是一个使用 `contextmanager` 装饰器创建上下文管理器的示例代码：

```python
from contextlib import contextmanager

@contextmanager
def file_open(file_name):
    try:
        f = open(file_name, 'r')
        yield f
    finally:
        f.close()

with file_open('test.txt') as f:
    content = f.read()
    print(content)
```

在这个示例中，我们使用 `contextmanager` 装饰器将 `file_open` 函数转化为一个上下文管理器。在 `file_open` 函数中，我们打开了一个文件，并使用 `yield` 将文件对象返回。在 `finally` 语句块中，我们关闭了文件。

使用 `with` 语句创建上下文时，我们可以在 `with` 语句块中使用 `file_open` 函数打开文件，并在 `with` 语句块结束时自动关闭文件。这样，我们就避免了手动打开和关闭文件的繁琐操作，使代码更加简洁和易读。

总之，`contextmanager` 装饰器可以帮助我们快速创建上下文管理器，简化资源管理的代码。

## 6 闭包

在 Python 中，闭包（closure）是指内部函数可以访问外部函数作用域中的变量，并将其保存在内存中，即使外部函数已经执行完毕，内部函数仍然可以访问和修改这些变量。

闭包通常由两个函数组成：外部函数和内部函数。外部函数返回内部函数，内部函数使用外部函数的变量。在返回内部函数之前，外部函数通常会将一些变量保存在函数对象的 `__closure__` 属性中，这些变量就成为了闭包的“自由变量”。

下面是一个简单的闭包示例代码：

```python
def outer_func(x):
    def inner_func(y):
        return x + y
    return inner_func

add5 = outer_func(5)
add10 = outer_func(10)

print(add5(3))   # 输出 8
print(add10(3))  # 输出 13
```

在这个示例中，我们定义了一个 `outer_func` 函数，这个函数接收一个参数 `x`，并返回一个内部函数 `inner_func`。在 `inner_func` 中，我们使用了外部函数的变量 `x` 和传入的参数 `y`。

我们创建了两个闭包 `add5` 和 `add10`，它们分别保存了 `x=5` 和 `x=10`，并使用内部函数 `inner_func` 计算和。当我们调用 `add5(3)` 时，实际上是调用了内部函数 `inner_func`，并传入了参数 `y=3`，此时 `x=5`，因此返回值为 `8`。同理，当我们调用 `add10(3)` 时，返回值为 `13`。

闭包可以用于很多场景，例如：封装私有变量、实现装饰器、实现回调函数等等。闭包可以让代码更加灵活和模块化，也可以减少全局变量的使用，提高代码的可维护性。

- 封装私有变量

闭包可以用于封装私有变量。例如，我们可以定义一个计数器函数，每次调用这个函数都会返回一个递增的数字，但这个数字不希望被外部直接访问。可以使用闭包将计数器变量封装起来，只能通过调用计数器函数来获取递增的数字。

```python
def make_counter():
    count = 0
    def counter():
        nonlocal count
        count += 1
        return count
    return counter

counter1 = make_counter()
counter2 = make_counter()

print(counter1())  # 输出 1
print(counter1())  # 输出 2
print(counter2())  # 输出 1
print(counter2())  # 输出 2
```

在这个例子中，我们定义了一个 `make_counter` 函数，这个函数返回一个内部函数 `counter`，并保存了一个自由变量 `count`。每次调用 `counter` 函数时，`count` 会递增并返回递增后的值。

- 实现装饰器

闭包可以用于实现装饰器，装饰器是 Python 中非常常用的一种语法糖，可以用于在不修改被装饰函数代码的情况下增强函数的功能。

```python
def decorator(func):
    def wrapper(*args, **kwargs):
        print("Before the function is called.")
        result = func(*args, **kwargs)
        print("After the function is called.")
        return result
    return wrapper

@decorator
def add(x, y):
    return x + y

print(add(2, 3))  # 输出：
                  # Before the function is called.
                  # After the function is called.
                  # 5
```

在这个例子中，我们定义了一个装饰器函数 `decorator`，这个函数接收一个函数 `func` 作为参数，返回一个内部函数 `wrapper`。在 `wrapper` 函数中，我们可以在函数调用前后进行一些操作，例如打印日志、计时等。最后，我们返回 `func` 函数的返回值。

使用装饰器语法 `@decorator` 可以将被装饰函数 `add` 传递给装饰器函数 `decorator` 并返回增强后的函数。这样，在调用 `add` 函数时，实际上是调用了装饰器函数 `wrapper`。

- 实现回调函数

闭包可以用于实现回调函数，回调函数是指将一个函数作为参数传递给另一个函数，并在另一个函数执行完毕后调用该函数。例如，我们可以定义一个异步任务函数 `async_task`，这个函数接收一个回调函数作为参数，并在任务完成后调用该回调函数。

```python
def apply(func, x, y, callback):
    result = func(x, y)
    callback(result)

def add(x, y):
    return x + y

def make_callback():
    count = 0
    def inner(result):
        nonlocal count
        count += 1
        print(f'Callback has been called {count} time(s), result is: {result}')
    return inner

callback = make_callback()
apply(add, 2, 3, callback) # Callback has been called 1 time(s), result is: 5
apply(add, 4, 5, callback) # Callback has been called 2 time(s), result is: 9
```

在上述代码中，我们创建了一个make_callback函数，用于创建一个闭包函数inner。在内层函数inner中，我们使用了nonlocal关键字来访问外层函数的变量count，并在每次调用时将count加1，以便记录回调函数被调用的次数。最后，我们将闭包函数inner作为回调函数传递给apply函数，在apply函数中计算结果并将其传递给回调函数inner。

## 7 装饰器

装饰器是Python语言的一种特殊语法，它可以用来动态地修改函数或类的行为，而不需要对原始代码进行修改。简单来说，装饰器就是一个函数，它接受一个函数或类作为参数，然后返回一个新的函数或类，新的函数或类可以对原始函数或类进行增强或修改。

装饰器的语法非常简单，可以用`@`符号将其应用到函数或类上。例如，下面是一个简单的装饰器：

```python
def my_decorator(func):
    def wrapper():
        print("Something is happening before the function is called.")
        func()
        print("Something is happening after the function is called.")
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

say_hello()
```

在上面的例子中，`my_decorator`是一个装饰器函数，它接受一个函数作为参数，并返回一个新的函数`wrapper`。`wrapper`函数增强了原始函数，它在原始函数被调用前后打印一些日志信息。`@my_decorator`语法将`my_decorator`装饰器应用到`say_hello`函数上，相当于执行了`say_hello = my_decorator(say_hello)`，将`say_hello`函数替换为装饰后的函数。最后调用`say_hello()`函数，输出如下结果：

```
Something is happening before the function is called.
Hello!
Something is happening after the function is called.
```

装饰器非常灵活，可以用来实现很多功能，比如记录日志、验证权限、缓存数据等。装饰器可以嵌套使用，可以同时应用多个装饰器，可以接受参数等，具有很高的可扩展性和可复用性。

- 记录日志

当涉及到记录日志时，可以使用装饰器将函数的调用和返回结果打印到日志中。下面是一个简单的例子：

```python
import logging

logging.basicConfig(level=logging.INFO)

def log(func):
    def wrapper(*args, **kwargs):
        logging.info("calling %s with args %s, %s", func.__name__, args, kwargs)
        result = func(*args, **kwargs)
        logging.info("returning %s", result)
        return result
    return wrapper

@log
def add(a, b):
    return a + b

add(2, 3)
```

在上面的例子中，`log`是一个装饰器函数，它将原始函数增强了一些日志功能。`@log`语法将`log`装饰器应用到`add`函数上，使其增强了日志功能。当我们调用`add(2, 3)`时，将输出以下日志信息：

```
INFO:root:calling add with args (2, 3), {}
INFO:root:returning 5
```

- 验证权限

在需要验证权限的情况下，可以使用装饰器限制只有具有特定权限的用户才能访问某个函数。下面是一个简单的例子：

```python
def require_permission(permission):
    def decorator(func):
        def wrapper(*args, **kwargs):
            if permission in current_user.permissions:
                return func(*args, **kwargs)
            else:
                raise Exception("Permission denied")
        return wrapper
    return decorator

@require_permission("admin")
def delete_user(user_id):
    # delete user with user_id
    pass
```

在上面的例子中，`require_permission`是一个装饰器工厂函数，它接受一个权限参数，返回一个装饰器函数。`decorator`是一个装饰器函数，它接受一个函数作为参数，返回一个新的函数`wrapper`。`wrapper`函数检查当前用户是否具有指定的权限，如果有则调用原始函数，否则抛出异常。`@require_permission("admin")`语法将`require_permission`装饰器应用到`delete_user`函数上，使其只能被具有`admin`权限的用户访问。

- 缓存数据

以下是一个使用装饰器实现缓存数据的例子：

```python
import time

def cache(func):
    cached_results = {}
    def wrapper(*args):
        if args in cached_results:
            print(f"Using cached result for {args}")
            return cached_results[args]
        else:
            result = func(*args)
            cached_results[args] = result
            print(f"Caching result for {args}")
            return result
    return wrapper

@cache
def expensive_function(n):
    time.sleep(3) # Simulate an expensive operation
    return n ** 2

print(expensive_function(3)) # Output: Caching result for (3,) 9
print(expensive_function(3)) # Output: Using cached result for (3,) 9
print(expensive_function(4)) # Output: Caching result for (4,) 16
print(expensive_function(4)) # Output: Using cached result for (4,) 16
```

在这个例子中，我们定义了一个装饰器`cache`，它接受一个函数`func`作为参数。在装饰器内部，我们定义了一个内部函数`wrapper`，它接受任意数量的参数`*args`。在`wrapper`函数中，我们首先检查缓存中是否有与传入的参数`args`匹配的结果。如果有，则直接返回缓存的结果。否则，我们调用被装饰的函数`func`来计算结果，并将其缓存起来。

**类装饰器**

类装饰器是指以类的形式实现的装饰器，它可以用来包装函数或类，类似于函数装饰器，但具有更强的灵活性和可重用性。

类装饰器实际上就是一个类，该类必须实现 `__call__` 方法，因为它需要像函数装饰器一样被调用。在类装饰器中，装饰器函数通常定义在 `__init__` 方法中，而被装饰的函数或类则作为参数传递给 `__call__` 方法。在 `__call__` 方法中，可以对传入的函数或类进行修改或包装。

下面是一个简单的例子，演示了如何使用类装饰器来包装函数：

```python
class Logger:
    def __init__(self, func):
        self.func = func
    
    def __call__(self, *args, **kwargs):
        print(f"Calling function {self.func.__name__}")
        return self.func(*args, **kwargs)

@Logger
def my_function():
    print("Hello, world!")

my_function()
```

在上面的例子中，`Logger` 类接收一个函数作为参数，并将其存储在 `self.func` 属性中。`__call__` 方法接收任意数量的参数，并在调用函数之前打印一条日志。然后，它使用 `self.func(*args, **kwargs)` 调用被装饰的函数。

在 `my_function()` 上应用 `@Logger` 装饰器后，每次调用该函数时都会打印一条日志。这个例子展示了如何使用类装饰器来包装函数，并为其添加日志记录功能。

**wraps**

`wraps` 是 Python 中的一个装饰器函数，它可以用于创建一个新的装饰器，用来修饰其他函数或类。`wraps` 可以帮助我们保留被修饰函数的元信息，比如函数名、文档字符串、参数列表等。

在 Python 中，当我们用一个装饰器来修饰一个函数时，实际上是将被修饰函数作为参数传递给装饰器函数，而装饰器函数会返回一个新的函数对象，替换掉原有的函数对象。这样一来，原有函数的元信息就会丢失，比如函数名、文档字符串、参数列表等。

使用 `wraps` 装饰器可以解决这个问题，它可以用于包装函数，保留原有函数的元信息。

下面是一个示例代码，演示如何使用 `wraps` 装饰器：

```python
from functools import wraps

def my_decorator(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print("Before the function is called.")
        result = func(*args, **kwargs)
        print("After the function is called.")
        return result
    return wrapper

@my_decorator
def my_function():
    """A simple function."""
    print("Hello, world!")

print(my_function.__name__)
print(my_function.__doc__)
```

在上面的代码中，我们定义了一个简单的装饰器 `my_decorator`，它可以打印函数被调用前后的信息。为了保留原有函数的元信息，我们使用了 `wraps` 装饰器，将原有函数的元信息复制到新函数中。

当我们将 `my_decorator` 装饰器应用到 `my_function` 函数上时，`my_function` 的元信息得以保留，可以通过 `__name__` 和 `__doc__` 属性访问原有函数的名称和文档字符串。

使用 `wraps` 装饰器可以使装饰器更加灵活和可重用，同时也可以帮助我们避免一些常见的错误。

**同时被多个装饰器装饰**

在Python中，可以将多个装饰器应用于一个函数或方法，这意味着在调用函数或方法之前将以与它们在代码中出现的顺序相反的顺序应用这些装饰器。例如：

```python
@decorator1
@decorator2
def my_function():
    # function code here
    pass
```

在这个例子中，`my_function`被装饰器`decorator1`和`decorator2`装饰。当调用`my_function`时，`decorator2`将首先被应用，然后是`decorator1`。

在这种情况下，每个装饰器将对函数进行修改或包装，以添加一些特殊的行为或功能。每个装饰器都可以通过将函数传递给下一个装饰器来进行链式调用，直到所有装饰器都被应用于函数。
