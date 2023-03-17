require 'test_helper'
require 'minitest/autorun'
require 'sidekiq/testing'

class UserMailerJobTest < Minitest::Test
  def test_user_mailer_job
    assert_equal 0, UserMailerJob.jobs.length
    job_params = {}
    job_params["email"] = 'test@test.com'
    UserMailerJob.perform_in(30.minutes, job_params)
    assert_equal 1, UserMailerJob.jobs.length
  end
end
