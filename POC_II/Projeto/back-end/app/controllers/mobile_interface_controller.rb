class MobileInterfaceController < ApplicationController
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
end

def user_params
  params.require(:user).permit(:username, :password, :password_confirmation, :email)
end
