class ProductsController < ApplicationController
  #Esto manejas las acciones
  #Lista los productos
  def index
    @products = Product.all
  end

  #Muestra un solo producto
  def show
  @product = Product.find(params[:id])  
  end

  #Prepara un producto vacio para el formulario
  def new
    @product = Product.new
  end

  #Guarda un producto nuevo en la base de datos
  def create
    @product = Product.create(product_params)
    if @product.save
    redirect_to "/products"
    else
      #si el producto no se guarda, new mantienen @product con sus errores y responde con un 422
      render :new, status: :unprocessable_entity
    end
  end

  #Carga un producto existente para editarlo
  def edit
    @product = Product.find(params[:id])
  end

  #Actualiza un producto existente
  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      
    redirect_to "/products"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  #Elimina un producto existente
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to "/products"
    
  end
end

private

#Aqui se que campos se permiten recibir desde el formulario
def product_params
  params.require(:product).permit(:name, :description,:price,:stock,:category, :active)
end

