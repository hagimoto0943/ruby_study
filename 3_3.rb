# 論理値

if true then
  p 1
end #1

a = if true
  1
end

p a #1

a= 1 if true

p a #1

a = 2 if false

p a #nil

b = 3 if false

p b #nil

a = if false then
  1
elsif false
  2
else
  3
end

p a

unless false
  p 1
end

unless true
  p "unko"
end

a = true ? 1 : 2

p a

b = false ? 3 : 56

p b

if true && true; 1; end
if nil && 10; 1; end
if false || true; 1; end
if nil || false; 1; end
if !true; 1; end

b = b || 1
c ||= 1

p 1 && 2
p 1 and 2

p (1 and 2)