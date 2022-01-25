require 'oystercard'

describe Oystercard do
  it 'checks a card has a balance of zero on creation' do
    expect(subject.balance).to eq(0)
  end

end