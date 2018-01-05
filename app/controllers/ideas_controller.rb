class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.save
    redirect_to ideas_path
  end

  def index
    @ideas = Idea.all
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    redirect_to idea_path(@idea)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.delete
    redirect_to ideas_path
  end


    private
      def idea_params
        params.require(:idea).permit(:title, :description, :category_id)
      end
end