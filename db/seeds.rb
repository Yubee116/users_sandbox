require 'net/http'

url = URI('https://dummyjson.com/users')

res = Net::HTTP.get_response(url)
resBody = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)

resBody['users'].each do |user|
    User.create(user)
end
