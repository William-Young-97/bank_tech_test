require './lib/bank'
require 'timecop'


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

  describe '#show_statement' do
    before do
      Timecop.freeze(Time.local(2021,9,2))
    end
    
    it 'Returns the date, credit, debit and balance' do
      subject.deposit(20)
      expect{ subject.show }.to output("\"Date || Credit || Debit || Balance\"\n\"02/09/21 || 20 ||  || 20\"\n"
      ).to_stdout
    end
    
    after do
      Timecop.return
    end
  end
end

describe Time do
    it 'Logs the date' do
       current_time = Time.new
       allow(Time).to receive(:now).and_return(current_time)
       expect(Time.now).to eq(current_time)
   end
 end