
# attr_accessor(*name) -> [Symbol]

# インスタンス変数nameに対する読み取りメソッドと書き込みメソッドの両方を定義します
class User
  attr_accessor :name
  attr_accessor :id, :age
end

# このメソッドで定義されるメソッドの定義は以下のとおりです。
def name 
  @name
end

def name=(val)
  @name = val
end