json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :string
  json.url room_url(room, format: :json)
end
