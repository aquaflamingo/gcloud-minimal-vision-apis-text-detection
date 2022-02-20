require 'pry'

require "google/cloud/vision"

ENV['GOOGLE_APPLICATION_CREDENTIALS'] = './account.json'

# Initialize the Vision APIs client
client = Google::Cloud::Vision.image_annotator

# Accept a single image path argument from script
path = ARGV[0]

# Make the API call via SDK
response = client.document_text_detection image: path

# Iterate through response
response.responses.each do |res|
  # Enter into pry REPL

  binding.pry
  
  # Write the resulting text detected to STDOUT
  puts res.text_annotations.first.description

  # Write the resulting text detected to file
  File.new("out.txt", "w").write(res.text_annotations.first.description)
end
