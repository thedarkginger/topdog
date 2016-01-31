json.array!(@chipzs) do |chipz|
  json.extract! chipz, :id, :category, :rank, :prize
  json.url chipz_url(chipz, format: :json)
end
