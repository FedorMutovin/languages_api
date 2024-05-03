# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable, :confirmable, :lockable, :timeoutable, :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenyList

  has_one :account, dependent: :destroy
end
