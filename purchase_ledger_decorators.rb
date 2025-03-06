class Number < SimpleDelegator 
  def initialize(number)
    @number = number 
    super 
  end

  def with_commas 
    @number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse 
  end
end

class Dollars < SimpleDelegator 
  def initialize(cents)
    @cents = cents 
  end

  def to_s 
    "#$" + Number.new("%.2f" % (@cents / 100)).with_commas 
  end
end