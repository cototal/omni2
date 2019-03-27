namespace :export do
  desc "Export notes to JSON format"
  task notes: :environment do
    data = []
    Notes::Entry.includes(:notes_category, :notes_sequence).find_each do |note|
      obj = {
        name: note.name,
        body: note.body,
        category: note.notes_category.try(:name) || "Uncategorized",
        sequence: note.notes_sequence.try(:name),
        created: (note.created_at.to_f * 1000).ceil,
        updated: (note.updated_at.to_f * 1000).ceil
      }
      data << obj
    end
    File.open(Rails.root.join("tmp", "note-backup.json"), "w+") { |f| f.write(data.to_json) }
  end
end
