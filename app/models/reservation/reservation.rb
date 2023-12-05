module Reservation
  class Reservation < ApplicationRecord
    belongs_to :immobile, class_name: "Immobile::Immobile"
    belongs_to :user, optional: true, class_name: "User::User"
  end
end