class PetHistory < ApplicationRecord
    belongs_to :pet, inverse_of: :pet_history
end
