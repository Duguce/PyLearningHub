# Python数据分析学习笔记

Abstract：本文是根据作者日常学习Python数据分析相关知识所作的笔记，主要目的是为了方便备查及复习。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-04-11 19:41 —— 2022-04-11 20:26



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

