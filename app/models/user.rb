class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid).permit!).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.refresh_token = auth.credentials.refresh_token
        user.instance_url = auth.credentials.instance_url
        user.save!
      end
    end
  end
