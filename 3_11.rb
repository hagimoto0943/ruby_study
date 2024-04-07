# 脱出構文と例外処理、大域脱出
# 処理を屠龍で抜ける方法としてreturn文を見てきましたが、
# 他に、ループを抜ける脱出構文と、メソッド抜ける大域脱出があります。
# ループを抜ける脱出構文は、」指定した場合の実行順序が重要です。
# メソッドを抜ける大域脱出は、構文が重要です。

# 脱出構文
# Rubyでは、ループの中の現在の回を中断するための構文が豊富に用意されています。
# スープそのものを中断するbreak、他のプログラミング言語でいうcontinueに相当するnext、
# 現在の処理をやり直すredoがあります。

# このうち、next,redoの違いがわかりづらい。
# この２つは、ループ条件の評価などを再度行うかどうかが異なる。
# nextは、中断して次の回に進む、redoは現在の回を操り返すと理解する。

# 例えば、ループが5回目の最中にnext,redoが指定された場合、nextは6回目を実行するのに対して、
# redoは5回目を再度実行します。

# next 
10.times do |i|
  next if i == 5
  print i, ","
end # => 0,1,2,3,4,6,7,8,9,

# redo

10.times do |i|
  redo if i == 5
  print i, ","
end # => 0 1 2 3 3 4 と続いた後、無限ループになる。

# 例外処理
# Rubyで例外を発生させるにはraiseメソッドを使用します。
# raiseは、第一引数に例外クラスまたはそのインスタンスを、第二引数にメッセージを指定します。

# 例外の発生
raise ArgumentError, "引数が不正です" # => ArgumentError: 引数が不正です
raise ArgumentError.new("引数が不正です") # => ArgumentError: 引数が不正です

# メッセージを含む例外オブジェクトを作成
err = ArgumentError.new("引数が不正です")
raise err # => ArgumentError: 引数が不正です

## 引数を省略した例外の発生
raise "エラーが発生しました" # => RuntimeError: エラーが発生しました
# 引数を省略すると、RuntimeErrorが発生します。

# 例外処理
begin
  1 / 0 # 例外が発生する
  p 1
rescue
  p 0 # 例外が発生した場合に実行される
end

# rescue説について、else説を指定することで、例外が発生しなかった時の処理を記述できます。
# また、ensure説を指定することで、例外の発生有無に関わらず、最後に必ず実行される処理を記述できます。
# begin, rescue, else, ensureの順番で記述します。

# else節とensure節
begin # begin節は実行される
  p 1
rescue # 例外が発生しないので、rescue節は実行されない
  p 0
else # 例外が発生しないので、else節が実行される
  p 2
ensure # ensure節は必ず実行される
  p 3
end # => 1 2 3

# rescueは、begin説を指定しなくても使用できるので、確認する。
# rescue説は、if式と同様に修飾子としても書くことができます。
# この場合、例外が発生すると、rescueで指定された式が実行されます。

# rescure修飾子
1/0 rescue p 1 # => 1

# メソッドの中で指定することもできます。
# メソッド内部のrescue節
def foo
  -1/0
rescue
  p 1
end

foo # => 1

# 同じスレッドとブロックで発生した最後の例外は、組み込み変数$!に格納されます。
# さらに、raiseメソッドを引数なしで実行することで、最後に発生した例外を再度発生させることができます。
# これは責任範囲でやるべきことを行い、残りを呼び出し元に委ねる場合に便利です。

# 例外の再発生
begin
  1/0
rescue ZeroDivisionError => e
  p $!.calss #　=> ZeroDivisionError
  raise  # 例外を再発生させる
end 

# 例外処理を呼び出し元にユダれるのではなく、自分で解決して再度行いたい場合は、
# retryが便利です。これは、再度begin説を実行します。
# この場合でもensure説は一回しか実行されません。

# retry
a = 0

begin
  b = 1 / a # 例外が発生する
rescue ZeroDivisionError # 例外が発生すると、rescue説が実行される
  a += 1  # aをインクリメントして、再度begin説を実行
  retry   # retryで再度begin説を実行
ensure # ensureは必ず実行される
  p b
end # => 1

# rescue節を複数指定した場合の動作を確認して、例外の説明を終了します。
# rescue節は一つのbegin節の中で幾つでも指定できます。しかし、最初にマッチしたものしか実行されません。
# よって、より範囲の狭い例外クラスを後で指定しても、役に立たない。

# ensureの実行順
begin
  1/0
rescue 
  p 1 # 例外が発生する
rescue ZeroDivisionError # この節は実行されない
  p 2
end # => 1

# rescue節を続けて書く場合は、マッチする範囲が広くなる順に指定するように注意してください。


# catch, throw
# ここまで見てきた例外は異常時に使用するものですが、階層の深いグループの中で全ての処理が完了すた場合のように、
# 正常時であっても処理を抜けたい場合があります。そのような場合には、catch, throwを使用します。

# catch, throw
def foo 
  throw :exit # ここで処理を抜ける
end

catch(:exit) do 
  foo # fooメソッドを実行
  p 1 # この行は実行されない
end

p 2 # => 2

# catchの戻り値をthrowに渡して実行
def bar 
  catch(:calc) do 
    throw :calc, 100 # throwの第二引数が戻り値になる
  end
end

p bar # => 100

# throwが例外の場合のraiseに相当し、catchがbegin節に相当すると考える。
# throwが実行されると、同名のラベルが指定されているcatch節が実行される。
# ラベルは、シンボルの他に文字列も指定できる。
# 対応するラベルが見つからない場合は、NameErrorの例外が発生します。
# また、throwにはラベル以外に値を引数として渡すことができます。この値はcatch節の戻り値となります。