#sintaxis  validates :campo, condicion: valor 
class Product < ApplicationRecord
    #valida que minimo tenga 3 caracteres
    validates :name, presence:true, length: {minimum:3}
    #se asegura de que el precio nunca sea 0
    validates :price,
     presence:true,
     numericality: {greater_than: 0}
    #se asegura de que solo se puedan meter numeros enteros y que siempre sean igual o mayor a 0
    validates :stock,
              presence: true,
              numericality:{only_integer: true, greater_than_or_equals_to: 0}
              
    validates :category, presence:true


    def self.filter_by(params)
            products = all
            
            if params[:name].present?
                            products = products.where("name LIKE ?","%#{params[:name]}%")  
            end

            if params[:active].present?
                              # Convierte el texto del formulario:
                              # "true"  -> true
                              # "false" -> false
                            active_value = ActiveModel::Type::Boolean.new.cast(params[:active]) 
                            products = products.where(active: active_value)  
            end
        products
    end
end

#Presenece true quiere decir que no puede queda vacio
#Numeracality quiere decir que ese campo especifacamente solo acepta numeros