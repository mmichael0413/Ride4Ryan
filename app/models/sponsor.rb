class Sponsor < ActiveRecord::Base
  attr_accessible :fund_id, :link_url, :logo
  
  has_attached_file :logo,
    :storage => :s3,
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  
  belongs_to :fund
end
