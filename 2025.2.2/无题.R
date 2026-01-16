getwd()
setwd("D:/R/exercise/2025.2.2")

example(mean)
x

library(sos)
findFn("mean")

10000*(1+0.03)^10

# (1) 计算10年后本息总和
principal <- 10000  # 初始存款金额
annual_rate <- 0.03  # 年利率
years <- 10  # 存款年数

# 计算10年后的本息总和
total_amount_10_years <- principal * (1 + annual_rate) ^ years

# 输出结果
cat("10年后本息总和为:", total_amount_10_years, "元\n")

# (2) 计算需要存多少年才能增值到20000元
target_amount <- 20000  # 目标金额

# 使用对数公式计算所需年数
years_to_double <- log(target_amount / principal) / log(1 + annual_rate)

# 输出结果
cat("需要存", years_to_double, "年才能增值到20000元\n")

# 智者的判断准确率
p1 <- 0.99
# 愚者的判断准确率
p2 <- 0.01

# 计算智者做1000次独立判断至少犯一次错误的概率
# 使用反向概率，即至少犯一次错误 = 1 - 全部正确
prob_at_least_one_error <- 1 - (p1 ^ 1000)

# 计算愚者做1000次独立判断至少对一次的概率
# 使用反向概率，即至少对一次 = 1 - 全部错误
prob_at_least_one_correct <- 1 - ((1 - p2) ^ 1000)

# 输出结果
cat("智者做1000次独立判断至少犯一次错误的概率为:", prob_at_least_one_error, "\n")
cat("愚者做1000次独立判断至少对一次的概率为:", prob_at_least_one_correct, "\n")

exp(1)

# 计算e的值
e_value <- exp(1)

# 使用format函数显示小数点后18位
formatted_e_value <- format(e_value, digits = 20, scientific = FALSE)

# 输出结果
cat("e的小数点后18位为:", formatted_e_value, "\n")

pi

# 自由度
df <- 10

# 显著性水平
alpha <- 0.05

# 计算双侧临界值
critical_value_left <- qt(alpha / 2, df)
critical_value_right <- qt(1 - alpha / 2, df)

# 输出结果
cat("双侧临界值为:", critical_value_left, "和", critical_value_right, "\n")

cat("log10(2)=", log10(2), "log10(5)=", log10(5), "\n")

sink("01.txt", split = T)
print(sin(pi/6))
print(cos(pi/3))
cat("log10(2)=", log10(2), "log10(5)=", log10(5), "\n")
sink()

x1 <- c(1:10)
sqrt(x1)

# 某人存入 10000 元 1 年期定期存款，年利率 3%, 约定到期自动转存（包
# 括利息）。列出 1、2、……、10 年后的本息金额。

a <- c(1:10)
b <- 10000*(1+0.03)^a
b

# 显示 2 的 1,2,……, 20 次方。
c <- c(1:20)
d <- 2^c
d

# 定义 x1 为 1 到 10 的向量，定义 x2 为 x1 的 3 倍，然后退出 R，再次
# 启动 R，查看 x1 和 x2 的值。
x1 <- c(1:10)
x2 <- x1*3
q()
n

x1
x2

curve(x^2, 2, -2)
curve(sin(x), 0, 2*pi)
abline(h = 0)

