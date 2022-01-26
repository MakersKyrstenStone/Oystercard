require 'oystercard'

describe Oystercard do
  it 'checks a card has a balance of zero on creation' do
    expect(subject.balance).to eq(0)
  end
  it 'checks a top_up method increase balance by value' do
    expect{ subject.top_up(10)}.to change { subject.balance }.by(10)
  end
  it ' returns an error if max balance exceeded' do
    expect{ subject.top_up(Oystercard::MAX_BALANCE+1) }.to raise_error "Sorry Maximum Balance is #{ Oystercard::MAX_BALANCE } "
  end
  it 'have a balance deducted' do
    subject.top_up(20)
    expect{ subject.deduct(15)}.to change { subject.balance}.by (-15)
  end
  it 'card defaults to false if not in a journey' do
    expect(subject.in_journey?).to eq (false)
  end
  it 'knows when card is in use' do
    subject.top_up(5)
    expect{ subject.touch_in }.to change {subject.in_journey?}.to eq true
  end
  it 'knows when card no longer in use' do
    subject.top_up(5)
    subject.touch_in
    expect{ subject.touch_out }.to change {subject.in_journey?}.to eq false
  end

  it 'returns an error if the min card bal not met' do
      expect{ subject.touch_in }.to raise_error "Sorry not enough credit to travel, Min is #{ Oystercard::MIN_BALANCE } "
  end
  it 'reduces balance by min fare when touch out' do
    subject.top_up(5)
    subject.touch_in
    expect{ subject.touch_out }.to change {subject.balance}.by (-1)
  end
end

