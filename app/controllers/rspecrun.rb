require 'rspec'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
  config.add_formatter(:json)
end

formatters = RSpec.configuration.formatters

config = RSpec.configuration
json_formatter = RSpec::Core::Formatters::JsonFormatter.new(config.out) 
# create reporter with json formatter
reporter =  RSpec::Core::Reporter.new(json_formatter)
# set reporter for rspec configuration
config.instance_variable_set(:@reporter, reporter)

# execute rspec runner
# 'example_spec.rb' is the location of the spec file
RSpec::Core::Runner.run(['04_greeting_spec.rb'])

# output test result as json
# see example output in `rsspec_json_formatter_result.rb`
puts json_formatter.output_hash
puts json_formatter.output_hash[:examples][0][:status]  # "passed" or "failed"
puts json_formatter.output_hash[:examples][0][:exception][:message] 	# specific error message