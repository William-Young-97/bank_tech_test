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
    guard(amount)
    @balance -= amount
    @entries << [Time.now.strftime("%d/%m/%y"), nil, amount, @balance]
    @balance
  end

  def show 
    index = 0
    while index < @entries.length
      p @entries[-index].join(" || ") 
      index += 1
    end
  end

  def guard(amount)
    fail "Withdrawal must not exceed current balance." if (@balance - amount) < INITIAL_BALANCE
  end
end