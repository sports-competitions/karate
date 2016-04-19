json.array!(@events) do |event|
  json.extract! event, :id, :name, :address, :start_date, :end_date, :details
  json.url event_url(event, format: :json)
end
