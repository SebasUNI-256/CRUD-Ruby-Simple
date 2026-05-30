#Restricciones para la base de datos
class AddConstraintsToProducts < ActiveRecord::Migration[8.1]
  def change
    #significa que las columnas no pueden ser nulas
    change_column_null :products, :name, false
    change_column_null :products, :price, false
    change_column_null :products, :stock, false
    change_column_null :products, :category, false
    change_column_null :products, :active, false

    #sirve para cambiar el valor por defecto de una columna
    change_column_default :products, :stock, from: nil, to: 0
    change_column_default :products, :active, from: nil, to: true

    #RESUMEN DE LAS RESTRICCIONES
    #Los Nombres de los productos tiene que tener 3 caracteres o mas
    #Los productos no pueden tener precio negativo
    #el stock siempre debe ser mayor o igual a 0
    #Los nombre de los products no pueden ser negativos

    add_check_constraint :products,
                         "char_length(trim(name)) >= 3",
                         name: "products_name_min_length"

    add_check_constraint :products,
                         "price > 0",
                         name: "products_price_positive"

    add_check_constraint :products,
                         "stock >= 0",
                         name: "products_stock_non_negative"

    add_check_constraint :products,
                         "char_length(trim(category)) > 0",
                         name: "products_category_not_blank"
  end
end
