# Python数据分析学习笔记

Abstract：本文是根据作者日常学习Python数据分析相关知识所作的笔记，主要目的是为了方便备查及复习。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-04-11 19:41 —— 2022-04-23 13:30

--------------------------

- [1 数据分析概述](#1-数据分析概述)
  - [1.1 基本概念](#11-基本概念)
  - [1.2 指标体系](#12-指标体系)
- [2 常用第三方库](#2-常用第三方库)
  - [2.1 Matplotlib](#21-matplotlib)
  - [2.2 NumPy](#22-numpy)
  - [2.3 Pandas](#23-pandas)

--------------------------

## 1 数据分析概述

### 1.1 基本概念

数据分析是一种科学的研究方法，通过对收集的数据进行分析和解释，以揭示数据中蕴含的有用信息和规律性的结构。它是一个广泛的领域，包括数据的收集、处理、可视化和解释等多个方面。数据分析的目的是在基于数据的推理和决策中提供支持，从而促进理解和改进各种现象和过程。

数据分析方法通常包括探索性数据分析、描述性统计分析、推断性统计分析和预测分析等。**探索性数据分析**通过可视化和汇总数据的方式，提供一种直观的方法来了解数据集的属性和结构。**描述性统计分析**涉及对数据的汇总和归纳，以便快速了解数据的特征。**推断性统计分析**则是基于概率模型和统计推断，对数据进行更深入的探索和解释。预测分析则是通过数据建模和模拟，以预测未来可能发生的事件和趋势。

数据分析的应用领域非常广泛，包括商业、金融、医疗、社会科学、工程、环境科学等等。在这些领域中，数据分析被广泛应用于市场营销、风险管理、医学诊断、社会调查、生产优化等方面。

### 1.2 指标体系

数据分析指标体系是数据分析中的重要组成部分，用于度量和评估一个系统或应用的性能、效率和效果。常见的数据分析指标包括以下几种：

- DAU（Daily Active Users，日活跃用户数）：指在一定时间内（通常是一天），使用应用或访问网站的独立用户数。

$$
DAU = \frac{活跃用户数}{时间段}
$$

- MAU（Monthly Active Users，月活跃用户数）：指在一个月内，使用应用或访问网站的独立用户数。

$$
MAU = \frac{活跃用户数}{时间段}
$$

- PV（Page Views，页面浏览量）：指在一定时间内，网站或应用的页面被访问的总次数。

$$
PV = \sum_{i=1}^{n} 页面浏览量_i
$$

- UV（Unique Visitors，独立访客数）：指在一定时间内，访问网站或应用的独立用户数量，同一用户多次访问只算一次。

$$
UV = \sum_{i=1}^{n} 独立访客数_i
$$

- Conversion Rate（转化率）：指在一个时间段内，完成目标行为（如购买、注册、下载等）的用户数量与访问网站或应用的总用户数量之比。

$$
Conversion\ Rate = \frac{目标行为完成的用户数量}{访问网站或应用的总用户数量}
$$

- Bounce Rate（跳出率）：指在访问网站或应用的过程中，仅浏览一个页面或访问时间极短的用户数量与访问网站或应用的总用户数量之比。

$$
Bounce\ Rate = \frac{仅浏览一个页面或访问时间极短的用户数量}{访问网站或应用的总用户数量}
$$

- Retention Rate（留存率）：指在一段时间内，仍然使用应用或访问网站的用户数量与总用户数量之比。

$$
Retention\ Rate = \frac{在指定时间段内仍然使用应用或访问网站的用户数量}{总用户数量}
$$

- ARPU（Average Revenue Per User，每用户平均收入）：指在一定时间内，平均每个用户带来的收入。

$$
ARPU = \frac{总收入}{活跃用户数}
$$

- Churn Rate（流失率）：指在一定时间内停止使用应用或访问网站的用户数量与总用户数量之比。

$$
Churn\ Rate=\frac{Number\ of\ Users\ Lost}{Total\ Number\ of\ Users}
$$

- Average Session Duration（平均会话时长）：指用户在应用或网站上的平均停留时间。

$$
Average\ Session\ Duration=\frac{Total\ Session\ Duration}{Number\ of\ Sessions}
$$

- Stickiness（粘性）：指在一定时间内，用户访问应用或网站的频率。

$$
Stickiness=\frac{Number\ of\ Sessions}{Number\ of\ Active\ Users}
$$

- Cost per Acquisition（每个获取成本）：指获取一个新用户所需的平均成本。


$$
Cost\ per\ Acquisition=\frac{Total\ Cost\ of\ Acquisition}{Number\ of\ New\ Customers\ Acquired}
$$

- Customer Lifetime Value（客户生命周期价值）：指每个客户在其使用期间为企业带来的预期收益。

$$
Customer\ Lifetime\ Value=\sum_{i=1}^n(\frac{Profit_i}{1+r})^t
$$

- Net Promoter Score（净推荐值）：指客户对企业产品或服务的推荐程度，用于衡量客户忠诚度。

$$
Net\ Promoter\ Score=\frac{Number\ of\ Promoters-Number\ of\ Detractors}{Total\ Number\ of\ Respondents}\times 100
$$

- Click-Through Rate（点击率）：指用户在广告、邮件或推送通知等中点击链接的比率。

$$
Click-Through\ Rate=\frac{Number\ of\ Clicks\ on\ Ad}{Number\ of\ Impressions}\times 100
$$

- Cost per Click（每次点击成本）：指每次点击广告所需的平均成本。

$$
Cost\ per\ Click=\frac{Total\ Cost\ of\ Clicks}{Number\ of\ Clicks}
$$

## 2 常用第三方库

### 2.1 Matplotlib

**Matplotlib**是一个Python的绘图库，用于创建各种静态，动态，交互式图形，包括线图、散点图、条形图、等高线图、热力图、3D图等等。该库提供了广泛的自定义选项和扩展能力，使其成为科学计算和数据可视化领域中最受欢迎的绘图库之一。

Matplotlib的基本架构由三个层级组成：前端层，绘图层和后端层。前端层提供了用户接口，绘图层负责处理数据和生成绘图，后端层处理实际图形设备的输出。

Matplotlib的使用方式很灵活，可以直接在Python脚本中使用，也可以在Jupyter Notebook或IPython Shell中使用。Matplotlib还提供了大量的例子和文档，帮助用户快速入门并深入了解绘图库的各种特性。

**Matplotlib官方文档：**https://matplotlib.org/stable/tutorials/index.html

**折线图代码示例**

```python
import matplotlib.pyplot as plt

# 设置 x, y 值
x = [1, 2, 3, 4, 5]
y = [2, 4, 6, 8, 10]

# 创建图形对象
fig, ax = plt.subplots()

# 绘制折线图
ax.plot(x, y)

# 设置图形标题和轴标签
ax.set_title('Line Plot Example')
ax.set_xlabel('X-Axis')
ax.set_ylabel('Y-Axis')

# 显示图形
plt.show()
```

这个示例代码首先设置了 x, y 值，然后创建了一个图形对象，接着使用 `ax.plot()` 函数绘制了折线图，最后通过 `ax.set_title()`、`ax.set_xlabel()` 和 `ax.set_ylabel()` 设置了图形的标题和轴标签。最后调用 `plt.show()` 函数显示图形。

**设置图片大小和保存的代码示例**

```python
import matplotlib.pyplot as plt

# 设置 x, y 值
x = [1, 2, 3, 4, 5]
y = [2, 4, 6, 8, 10]

# 创建图形对象
fig, ax = plt.subplots(figsize=(8, 6)) # 设置图片大小为 8 x 6

# 绘制折线图
ax.plot(x, y)

# 设置图形标题和轴标签
ax.set_title('Line Plot Example')
ax.set_xlabel('X-Axis')
ax.set_ylabel('Y-Axis')

# 保存图形到文件
plt.savefig('line_plot.png', dpi=300) # 保存为 png 格式，分辨率为 300 dpi

# 显示图形
plt.show()
```

这个示例代码与前面的示例代码基本相同，不同的是在创建图形对象时添加了 `figsize=(8, 6)` 参数，以设置图形的大小为 8 x 6。另外，示例代码还添加了 `plt.savefig()` 函数，用于将图形保存为文件。在保存图形时，可以指定保存的文件名和分辨率。

**绘制x轴和y轴刻度的代码示例**

```python
import matplotlib.pyplot as plt

# 设置 x, y 值
x = [1, 2, 3, 4, 5]
y = [2, 4, 6, 8, 10]

# 创建图形对象
fig, ax = plt.subplots()

# 绘制折线图
ax.plot(x, y)

# 设置 x 轴和 y 轴刻度
ax.set_xticks([1, 2, 3, 4, 5]) # 设置 x 轴刻度
ax.set_yticks([0, 2, 4, 6, 8, 10]) # 设置 y 轴刻度

# 设置图形标题和轴标签
ax.set_title('Line Plot Example')
ax.set_xlabel('X-Axis')
ax.set_ylabel('Y-Axis')

# 显示图形
plt.show()
```

这个示例代码与前面的示例代码基本相同，不同的是添加了 `ax.set_xticks()` 和 `ax.set_yticks()` 函数，分别用于设置 x 轴和 y 轴的刻度。这里设置 x 轴刻度为 [1, 2, 3, 4, 5]，y 轴刻度为 [0, 2, 4, 6, 8, 10]。设置刻度后，可以更直观地看到 x 轴和 y 轴的取值范围。

**设置显示中文的代码示例**

```python
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

# 设置字体文件的路径和名称
font_path = '/path/to/simhei.ttf'  # 字体文件的路径
font_name = fm.FontProperties(fname=font_path).get_name()  # 字体名称

# 将字体名称设置为默认字体
plt.rcParams['font.family'] = font_name

# 设置 x, y 值
x = [1, 2, 3, 4, 5]
y = [2, 4, 6, 8, 10]

# 创建图形对象和子图对象
fig, ax = plt.subplots()

# 绘制折线图
ax.plot(x, y)

# 设置图形标题和轴标签
ax.set_title('线性关系示例')
ax.set_xlabel('横坐标')
ax.set_ylabel('纵坐标')

# 显示图形
plt.show()
```

在这个示例代码中，我们首先设置字体文件的路径和名称，然后通过 `fm.FontProperties` 函数获取字体名称。接着，将字体名称设置为默认字体，使用 `plt.rcParams['font.family']` 将字体名称设置为默认字体。

最后，我们创建图形对象和子图对象，使用 `ax.set_title()` 和 `ax.set_xlabel()`、`ax.set_ylabel()` 函数设置图形标题和轴标签。因为我们已经将字体名称设置为默认字体，所以这里的标题和标签会使用中文显示。

需要注意的是，在设置字体名称和路径时，需要使用本机上已经安装的字体文件。如果没有对应的字体文件，可以先下载字体文件，然后将字体文件路径设置为 `font_path` 变量的值。

**一图多个坐标系子图的代码示例**

```python
import matplotlib.pyplot as plt
import numpy as np

# 生成数据
x = np.linspace(0, 10, 100)
y1 = np.sin(x)
y2 = np.cos(x)
y3 = np.tan(x)

# 创建图形对象和子图对象
fig, (ax1, ax2, ax3) = plt.subplots(nrows=1, ncols=3, figsize=(12, 4))

# 在子图 ax1 上绘制 sin 曲线
ax1.plot(x, y1)
ax1.set_title('Sin')

# 在子图 ax2 上绘制 cos 曲线
ax2.plot(x, y2)
ax2.set_title('Cos')

# 在子图 ax3 上绘制 tan 曲线
ax3.plot(x, y3)
ax3.set_title('Tan')

# 显示图形
plt.show()
```

在这个示例代码中，我们首先生成了三组数据，然后使用 `plt.subplots()` 函数创建包含三个子图的图形对象。`nrows=1` 和 `ncols=3` 参数指定了子图的排列方式，即一行三列。

接着，我们分别在三个子图对象 `ax1`、`ax2`、`ax3` 上绘制了 sin、cos 和 tan 曲线，并设置了各自的标题。

最后，使用 `plt.show()` 函数显示图形。由于我们将三个子图对象保存在一个元组 `(ax1, ax2, ax3)` 中，因此可以使用类似元组解包的方式，分别将三个子图对象赋值给 `ax1`、`ax2`、`ax3` 变量。

**散点图代码示例**

在 Matplotlib 中，可以使用 `plt.scatter()` 函数绘制散点图。下面是一个简单的示例代码，演示了如何绘制一个简单的散点图：

```python
import matplotlib.pyplot as plt
import numpy as np

# 生成数据
x = np.random.rand(50)
y = np.random.rand(50)

# 绘制散点图
plt.scatter(x, y)

# 设置图形标题和轴标签
plt.title('散点图示例')
plt.xlabel('X 轴')
plt.ylabel('Y 轴')

# 显示图形
plt.show()
```

在这个示例代码中，我们首先使用 `np.random.rand()` 函数生成了两组随机数据，然后使用 `plt.scatter()` 函数绘制了散点图。`plt.scatter(x, y)` 中的 `x` 和 `y` 分别是横坐标和纵坐标的数据。接着，我们使用 `plt.title()`、`plt.xlabel()`、`plt.ylabel()` 函数设置了图形标题和轴标签。最后，使用 `plt.show()` 函数显示图形。

**条形图代码示例**

在 Matplotlib 中，可以使用 `plt.bar()` 函数绘制条形图。下面是一个简单的示例代码，演示了如何绘制一个简单的条形图：

```python
import matplotlib.pyplot as plt
import numpy as np

# 生成数据
labels = ['A', 'B', 'C', 'D', 'E']
values = [5, 7, 3, 9, 11]

# 绘制条形图
plt.bar(labels, values)

# 设置图形标题和轴标签
plt.title('条形图示例')
plt.xlabel('类别')
plt.ylabel('数量')

# 显示图形
plt.show()
```

在这个示例代码中，我们首先定义了两个列表 `labels` 和 `values`，分别存储条形图的类别和数量数据。然后使用 `plt.bar()` 函数绘制了条形图。`plt.bar(labels, values)` 中的 `labels` 和 `values` 分别是条形图的类别和数量数据。接着，我们使用 `plt.title()`、`plt.xlabel()`、`plt.ylabel()` 函数设置了图形标题和轴标签。最后，使用 `plt.show()` 函数显示图形。

**直方图代码示例**

在 Matplotlib 中，可以使用 `plt.hist()` 函数绘制直方图。下面是一个简单的示例代码，演示了如何绘制一个简单的直方图：

```
pythonCopy codeimport matplotlib.pyplot as plt
import numpy as np

# 生成随机数据
data = np.random.randn(1000)

# 绘制直方图
plt.hist(data, bins=30, edgecolor='black')

# 设置图形标题和轴标签
plt.title('直方图示例')
plt.xlabel('数据范围')
plt.ylabel('数据出现次数')

# 显示图形
plt.show()
```

在这个示例代码中，我们首先使用 `np.random.randn()` 函数生成了一组随机数据，然后使用 `plt.hist()` 函数绘制了直方图。`plt.hist(data, bins=30, edgecolor='black')` 中的 `data` 是数据，`bins=30` 指定了直方图的条数，`edgecolor='black'` 指定了直方图的边框颜色。接着，我们使用 `plt.title()`、`plt.xlabel()`、`plt.ylabel()` 函数设置了图形标题和轴标签。最后，使用 `plt.show()` 函数显示图形。

**饼状图代码示例**

在 Matplotlib 中，可以使用 `plt.pie()` 函数绘制饼状图。下面是一个简单的示例代码，演示了如何绘制一个简单的饼状图：

```python
import matplotlib.pyplot as plt

# 定义饼状图的类别和数据
labels = ['A', 'B', 'C', 'D', 'E']
sizes = [15, 30, 25, 10, 20]

# 绘制饼状图
plt.pie(sizes, labels=labels)

# 设置图形标题
plt.title('饼状图示例')

# 显示图形
plt.show()
```

在这个示例代码中，我们首先定义了两个列表 `labels` 和 `sizes`，分别存储饼状图的类别和数据。然后使用 `plt.pie()` 函数绘制了饼状图。`plt.pie(sizes, labels=labels)` 中的 `sizes` 是数据，`labels=labels` 指定了每个类别的标签。接着，我们使用 `plt.title()` 函数设置了图形标题。最后，使用 `plt.show()` 函数显示图形。

### 2.2 NumPy

NumPy是Python的一个开源数学库，它为Python提供了高性能的多维数组和矩阵计算功能，以及用于处理数组的各种数学函数和工具。NumPy不仅能够高效地处理数值运算，还可以进行数组和矩阵运算、随机数生成、线性代数计算、傅里叶变换、数值积分和优化等各种数学计算。

以下是NumPy的主要特点：

- 强大的数组对象：NumPy的核心是 ndarray（N-dimensional array object）对象，它是一种高效、灵活的多维数组，可以支持任意维度的元素操作和计算。
- 简单、灵活、高效的数组操作：NumPy提供了丰富的数组操作函数和方法，可以高效地对数组进行重构、切片、拼接、分裂、翻转、排序、查找、统计、计算等各种操作。
- 数学函数库：NumPy提供了一组强大的数学函数库，包括线性代数、傅里叶变换、随机数生成、积分计算等，可以满足科学计算和数据分析的各种需求。
- 兼容性：NumPy兼容其他科学计算和数据分析库，例如pandas、SciPy等，可以与它们无缝衔接，构建完整的数据处理和分析工具链。
- 开源自由：NumPy是开源的，使用和修改都非常方便，而且拥有庞大的社区支持。

**NumPy官方文档：**https://numpy.org/doc/stable/user/index.html

**NumPy的`ndarray`对象**

- 创建一维数组。以下是使用NumPy创建一维数组的示例代码：

```python
import numpy as np

# 创建一维数组
a = np.array([1, 2, 3, 4, 5])
print(a)
```

在这个示例代码中，我们首先导入了NumPy库，并使用 `np.array()` 函数创建了一个一维数组 `a`。在函数的参数中，我们传入了一个Python列表 `[1, 2, 3, 4, 5]`，该列表中的元素就是数组 `a` 的各个元素。然后使用 `print()` 函数输出了数组 `a`。

- 创建多维数组。以下是使用NumPy创建多维数组的示例代码：

```python
import numpy as np

# 创建二维数组
b = np.array([[1, 2, 3], [4, 5, 6]])
print(b)

# 创建三维数组
c = np.array([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])
print(c)
```

- `ndarray`对象的常用属性

  - `ndarray.ndim`: 数组的维数（即数组轴的个数），也称为数组的秩。

  - `ndarray.shape`: 数组的维度。返回一个元组，表示每个维度上的数组大小。例如，一个n行m列的数组，其`shape`属性将返回元组`(n, m)`。

  - `ndarray.size`: 数组中的元素总数，等于各个维度大小的乘积。

  - `ndarray.dtype`: 描述数组中元素类型的对象，可以使用标准Python类型或NumPy提供的类型（例如`numpy.int32`、`numpy.int16`和`numpy.float64`等）。

  - `ndarray.itemsize`: 数组中每个元素的字节大小。例如，一个元素类型为`float64`的数组，它的`itemsize`属性就是8（即8个字节）。

  - `ndarray.data`: 包含数组实际元素的缓冲区。通常，我们不需要使用该属性，因为我们将使用索引访问数组中的元素。

这些属性在创建、修改、操作和处理数组时都非常有用，特别是在处理大量数据时。通过这些属性，我们可以了解数组的大小、形状、元素类型、占用内存等各种信息，从而更好地管理和优化我们的代码。

- 调整数组的形状

以下是使用NumPy调整数组形状的示例代码：

```python
import numpy as np

# 创建一个一维数组
a = np.array([1, 2, 3, 4, 5, 6])
print("一维数组 a 的形状：", a.shape)

# 将一维数组转换为二维数组
b = a.reshape((2, 3))
print("二维数组 b 的形状：", b.shape)
print(b)

# 将二维数组展开成一维数组
c = b.ravel()
print("一维数组 c 的形状：", c.shape)
print(c)

# 使用resize()函数改变数组形状
d = np.array([[1, 2], [3, 4], [5, 6]])
print("二维数组 d 的形状：", d.shape)
e = np.resize(d, (2, 4))
print("改变形状后的二维数组 e：\n", e)
```

在这个示例代码中，我们首先创建了一个一维数组`a`，输出其形状，然后使用`reshape()`函数将其转换为一个二维数组`b`，输出其形状和元素，再使用`ravel()`函数将其展开成一维数组`c`，输出其形状和元素。最后，我们使用`resize()`函数将一个二维数组`d`的形状改变成`(2, 4)`，并输出其结果`e`。

运行这段代码，输出结果为：

```lua
一维数组 a 的形状： (6,)
二维数组 b 的形状： (2, 3)
[[1 2 3]
 [4 5 6]]
一维数组 c 的形状： (6,)
[1 2 3 4 5 6]
二维数组 d 的形状： (3, 2)
改变形状后的二维数组 e：
 [[1 2 3 4]
 [5 6 1 2]]
```

可以看到，我们通过`reshape()`函数将一维数组转换为了二维数组，通过`ravel()`函数又将其展开成一维数组。另外，我们还使用`resize()`函数改变了二维数组的形状。在使用NumPy时，我们可以灵活地改变数组的形状，以适应不同的数据处理需求。

- 将数组转为list

在NumPy中，可以通过tolist()函数将NumPy数组转换为Python列表。下面是一个示例代码：

```python
import numpy as np

# 创建一个NumPy数组
arr = np.array([1, 2, 3, 4, 5])

# 将NumPy数组转换为Python列表
arr_list = arr.tolist()

# 输出转换后的Python列表
print(arr_list)
```

在上面的示例代码中，我们首先创建了一个NumPy数组`arr`，然后使用tolist()函数将其转换为Python列表，并将转换后的列表存储在变量`arr_list`中。最后，我们输出`arr_list`，即可看到NumPy数组被成功转换为了Python列表。

需要注意的是，将大型的NumPy数组转换为Python列表可能会占用较多内存，因此在实际应用中应谨慎使用。

**NumPy的数据类型**

NumPy的数据类型可以通过`dtype`属性进行访问或修改。常用的NumPy数据类型如下：

- bool：布尔类型，True或False
- int：整型，通常为int64或int32
- float：浮点型，通常为float64或float32
- complex：复数类型，由两个浮点型数组成
- object：对象类型，可以是任意Python对象
- string_：字符串类型，用于存储固定长度的字符串
- unicode_：Unicode字符串类型，用于存储固定长度的Unicode字符串

下面是一个示例代码，演示如何创建不同类型的NumPy数组：

```python
import numpy as np

# 创建一个布尔类型的数组
arr_bool = np.array([True, False, True])
print(arr_bool.dtype)

# 创建一个整型数组
arr_int = np.array([1, 2, 3, 4, 5])
print(arr_int.dtype)

# 创建一个浮点型数组
arr_float = np.array([1.0, 2.0, 3.0, 4.0, 5.0])
print(arr_float.dtype)

# 创建一个复数类型的数组
arr_complex = np.array([1+2j, 3+4j, 5+6j])
print(arr_complex.dtype)

# 创建一个对象类型的数组
arr_obj = np.array([{'a': 1, 'b': 2}, {'a': 3, 'b': 4}])
print(arr_obj.dtype)

# 创建一个字符串类型的数组
arr_str = np.array(['foo', 'bar', 'baz'])
print(arr_str.dtype)

# 创建一个Unicode字符串类型的数组
arr_unicode = np.array(['中文', 'English'])
print(arr_unicode.dtype)
```

在上面的示例代码中，我们分别创建了不同类型的NumPy数组，并通过`dtype`属性输出了每个数组的数据类型。需要注意的是，不同类型的NumPy数组占用的内存空间可能不同，因此在选择数据类型时应根据实际情况进行选择。

**数组的计算**

- 数组间的运算

NumPy数组支持各种数学运算，例如加法、减法、乘法、除法等。下面是一些示例代码，演示如何对NumPy数组进行计算：

```python
import numpy as np

# 创建两个数组
arr1 = np.array([1, 2, 3, 4])
arr2 = np.array([5, 6, 7, 8])

# 数组加法
arr_sum = arr1 + arr2
print(arr_sum)

# 数组减法
arr_diff = arr2 - arr1
print(arr_diff)

# 数组乘法
arr_prod = arr1 * arr2
print(arr_prod)

# 数组除法
arr_quot = arr2 / arr1
print(arr_quot)

# 数组求幂
arr_pow = arr1 ** 2
print(arr_pow)

# 数组求余数
arr_mod = arr2 % arr1
print(arr_mod)

# 数组求正弦值
arr_sin = np.sin(arr1)
print(arr_sin)
```

在上面的示例代码中，我们首先创建了两个NumPy数组`arr1`和`arr2`，然后分别对它们进行加法、减法、乘法、除法、幂运算、求余数和求正弦值等运算，并输出了结果。需要注意的是，对于大型数组的计算，应尽可能使用NumPy的向量化操作，以提高运算速度。

- 数组中的轴

在NumPy中，轴（axis）是指数组的某个维度，例如对于一个二维数组，它有两个轴，分别是横轴和纵轴。下面是一些示例代码，演示如何在NumPy数组中使用轴：

```python
import numpy as np

# 创建一个二维数组
arr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

# 对所有元素求和，得到一个标量
sum_all = np.sum(arr)
print(sum_all)

# 沿着横轴求和，得到一个一维数组
sum_axis0 = np.sum(arr, axis=0)
print(sum_axis0)

# 沿着纵轴求和，得到一个一维数组
sum_axis1 = np.sum(arr, axis=1)
print(sum_axis1)

# 沿着横轴计算平均值，得到一个一维数组
mean_axis0 = np.mean(arr, axis=0)
print(mean_axis0)

# 沿着纵轴计算平均值，得到一个一维数组
mean_axis1 = np.mean(arr, axis=1)
print(mean_axis1)
```

在上面的示例代码中，我们首先创建了一个二维数组`arr`，然后对它进行了一些操作。首先我们对数组所有元素求和，得到一个标量`sum_all`；然后沿着横轴和纵轴分别对数组元素求和，得到一维数组`sum_axis0`和`sum_axis1`；最后沿着横轴和纵轴分别计算数组元素的平均值，得到一维数组`mean_axis0`和`mean_axis1`。需要注意的是，沿着某个轴进行计算时，该轴上的元素会被压缩成一个维度更低的数组，例如在上面的示例中，对于二维数组`arr`，沿着横轴求和时会得到一个一维数组，而沿着纵轴求和时也会得到一个一维数组。

**数组的添加、删除和去重**

- 数组的添加。NumPy提供了三个函数可以用于在数组中添加元素：

  - `np.append(arr, values, axis=None)`: 在数组`arr`的末尾添加`values`元素，并返回一个新的数组。

  - `np.concatenate((arr1, arr2, ...), axis=0)`: 沿着指定的轴拼接数组。

  - `np.insert(arr, obj, values, axis=None)`: 在数组`arr`的指定位置`obj`插入`values`元素，并返回一个新的数组。

以下是示例代码：

```python
import numpy as np

# np.append()示例
arr1 = np.array([1, 2, 3])
arr2 = np.append(arr1, [4, 5, 6])
print(arr2)  # [1 2 3 4 5 6]

# np.concatenate()示例
arr3 = np.array([[1, 2], [3, 4]])
arr4 = np.array([[5, 6]])
arr5 = np.concatenate((arr3, arr4), axis=0)
print(arr5)  # [[1 2]
             #  [3 4]
             #  [5 6]]

# np.insert()示例
arr6 = np.array([1, 2, 3])
arr7 = np.insert(arr6, 1, [4, 5])
print(arr7)  # [1 4 5 2 3]
```

- 数组的删除。NumPy提供了两个函数可以用于删除数组中的元素：

  - `np.delete(arr, obj, axis=None)`: 删除数组`arr`的指定位置`obj`的元素，并返回一个新的数组。

  - `np.unique(arr, return_index=False, return_inverse=False, return_counts=False, axis=None)`: 返回数组中的唯一元素，并按照出现的顺序进行排序。

以下是示例代码：

```python
import numpy as np

# np.delete()示例
arr1 = np.array([1, 2, 3, 4, 5])
arr2 = np.delete(arr1, 1)
print(arr2)  # [1 3 4 5]

# np.unique()示例
arr3 = np.array([1, 2, 3, 1, 2, 4, 5])
arr4 = np.unique(arr3)
print(arr4)  # [1 2 3 4 5]
```

- 数组的去重。在NumPy中，数组的去重操作可以通过np.unique()函数实现，它可以去掉数组中的重复元素并返回新的数组。np.unique()函数有三个主要参数：

  - arr：要操作的数组

  - return_index：如果为True，返回新列表元素在原列表中的位置下标

  - return_inverse：如果为True，返回原列表元素在新列表中的位置下标

示例代码如下：

```python
import numpy as np

arr = np.array([1, 2, 2, 3, 3, 3, 4, 4, 5, 6, 6])

unique_arr = np.unique(arr)

print(unique_arr) # [1 2 3 4 5 6]
```

除了使用np.unique()函数进行数组去重之外，还可以使用np.setdiff1d()和np.intersect1d()函数实现对数组的去重操作。

np.setdiff1d()函数可以返回第一个数组中存在，但是在第二个数组中不存在的元素，即差集。

示例代码如下：

```python
import numpy as np

arr1 = np.array([1, 2, 3, 4, 5, 6])
arr2 = np.array([4, 5, 6, 7, 8, 9])

diff_arr = np.setdiff1d(arr1, arr2)

print(diff_arr) # [1 2 3]
```

np.intersect1d()函数可以返回两个数组中共同存在的元素，即交集。

示例代码如下：

```python
import numpy as np

arr1 = np.array([1, 2, 3, 4, 5, 6])
arr2 = np.array([4, 5, 6, 7, 8, 9])

intersect_arr = np.intersect1d(arr1, arr2)

print(intersect_arr) # [4 5 6]
```

**数组的分割**

在NumPy中，可以使用np.split()函数将一个数组分割成多个子数组，或者将多个数组合并成一个数组。np.split()函数的用法如下：

```python
numpy.split(ary, indices_or_sections, axis=0)
```

其中，参数ary表示要分割的数组，indices_or_sections可以是一个整数，表示将数组平均分成几个子数组，也可以是一个列表，表示以哪些索引位置分割数组，axis表示在哪个轴上进行分割，默认为0轴。

示例代码如下：

```python
import numpy as np

arr = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

arr1, arr2, arr3 = np.split(arr, [3, 7])

print(arr1)  # [1 2 3]
print(arr2)  # [4 5 6 7]
print(arr3)  # [ 8  9 10]
```

上面的代码将原数组分成了3个子数组，分割点分别为3和7，得到了3个子数组arr1、arr2和arr3。

除了np.split()函数，NumPy还提供了一些其他的数组分割函数，如np.hsplit()和np.vsplit()函数可以将数组水平和垂直方向上分割为多个子数组，np.array_split()函数可以将数组在不同的轴上分割为不同大小的子数组。

**数组中的nan和inf**

在NumPy中，nan和inf是特殊的浮点数，它们分别表示“Not a Number”和“正无穷”、“负无穷”。当进行某些计算时，可能会出现这些特殊的浮点数，它们在一些情况下可以作为合法的结果返回，但在其他情况下可能会导致错误的结果。

nan可以通过np.nan来表示，它通常出现在无法确定结果的情况下，例如0/0、np.log(0)等操作。与任何其他数字相比，nan都不相等，包括它自己。在对包含nan的数组进行计算时，结果通常是nan，除非使用特殊的函数对nan进行处理。

inf和-inf表示正无穷和负无穷，可以通过np.inf和-np.inf来表示。当对正数除以0或对负数除以0时，会得到np.inf和-np.inf。inf与任何大于0的数相乘或除以结果仍为inf，与任何小于0的数相乘或除以结果为-inf，与0相乘结果为nan。inf同样在计算中可能会出现错误的结果，因此在使用时需要注意。

示例代码如下：

```python
import numpy as np

# 创建含有nan和inf的数组
arr = np.array([1, 2, np.nan, np.inf, -np.inf])

# 判断数组中是否包含nan和inf
print(np.isnan(arr))   # [False False True False False]
print(np.isinf(arr))   # [False False False  True  True]

# 替换数组中的nan和inf
arr[np.isnan(arr)] = 0
arr[np.isinf(arr)] = 1

print(arr)   # [ 1.  2.  0.  1.  1.]
```

**二维数组的转置**

在NumPy中，可以使用数组对象的T属性来对二维数组进行转置操作。转置操作会将数组的行和列交换，因此原来的行变为转置后的列，原来的列变为转置后的行。

示例代码如下：

```python
import numpy as np

# 创建一个2x3的二维数组
arr = np.array([[1, 2, 3], [4, 5, 6]])

# 输出原数组
print(arr)

# 对数组进行转置操作
transposed_arr = arr.T

# 输出转置后的数组
print(transposed_arr)
```

输出结果：

```lua
[[1 2 3]
 [4 5 6]]
[[1 4]
 [2 5]
 [3 6]]
```

在上述示例中，首先创建了一个2x3的二维数组，并使用print函数输出了该数组。接着，使用数组对象的T属性对数组进行转置操作，并将转置后的结果存储在transposed_arr变量中。最后，使用print函数输出了转置后的数组。

需要注意的是，数组的转置是一种视图操作，不会改变原数组本身，而是返回一个新的数组。如果想要直接修改原数组，可以使用数组对象的transpose方法，或者直接对数组进行赋值操作。例如，可以使用下面的代码将原数组进行转置并直接赋值给自身：

```python
arr = arr.transpose()
```

或者：

```python
arr[:] = arr.T
```

**numpy读取数据**

NumPy提供了多种读取数据的函数，其中最常用的是loadtxt函数和genfromtxt函数。

loadtxt函数可以读取文本文件中的数据，并返回一个数组。它的基本用法如下：

```python
import numpy as np

data = np.loadtxt('filename.txt')
```

其中，'filename.txt'是待读取的文本文件名，data是读取到的数据数组。loadtxt函数默认使用空格作为分隔符，并且会自动识别每一行的数据类型。

如果待读取的文本文件中包含有缺失数据或非法数据，loadtxt函数可能会报错。为了避免这种情况，可以使用genfromtxt函数。

genfromtxt函数和loadtxt函数类似，可以读取文本文件中的数据，并返回一个数组。**与loadtxt函数不同的是，genfromtxt函数可以处理包含缺失数据或非法数据的文件，还可以自定义数据类型等参数。**它的基本用法如下：

```python
import numpy as np

data = np.genfromtxt('filename.txt', delimiter=',', dtype=float, missing_values='NaN', filling_values=0.0)
```

其中，'filename.txt'是待读取的文本文件名，delimiter参数指定分隔符，dtype参数指定数据类型，missing_values参数指定缺失数据的标识符，filling_values参数指定用来替代缺失数据的值。

除了loadtxt函数和genfromtxt函数之外，NumPy还提供了多种读取其他格式数据的函数，如load函数、fromfile函数、frombuffer函数等，可以根据具体需求选择使用。

### 2.3 Pandas

Pandas是Python中一个开源的数据分析库，它提供了高效的数据操作工具和数据结构，可以用于数据清洗、数据转换、数据分析、数据可视化等方面的工作。Pandas的两个主要数据结构是Series和DataFrame。

**Pandas官方文档：**https://pandas.pydata.org/docs/

Series是一种一维的数据结构，类似于数组或列表，其中的每个元素都有一个标签（index），可以用于快速访问数据。

DataFrame是一种二维的数据结构，类似于电子表格或SQL表格，由多个Series组成，每个Series代表一列数据。DataFrame可以处理结构化、半结构化和非结构化的数据。

Pandas提供了丰富的数据操作和处理方法，包括数据选择、过滤、分组、聚合、合并、重塑、填充、插值、缺失值处理、日期处理等。

下面是一些Pandas的基本操作示例：

```python
import pandas as pd

# 创建Series
s = pd.Series([1, 2, 3, 4, 5], index=['a', 'b', 'c', 'd', 'e'])
print(s)

# 创建DataFrame
data = {'name': ['Alice', 'Bob', 'Charlie', 'David'], 'age': [25, 30, 35, 40]}
df = pd.DataFrame(data)
print(df)

# 选择数据
print(s['b'])
print(df['name'])
print(df.loc[1:2, ['name', 'age']])

# 过滤数据
print(df[df['age'] > 30])

# 分组聚合
grouped = df.groupby('age')
print(grouped.mean())

# 合并数据
data1 = {'name': ['Alice', 'Bob'], 'age': [25, 30]}
data2 = {'name': ['Charlie', 'David'], 'age': [35, 40]}
df1 = pd.DataFrame(data1)
df2 = pd.DataFrame(data2)
merged = pd.concat([df1, df2])
print(merged)

# 填充缺失值
df = pd.DataFrame({'A': [1, 2, None, 4], 'B': [5, None, 7, 8]})
print(df.fillna(method='ffill'))

# 插值
df = pd.DataFrame({'A': [1, 2, 3, 4], 'B': [5, 6, 7, None]})
print(df.interpolate())

# 日期处理
df = pd.DataFrame({'date': pd.date_range('2022-01-01', periods=3), 'value': [1, 2, 3]})
print(df)
```

**Pandas的索引操作**

在Pandas中，索引操作是非常重要的一部分，因为它可以让我们方便地获取、修改和删除数据。

Pandas提供了两种类型的索引操作：

- 利用标签进行索引：可以使用标签或标签范围选择数据。例如，使用.loc方法或.iloc方法（后者是基于整数位置的索引），可以访问DataFrame或Series对象中的元素。这两个方法的参数可以是单个标签，标签列表或切片。
- 利用位置进行索引：可以使用位置或位置范围选择数据。例如，使用.iloc方法，可以使用整数索引访问DataFrame或Series对象中的元素。这种方法的参数可以是单个整数，整数列表或切片。

下面是一些常见的索引操作示例：

```python
import pandas as pd

# 创建一个DataFrame
df = pd.DataFrame({
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Emily'],
    'age': [25, 30, 35, 40, 45],
    'city': ['New York', 'Paris', 'London', 'Tokyo', 'Sydney']
})

# 使用标签进行索引
print(df.loc[0])  # 选择第一行
print(df.loc[[0, 2]])  # 选择第一行和第三行
print(df.loc[1:3, 'name':'age'])  # 选择第二行到第四行和第一列到第三列

# 使用位置进行索引
print(df.iloc[0])  # 选择第一行
print(df.iloc[[0, 2]])  # 选择第一行和第三行
print(df.iloc[1:3, 0:2])  # 选择第二行到第四行和第一列到第三列
```

输出：

```lua
name        Alice
age            25
city     New York
Name: 0, dtype: object
       name  age     city
0     Alice   25  New York
2   Charlie   35   London
       name  age
1       Bob   30
2   Charlie   35
3     David   40
       name        Alice
age            25
city     New York
Name: 0, dtype: object
       name  age     city
0     Alice   25  New York
2   Charlie   35   London
       name  age
1       Bob   30
2   Charlie   35
```

**Pandas的对齐操作**

在 Pandas 中，对齐操作是指通过索引和列名来对齐两个数据集。当两个数据集进行运算时，如果它们的索引和列名不一致，Pandas 会自动进行对齐操作，将它们对齐后再进行运算。

例如，给定两个 Series：

```python
import pandas as pd

s1 = pd.Series([1, 2, 3], index=['a', 'b', 'c'])
s2 = pd.Series([4, 5, 6], index=['b', 'c', 'd'])
```

它们的索引不完全相同。如果要将这两个 Series 相加，则可以直接相加：

```lua
s3 = s1 + s2
```

得到的结果如下：

```lua
a    NaN
b    6.0
c    8.0
d    NaN
dtype: float64
```

可以看到，Pandas 在相加时自动对齐了两个 Series，将它们的索引对齐后再进行加法运算。对于没有对应的索引的值，Pandas 会用 NaN（Not a Number）来填充。

类似地，对于 DataFrame 的对齐操作，Pandas 会同时对齐行索引和列索引。例如：

```python
import numpy as np

df1 = pd.DataFrame(np.random.randn(3, 2), columns=['A', 'B'])
df2 = pd.DataFrame(np.random.randn(2, 3), columns=['B', 'C', 'D'])
```

两个 DataFrame 的列名不完全相同，行数也不一致。如果要将这两个 DataFrame 相加，则可以直接相加：

```lua
df3 = df1 + df2
```

得到的结果如下：

```lua
          A         B         C   D
0 -0.459740  0.486874 -1.764863 NaN
1 -0.377821  0.308109  1.131165 NaN
2  0.276932 -0.224009 -0.595954 NaN
```

可以看到，Pandas 在相加时自动对齐了两个 DataFrame，将它们的行索引和列索引对齐后再进行加法运算。对于没有对应的行或列的值，Pandas 会用 NaN 来填充。

需要注意的是，对齐操作只在二元运算时才会进行。如果想要对两个数据集进行拼接、合并等操作，需要使用 join、concat 等方法。

**Pandas的函数应用**

在 Pandas 中，我们可以使用函数将一个数据集中的某些值进行更改、替换、计算等操作。Pandas 的函数应用有三种常见方式：使用 NumPy 函数、使用 Pandas 的函数、使用自定义函数。

- 使用 NumPy 函数

可以使用 NumPy 中的许多通用函数（universal functions）对 Pandas 对象进行操作。这些函数会自动适用于整个 Pandas 对象，而不需要像在 NumPy 中一样进行显式循环。以下是一些常见的 NumPy 函数在 Pandas 中的使用示例：

```python
import pandas as pd
import numpy as np

# 创建一个 DataFrame
df = pd.DataFrame(np.random.randn(4,3), columns=['a', 'b', 'c'])

# 使用 np.abs() 函数对 df 中的所有元素取绝对值
abs_df = np.abs(df)

# 使用 np.exp() 函数对 df 中的所有元素进行指数运算
exp_df = np.exp(df)
```

- 使用 Pandas 的函数

Pandas 提供了一些常用的函数，可以在 Pandas 对象上进行操作。以下是一些常见的 Pandas 函数在 Pandas 中的使用示例：

```python
import pandas as pd
import numpy as np

# 创建一个 Series
s = pd.Series(np.random.randn(5))

# 使用 pd.isnull() 函数检查 s 中的元素是否为缺失值
null_s = pd.isnull(s)

# 使用 pd.cut() 函数将 s 中的值划分为两个区间
cut_s = pd.cut(s, 2)
```

- 使用自定义函数

除了使用 NumPy 和 Pandas 的函数，我们还可以自定义函数对 Pandas 对象进行操作。使用 Pandas 的 apply() 函数可以将自定义函数应用于 Pandas 对象的每一行或每一列。以下是使用自定义函数的示例：

```python
import pandas as pd
import numpy as np

# 创建一个 DataFrame
df = pd.DataFrame(np.random.randn(4,3), columns=['a', 'b', 'c'])

# 定义一个自定义函数，计算每个元素的平方
def square(x):
    return x ** 2

# 使用 apply() 函数将自定义函数应用于 df 的每一行
square_df_row = df.apply(square, axis=1)

# 使用 apply() 函数将自定义函数应用于 df 的每一列
square_df_col = df.apply(square, axis=0)
```

在使用自定义函数时，需要注意函数的输入和输出。apply() 函数默认将每一行或每一列作为输入传递给自定义函数，因此自定义函数的输入是一个一维数组。输出的格式也需要注意，通常需要输出一个 Pandas 对象（如 Series 或 DataFrame）。

**Pandas的层级索引**

Pandas中的层级索引（MultiIndex）是一种用于在单个轴上拥有多个（两个或多个）索引级别的方法。这种索引方式在数据处理和分析中非常有用，因为它可以帮助我们处理复杂的数据结构。

在Pandas中，我们可以使用多种方式创建层级索引。其中一种方式是通过将一个由元组组成的列表传递给pandas.MultiIndex()函数来创建一个多级索引。例如：

```python
import pandas as pd

# 创建一个二级索引
index = pd.MultiIndex.from_tuples([('a', 1), ('a', 2), ('b', 1), ('b', 2)])

# 创建一个包含随机数据的Series
data = pd.Series([0.25, 0.5, 0.75, 1.0], index=index)

# 显示Series
print(data)
```

这段代码将创建一个由4个元素组成的Series对象，其中每个元素都具有二级索引。输出结果如下：

```lua
a  1    0.25
   2    0.50
b  1    0.75
   2    1.00
dtype: float64
```

在这个Series中，每个元素都由两个索引级别组成：一个用于标识字母（a或b），另一个用于标识数字（1或2）。我们可以使用这些索引级别来选择、操作和汇总数据。

例如，我们可以使用.loc[]方法根据索引选择数据。例如，要选择索引为('a', 1)的元素，我们可以使用以下代码：

```python
print(data.loc[('a', 1)])
```

输出结果为：

```lua
0.25
```

我们也可以使用.loc[]方法选择整个索引层。例如，要选择所有字母为'a'的元素，我们可以使用以下代码：

```python
print(data.loc['a'])
```

输出结果为：

```lua
1    0.25
2    0.50
dtype: float64
```

此外，层级索引还可以用于Pandas的分组、透视表、重塑等操作，使得数据分析更加高效和灵活。

**Pandas的缺失值处理**

在pandas中，缺失值用NaN表示。pandas提供了很多方法来处理缺失值。

1. 检测缺失值：使用`isna()`或`isnull()`方法来检测缺失值。这两个方法的作用是一样的，都会返回一个布尔型的DataFrame或Series。
2. 填充缺失值：使用`fillna()`方法可以用指定的值或方法来填充缺失值。常用的方法包括用前面的值填充（`ffill`）和用后面的值填充（`bfill`）。
3. 删除缺失值：使用`dropna()`方法可以删除缺失值所在的行或列。可以使用`how`参数来指定删除行还是列，使用`thresh`参数来指定非缺失值的最小数量。

下面是一些示例代码：

```python
import pandas as pd
import numpy as np

# 创建包含缺失值的DataFrame
df = pd.DataFrame({'A': [1, 2, np.nan, 4],
                   'B': [5, np.nan, np.nan, 8],
                   'C': [9, 10, 11, 12]})
print(df)

# 检测缺失值
print(df.isna())
print(df.isnull())

# 填充缺失值
print(df.fillna(0))  # 用0填充缺失值
print(df.fillna(method='ffill'))  # 用前面的值填充
print(df.fillna(method='bfill'))  # 用后面的值填充

# 删除缺失值
print(df.dropna())  # 删除包含缺失值的行
print(df.dropna(axis=1))  # 删除包含缺失值的列
print(df.dropna(thresh=2))  # 至少需要2个非缺失值才保留行
```

**Pandas的重复值处理**

下面是一些常用的 pandas 处理重复值的方法：

- 检测重复值：使用 `duplicated()` 方法可以检测 DataFrame 中的重复值。该方法返回一个布尔型的 Series，其中重复值为 True，非重复值为 False。可以通过传递列名参数来指定基于哪些列进行重复值的检测，默认检测所有列。

```python
import pandas as pd

# 创建一个包含重复值的 DataFrame
df = pd.DataFrame({'A': [1, 2, 3, 4, 2],
                   'B': [4, 5, 6, 7, 8],
                   'C': [7, 8, 9, 10, 11]})

# 检测重复值
duplicates = df.duplicated()
print(duplicates)
```

- 删除重复值：使用 `drop_duplicates()` 方法可以删除 DataFrame 中的重复值。该方法默认基于所有列进行重复值的检测，可以通过传递列名参数来指定基于哪些列进行检测。可以选择保留第一个出现的重复值，或者保留最后一个出现的重复值，也可以删除所有重复值。

```python
import pandas as pd

# 创建一个包含重复值的 DataFrame
df = pd.DataFrame({'A': [1, 2, 3, 4, 2],
                   'B': [4, 5, 6, 7, 8],
                   'C': [7, 8, 9, 10, 11]})

# 删除重复值
df = df.drop_duplicates()
print(df)
```

- 替换重复值：使用 `replace()` 方法可以将 DataFrame 中的重复值替换为指定的值。可以通过传递 `inplace=True` 参数来在原地进行替换，或者将结果赋值给一个新的 DataFrame。

```python
import pandas as pd

# 创建一个包含重复值的 DataFrame
df = pd.DataFrame({'A': [1, 2, 3, 4, 2],
                   'B': [4, 5, 6, 7, 8],
                   'C': [7, 8, 9, 10, 11]})

# 将重复值替换为 -1
df.replace(2, -1, inplace=True)
print(df)
```

**Pandas的数据连接**

数据连接是将多个数据集合并为一个数据集的操作，pandas 提供了多种方法来进行数据连接，包括以下几种常用的方式：

- `concat()` 函数：`concat()` 函数可以将两个或多个 DataFrame 沿着指定的轴（如行轴或列轴）进行连接。可以通过传递 `axis` 参数来指定连接的轴，默认为 0 行轴。可以通过传递 `keys` 参数来给连接后的数据集添加层次化的索引，便于标识来源。

```python
import pandas as pd

# 创建两个 DataFrame
df1 = pd.DataFrame({'A': [1, 2, 3],
                    'B': [4, 5, 6]})

df2 = pd.DataFrame({'A': [7, 8, 9],
                    'B': [10, 11, 12]})

# 使用 concat() 进行连接
result = pd.concat([df1, df2], axis=0)  # 沿着行轴进行连接
print(result)
```

- `merge()` 函数：`merge()` 函数可以基于一个或多个共同的列将两个 DataFrame 进行连接，类似于 SQL 中的 join 操作。可以通过传递 `on` 参数来指定连接的列，也可以根据多个列进行连接。还可以通过 `how` 参数来指定连接方式（如内连接、左连接、右连接、全外连接等）。

```python
import pandas as pd

# 创建两个 DataFrame
df1 = pd.DataFrame({'A': [1, 2, 3],
                    'B': [4, 5, 6],
                    'key': ['X', 'Y', 'Z']})

df2 = pd.DataFrame({'C': [7, 8, 9],
                    'D': [10, 11, 12],
                    'key': ['X', 'Y', 'W']})

# 使用 merge() 进行连接
result = pd.merge(df1, df2, on='key')  # 基于 'key' 列进行连接
print(result)
```

- `join()` 方法：`join()` 方法是 DataFrame 对象的方法，可以将两个 DataFrame 进行连接。可以通过传递 `on` 参数来指定连接的列，也可以根据多个列进行连接。还可以通过 `how` 参数来指定连接方式。

```python
import pandas as pd

# 创建两个 DataFrame
df1 = pd.DataFrame({'A': [1, 2, 3],
                    'B': [4, 5, 6],
                    'key': ['X', 'Y', 'Z']})

df2 = pd.DataFrame({'C': [7, 8, 9],
                    'D': [10, 11, 12],
                    'key': ['X', 'Y', 'W']})

# 使用 join() 进行连接
result = df1.join(df2.set_index('key'), on='key')  # 基于 'key' 列进行连接
print(result)
```
