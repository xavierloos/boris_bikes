require "../lib/bike"
describe Bike do
  it "working?" do
    expect(subject.working?).to be true
  end
end