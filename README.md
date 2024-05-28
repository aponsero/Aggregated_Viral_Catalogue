# Aggregated Viral Catalogue (AVrC) user interface

The AVrC user interface is a Shiny app that allows users to filter and download a subset of the vOTU reference sequences based on various criteria. The app provides a user-friendly interface to select specific values for different variables and retrieve the corresponding data.

User can either download the app locally or use the web-service : [https://ponseroa.shinyapps.io/AVrC/](https://ponseroa.shinyapps.io/AVrC/)

## Installation

To run the app locally, follow these steps:

1. Make sure you have R and RStudio installed on your system.

2. Clone or download the repository from GitHub:

```bash
git clone https://github.com/your-username/AVrC-shiny-app.git
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
   - **CheckV Quality**: Select one or more quality levels.
   - **Plasmid**: Choose whether to include plasmids or not.
   - **Predicted Lifestyle**: Select one or more predicted lifestyles.
   - **Host Phylum**: Select one or more host phyla.
   - **Viral Phylum**: Select one or more viral phyla.

6. After making your selections, click the "Search" button to apply the filters.

7. The main panel will display a table with the filtered data, showing the `vOTU_ID`, `checkv_quality`, `Plasmid`, `pred_lifestyle`, `Host_Phylum`, and `Phylum` columns.

8. To download the filtered data, click the "Download metadata" button to get a CSV file with the metadata, or click the "Download fasta" button to get a FASTA file with the representative sequences.

9. The "About" and "Downloads" tabs provide additional information about the app and pre-filtered subsets of the dataset available for download, respectively.

## License

This project is licensed under the [MIT License](LICENSE).