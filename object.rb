class Foo
  def initialize(a)
    @a = a
  end
  def method1
    @a
  end
end

foo1 = Foo.new(1)
foo2 = Foo.new(2)

p foo1.method1 # => 1
p foo2.method1 # => 2

class FooExt < Foo
  def initialize(a,b)
    @b = b
    super(a)
  end
  def mothod2(c)
    @a + @b + c
  end
end

fooExt = FooExt.new(3,4)
