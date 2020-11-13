class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end
  
  def show 
    bird = Bird.find_by(id: params[:id])
    render json: birds, except: [:created_at, :updated_at]
  end
end