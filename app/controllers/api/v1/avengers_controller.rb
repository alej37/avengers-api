class Api::V1::AvengersController < ActionController::API
    before_action :set_avenger, only: [ :show ]
  
    def index
      @avengers = Avenger.all
    end
  
    def show
      return render plain: 'avenger Not Found, Please try a different one', status: 404 unless (@avenger = set_avenger)
    end

    def create
      new_avenger = Avenger.create(avengers_params)
      if new_avenger.save
        status = 'new avenger #{new_avenger.superhero_name} created'
      else
        render plain: 'sorry, avenger not created'

      end

      render plain: status
    end
  

    private
  
    def set_avenger
      @avenger = Avenger.find_by(id: params[:id])
    end

    def avengers_params
      params.permit([
        :superhero_name,
        :real_name,
        :age,
        :description,
        :status
      ])
    end
  end