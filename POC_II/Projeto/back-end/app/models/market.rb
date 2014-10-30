class Market
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :latitude, type: Float
  field :longitude, type: Float

  embeds_many :products

  def get_geocode
    Geokit::LatLng.new(self.latitude, self.longitude)
  end

  def distance(geolocation)
    get_geocode.distance_to(geolocation)
  end

  #Instance
  def place_list(geolocation, radius)
    all.select{ |place| place.distance(geolocation) <= radius  }
  end

end
