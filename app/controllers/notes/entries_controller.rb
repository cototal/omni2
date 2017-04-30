class Notes::EntriesController < ApplicationController
  def index
    @q = ::Notes::Entry.ransack(params[:q])
    @notes_entries = @q.result(uniq: true).includes(:notes_category, :notes_sequence)
  end

  def show
    @notes_entry = ::Notes::Entry.find(params[:id])
  end
end
