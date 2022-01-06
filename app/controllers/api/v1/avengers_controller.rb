class Api::V1::AvengersController < ActionController::API
    before_action :set_avenger, only: [ :show ]
  
    def index
      @avengers = Avenger.all
    end
  
    def show
      return render plain: 'avenger Not Found, Please try a different one', status: 404 unless (@avenger = set_avenger)
      
    end

    private
  
    def set_avenger
      @avenger = Avenger.find_by(id: params[:id])
    end
  end