
## Fooクラス

```ruby
class Foo # Fooは定数であるためFoo=1とすると定数なので警告は出るが、代入できる
  def initialize(a)
    @a = a
  end
  def method1
    @area
  end
end

# Fooクラスのs
foo1 = Foo.new(1) 
foo2 = Foo.new(2)

p 1
class Hoge
  p 2
end
p 3
```
