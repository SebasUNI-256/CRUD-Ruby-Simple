# Mi CRUD Simple

Aplicacion web desarrollada con Ruby on Rails para gestionar productos mediante un CRUD completo.

El proyecto fue construido siguiendo el patron MVC de Rails y utiliza PostgreSQL como base de datos. Su objetivo es demostrar una implementacion simple, clara y funcional de:

- Crear productos
- Listar productos
- Ver detalle de un producto
- Editar productos
- Eliminar productos
- Filtrar productos por nombre y estado

## Funcionalidades

- CRUD completo del recurso `Product`
- Validaciones del modelo
- Mensajes de error en formularios
- Confirmacion antes de eliminar registros
- Filtro por nombre
- Filtro por productos activos e inactivos
- Reutilizacion del formulario con partials

## Tecnologias usadas

- Ruby on Rails 8
- PostgreSQL
- ERB para las vistas
- HTML y CSS
- Importmap / Turbo / Stimulus incluidos por defecto en Rails

## Estructura del proyecto

El proyecto sigue la estructura clasica de Rails:

- `app/models`
  Aqui vive la logica del modelo `Product`, incluyendo validaciones y filtrado.

- `app/controllers`
  Aqui vive `ProductsController`, encargado de coordinar las acciones del CRUD.

- `app/views/products`
  Contiene las vistas del recurso productos:
  - `index`
  - `show`
  - `new`
  - `edit`
  - `_form`

- `config/routes.rb`
  Define las rutas RESTful del recurso `products` y la ruta raiz.

## Modelo principal

El modelo `Product` contiene los siguientes campos:

- `name`
- `description`
- `price`
- `stock`
- `category`
- `active`
- `created_at`
- `updated_at`

## Validaciones

El modelo valida:

- `name`: requerido y con minimo 3 caracteres
- `price`: requerido y mayor que 0
- `stock`: requerido, entero y mayor o igual a 0
- `category`: requerida

Ademas, la base de datos incluye restricciones para reforzar la integridad de los datos.

## Filtrado

En la vista principal se puede filtrar por:

- Nombre del producto
- Estado del producto: activos o inactivos

La logica del filtrado fue movida al modelo para mantener el controlador mas limpio.

## Rutas principales

La aplicacion usa rutas RESTful:

- `GET /products`
- `GET /products/new`
- `POST /products`
- `GET /products/:id`
- `GET /products/:id/edit`
- `PATCH /products/:id`
- `DELETE /products/:id`

La ruta principal del proyecto apunta a:

- `root "products#index"`

## Como ejecutar el proyecto

1. Instalar las dependencias:

```bash
bundle install
```

2. Crear la base de datos:

```bash
bin/rails db:create
```

3. Ejecutar migraciones:

```bash
bin/rails db:migrate
```

4. Iniciar el servidor:

```bash
bin/rails server
```

5. Abrir en el navegador:

```text
http://localhost:3000
```

## Base de datos

El proyecto esta configurado para usar PostgreSQL en desarrollo, pruebas y produccion.

Las credenciales de la base de datos se leen desde variables de entorno para no exponer datos sensibles en el repositorio.

Variables usadas:

- `DB_USERNAME`
- `DB_PASSWORD`

Ejemplo en PowerShell para la sesion actual:

```powershell
$env:DB_USERNAME="postgres"
$env:DB_PASSWORD="tu_password"
```

Despues de definirlas, puedes iniciar la aplicacion normalmente:

```bash
bin/rails server
```

Si quieres dejarlas guardadas de forma persistente en Windows:

```powershell
[System.Environment]::SetEnvironmentVariable("DB_USERNAME", "postgres", "User")
[System.Environment]::SetEnvironmentVariable("DB_PASSWORD", "tu_password", "User")
```

## Objetivo del proyecto

Este proyecto fue desarrollado como practica de Ruby on Rails para demostrar:

- Uso correcto de MVC
- Uso de rutas RESTful
- Manejo de formularios con helpers de Rails
- Validaciones y manejo de errores
- Separacion de responsabilidades entre modelo, controlador y vista

## Autor

Proyecto desarrollado por Sebastian como practica de CRUD en Ruby on Rails.
