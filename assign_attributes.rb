# assign_attributesの使い方

# 説明
# 属性のハッシュを渡すことで全ての属性を設定することができる

# 使い方
assign_attributes(属性のハッシュ)

class Cat
  include ActiveModel::AttributeAssignment
  attr_accessor :name, :status  
end

cat = Cat.new
cat.assign_attributes(name: 'tama', status: 'sleeping')
cat.name    # => "tama"
cat.status  # => "sleeping"

cat.assign_attributes(name: 'mike')
cat.name    # => "mike"
cat.satatus # => "sleeping"