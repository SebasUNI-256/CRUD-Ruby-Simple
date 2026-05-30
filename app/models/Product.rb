#sintaxis  validates :campo, condicion: valor 
class Product < ApplicationRecord
    #valida que minimo tenga 3 caracteres
    validates :name, presence:true, lenght: {minimum:3}
    #se asegura de que el precio nunca sea 0
    validates :price, presence:true, numericality: {greather_than: 0}
    #se asegura de que solo se puedan meter numero enteros y que siempre sean igual o mayor a 0
    validates :stock, presence: true, numericality:{only_integer: true, greather_than_or_equals: 0}
    validates :category, presence:true
end