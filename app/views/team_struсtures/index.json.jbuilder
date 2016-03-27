json.array!(@team_struсtures) do |team_struсture|
  json.extract! team_struсture, :id, :event_id, :sportsmen, :judges, :trainers, :delegates
  json.url team_struсture_url(team_struсture, format: :json)
end
