# Proyecto base de Python

Plantilla inicial para desarrollar y ejecutar un proyecto de Python utilizando un entorno virtual local en `.venv`.

Actualmente, el repositorio contiene el entorno virtual y está listo para incorporar el código fuente, las dependencias y las pruebas del proyecto.

## Requisitos

- Python 3.10 o una versión posterior.
- `pip`, incluido normalmente con Python.
- Git, si se desea versionar el proyecto.
- Un editor de código, como Visual Studio Code.

Para comprobar la versión instalada de Python:

```bash
python3 --version
```

En Windows, puede ser necesario utilizar:

```powershell
py --version
```

## Estructura sugerida

A medida que el proyecto crezca, se recomienda organizarlo de la siguiente manera:

```text
python_proyectos/
├── .venv/              # Entorno virtual local, no se versiona
├── src/                # Código fuente de la aplicación
├── tests/              # Pruebas automatizadas
├── requirements.txt    # Dependencias del proyecto
├── .gitignore          # Archivos excluidos del control de versiones
└── README.md           # Documentación del proyecto
```

## Instalación

### 1. Clonar o abrir el proyecto

Si el proyecto está alojado en un repositorio Git:

```bash
git clone <URL_DEL_REPOSITORIO>
cd python_proyectos
```

Si ya se encuentra en la computadora, basta con abrir la carpeta del proyecto desde el editor o la terminal.

### 2. Activar el entorno virtual existente

El entorno `.venv` ya está creado en la raíz del proyecto.

#### Linux y macOS

```bash
source .venv/bin/activate
```

#### Windows PowerShell

```powershell
.venv\Scripts\Activate.ps1
```

#### Windows CMD

```bat
.venv\Scripts\activate.bat
```

Cuando el entorno está activo, el nombre `(.venv)` aparece al principio de la línea de comandos.

### 3. Actualizar las herramientas de instalación

Con el entorno virtual activado:

```bash
python -m pip install --upgrade pip
```

### 4. Instalar dependencias

Si existe un archivo `requirements.txt`, instalar sus dependencias con:

```bash
python -m pip install -r requirements.txt
```

Para agregar una nueva dependencia:

```bash
python -m pip install <paquete>
python -m pip freeze > requirements.txt
```

## Uso

Con `.venv` activado, ejecutar el archivo principal del proyecto con:

```bash
python src/main.py
```

Si el archivo principal se encuentra en la raíz, utilizar:

```bash
python main.py
```

Reemplazar estas rutas por el punto de entrada real cuando se incorpore la aplicación.

También es posible ejecutar un módulo como paquete:

```bash
python -m src.main
```

## Pruebas

Cuando se agreguen pruebas con `pytest`, instalarlas con:

```bash
python -m pip install pytest
python -m pip freeze > requirements.txt
```

Ejecutar toda la suite desde la raíz del proyecto:

```bash
python -m pytest
```

## Desactivar el entorno virtual

Para salir del entorno virtual:

```bash
deactivate
```

## Configuración en Visual Studio Code

1. Abrir la carpeta del proyecto.
2. Seleccionar el intérprete de Python correspondiente a `.venv`:
   - Linux/macOS: `.venv/bin/python`
   - Windows: `.venv\\Scripts\\python.exe`
3. Abrir una terminal nueva para que Visual Studio Code active el entorno automáticamente, si esa opción está habilitada.

## Control de versiones

El entorno virtual contiene archivos específicos de la computadora y no debe subirse al repositorio. Se recomienda crear un archivo `.gitignore` con, al menos:

```gitignore
.venv/
__pycache__/
*.py[cod]
.pytest_cache/
.coverage
.env
```

No incluir en el repositorio contraseñas, claves API ni otros datos sensibles.

## Estado del proyecto

Este proyecto se encuentra en su etapa inicial. El próximo paso es incorporar el código fuente en `src/`, definir el archivo de entrada de la aplicación y registrar las dependencias en `requirements.txt`.

## Licencia

Aún no se ha definido una licencia para este proyecto.
