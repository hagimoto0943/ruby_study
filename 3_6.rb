## 配列
v1 = %w(a b c)
# => ["a", "b", "c"]

v1.join()
# => "abc"

v1.join(" ")
# => "a b c"

v1.join("_")
# => "a_b_c"

a = Array.new(3)
# => [nil, nil, nil]

Array.new(2){|index| index + 10}
# => [10, 11]

#　第二引数には、配列の要素を初期化するための値を指定できます。
#  第二引数で指定した初期値オブジェクトは、すべて同一のオブジェクトIDを持つ同一オブジェクトです。


a = Array.new(3, "foo")
# => ["foo", "foo", "foo"]: foo[0]とfoo[1]とfoo[2]は同じオブジェクトIDを持つ
a[0].replace("bar")　# a[0]だけでなく、a[1]とa[2]も変更される
p a # => ["bar", "bar", "bar"]


# replaceで全て置き換わらないように、以下のようにする
a = Array.new(3){"foo"}
a[0].replace("bar")
p a # => ["bar", "foo", "foo"]

# サイズを超えた要素への代入
v1 = [10] # => [10]
v1.length # => 1
v1[3] = 20 # サイズを超えて代入できる
v1.length # => 4
v1[2] # => nil
v1[100] 

# インデックスに負の数を指定
v1 = [10, 20, 30, 40, 50]
p v1[-1] # => 50
p v1[5-1] # => 50
p v1[-4] # => 40
p v1[5-4] # => 40

# 要素数の指定
a = [1,2,3,4]
p a[1,2] # => [2,3]
p a[1,3] # => [2,3,4]

# 要素数を指定した代入
a = [1,2,3,4]
a[1,2] = 'a'
p a # => [1, "a", 4]
# 要素数を指定したうえで、代入すると、その部分が指定された値に置き換わります。

a = [1,2,3,4]
a[1,2] = 'a', 'b', 'c'
p a # => [1, "a", "b", "c", 4]

# 多重代入と可変長引数

# 多重代入
a,b,c = 1,2,3
p a # => 1
p b # => 2
p c # => 3

# 帰り値に複数の値を返すメソッド
def foo 
  return 1,2,3
end

a,b,c = foo

p a # => 1
p b # => 2
p c # => 3

# 配列による多重代入

a,b,c = [1,2,3]

(a,b),c = [1,2],3

a = 1,2
p a # => [1,2]

# 最後の変数に配列で代入
a, *b = 1,2,3,4
p a # => 1
p b # => [2,3,4]

def foo a, *b
  b
end

foo(1,2,3,4,5) # => [2,3,4,5]

# 引数展開
def foo1 a, *b
  foo2(*b)
end

def foo2 c,*d
  d
end

foo1(1,2,3,4,5) # => [3,4,5]

# foo1の実行によって、foo2が呼び出される際に、*bが展開されて、foo2(3,4,5)となります。

# 配列の演算
a = [1,1,2,2]
b = [2,2,3,3]

a & b # => [2]
a | b # => [1,2,3]
a - b # => [1,1]
a + b # => [1,1,2,2,2,2,3,3]
b - a # => [3,3]

a= [1,1,2,2]
c= [1]
a-c # => [2,2]

# 配列の足し算と引き算は、配列の要素を操作する演算です。足し算は、配列の要素を追加し、引き算は、配列の要素を削除します。

[1,2] * 3 # => [1,2,1,2,1,2]
# 配列の要素を繰り返し出力する場合は、*演算子を使います。

[1,2,3] * ',' # => "1,2,3"
[1,2,3].join(',') # => "1,2,3"
# joinメソッドを使って、配列の要素を連結することができます。これは、*演算子と同じように、配列の要素を繰り返し出力することができます。

# for式
a= [2,3,4]
for i in a do 
  p i
end # 2から4まで順に出力

# 識別子を複数指定
for i,j in [[1,2],[3,4],[5,6]] do
  p i
  p j
end # 1,2,3,4,5,6

# for式はスコープが作成されないので、内部で初期化した変数は、その後のコードからも参照可能です。

for i in [2,3,4]
  bar = i
end

p bar # => 4
[2,3,4].each do 
  bar = i
end # => NameError: undefined local variable or method `i' for main:Object
# for式は、eachメソッドを使って、次のように書き換えることができます。しかし、each文はスコープを作成するので、each内の変数を呼び出すと、NameErrorの例外が発生します。

# ハッシュ引数

# 配列と同様に、ハッシュでも特殊な引数指定が用意されているので、確認しましょう。
# 実引数の最後にハッシュを指定する場合は、その両側の波括弧{}を省略することができます。
# 波括弧{}を省略した呼び出し
def foo a,b,c
  c
end

foo(1,2,:foo1 => 1, :foo2 => 2) # => {:foo1=>1, :foo2=>2}
#波括弧を省略せずに呼び出す
foo(1,2,{:foo1 => 1, :foo2 => 2}) # => {:foo1=>1, :foo2=>2}

# この文法は、最後の引数のみ有効となる点に注意してください。
# それ以外の引数では区切りが曖昧となるので、波括弧をしっかりと指定しましょう。
