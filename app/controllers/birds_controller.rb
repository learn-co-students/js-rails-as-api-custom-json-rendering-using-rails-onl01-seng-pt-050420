class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
        # the above two ways of using render give us the same result, the top one tells the controller to only render :id, :name, :species.
        # the bottom one tells the controller to render enverything except :created_at and :updated_at
    #render json: birds.to_json(except: [:created_at, :updated_at])
        # The above code snippet shows what is happening under the hood when we call the code on line 5
    
  end

  def show
    bird = Bird.find_by(id: params[:id])
    #render json: bird 
    if bird 
      render json: {id: bird.id, name: bird.name, species: bird.species}
    #render json: bird.slice(:id, :name, :species)
        # These two do the exac same thing, but the bottom one uses the .slice method to achieve it. 
        # .slice works great for a SINGLE HASH but it wont work on an array of hashes like the one in our index action 
    else 
      render json: {message: 'Bird not found'}
    end 

  end 

end