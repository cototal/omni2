class Notes::SequencesController < ApplicationController
  def index
    @q = ::Notes::Sequence.ransack(params[:q])
    @notes_sequences = @q.result(distinct: true).includes(:notes_category)
  end

  def show
    @notes_sequence = ::Notes::Sequence.find(params[:id])
  end
end
