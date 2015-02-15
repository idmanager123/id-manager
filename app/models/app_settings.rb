# Singleton record
class AppSettings < ActiveRecord::Base

  def self.instance
    begin
      find 1
    rescue ActiveRecord::RecordNotFound
      row = AppSettings.new
      row.singleton_guard = 0
      row.default_head_hunting_fee = 5.0
      row.default_id_cost = 40.00
      row.default_id_price = row.default_id_cost * 2
      row.save!
    end
  end
end
