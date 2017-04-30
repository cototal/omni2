class Admin::Notes::EntriesController < AdminController
  before_action :set_notes_entry, only: [:show, :edit, :update, :destroy]

  def new
    @notes_entry = ::Notes::Entry.new
  end

  def edit
  end

  def create
    @notes_entry = current_user.notes_entries.build(notes_entry_params)

    respond_to do |format|
      if @notes_entry.save
        format.html { redirect_to @notes_entry, notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @notes_entry }
      else
        format.html { render :new }
        format.json { render json: @notes_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notes_entry.update(notes_entry_params)
        format.html { redirect_to @notes_entry, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @notes_entry }
      else
        format.html { render :edit }
        format.json { render json: @notes_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notes_entry.destroy
    respond_to do |format|
      format.html { redirect_to notes_entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_notes_entry
      @notes_entry = ::Notes::Entry.find(params[:id])
    end

    def notes_entry_params
      params.require(:notes_entry).permit(:name, :slug, :body, :notes_category_id, :notes_sequence_id)
    end
end
