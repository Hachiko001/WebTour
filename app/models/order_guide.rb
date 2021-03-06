class OrderGuide < ApplicationRecord
  belongs_to :guide
  belongs_to :order
  
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :guide_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      guide.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def guide_present
    if guide.nil?
      errors.add(:guide, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
