class Products
  include Mongoid::Document
  field :name, type: String
  field :category, type: String
  field :description, type: String


  #Price
  field :price_min, type: float
  field :price_max, type: float
  field :price_indicated, type: float

  #Position
  field :position, type: String

  #Ratings
  field :ratings, type: Float

  #Validations
  validates :ratings, numericality: {
    greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 5.0
  }

  embedded_in :markets
end
