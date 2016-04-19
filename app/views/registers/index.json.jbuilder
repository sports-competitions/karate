json.array!(@registers) do |register|
  json.extract! register, :id, :registrator_id, :event_id, :name
  json.url register_url(register, format: :json)
end
