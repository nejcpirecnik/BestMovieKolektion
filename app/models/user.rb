class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_many :posts
  has_many :tickets

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
     unless user
         user = User.create(
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
     end
    user
end

def self.from_omniauth(auth)
  name_split = auth.info.name.split(" ")
  user = User.where(email: auth.info.email).first
  user ||= User.create!(provider: auth.provider, uid: auth.uid, last_name: name_split[0], first_name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
end
end
