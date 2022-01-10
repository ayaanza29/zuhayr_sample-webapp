library(umap)
library(dplyr)
#library(Seurat)
library(ggplot2)
library(patchwork)
library(flowCore)
#library(flowViz)
library(magrittr)
library(ggnewscale)
library(scales)

#iris.data = iris[, grep("Sepal|Petal", colnames(iris))]
#iris.labels = iris[, "Species"]
#iris.umap = umap(iris.data)
#iris.umap
#head(iris.umap$layout, 3)
#plot(iris.umap, iris.labels)



#data <-read.table("C:\\Users\\Zuhayr\\Desktop\\export_709 F SP.csv", sep=",")
#umap(data)




# X<- read.csv("Desktop/export_B 6 hr stim 0.5_CD8.csv")
# x2m <- function(X) {
#   if (!methods::is(X, "matrix")) {
#     m <- as.matrix(X[, which(vapply(X, is.numeric, logical(1)))])
#   }
#   else {
#     m <- X
#   }
#   m
# }
# X_umap<- umap(X, init = "spca")
# embed_img <- function(X, Y, k = 10, ...) {
#   args <- list(...)
#   args$coords <- Y
#   args$x <- X
#   do.call(vizier::embed_plot, args)
#
# }
# embed_img(X, X_umap, pc_axes = F, equal_axes = F, alpha_scale = 0.5, title = "iris UMAP", cex = 1, label=T)





#fcsFile <- "//home//kha17//Downloads//776 F SP.fcs"
fcsFile <- "C:\\Users\\rkhan\\Desktop\\Z Research Programming\\776 F SP.fcs"


x  <- read.FCS(filename = fcsFile, truncate_max_range = FALSE)
x
matrixFormat <- exprs(x)
#matrixShort <- head(matrixFormat, -1430593)
matrixShort <- matrixFormat

matrix_prcomp <- prcomp(matrixShort, scale = FALSE)
matrix_princomp <- princomp(matrixShort, cor = FALSE, scores = TRUE)

#plot(x)

#inputMatrix <- as.matrix(x)
#inputMatrix
#matrixFormat <- princomp(matrixFormat, center = TRUE, scale = TRUE)
umapStuff1 <- umap(matrixShort, init = "pca")
umapStuff1
umapStuff_df_prcomp <- data.frame(umapStuff1$layout)


umapStuff2 <- umap(matrixShort, init = "pca")
umapStuff2
umapStuff_df_princomp <- data.frame(umapStuff2$layout)
# 
# umapStuff_df <- cbind.data.frame(
#   setNames(as.data.frame(umapStuff_df), c("x", "y")),
#   matrixShort,
#   color = rgb(
#     rescale(umapStuff_df$SSC-W),
#     rescale(umapStuff_df$SSC-H),
#     rescale(umapStuff_df$FSC-W)
#   )
# )


ggplot_object <- ggplot(umapStuff_df_prcomp, aes(x = X1, y = X2)) + 
  geom_point() # +
  # scale_color_identity() +
  # new_scale_color() +
  # # shape = NA --> invisible layers
  # geom_point(aes(color = SSC-W), shape = NA) +
  # scale_color_gradient(low = "black", high = "red") +
  # new_scale_color() +
  # geom_point(aes(color = SSC-H), shape = NA) +
  # scale_color_gradient(low = "black", high = "green") +
  # new_scale_color() +
  # geom_point(aes(color = FSC-W), shape = NA) +
  # scale_color_gradient(low = "black", high = "blue")

ggplot_object <- ggplot(umapStuff_df_princomp, aes(x = X1, y = X2)) + 
  geom_point()

ggsave("geomplot_image", plot = ggplot_object)

# umap_plot_df <- umap(matrixFormat)
#
# finalUMAPplot <- ggplot(
#   umap_plot_df,
#   aes(
#     x = X1,
#     y = X2,
#   )
# ) + geom_point()
#
#
# finalUMAPplot
