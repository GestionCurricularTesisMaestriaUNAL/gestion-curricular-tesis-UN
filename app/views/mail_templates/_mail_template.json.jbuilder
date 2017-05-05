json.extract! mail_template, :id, :name, :content, :created_at, :updated_at
json.url mail_template_url(mail_template, format: :json)
