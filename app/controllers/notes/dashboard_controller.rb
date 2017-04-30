class Notes::DashboardController < ApplicationController
  def index
    @q = ::Notes::Entry.ransack(params[:q])
    if current_user
      @categories = ::Notes::Entry.categories_with_user(current_user)
      @sequences = ::Notes::Entry.sequences_with_user(current_user)
      @recent_entries = current_user.notes_entries.includes(:notes_category).order(updated_at: :desc).limit(10)
    else
      @categories = ::Notes::Entry.category_select.category_group
      @sequences = ::Notes::Entry.sequence_select.sequence_group
      @recent_entries = ::Notes::Entry.includes(:notes_category).order(updated_at: :desc).limit(10)
    end
  end
end
