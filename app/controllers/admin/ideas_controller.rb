class Admin::IdeasController < Admin::BaseController
  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.save
    redirect_to admin_Ideas_path
  end

  def index
    @ideas = Idea.all
  end


    private
      def idea_params
        params.require(:idea).permit(:title, :description)
      end
end