class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable(allow users to sign up),
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
