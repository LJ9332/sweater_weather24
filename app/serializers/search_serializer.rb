class SearchSerializer
  include JSONAPI::Serializer
  attributes :destination_city,
             :forecast,
             :restaurant

end