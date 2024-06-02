directory_path <- "C:/R_Scripts/XenaFiles/Results23"
text_files <- list.files(path = directory_path, pattern = "_genes\\.txt$", full.names = TRUE)

all_gene_names <- c()

for (file_path in text_files) {
  gene_names <- read.table(file_path, header = FALSE, stringsAsFactors = FALSE)$V1
  
  all_gene_names <- c(all_gene_names, gene_names)
}

gene_counts <- table(all_gene_names)

most_common_genes <- names(sort(gene_counts, decreasing = TRUE))[1:5]  # Change 5 to the desired number of top genes

cat("Most common gene names and their counts:\n")
for (gene_name in most_common_genes) {
  cat(gene_name, ": ", gene_counts[gene_name], "\n")
}

