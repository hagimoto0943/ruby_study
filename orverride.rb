class Member
  attr_accessor :name, :number

  def initialize(name, number)
    @name = name
    @number = number
  end
  def +(obj)
    return Member.new("#{self.name} & #{obj.name}", "#{self.number}#{obj.number}")
  end
end

a = Member.new("Hagi", "0")
a = Member.new("Fujimura", "3")

puts (a+b).inspect