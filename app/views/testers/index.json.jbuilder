json.array!(@testers) do |tester|
  json.extract! tester, 
  json.url tester_url(tester, format: :json)
end
