a = 1
p "a is #{a}"
p 'a is #{a}'

query = <<SQL
  SELECT *
    FROM my_table;
SQL

p query

def foo 
  <<-UNKO
  Un
  ko
  UNKO
end

p foo

a =1

z = <<EOS
  #{a}
EOS

p z

s = <<'EOS'
  #{a}
EOS

p s

a = %*test*

p a

a = %*"unko"*

p a

a = "\"unko\""

a = %[test]

p a

a = 1

p %q!#{a + 1}!

p %Q?#{a + 1}?

def sigmoid(x)
  return x / (x + Math.exp(0.01))
end

200.times do |i|
  p 3 * sigmoid(i)
end