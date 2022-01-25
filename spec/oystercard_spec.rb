require 'oystercard'

describe Oystercard do
  it 'checks a card has a balance of zero on creation' do
    expect(subject.balance).to eq(0)
  end
  it 'checks a top_up method increase balance by value' do
    subject.top_up(10)
    expect(subject.balance).to eq(10) 
  end
end