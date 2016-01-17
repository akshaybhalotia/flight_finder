json.array!(@progress_statuses) do |progress_status|
  json.extract! progress_status, :id, :percent
  json.url progress_status_url(progress_status, format: :json)
end
