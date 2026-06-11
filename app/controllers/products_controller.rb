class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # Carga @product antes de las acciones que lo necesitan.

  # Lista y filtra productos.
  def index
    @products = Product.filter_by(params)
  end

  # Muestra un producto.
  def show
  end

  # Prepara el formulario de registro.
  def new
    @product = Product.new
  end

  # Guarda un producto nuevo.
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      # Reutiliza el formulario mostrando errores.
      render :new, status: :unprocessable_entity
    end
  end

  # Carga el formulario de edicion.
  def edit
  end

  # Actualiza un producto.
  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Elimina un producto.
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  # Busca el producto por id.
  def set_product
    @product = Product.find(params[:id])
  end

  # Limita los campos permitidos del formulario.
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category, :active)
  end
end
