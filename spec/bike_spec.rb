require "../lib/bike"

describe Bike do
  describe "#working?" do
    it "returns a working bike" do
      expect(subject.working?).to be true
    end
  end
  describe "broken?" do
    it "bike reported broken" do
      subject.report_broken
      expect(subject).to be_broken
    end
  end
end