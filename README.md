First...
I am improving my English, thank you for your attention!

# INSTRUCTIONS

## Loading libraries 

- library(dplyr)
- library(data.table)

## __Downloading and reading data___

Download the zip file and unzipping in the console. After read txt files with read.table()

Naming the columns (variables) and subsetting date in a specific format ("%d/%m/%Y)

Binding date and time values from txt file and create a new column (variable)

Setting the local time for the plots

if you want Background transparent, U can use # par(bg = NA) #

## _Plot 1_

Converting format Date and creating plot1 using *hist()*, you can modify the values as Main, Colors, label and others features.  After, copying to PDF file and close it using dev.off()

## _Plot2_

Creating plot2 using with() and plot(), you can modify the values as Main, Colors, label and others features. After, copying to PDF file and close it using dev.off()
   
## _Plot3_

Creating plot3 using with() and plot(), you can modify the values as Main, Colors, label and others features. Likewise, can add lines using *lines()*  you can modify the values as Colors, lenghts and others features. After, copying to PDF file and close it using dev.off()

## _Plot4_

First, modifiynig mfrow using *par(mfrow = "")*, you can modify margins also. After creating every plot using the last plots' codes in this file. You can modify the values as Main, Colors, label and others features. After, copying to PDF file and close it using dev.off()

## Close

Finally, reseting values using 

*par(bg = "white")
par(mfrow = c(1, 1))*

