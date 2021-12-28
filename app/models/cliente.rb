class Cliente < ApplicationRecord
    has_many :pet, inverse_of: :cliente
end
