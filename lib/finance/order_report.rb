module Finance
  class OrderReport
    def initialize order
      @order = order
    end

    def profit
      begin
        current_money_made - id_costs
      rescue TypeError
        0
      end
    end

    def theoretical_profit
      begin
        total_made - id_costs
      rescue TypeError
        0
      end
    end

    private

    def current_money_made
      paid_customers.map(&:id_price).inject(0, :+)
    end

    def paid_customers
      @order.customers.select {|c| c.haspaid}
    end

    def id_costs
      @order.customers.map(&:id_cost).inject(0, :+)
    end

    def total_made
      @order.customers.map(&:id_price).inject(0, :+)
    end
  end

  class NilOrderObject
    def initialize
      puts "swagger"
    end

    def customers
      [NilCustomer.new]
    end

    private
    class NilCustomer
      def haspaid
        true
      end
      def id_price
        0
      end
      def id_cost
        0
      end
    end
  end
end
