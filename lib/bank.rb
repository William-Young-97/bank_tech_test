class Bank

  def initialize
    @balance = 0
  end
 
  def deposit(amount)
    @balance += amount
    @balance
  end

end