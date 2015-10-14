class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def form_insert
    @car = Car.new
  end

  def insert_data
    @car             = Car.new
    @car.name        = params[:car][:name]
    @car.brand       = params[:car][:brand]
    @car.description = params[:car][:description]
    @car.price       = params[:car][:price]
    @car_save        = @car.save

    if @car_save
      redirect_to '/cars'
    else
      render 'form_insert'
    end
  end

  def form_update
    @id  = params[:id]
    @car = Car.find(@id.to_i)
  end

  def update_data
    @car             = Car.find(params[:car][:id].to_i)
    @car.name        = params[:car][:name]
    @car.brand       = params[:car][:brand]
    @car.description = params[:car][:description]
    @car.price       = params[:car][:price].to_i
    @car_save        = @car.save

    if @car_save
      redirect_to '/cars'
    else
      render 'form_update'
    end
  end

  def hapus
    @id  = params[:id]
    @car = Car.find(@id.to_i)

    @car_hapus = @car.destroy

    redirect_to '/cars'
  end

end

