# 1
# ソースコードの文字コードをUS-ASCIIに設定するマジックコメントの書き方として正しいものを全て選びなさい。

# 1. # coding: us-ascii
# 2. # encoding: us-ascii
# 3. # -*- charser: us-ascii -*-
# 4. # CODING: US-ASCII

# 正解は 1,2,4番

# 解説：マジックコメントは「coding:エンコーディング名」が正しければ、その前後には任意の文字を並べることができます。
# また、大文字、小文字の区別はない。

# コメントとRdoc

# Rubyでは、「#」から行末までをコメントとして扱います。行末まで、という点に注意してください。
# 他の言語とは異なり、行の途中からコメントを書くことはできません。

# また、スクリプトファイルの１行目に描かれたコメントは、マジックコメントといい、
# Ruby実行系にスクリプトエンコーディングを伝えるための特殊なコメントとして扱われます。

# マジックコメントでスクリプトエンコーディングを指定

# coding: euc-jp

p __ENCODING__ # => #<Encoding:EUC-JP>

# さまざまなマジックコメントの書き方
---------------------------------------
# encoding: euc-jp
#  -*- coding: euc-jp -*-
# vim: set fileencoding=euc-jp :

---------------------------------------

# 埋め込みドキュメント
=begin
  
ここに任意のドキュメントを記述します。
  
=end

# クラスやメソッドの直前に挿入したコメントは、Rdocに認識され、HTMLに出力されます。

# RDocの記述例

# = Hogeを表現するクラス
# 説明用のクラス定義です
# 実際には"ちゃんとした名前"で定義してください
# 

class Hoge
  # == テスト用メソッド
  # 返り値::常に1
  def test
    1
  end
end

# 2
# 以下のコードを実行するとどうなるか

x= 0
def hoge
  (1...5).each do |i|
    x += 1
  end
  puts x
end
hoge

# 1.4が表示される
# 2.5が表示される
# 3.例外が発生する
# 4.０が表示される

# 解答は３
# メソッド内と外では、変数名が同じでも別の変数として扱われます。
# 出題コードの１行目と４行目の変数xは、それぞれ別の変数です。
# hogeメソッド内の変数xは４行目が初出です
# ここで自己代入演算子+=を使用して１を加算していますが、

---------------------------------------------------------------------------------------
# 自己代入演算子は、最初に左オペランドを評価するため、定義されていない変数xを参照することになります。
# 定義されていない変数を参照すると、例外が発生します。
---------------------------------------------------------------------------------------


# 3
# 以下のコードを実行するとどうなりますか。全て選べ

begin
  puts 1 + "2"
rescue
  puts "Error"
rescue TypeError
  puts "TypeError"
ensure
  puts "Ensure"
end

# 1. ３と表示される
# 2.Error.と表示される
# 3.Type Error. と表示される。
# 4.Ensure.と表示される

# 解答　２と４

# 解説: reucue説において例外型を省略すると、StandardErrorとそのサブクラス例外を補足します。
---------------------------------------------------------------------------------------
# ２行目で発生するTypeErrorはStanderdErrorのサブクラスなので、
# ３〜４行目のrescue節で処理されます。
---------------------------------------------------------------------------------------
# また、ensure節は必ず実行されます。


# 問題４
# 以下のコードの　XXXXX 部分に記述するとエラーになるコードはどれか

puts XXXXXXXXX

# 1. "90"
# 2. '90'
# 3. 0x90
# 4. 090

# 解答　4
# 解説　
# 文字列リテラルはダブルクォート「"」、またはシングルクォート「'」で囲みます。ダブルクォートで囲まれた文字列は、
# バックスラッシュ記法と式展開が有効ですが、シングルクォートで囲まれた文字列は、一部を除いて字義通りに扱います。
# 選択肢3の0xで始まる数値は、16進数の整数リテラルです。選択肢4の0で始まる数値は、8進数の整数リテラルです。
----------------------------------------------------------------------------------------------
# 8進数では各桁の最大値は7なので、選択肢4の90という値はありえません。このため、選択肢4はエラーになります。
----------------------------------------------------------------------------------------------

# 問題５
# 以下のコードを実行するとどうなりますか。

x= 10
y= x < 10 ? "A" : "B"
puts y

# 解答：Bが表示される
# いうまでもない

# 問題６
# 以下のコードを実行するとどうなるか
MAX= 10
print MAX

MAX= 100
print= MAX

# 解答：10と表示されたのち、警告が表示されて100が表示される
# アルファベットの大文字ではじます識別子は定数です。
# ただしRubyの定数は、警告メッセージが出力されますが、変更可能です。

# 問題７
# 以下のコードを実行するとどうなるか
def foo(*a)
  p a
end

foo(1,2,3)

# 解答：[1,2,3]
# メソッドの引数に*をつけると、可変町引数として扱われ、
# メソッドには任意の個数の引数を渡せるようになり、
---------------------------------------------
# 結果は配列に格納されます。
---------------------------------------------
# fooメソッドには1,2,3の引数が渡されているため、
# aには[1,2,3]が入ります。


# 問題８
# 以下の変数についての説明のうち、間違っているものを全て選択してください

# 1. ローカル変数はアルファベット小文字で始まり、２文字以上である
# 2. グローバル変数は＄ではじまる
# 3. インスタンス変数は、@で始まる
# 4. クラス変数は、*で始まる
# 5. 定数は、アルファベット大文字ではじます

# 解答: 1,4
# 解説: ローカル変数はアルファベット小文字、もしくは「_(アンダーバー)」から始まり、
# １文字以上で構成されます。クラス変数は@@から始まります。

# 問題９
# 以下のコードを実行するとどうなりますか

class Hoge
  attr_reader :message
  def initialize
    @message = "Hello"
  end
end

class Piyo < Hoge
  def initialize
    @message = "Hi"
    super
  end
end

puts Piyo.new.message

# 解答: Helloと表示される
# 解説: インスタンスかされるクラスはPiyoクラスなので、Piyoのinitializeメソッドが実行される
# Piyoのinitializeは@messageに"Hi"を格納した後、スーパークラスのinitializeを呼び出します。
# PiyoのスーパークラスHogeでは@messageに"Hello"を代入しているので、@messageの最終的な値は"Hello"となります。

