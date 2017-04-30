class Admin::Notes::SequencesController < AdminController
  before_action :set_notes_sequence, only: [:show, :edit, :update, :destroy]

  def new
    @notes_sequence = ::Notes::Sequence.new
  end

  def edit
  end

  def create
    @notes_sequence = ::Notes::Sequence.new(notes_sequence_params)

    respond_to do |format|
      if @notes_sequence.save
        format.html { redirect_to @notes_sequence, notice: "Sequence was successfully created." }
        format.json { render :show, status: :created, location: @notes_sequence }
      else
        format.html { render :new }
        format.json { render json: @notes_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notes_sequence.update(notes_sequence_params)
        format.html { redirect_to @notes_sequence, notice: "Sequence was successfully updated." }
        format.json { render :show, status: :ok, location: @notes_sequence }
      else
        format.html { render :edit }
        format.json { render json: @notes_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notes_sequence.destroy
    respond_to do |format|
      format.html { redirect_to notes_sequences_url, notice: "Sequence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_notes_sequence
      @notes_sequence = ::Notes::Sequence.find(params[:id])
    end

    def notes_sequence_params
      params.require(:notes_sequence).permit(:name, :notes_category_id, :description)
    end
end
