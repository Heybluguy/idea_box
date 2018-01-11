class CategoriesController < ApplicationController

  def new
    render file: "/public/404" unless current_admin?
  end

  def index
    @categories = Category.all
  end

  # def destroy
  #   render file: "/public/404" unless current_admin?
  # end

    private
      def category_params
        params.require(:category).permit(:title)
      end
end