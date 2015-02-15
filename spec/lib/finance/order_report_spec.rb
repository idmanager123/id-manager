require 'spec_helper'
require 'finance/order_report'
describe Finance::OrderReport do
  let(:customer) { FactoryGirl.create_list(:customer, 10, haspaid: true) }
  let(:unpaid_customer) { FactoryGirl.create_list(:customer, 2) }
  let(:order) { FactoryGirl.create(:order,
                                   customers: [customer, unpaid_customer].flatten)}
  let(:order_report) { Finance::OrderReport.new order }
  describe '#profit' do
    it " should determine the current profit of an order" do
      expect(order_report.profit).to eq 320
    end
  end

  describe "#theoretical_profit" do
    it "should determine the profits assuming everyone pays" do
      expect(order_report.theoretical_profit).to eq 480
    end
  end

end
