class Bank
  
  INITIAL_BALANCE = 0
  
  def initialize
    @balance = INITIAL_BALANCE
    @entries = [] 
  end
 
  def deposit(amount)
    @balance += amount
    @entries << [Time.now, amount, nil, @balance] 
    @balance
  end

  def withdraw(amount)
    fail "Withdrawal must not exceed current balance." if (@balance - amount) < 0
    @balance -= amount
    @entries << [Time.now, nil, amount, @balance]
    @balance
  end
  
  def show 
    p "Date || Credit || Debit || Balance"
    p @entries.join(" || ")
  end

end

# When a new withdrawal or deposit is made a hash is formed.
# The hash key is date and the values are credit, debit and balance.
# This can then be iterated over each row on show