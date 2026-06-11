class Product < ApplicationRecord
  # Requiere un nombre con al menos 3 caracteres.
  validates :name, presence: true, length: { minimum: 3 }

  # El precio debe ser mayor que 0.
  validates :price,
            presence: true,
            numericality: { greater_than: 0 }

  # El stock debe ser entero y no negativo.
  validates :stock,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :category, presence: true

  def self.filter_by(params)
    products = all

    if params[:name].present?
      products = products.where("name LIKE ?", "%#{params[:name]}%")
    end

    if params[:active].present?
      # Convierte "true" o "false" al booleano correcto.
      active_value = ActiveModel::Type::Boolean.new.cast(params[:active])
      products = products.where(active: active_value)
    end

    products
  end
end
