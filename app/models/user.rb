module User
  class User < ApplicationRecord
    has_many :reservations

    has_secure_password
  end
end