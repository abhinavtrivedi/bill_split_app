# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_secure_password

  before_save { email.downcase! }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
end
