class User < ApplicationRecord
  belongs_to :course
  has_many :comments
  has_secure_password
end
