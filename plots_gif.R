# Librerías necesarias
install.packages("magick")
library(magick)

# Definir parámetros y datos
n = 1000
m = 1000

# Generar datos
x = runif(n * m, 10, 50)
m = matrix(x, nrow = m)

# Calcular las matrices y promedios
M1 = m[, 1]
M5 = m[, 1:5]
M50 = m[, 1:50]
M100 = m[, 1:100]
M500 = m[, 1:500]
M1000 = m[, 1:1000]

MX5 = apply(M5, 1, mean)
MX50 = apply(M50, 1, mean)
MX100 = apply(M100, 1, mean)
MX500 = apply(M500, 1, mean)
MX1000 = apply(M1000, 1, mean)

# Listar las variables que vamos a graficar
matrices = list(M1, MX5, MX50, MX100, MX500, MX1000)
labels = c("n=1", "n=5", "n=50", "n=100", "n=500", "n=1000")

# Generar gráficos individuales y guardarlos como imágenes
for (i in 1:length(matrices)) {
  # Crear el histograma
  hist(matrices[[i]], main = paste("Histograma de medias con", labels[i]), col = "skyblue", border = "white")
  
  # Guardar cada gráfico como una imagen PNG
  filename <- paste0("hist_", labels[i], ".png")
  dev.copy(png, filename = filename)
  dev.off()
}

# Leer las imágenes generadas
image_list <- list()
for (i in labels) {
  image_list[[i]] <- image_read(paste0("hist_", i, ".png"))
}

# Crear el GIF combinando las imágenes
animation <- image_animate(image_join(image_list), fps = 1)  # fps = cuadros por segundo
image_write(animation, "img/animation_hist.gif")

# El GIF se guarda en el directorio de trabajo
