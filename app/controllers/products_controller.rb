class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #Prepara Todo para no repetir codigo (ej: @product = Product.find(params[:id]) )
    
  #/products/5/edit
     #       ↓
    #params[:id] = 5
    #        ↓
    #before_action ejecuta set_product
    #        ↓
    #@product = Product.find(5)
    #        ↓
    #entra a edit con @product ya listo  
    

  #Esto manejas las acciones
  #Lista los productos
  def index
   #Logica de filtrado movida al modelo
   @product = Product.filter_by(params)
  end

  #Muestra un solo producto
  def show
  end

  #Prepara un producto vacio para el formulario
  def new
    @product = Product.new
  end

  #Guarda un producto nuevo en la base de datos
  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to products_path
    else
      #si el producto no se guarda, new mantienen @product con sus errores y responde con un 422
      render :new, status: :unprocessable_entity
    end
  end

  #Carga un producto existente para editarlo
  def edit
  end

  #Actualiza un producto existente
  def update
    if @product.update(product_params)
    redirect_to products_path #Es mejor que (redirect_to "/products")
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  #Elimina un producto existente
  def destroy
    @product.destroy
    redirect_to products_path
    
  end
end

private

# Esto es llamdo por before_action
# mientras que esto busca el producto por id 
# y lo guarda
def set_product
  @product = Product.find(params[:id])
end

#Aqui se que campos se permiten recibir desde el formulario
def product_params
  params.require(:product).permit(:name, :description,:price,:stock,:category, :active)
end

