require './lib/time'

describe Time do
  describe "#date" do
   it 'Logs the date' do
      current_time = Time.new
      allow(Time).to receive(:now).and_return(current_time)
      expect(subject.date).to eq(current_time)
    end
  end
end