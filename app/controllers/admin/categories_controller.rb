class Admin::CategoriesController < Admin::BaseController

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.delete
    redirect_to admin_categories_path
  end

    private
      def category_params
        params.require(:category).permit(:title)
      end
end