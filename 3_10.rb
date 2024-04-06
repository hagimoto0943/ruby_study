# ブロックとProcオブジェクト
# ここまでリテラルを中心にRubyの基本を学んできましたが、Rubyの特徴の一つであるブロックについて学びます。
# まずはブロックとProcで、これは他のプログラミング言語ではクロージャに相当します。


# ブロックの基本
# for,if,whileなどは、スコープが作成されないことを見てきました。
# これに対して、ブロックは新たにスコープを作成するものだと考えてください。
# ブロックはメソッドを呼び出す時のみ記述でき、メソッドの内部では、yieldメソッドを使ってブロックを実行します。

# 使用例
def func
  x + yield # ブロックの実行結果を取得
end

p func(1) { 2 } # => 3: ブロック付きでメソッドを呼び出す

# {} に囲まれているのがブロックです。このブロックは２を返し、メソッドfuncではブロックの実行結果(yield)
# と引数の合計を返しているので、実行結果は３となります。

# ここまではC言語の関数へのポインタのように、単に処理をメソッドに渡しているだけのようにみえる。
# しかしブロックは、さらにスコープを生成するという特徴を持っています。

# スコープが生成されている様子
def func y
  y + yield
end

func(1) do
  x =2
end

p x # => NameError: undefined local variable or method `x' for main:Object

# 上の例では、ブロックの実行中に、ブロックの中で変数xに値を代入しています。
# これは下のスコープ（ブロックの外）とは別の場所に確保されるので、ブロックの外からは参照できません。
# また、ブロックは、波括弧{}だけでなく、do...endでも記述できます。

# ブロックにはもう一つ、重要な特徴があります。
# # 
# ブロックはスコープを生成するのに加えて、ブロック生成時の変数をブロック内で参照することができ、
# その変数を更新すると、結果が外部にも影響します。


# クロージャとしてのブロック
def func y
  y + yield
end

x = 2

p func(1) { x += 2} # => 5
p x # => 4

# ブロックの外で変数xに2を代入しています。そして、ブロック内でxに2を加算しています。
# 値てはなく変数そのものが共有されていることに注意しなければならない。

# 上の例では、funcメソッドの実行後、xの値を参照すると、値が更新されていることがわかります。
# このような対応づけは、ユーザからは直接指定できず、変更もできないので、代入ではなく束縛と呼ばれます。
# このように処理の生成時の環境を束縛するものを、一般にクロージャと呼びます。
# 遅延評価や高階関数など、様々な用途に使われます。
# 遅延評価とは、処理を実行するタイミングを遅らせることで、効率的な処理を行うことができる手法です。
# 高階関数とは、関数を引数として受け取る関数のことです。

# 特にRubyでは、メソッドの内部から外部の変数を参照できないため、
# クロージャが呼び出し下の変数を処理に持ち込む、数少ない手段の一つであり、より重要です。

# ブロックのフォーマットと判定
# ブロックの特徴がわかったので、ブロックの書き方を見ていきましょう。
# ブロックは、引数を受け取ることができ、波括弧{}またはdo...endで囲まれます。
# ブロックの引数は、パイプ(|)で囲まれた変数で受け取ります。

# ブロックの引数の指定
def func a,b
  a + yield(b,3)
end

p func(1,2){|x,y| x + y} # => 6

# ブロックの判定
# ブロック内部で、ブロックが渡されているかどうかを判定する方法です。

def func
  return 1 if block_giben?
  2
end

p func(){} # => 1
p func() # => 2

# ブロックが指定された場合は１を、指定されていない場合は２を返すようにメソッド定義しています。
# これを応用して、ブロックが指定されたときは、それを活用する処理が記述できます。

# Procオブジェクト
# ブロックをオブジェクトとして扱いたい場面が多くあります。このようなときに使用するのがProcオブジェクトです。
# Procは、Procクラスのコンストラクタに,ブロックを指定することで生成できます。
# 実行するには、Procのインスタンスに対してcallメソッドを呼び出します。

# Procの基本
proc = Proc.new{ |x| p x }
proc.call(1) # => 1


# Procオブジェクトの生成
def get_counter start
  Proc.new{|up| start += up} # Procオブジェクト生成。startには現在の値を管理
end

count_up = get_counter(1) # 初期値として１を設定。count_upはProcオブジェクトを参照

count_up.call(1) # => 2 # count_upの参照するブロックを実行

count_up.call(2) # => 4 # count_upの参照するブロックを実行

# ブロックへの変換
def func x 
  x + yield
end

proc = Proc.new{2}

func(1, &proc) # => 3

# ブロックをProcオブジェクトに変換するには、&を付けて引数に指定します。

def func x, &proc
  x + proc.call
end

func(1) do
  2
end # => 3


# lambda
# Procに関連してlambdaメソッドも理解しておきましょう。
# lambdaメソッドは、Proc.newと同様にProcオブジェクトを生成しますが、

lmd = lambda{|x| p x}
# 以下のようにも書ける
lmd = ->(x){p x}
lmd.call(1) # => 1

# このように作成したProcインスタンスはlambdaとも呼ばれ、
# オブジェクト化されていないブロックやProc.newで生成したProcインスタンスよりもメソッドに近い動きをします。

# それに対し、Proc.newで生成したオブジェクトをprocとも呼びます。

# procとlambdaの違い
# proc中のreturnは、生成元のスコープを脱出します。
# lambdaは、そのブロック内でreturnを実行すると、呼び出し元に戻ります。

def func 
  proc = Proc.new{return 1}
  proc.call # ここでメソッドを抜ける
  2 # この行は実行されない
end

p func # => 1

def func
  proc = lambda{return 1}
  proc.call  # ここでメソッドを抜ける
  2 # この行は実行される
end

p func # => 2

# 引数の数が一致しない場合、メソッドでは例外ArgumentErrorが発生しますが、
# procやオブジェクト化されて嬰内ブロックでは、余分な実引数を無視したり、実引数が足りない場合にnilを返すなどの挙動を示します。

# procの引数
p1 = Proc.new {|x,y| y}
p p1.call(1) # => nil

# これはlambdaでも同様です。

# lambdaの引数
p1 = lambda{|x,y| y}
p p1.call(1) # => Argument Error: wrong number of arguments (given 1, expected 2)

# 「->」を使用したlambda記法
p1 = ->(x,y){p x + y}
p1.call(1,2) # => 3

# ブロックを受け取るメソッド

# for,whileはスコープが作成されないという欠点があるので、配列やハッシュなどの走査niaamasitukawaremasenn.

# 代わりにブロックを受けるメソッドが使われます・
# これらのメソッドはをブロックの練習も兼ねて見ていく。
# 配列の走査はeachメソッドを使用します。
# このメソッドのブロックの引数には要素の値が格納されます。


# 配列のeachメソッド
[1,2,3].each do |value|
  p value
end # => 1,2,3

# 配列のインデックスが必要な場合は、each_with_indexメソッドを使用します。
# このブロックでは引数を２つとり、第二引数にインデックスが指定されます・

# each_with_indexメソッド
[2,3,4].each_with_index do |value, index|
  p value + index
end # => 2,4,6

# ハッシュのeachメソッド

{:a => 1, :b => 2}.each do |key, value|
  p "#{key}: #{value}"
end # => "a: 1", "b: 2"

# キーのみ必要な場合はeach_keyメソッドを使用します。
# 値のみ必要な場合はeach_valueメソッドを使用します。

{:a => 1, :b => 2}.each_key do |key|
  p key
end # => :a, :b

{:a => 1, :b => 2}.each_value do |value|
  p value
end # => 1, 2

# eachメソッドは、Rangeクラスにも実装されています。

# 範囲メソッドのeachメソッド
(1..3).each do |value|
  p value 
end # => 1,2,3

# 範囲を指定したループでは、値を増やしていくuptoメソッドも利用できます。
# 逆に値を減らしていくdowntoメソッドもあります。

# uptoメソッド
2.upto(4) do |i|
  p i
end # 5から1まで降順に出力される

# 回数を指定してループを実行する場合は、timesメソッドを使用します
# timesメソッド
4.times do |i|
  p i 
end # ０から３まで順に出力

# どれもforやwhileよりも、英語に近い形式で記述できる。
# コードの可読性の観点から、可能な限りこちらを使用する。

# スレッド


# ファイバ  