require 'net/http'
require 'json'

uri = URI('http://not-tella.requestcatcher.com/test')

File.readlines(ARGV.last).each do |line|
  req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
  req.body = line
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end
end
