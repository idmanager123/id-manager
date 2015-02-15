json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :height, :weight, :eye_color, :hair_color, :dob, :order_id
  json.url customer_url(customer, format: :json)
end
