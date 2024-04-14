# インスタンスメソッド

-------------------------------------------------------------------------
# インスタンスは、クラスで定義されたインスタンスメソッドを呼び出すことができる
# 継承したクラスのインスタンスは、スーパークラスで定義されたインスタンスメソッドを呼び出すことができる
-------------------------------------------------------------------------

# Rubyインタプリタが、どのように実行するメソッドを当k亭しているかを理解できると、
# 後述するモジュールや得意クラスの理解が容易になる
# そこで、呼び出されたメソッドが探索される経路を詳細に見ていきましょう

# クラスオブジェクト
-------------------------------------
# クラスとインスタンス

  ------- Fooクラス ------------
  |   オブジェクト - x          |
  |   foo1 - x                |
  |   foo2 - x                |
  -----------------------------
-------------------------------------

# プログラム上でオブジェクトの雛形がクラスです。
# クラスは、同じ性質を持つオブジェクトの集合とみなすこともできます。
# クラスからオブジェクトを生成することをインスタンス化と呼びます。

# 「学校のクラス」と同じ意味合いで捉えると、HTMLのクラス属性や、正規表現の文字クラスも同じ意味で使っている。

# 上の図では、x印でオブジェクトを表現しています。
# Rubyではクラスに対応するオブジェクトが生成されるため、
# Fooクラスに対応するオブジェクトもx印で配置してみましょう。

-------------------------------------
# クラスレイヤとクラスオブジェクト

------- クラスレイヤ ----------  |---|---x
|                           |  |   |
|          Foo---------------------|---x              
|                           |  |   |
-----------------------------  |---|---x
                                インスタンス化
抽象化 <-----------------------> 具体化

# 以上がオブジェクトが配置される空間です。
# 抽象度がわかりやすいようにクラスオブジェクトとインスタンスとでレイヤを分けています。
# インスタンスを生成すると一つ上のクラスレイヤからオブジェクトが生成されて降りてくることをイメージしてください。

# ここまでみてきたプログラムでは、クラスとインスタンスの他に、以下の２つの要素が出てきました。

-------------------------------------------------------
# インスタンスメソッド
# インスタンス変数
-------------------------------------------------------
# メモリ上では、インスタンスメソッドはクラスオブジェクトに、インスタンス変数はインスタンスに保持されます。

# 継承したクラスオブジェクト
# 以上でクラスオブジェクトとインスタンスの関係を図示しました。


