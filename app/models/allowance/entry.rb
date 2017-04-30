class Allowance::Entry < ApplicationRecord
  belongs_to :user

  validates :price, :entry_date, :user_id, presence: true

  scope :cache_update, -> { unscoped.order(updated_at: :desc).first }

  class << self
    def balance(entries)
      return 0 if entries.empty?
      -entries.map(&:price).inject(:+)
    end

    def merge(field, from, to)
      where(field => from).update_all(field => to)
    end

    def monthly_spending(date, entries)
      first = date.beginning_of_month
      last = date.end_of_month
      month_entries = entries.where("entry_date >= ? AND entry_date <= ?", first, last)
                             .where("price >= 0")
      month_entries.empty? ? 0 : month_entries.map(&:price).inject(&:+)
    end
  end
end
