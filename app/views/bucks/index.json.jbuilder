json.array!(@bucks) do |buck|
  json.extract! buck, :id, :description, :status, :value, :goes_to
  json.url buck_url(buck, format: :json)
end
