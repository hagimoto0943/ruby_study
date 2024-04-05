# 正規表現とコマンド出力

## 正規表現オブジェクトを作成
# 文字列では両端を「'」などで囲みましただ、「/」で囲むと正規表現オブジェクトが生成されます。
# パーセント記法で生成することも可能であり、この場合は「%r」を使います。
# これらの値はRegexpクラスのインスタンスです。

# 正規表現オブジェクトを作成
/Ruby/ # => /Ruby/
%r(Ruby) # => /Ruby/
Regexp.new 'Ruby' # => /Ruby/

# 以上のように生成した正規表現オブジェクトは、さまざまなメソッドを使用することで文字列と比較できます。
# ===演算子から見ていきましょう。この演算子は指定した文字列とマッチしているかどうかを論理値で返します。

## case式と正規表現オブジェクト

/Ruby/ === 'I love Ruby' # => true

p case 'I love Ruby'
when /Ruby/ then; 'Ruby is there!'
when /Java/ then; 'Java is there!'
end # => "Ruby is there!"

