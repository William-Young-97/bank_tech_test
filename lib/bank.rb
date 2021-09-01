require 'time'

class Bank
  
  INITIAL_BALANCE = 0
  
  def initialize
    @balance = INITIAL_BALANCE
    @entries = [] 
  end
 
  def deposit(amount)
    @balance += amount
    @entries << {"Date" => Time.now, "Credit" => amount, "Debit" => nil, "Balance" => @balance}
    @balance
  end

  def withdraw(amount)
    fail "Withdrawal must not exceed current balance." if (@balance - amount) < 0
    @balance -= amount
    @entries << {"Date" => Time.now, "Credit" => nil, "Debit" => amount, "Balance" => @balance}
    @balance
  end
  
  def show 
    @entries.each { |row| row.each {|item| p item}}
  end

end

# When a new withdrawal or deposit is made a hash is formed.
# The hash key is date and the values are credit, debit and balance.
# This can then be iterated over each row on show