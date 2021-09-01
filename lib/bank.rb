class Bank
  
  INITIAL_BALANCE = 0
  
  def initialize
    @balance = INITIAL_BALANCE
  end
 
  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail "Withdrawal must not exceed current balance." if (@balance - amount) < 0
    @balance -= amount
  end

end