class FetchUsersJob
  require 'net/http'
  include Sidekiq::Job

  def perform(url)
    res = Net::HTTP.get_response(URI(url))

    resBody = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)

    resBody['users'].each do |user|
      User.create(user)
    end
  end
end
