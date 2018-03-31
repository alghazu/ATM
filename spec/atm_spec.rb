require './lib/atm.rb'

describe Atm do
  it 'has 1000$ on intitialize' do
    expect(subject.funds).to eq 1000
  end
end
