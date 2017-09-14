json.extract! chatroom, :id, :topic, :sid, :created_at, :updated_at
json.url chatroom_url(chatroom, format: :json)
