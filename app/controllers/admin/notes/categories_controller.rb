class Admin::Notes::CategoriesController < AdminController
  before_action :set_notes_category, only: [:edit, :update, :destroy]

  def new
    @notes_category = ::Notes::Category.new
  end

  def edit
  end

  def create
    @notes_category = ::Notes::Category.new(notes_category_params)

    respond_to do |format|
      if @notes_category.save
        format.html { redirect_to @notes_category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @notes_category }
      else
        format.html { render :new }
        format.json { render json: @notes_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notes_category.update(notes_category_params)
        format.html { redirect_to @notes_category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @notes_category }
      else
        format.html { render :edit }
        format.json { render json: @notes_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notes_category.destroy
    respond_to do |format|
      format.html { redirect_to notes_categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_notes_category
      @notes_category = ::Notes::Category.find(params[:id])
    end

    def notes_category_params
      params.require(:notes_category).permit(:name, :slug)
    end
end
