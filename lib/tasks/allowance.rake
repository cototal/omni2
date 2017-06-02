namespace :allowance do
  desc "Monthly allowance update"
  task monthly: :environment do
    User.all.each do |user|
      user.allowance_entries.create(
        payee: user.email,
        category: "Allowance",
        entry_date: Time.zone.now,
        price: -100
      )
    end
  end

  desc "allowance tasks"
  task tasks: :environment do
    Allowance::Task.all.each do |allowance_task|
      allowance_task.pay_up
    end
  end
end
