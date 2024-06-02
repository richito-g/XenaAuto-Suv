# XenaAnalysis
This software analyzes gene expression survival data downloaded from UCSC Xena and produces files containing significant and nonsignificant genes. Furthermore, it displays which genes were most common among all the files created. 
## Requirements (packages and software)
* RStudio
* survival
* survminer
## Installation
Clone the Repo as shown below
```
git clone https://github.com/richito-g/XenaAnalysis
```
## Usage
### Step 0: Prepare the Data
TSV file downloaded as shown in Image
![image](https://github.com/richito-g/XenaAnalysis/assets/112819365/5a21e444-8aad-4f05-a38e-680e8fcdc349)

| Column | Description |
| ------------- | ------------- |
| 1  | sample |
| 2  | patient  |
| 3  | OS |
| 4  | OS.Time  |
| 5  | gene expression RNAseq - IlluminaHiSeq: |
| 6  | data  |
### Step 1: P-Value Analysis
Organize your data as shown below:

![image](https://github.com/richito-g/XenaAnalysis/assets/112819365/8b855355-2cc3-43e2-b625-3f8ad042959d)

Open XenaAnalysis with RStudio and change the top line with the correct directory. Then run the script and input the p-value cutoff.

### Step 2: Significant Analysis
Now inside each SNV and CNA folder contain files named (i.e. KIRP_Sig.csv, KIRP_InSig.csv, BRCA_Sig.csv, BRCA_InSig.csv). The file is formated shown below in the table:
| Column | Description |
| ------------- | ------------- |
| 1  | Gene           |
| 2  | P-Value  |
| 3  | Significance |
