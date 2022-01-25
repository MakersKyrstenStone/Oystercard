require 'oystercard'

describe Oystercard do
  it 'checks a card has a balance of zero on creation' do
    expect(subject.balance).to eq(0)
  end
  it 'checks a top_up method increase balance by value' do
    expect { subject.top_up(10)}.to change { subject.balance }.by(10)
  end
  it ' returns an error if max balance exceeded' do
  expect { subject.top_up(Oystercard::MAX_BALANCE+1) }.to raise_error "Sorry Maximum Balance is #{ Oystercard::MAX_BALANCE } "
  end
  it 'have a balance deducted' do
    subject.top_up(20)
    expect { subject.deduct(15)}.to change { subject.balance}.by (-15)
  end
end

