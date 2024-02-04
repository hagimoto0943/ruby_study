


def sigmoid(x)
  return 1.0 / (1.0 + Math.exp(-x))
end

result = sigmoid(75543543)
puts Float(result)