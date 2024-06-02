# XenaAnalysis
This software analyzes gene expression survival data downloaded from UCSC Xena and produces files containing significant and nonsignificant genes. Furthermore, it displays which genes were most common among all the files created. 
## Requirements (packages and software)
* R
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

          
