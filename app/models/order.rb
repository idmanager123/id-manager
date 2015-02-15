class Order < ActiveRecord::Base
  has_many :customers, dependent: :destroy
  accepts_nested_attributes_for :customers

 def paid_for?
    paid_off = true
    self.customers.each do |c|
      if !c.haspaid
        paid_off = false
      end
    end
    return paid_off
  end

end
