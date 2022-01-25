require 'oystercard'

describe Oystercard do
  it 'checks a card has a balance of zero on creation' do
    expect(subject.balance).to eq(0)
  end
  it 'checks a top_up method increase balance by value' do
    expect { subject.top_up(10)}.to change { subject.balance }.by(10)
  end
end