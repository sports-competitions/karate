json.array!(@combats) do |combat|
  json.extract! combat, :id, :event_id, :name, :min_rank, :start_age, :end_age, :start_weight, :end_weight, :team, :sex
  json.url event_combat_url(@event, combat, format: :json)
end
