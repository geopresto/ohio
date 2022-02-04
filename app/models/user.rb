class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: {maximum: 255},
              uniqueness: true
    before_save :downcase_email
    has_secure_password


    private

    def downcase_email
        email.downcase! 
    end
end
