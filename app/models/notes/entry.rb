class Notes::Entry < ActiveRecord::Base
  include Sluggable
  belongs_to :notes_category, class_name: "::Notes::Category"
  belongs_to :notes_sequence, class_name: "::Notes::Sequence"
  belongs_to :user

  validates :user_id, :name, :body, presence: :true

  scope :cache_update, -> { unscoped.order(updated_at: :desc).first }
  scope :category_select, lambda {
    joins(:notes_category)
      .select("notes_categories.id, notes_categories.name, count(*) AS note_count")
  }
  scope :category_group, -> { group("notes_categories.name, notes_categories.id") }
  scope :categories_with_user, ->(user) { category_select.where(user: user).category_group }

  scope :sequence_select, lambda {
    joins(:notes_sequence)
      .select("notes_sequences.id, notes_sequences.name, count(*) AS note_count")
  }
  scope :sequence_group, -> { group("notes_sequences.name, notes_sequences.id") }
  scope :sequences_with_user, ->(user) { sequence_select.where(user: user).sequence_group }

  def to_s
    name
  end
end

