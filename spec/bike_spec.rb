require "../lib/bike"

describe Bike do
  describe "#working?" do
    it "returns a working bike" do
      expect(subject.working?).to be true
    end
  end
end