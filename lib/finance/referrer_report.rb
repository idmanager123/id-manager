module Finance
  class ReferrerReport
    def initialize referrer
      @referrer = referrer
    end

    def amount_owed
      begin
        total_owed - amount_paid
      rescue TypeError
        0
      end
    end

    def amount_paid
      paid_customers.map(&:head_hunting_fee).inject(:+)
    end

    private
    def total_owed
      @referrer.customers.map(&:head_hunting_fee).inject(:+)
    end

    def paid_customers
      @referrer.customers.to_a.keep_if {|c| c.head_hunting_fee_paid}
    end

  end
end
