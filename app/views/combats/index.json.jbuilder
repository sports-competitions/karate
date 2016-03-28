json.array!(@combats) do |combat|
  json.extract! combat, :id, :event, :name, :min_rank, :start_age, :end_age, :start_weight, :end_weight, :team, :sex
  json.url combat_url(combat, format: :json)
end
