library(survival)
library(survminer)

parent_folder_path <- "" # Enter Parent Folder Location


p_value_cutoff <- as.numeric(readline("Enter the p-value cutoff: "))

gene_folders <- list.dirs(path = parent_folder_path, full.names = TRUE, recursive = FALSE)

for (gene_folder in gene_folders) {
  gene_fold <- list.dirs(path = gene_folder, full.names = TRUE, recursive = FALSE)
  
  for (sub_folder in gene_fold) {
    data_files <- list.files(path = sub_folder, pattern = "*.tsv", full.names = TRUE)
    
    gene_results <- list()
    significant_results <- list()
    insignificant_results <- list()
    
    for (data_file in data_files) {
      data1 <- read.delim(data_file)
      data1 <- data1[!duplicated(data1), ]
      
      if (anyNA(data1)) {
        next  
      }
      
      if (ncol(data1) > 5) {
        data1 <- data1[, -ncol(data1)]
      }
      
      gene_name <- names(data1)[ncol(data1)]
      surv_obj <- Surv(data1$OS.time, data1$OS)
      km_fit <- survfit(surv_obj ~ get(gene_name), data = data1)
      p_val <- surv_pvalue(km_fit)
      
    
      p_val_numeric <- as.numeric(sub(".*=\\s*([0-9]+\\.?[0-9]*e?-?[0-9]*).*", "\\1", p_val[4]))
      gene_name <- gsub("gene.expression.RNAseq...IlluminaHiSeq..", "", names(data1)[ncol(data1)])
      
      if (is.na(p_val_numeric) || is.nan(p_val_numeric)) {
        next 
      }
      
     
      if (p_val_numeric < p_value_cutoff || is.nan(p_val_numeric)) {
        sig <- "Significant"
        significant_results[[data_file]] <- data.frame(Gene = gene_name, P_Value_Expression = p_val[4], Significance = sig, stringsAsFactors = FALSE)
      } else {
        sig <- "Insignificant"
        insignificant_results[[data_file]] <- data.frame(Gene = gene_name, P_Value_Expression = p_val[4], Significance = sig, stringsAsFactors = FALSE)
      }
    }
    
    combined_significant <- do.call(rbind, significant_results)
    combined_insignificant <- do.call(rbind, insignificant_results)
    
    file_name_significant <- paste0(basename(gene_folder),"_", basename(sub_folder), "_Sig.05.csv")
    file_path_significant <- file.path(sub_folder, file_name_significant)
    
    file_name_insignificant <- paste0(basename(gene_folder),"_", basename(sub_folder), "_InSig.05.csv")
    file_path_insignificant <- file.path(sub_folder, file_name_insignificant)
    
    write.csv(combined_significant, file = file_path_significant, row.names = FALSE)
    write.csv(combined_insignificant, file = file_path_insignificant, row.names = FALSE)
  }
}
