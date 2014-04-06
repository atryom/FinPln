json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :name, :note, :plan_amount, :plan_date, :fact_amount, :fact_date, :completed, :group_id
  json.url transaction_url(transaction, format: :json)
end
