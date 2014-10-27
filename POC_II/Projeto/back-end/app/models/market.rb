class Market
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :latitude, type: Float
  field :longitude, type: Float
end
