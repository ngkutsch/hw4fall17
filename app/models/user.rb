class User < ActiveRecord::Base
    
    def self.create_user!(userParams)
        
        userParams[:session_token] = SecureRandom.base64
        User.create!(userParams)
    end
end