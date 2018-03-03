class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes_entries, class_name: "::Notes::Entry", dependent: :destroy
  has_many :allowance_entries, class_name: "::Allowance::Entry", dependent: :destroy
  has_many :allowance_tasks, class_name: "::Allowance::Task", dependent: :destroy
  has_many :workouts_sessions, class_name: "::Workouts::Session", dependent: :destroy

  def allowance_entries_for_month(date)
    budget_entries_for_month(date).where(allowance: true)
  end

  def allowance_balance
    ::Allowance::Entry.balance(allowance_entries)
  end

  def to_s
    email
  end
end
