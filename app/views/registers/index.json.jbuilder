json.array!(@registers) do |register|
  json.extract! register, :id, :user_id, :event_id, :name
  json.url register_url(register, format: :json)
end
