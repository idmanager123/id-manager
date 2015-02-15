module OrdersHelper
  class Formatter
    def self.color_neg value
      if value < 0
        "<span class='negative'>#{value}</span>"
      else
        "#{value}"
      end
    end
  end
end
