class RecordSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :cover, :songs_list, :year, :price, :rating
end
