class IdeasController < ApplicationController
  def index
    @ideas = Idea.where(user_id: current_user.id)
  end

  def new
    @idea = Idea.new
  end

  def create
    idea = current_user.ideas.new(idea_params)
    idea.category_id=params[:idea][:category_id]
    if idea.save
      redirect_to ideas_path
    else
      render :new
    end
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
        params.require(:idea).permit(:title, :description)
      end
end