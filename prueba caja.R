library(shiny)

# Definir una función para la caja, ahora con parámetro para el color
create_box <- function(number, label, content, color = "#6a1b9a", icon_url = "https://via.placeholder.com/40") {
  HTML(paste0('
    <div class="box">
      <div class="number" style="background-color:', color, ';">', number, '</div>
      <div class="content">
        <h2>', label, '</h2>
        <p>', content, '</p>
      </div>
      <div class="icon">
        <img src="', icon_url, '" alt="Icon">
      </div>
    </div>
  '))
}

ui <- fluidPage(
  # Enlazar el archivo CSS
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "www/caja1.css")
  ),
  
  # Llamar a la función para generar varias cajas con diferentes colores
  create_box("01", "Problema 1", "Descripción del problema 1.", color = "#6a1b9a"),
  
  create_box("02", "Problema 2", "Descripción del problema 2.", color = "#ff5722"),
  
  create_box("03", "Problema 3", "Descripción del problema 3.", color = "#2196f3")
)

server <- function(input, output) {}

shinyApp(ui, server)
