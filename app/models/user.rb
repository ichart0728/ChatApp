class User < ApplicationRecord
    # 'self' is referencing each ofject of the User class
    before_save { self.email = email.downcase}
    # dependent => if a user is deleted, any associated articles will be destroyed as well
    has_many :articles, dependent: :destroy
    validates :username, presence: true,
                            uniqueness: { case_sensitive: false },
                            length: { minimum: 3, maximum: 25 }

    # You can specify constant by naming them using all Caps
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                            uniqueness: { case_sensitive: false },
                            length: { maximum: 105 },
                            format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end