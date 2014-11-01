class MobileInterfaceController < ApplicationController
  @@radius = 200
    #Users action
    def new_session
      if user = User.from_params(params[:user])
        result = { message: "Success", user: user.to_json(), status: 201}
      else
        result = { message: "Failure", status: 202 }
      end
      respond_to do |format|
        format.json{ render json: result }
      end
    end


    def new_user
      user = User.create(user_params)
      if user.save
        result = { message: "SUCCESS", user: user.to_json, status: 201 }
      else
        result = { message: "FAILURE", status: 202}
      end
      respond_to do |format|
        format.json{ render json: result }
      end
    end

  #Places Actions
    #Getters
    def get_places_list
      geolocation = Geokit::LatLng.new(params[:lat] ,params[:lng])
      radius = @@radius
      market = Market.search_within(geolocation, radius)

      respond_to do |format|
        format.json{render json: places.to_json }
      end
    end

    def get_place_infos
      market = market.find(params[:id])
      respond_to do |format|
        format.json{render json: market.to_json }
      end
    end

    #create and updates
    def update_place_info
      update_info = params[:place]
      market = Market.find(update_info[:id])
      if place.update(update_info)
        response = {status: "OK", code: 200}
      else
        response = { status: "Not Ok", code: 201}
      end
      respond_to do |format|
        format.json{render json: response.to_json }
      end
    end

    def new_place
      new_place_info = params[:place]
      place = Place.new(new_place_info)
      if place.save
        response = {status: "OK", code: 200}
      else
        response = { status: "Not Ok", code: 201}
      end
      respond_to do |format|
        format.json{render json: response.to_json }
      end
    end


  #Product actions
    #create and updates
    def update_product_info
      update_info = params[:product]
      market = Market.find(params[:place_id])
      product = market.products.find(update_info[:id])
      if product.update(update_info)
        response = {status: "OK", code: 200}
      else
        response = { status: "Not Ok", code: 201}
      end
      respond_to do |format|
        format.json{render json: response.to_json }
      end
    end

    def add_product
      p = Product.new(params[:product])
      market = Market.find(params[:place_id])
      market.products << p
    end

end

def user_params
  params.require(:user).permit(:username, :password, :password_confirmation, :email)
end
