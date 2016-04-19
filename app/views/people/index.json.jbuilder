json.array!(@people) do |person|
  json.extract! person, :id, :user_id, :first_name, :middle_name, :last_name, :birthday, :sex, :kind, :kind_data
  json.url person_url(person, format: :json)
end
