json.array!(@referrers) do |referrer|
  json.extract! referrer, :id, :name
  json.url referrer_url(referrer, format: :json)
end
