namespace :backup do
desc "Backup Database"
  task db: :environment do
    backup_directory = Rails.application.secrets.backup_directory.to_s
    config           = Rails.configuration.database_configuration
    host             = config[Rails.env]["host"]
    database         = config[Rails.env]["database"]
    username         = config[Rails.env]["username"]
    password         = config[Rails.env]["password"]

    puts "Dumping #{database} database..."
    backup_string = "#{database} > #{backup_directory}/#{Time.zone.now.strftime('%y%m%d')}-#{database}.sql"
    if username.present?
      system "PGPASSWORD=#{password} pg_dump -h #{host} -U #{username} #{backup_string}"
    else
      system "pg_dump #{backup_string}"
    end
  end

end
