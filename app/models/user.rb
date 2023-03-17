class User < ApplicationRecord
  validates :gender, :email, :height, presence: true
  validates :email, uniqueness: true
  after_destroy :send_removed_mail

  def self.search(params)
    records = User.all
    records = records.where('gender ILIKE ?', "#{params[:gender]}%") if params[:gender].present?
    if params[:height].present?
      records = if params[:height] == '>'
                  records.where('height > ?', 170)
                else
                  records.where('height < ?', 170)
                end
    end
    if params[:name].present?
      records = records.where('"firstName" ILIKE ? OR "lastName" ILIKE ?', "#{params[:name]}%",
                              "%#{params[:name]}%")
    end
    records = records.where('email ILIKE ?', "%#{params[:email]}%") if params[:email].present?
    order_by(records, params)
  end

  def send_removed_mail
    job_params = {}
    job_params['email'] = email
    UserMailerJob.perform_in(10.seconds, job_params)
  end
end
