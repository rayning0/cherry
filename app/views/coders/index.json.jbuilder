json.array!(@coders) do |coder|
  json.extract! coder, 
  json.url coder_url(coder, format: :json)
end
