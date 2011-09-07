class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :authentications

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :name, :password, :password_confirmation, :remember_me

  def self.find_for_open_id(open_id_data)
    # expecting user_info => first_name, last_name, name
	#           uid
	#           provider
	#           credentials => scope, token, secret
	user_info = open_id_data["user_info"]
	credentials = open_id_data["credentials"]

	if user = User.find_by_email(user_info["email"])
	  user
	else
	  user_info["password"] = Devise.friendly_token[0,20]
	  user = User.create(user_info)
	  
	  credentials["uid"] = open_id_data["uid"]
	  credentials["provider"] = open_id_data["provider"]
      credentials.delete "scope"
	  
	  user.authentications.find_by_provider_and_uid(credentials["provider"], credentials["uid"]) || user.authentications.create(credentials)
    end
    user    
  end
end
