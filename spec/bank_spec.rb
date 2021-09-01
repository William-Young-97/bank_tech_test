require './lib/bank'

describe Bank do
  describe '#deposit()' do
    it 'It allows you to make a deposit' do
      expect(subject.deposit(20)).to eq(20)
    end

    it 'Your deposit adds to previous balance' do
      subject.deposit(20)
      expect(subject.deposit(80)).to eq(100)
    end
  end

  describe '#withdraw()' do
    it 'Allows you to withdraw from your balance' do
      subject.deposit(100)
      expect(subject.withdraw(50)).to eq(50)
    end
    
    it 'Fails if withdraw would make balance negative' do
      expect{subject.withdraw(20)}.to raise_error("Withdrawal must not exceed current balance.")
    end 
  end
end