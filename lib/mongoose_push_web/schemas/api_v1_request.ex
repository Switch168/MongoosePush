defmodule MongoosePushWeb.Schemas.APIv1Request do
  require OpenApiSpex
  alias OpenApiSpex.Schema

  OpenApiSpex.schema(%{
    title: "User",
    description: "A user of the app",
    type: :object,
    properties: %{
      service: %Schema{
        type: :string,
        description: "Push notification service",
        format: :string,
        enum: ["fcm", "apns"]
      },
      body: %Schema{type: :string, description: "Body of the notification", format: :string},
      title: %Schema{type: :string, description: "Title of the notification", format: :string},
      badge: %Schema{type: :integer, format: :int32},
      click_action: %Schema{type: :string},
      tag: %Schema{type: :string},
      topic: %Schema{type: :string},
      data: %Schema{type: :string},
      mode: %Schema{type: :object, enum: [:prod, :dev]}
    },
    required: [:service, :body, :title],
    example: %{
      "service" => "apns",
      "body" => "A message from someone",
      "title" => "Notification title"
    }
  })
end
