json.array!(@ads) do |ad|
  json.extract! ad, :title, :description, :price
  json.url ad_url(ad, format: :json)
end
