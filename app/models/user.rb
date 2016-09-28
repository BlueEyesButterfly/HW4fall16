class User < ActiveRecord::Base 
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :user_id,  presence: true, length:{maximum:50}, uniqueness:true
    validates :email, presence: true, length:{maximum:255}, format: { with: VALID_EMAIL_REGEX }
    def self.create_user!(params_has)
        randomString=SecureRandom.base64(15)
        params_has[:session_token]=randomString
        create(params_has)
    end 
end
