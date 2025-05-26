json.extract! payment, :id, :value, :method, :created_at, :updated_at
json.url payment_url(payment, format: :json)
