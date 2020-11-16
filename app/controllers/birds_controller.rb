class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    render json: bird, only: [:id, :name, :species]
    # render json: bird.slice(:id, :name, :species)
  end
end