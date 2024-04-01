# ハッシュ
a = {"apple" => 130, "strawberry" => 180, "orange" => 100}
a["apple"] # => 130
a["melon"] = 600
p a # => {"apple"=>130, "strawberry"=>180, "orange"=>100, "melon"=>600}
# ハッシュは、キーと値をセットで保存するデータ構造です。ハッシュは、キーと値を=>で区切って保存します。ハッシュは、{}で囲んで表現します。
# ハッシュはシンボルをキーにすることが多いです。シンボルをキーにすると、ハッシュの記述が簡潔になります。

# 存在しないキーの指定
a = {}
a[:foo1]# => nil
# キーには任意のオブジェクトを指定できます。
# rubyインタプリタは添字演算子で指定されたキーから、ハッシュが保持する各キーに対して次の項目を確認します。

## 両者のメソッドの結果が等しいかどうか
## eql?メソッドで比較した結果が真となるか

# よって、独自のインスタンスをキーに指定する場合は、上記のメソッドを適切に実装する必要があります。
# なお、文字列をキーとする場合は、シンボルを使用した方が良い場合が多いです。
# シンボルは文字列に比べて比較処理が高速で、コードも読みやすくなるからです。また、
# Ruby1.9からはキーにシンボルを用いたハッシュは、「=>」の代わりに「:」を使って記述できるようになりました。

# キーにシンボルを用いたハッシュ
a = {:foo => 100, :bar => 200}
# コロンを用いた書き方
a= {foo: 100, bar: 200}
a[:foo] # => 100

# Ruby1.9以降の新しいハッシュリテラル記法を用いるとキーはシンボルで定義されます。
# 文字列のキーを使用したい場合は従来通りのハッシュリテラル記法を使う必要があります。
# また、キー名が:if等の予約語の場合や、:"foo_bar"等のダブル区オートで囲まないとシンボルの定義ができないような文字列を使用する場合も同様に従来通りのハッシュリテラル記法を使う必要があります。


#ハッシュのデフォルト値指定

a = Hash.new(5)
a[:foo] # => 5
# ハッシュのデフォルト値を指定する場合は、Hash.newメソッドを使用します。Hash.newメソッドの引数にデフォルト値を指定します。

#[]によるハッシュの生成
# Hashクラスメソッド[]から生成する方法

a = Hash[:foo1, 1, :foo2, 2] # => {:foo1=>1, :foo2=>2}

# Array#to_hメソッドを使用する方法

a = [[:foo1, 1], [:foo2, 2]].to_h  # => {:foo1=>1, :foo2=>2}

# ハッシュ引数
