require 'test_helper'
require 'sidekiq/testing'

class FetchUsersJobTest < Minitest::Test
  def test_fetch_users
    assert_equal 0, FetchUsersJob.jobs.length
    url = "https://dummyjson.com/users?limit=30&skip=0"
    FetchUsersJob.perform_async(url)
    assert_equal 1, FetchUsersJob.jobs.length
  end
end
