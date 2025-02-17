json.extract! report, :id, :title, :description, :author_pseudonym, :author_place, :author_contact, :created_at, :updated_at
json.url report_url(report, format: :json)
