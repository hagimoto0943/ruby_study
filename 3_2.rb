# ufo演算子

foo = 303904
bar = 2

comp = foo <=> bar

if comp == -1
    p "foo is smaller than bar"
elsif comp == 0
    p "foo is equal to bar"
else
    p "foo is bigger than bar"
end

# 別の書き方

if foo == bar
  p "foo is equal to bar"
elsif foo > bar
  p "foo is bigger than bar"
else
  p "foo is smaller than bar"
end

# 自己代入演算子

a = 100
a += 1
p a

b = 100
b-=1
p b

c = 100
c *= 2
p c 

d = 100
d **= 2
p d
# *2は2乗の意味



# メソッドの定義

def foo a,b
  a + b
end

puts foo(1,2)