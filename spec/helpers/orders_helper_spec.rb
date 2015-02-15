require 'spec_helper'

describe OrdersHelper do
  describe "#color_negative_value" do
    let(:negative_value) { -10.0 }
    let(:positive_value) { 10 }
    context "negate value" do
      let(:string) { OrdersHelper::Formatter.color_neg negative_value }
      it "should have the value and class negative" do
        expect(string).to include("negative")
        expect(string).to include("#{negative_value}")
      end
    end

    context "positive value" do
      let(:string) { OrdersHelper::Formatter.color_neg positive_value}
      it "should not have class negative" do
        expect(string).to_not include("negative")
      end
    end
  end
end
