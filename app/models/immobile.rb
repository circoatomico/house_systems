module Immobile
  class Immobile < ApplicationRecord
    has_many :reservations

    enum type_immobile: [:apartment, :house, :commercial_room]
  end
end