class Notes::Category < ApplicationRecord
  include Sluggable
  has_many :notes_entries, class_name: "::Notes::Entry", foreign_key: "notes_category_id"

  scope :cache_update, -> { unscoped.order(updated_at: :desc).first }
  default_scope { order(:name) }

  def to_s
    name
  end
end
