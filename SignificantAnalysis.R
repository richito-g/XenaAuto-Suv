# Set the directory path
directory_path <- ""#input directory path
result_path <- ""#input result path
# Get a list of all CSV files in the directory  
csv_files <- list.files(path = directory_path, pattern = "\\.csv$", full.names = TRUE)

# Loop through each CSV file
for (file_path in csv_files) {
  tryCatch({
    # Load the CSV file
    data <- read.csv(file_path)
    
    # Extract gene names
    gene_names <- data$Gene
    gene_names <- sub("^NC\\..", "", gene_names)
    
    # Create the output file name
    output_file <- sub("\\.csv$", "_genes.txt", basename(file_path))
      
    # Write gene names to the output file
    write.table(gene_names, file = file.path(result_path, output_file), row.names = FALSE, col.names = FALSE)
  }, error = function(e) {
    cat("Error reading file:", file_path, "\n")
    message(e)
    cat("Skipping file:", file_path, "\n\n")
  })
}
