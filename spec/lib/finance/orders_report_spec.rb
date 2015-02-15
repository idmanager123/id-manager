require 'spec_helper'
require 'finance/orders_report'

describe Finance::OrdersReport do
  describe "#profit" do
    context "orders exist"  do
      let(:customers) { FactoryGirl.build_stubbed_list(:customer, 10) }
      let(:orders) { FactoryGirl.build_list(:order, 5, customers: customers) }
      let(:orders_report) { Finance::OrdersReport.new orders}
      it "sums the profits of all the orders supplied" do
        expect(orders_report.profit).to eq (-2000)
      end
    end
    context "no orders exist" do
      let(:order) { Order.none }
      let(:order_report) {Finance::OrdersReport.new order}
      it "returns 0" do
        expect(order_report.profit).to eq (0)
      end
    end
  end
end
