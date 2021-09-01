class Bank
  
  INITIAL_BALANCE = 0
  
  def initialize
    @balance = INITIAL_BALANCE
  end
 
  def deposit(amount)
    @balance += amount
    @balance
  end

end