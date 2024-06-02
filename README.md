# Aggregated Viral Catalogue (AVrC) user interface

The AVrC user interface is a Shiny app that allows users to filter and download a subset of the vOTU reference sequences based on various criteria. The app provides a user-friendly interface to select specific values for different variables and retrieve the corresponding data.

User can either download the app locally or use the web-service : [https://ponseroa.shinyapps.io/AVrC/](https://ponseroa.shinyapps.io/AVrC/)

## Important Note:
The AVrC user interface allows users to search ONLY on the AVrC vOTU representative sequences. The complete database is available as a relational database (csv and sqlite format) in the Zenodo repository : XXX.

## Installation

To run the app locally, follow these steps:

1. Make sure you have R and RStudio installed on your system.

2. Clone or download the repository from GitHub:

```bash
git clone https://github.com/aponsero/AVrC-shiny-app.git
```

3. Open the project in RStudio.

4. Install the required packages by running the following code in the R console:

```r
install.packages(c("shiny", "shinydashboard", "DT", "tidyverse"))
```

## Usage

1. After installing the required packages, open the `app.R` file in RStudio.

2. Click the "Run App" button in the top-right corner of the script editor, or use the keyboard shortcut `Ctrl+Shift+Enter` (Windows/Linux) or `Cmd+Shift+Enter` (macOS).

3. The app will launch in a new window or in your default web browser.

4. In the sidebar menu, click on the "Filter Data" tab.

5. Use the various input controls to select the desired values for each variable:
   - **CheckV Quality**: Select one or more CheckV quality levels.
   - **Plasmid**: Choose whether to include potential plasmids or not.
   - **Predicted Lifestyle**: Select one or more predicted lifestyles.
   - **Host Phylum**: Select one or more viral host phyla.
   - **Viral Phylum**: Select one or more viral phyla.

6. After making your selections, click the "Search" button to apply the filters.

7. The main panel will display a table with the filtered data, showing the `vOTU_ID`, `checkv_quality`, `Plasmid`, `pred_lifestyle`, `Host_Phylum`, and `Phylum` columns.

8. To download the summary metadata for the filtered data, click the "Download metadata" button to get a CSV file.

## Fasta sequences download

The Fasta sequences of several data subsets of the AVrC database can be downloaded directly from the Zenodo archive or from the "Sequence Download" tab of the AVrC user interface:

- Representative dataset: Subset of 449,859 viral representative sequences for the AVrC vOTU
- High quality dataset: Subset of XXX viral sequences (representative and members from XX vOTUs) classified as "Complete" or "High Quality" by CheckV
- Bacteriophage only dataset: Subset of XXX viral sequences (representative and members from XX vOTUs) predicted to infect a prokaryotic host by iPhop.

## Metadata summary content

After selection, the user can download the viral sequence metadata summary as a csv file format containing the following columns:

- contig_id = Unique identifier of all viral sequences in the AVrC database
- vOTU_ID = AVrC species-level viral OTU unique ID
- checkv_quality = Quality category of the sequence, as defined by CheckV
- contig_length = length of the viral sequence
- plasmid_score = Plasmid score classification as defined by GeNomad
- Plasmid = The sequence was classified as a potential plasmid sequence by GeNomad
- pred_lifestyle = Viral lifestyle predicted by PhaTyp, CheckV and GeNomad (see below)
- Realm,Kingdom,Phylum,Class,Order,Family = Viral taxonomy predicted by GeNomad
- Host_Domain,Host_Phylum,Host_Class,Host_Order,Host_Family,Host_Genus = Taxonomic classification of the predicted hosts obtained by iPhop

## Data sources

The AVrC harmonize and aggregate viral sequences from previously published and unpublished mining efforts. Below is the list of the ressources included in the current database version:

- IMG/Vr (Camargo, Nayfach, et al. 2023) - Human gut subset downloaded on 01.12.24
- Gut virome database (GVD) (Gregory et al. 2020)
- Gut Phage database (GPD) (Camarillo-Guerrero et al. 2021)
- Metagenomic gut virus (MGV) (Nayfach, Páez-Espino, et al. 2021)
- Cenote human virome database (CHVD) (Tisza and Buck 2021) - Subset of viral sequnces marked as "Gut"
- COPSAC infant phages (Shah et al. 2023)
- Gut Phages (KGP) (Benler et al. 2021)
- Japanese 4D catalogue (Nishijima et al. 2022)
- Danish Enteric Virome Catalog (DEVoC) (Van Espen et al. 2021)

Additionally, 12 large-scale infant studies (> 7,000 samples) were screened and the putative viral sequences included in the catalogue (PRJNA345144, PRJEB32135, PRJEB6456, PRJNA384716, PRJNA473126, PRJNA290380, PRJEB42363, PRJNA695570, PRJEB32631, PRJNA497734, PRJNA489090, PRJEB70237)

## License

This project is licensed under the [MIT License](LICENSE).