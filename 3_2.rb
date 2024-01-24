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

