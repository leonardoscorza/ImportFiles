class SalesGroup < ApplicationRecord
  has_many :sales, dependent: :delete_all

  def total
    total = 0
    self.sales.each do |sale|
      total += sale.amount * sale.unit_price
    end
    total
  end
end
