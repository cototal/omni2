class Allowance::Task < ApplicationRecord
  belongs_to :user
  validates :user_id, :goal, :reward, presence: true

  def pay_up
    pay_out = days.length > 3 ? ((days.length / 7.0).round(2) * -10) : 0
    update_attributes(days: [])
    return if pay_out == 0

    user.allowance_entries.create(
      payee: user.email,
      category: "Allowance Task",
      entry_date: Time.zone.now,
      price: pay_out
    )
  end
end
