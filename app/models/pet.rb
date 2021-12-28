class Pet < ApplicationRecord
  has_many :pet_history, inverse_of: :pet
  accepts_nested_attributes_for :pet_history, allow_destroy: true

  def history_count
    return PetHistory.count
  end

  def avg_weight
    return PetHistory.average(:weight)
  end

  def avg_height
    return PetHistory.average(:heigth)
  end

  def max_weight
    return PetHistory.maximum(:weight)
  end

  def max_height
    return PetHistory.maximum(:heigth)
  end

end
