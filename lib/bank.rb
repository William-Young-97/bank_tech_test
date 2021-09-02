class Bank
  
  INITIAL_BALANCE = 0
  
  def initialize
    @balance = INITIAL_BALANCE
    @entries = [["Date || Credit || Debit || Balance"]] 
  end
 
  def deposit(amount)
    @balance += amount
    @entries << [Time.now.strftime("%d/%m/%y"), amount, nil, @balance] 
    @balance
  end

  def withdraw(amount)
    fail "Withdrawal must not exceed current balance." if (@balance - amount) < 0
    @balance -= amount
    @entries << [Time.now.strftime("%d/%m/%y"), nil, amount, @balance]
    @balance
  end
  
  def show 
    i = 0
      while i < @entries.length
        p @entries[-i].join(" || ") 
        i += 1
      end
  end
end
