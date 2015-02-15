require 'finance/order_report'
module Finance
  class OrdersReport

    def initialize orders
      @orders = orders
    end

    def profit
      @profits = order_report_profits.inject(0, :+)
    end
    private

    def order_report_profits
      @orders.map {|order| (OrderReport.new order).profit}
    end
  end
end
