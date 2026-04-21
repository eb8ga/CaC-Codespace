

# This dataset was collected by Claire de la Paz, Victoria Vien, and Elise Heffernan in June 2023. 
# We surveyed a 97 plots grid across OHill; each plot was spaced 100 m apart. 
# The data presented below is based on the tree plots, in which we measured the diameter at breast height (DBH) of the plot's central tree, and every tree that fell witin the 5.64 m radius (creating a 100 m2 plot). For each tree survey identified it to species, and assessed how many vines were growing on the tree, recorded as presence/absence.  
  
# This data is being used with the permission of Elise Heffernan and Claire de la Paz.  
  
###USE###
  
# Include necessary packages here:

library(dplyr)
library(ggplot2)
library(splitstackshape)
library(tidyr)
library(sf)
library(plyr)
library(scales)

# Start by setting up your working directory using setwd("/path/to/your/dir").
setwd("~/Documents/UVA/TeachingCoding/June25Workshop")

# Loading the data provided to you in the workshop once the working directory is setup.
load("OHillWorkshopMaterials.RData")

# Start by organizing the vine data by colonization
vines <- subset(ohill, PlotSize=="100")
vines$Densiometer <- NULL
colnames(vines)[13] <- "DBHcm"
vines$JapaneseHoneysuckle <- as.numeric(vines$JapaneseHoneysuckle)
vines$DBHcm <- as.numeric(vines$DBHcm)

# Clean up the common names and make sure that they are converted to a factor
vines$CommonName <- tolower(vines$CommonName)    ## making them all lower case
vines$CommonName <- trimws(vines$CommonName)     ## removing white space at end of words 
vines$CommonName <- as.factor(vines$CommonName)  ## making the common names a factor column
summary(vines$CommonName)

# Manually checking to make sure that some of the names are correct. This takes care of
# spaces and capital letters for some fo the common names.
vines$CommonName <- revalue(vines$CommonName, c("american holly" = "American holly",
                                                "american hornbeam" = "American hornbeam",
                                                "chesnut oak" = "chestnut oak", 
                                                "white oak chestnut hybrid" = "white x chestnut oak",
                                                "virginia pine" = "Virginia pine",
                                                "service berry" = "serviceberry",
                                                "mockernut oak" = "mockernut hickory"))

# Now is a good time to pull out the Plot, Scientific Name, Common name, and diamter in a
# separate dataframe so that we have access to these columns later
dbh <- vines %>% select(Plot, ScientificName, CommonName, DBHcm)

# Create a histogram of vine colonization per tree
vines <- vines %>% 
  dplyr::mutate(total = rowSums(pick(Bittersweet:Wisteria), na.rm = T))

hist(vines$total, 
     main="Histogram of Vine Colonization", 
     xlab="Total number of vine species identified per tree")

## Use gather() from tidyr to find pairs across multiple columns
vines <- gather(vines, vine, presence, Bittersweet:Wisteria)

###QUESTION###
# How is the bittersweet vine colonization distributed across OHill?  

# Calculate the percent of colonized vines for Bittersweet
bittersweet <- vines %>%
  subset(vine == "Bittersweet") %>%
  mutate(count = 1) %>%
  aggregate(cbind(presence, count) ~ Plot + x + y, sum) %>%
  mutate(bittersweetcol = presence/count*100)

### MODIFY ###
## Create a shapefile of the bittersweet data frame created above using the examples from the workshop.

# Create a map of the this data using the above shapefile and bittersweetcol.

### CREATE ###
# Now it us your turn to think about how we can visualize tree distribution on OHill.
# Think about how you can solve these on your own and by using the examples from the workshop, 
# and looking at documentation for certain functions you may need.

# Please experiment and ask a buddy before requesting help!

# What is the most important tree per site? Does it change at each site/plot?

# HINT: Use Importance value that does not have relative frequency, 
# because we want importance of each plot:
# IV = relative density + relative dominance.
# You can also use group_by(Plot, ) %>% to get each subsequent line to be 
# calculated for each plot. Check that your plots are factors.

# CALCULATIONS:
# Relative Density = Density of the species/Sum of total density for all species* 100
# Relative Dominance = Basal Area per hectare/Total basal area of all species * 100

# Calculate Relative Density

# Calculate Relative Dominance

# Join these together...

# Calculate Importance Value

# What is the most important (max) tree for each plot?
#HINT: You can use slice(which.max(importance))

# What trees are the most common? Display this in a bar graph.

# Check all XY points and add any needed.

# Convert this to a shapefile.

# Start by organizing the common names into an order that groups the 
# species by genus and general genetic similarity

# You can set the order using the following (replace YOURSHAPEFILENAME with yours...):
dfsf$CommonName <- factor(YOURSHAPEFILENAME$CommonName, c("American holly"  , "black cherry"  , "sweet cherry",
                                               "blackgum",  
                                               "black oak", "chestnut oak", "red oak",  "white oak", "white x chestnut oak", 
                                               "mockernut hickory",   "black walnut" ,
                                               "red maple",    "tulip poplar",
                                               "eastern red cedar",   "shortleaf pine",  "Virginia pine",
                                               "tree of heaven"   
                                               ))

# Set the colors of each tree and group by similarity:
group.colors <- c("American holly"  = "forestgreen" ,        
                  "black cherry"   = "violetred",     
                  "sweet cherry" = "thistle2",
                  "blackgum" = "darkorchid",  
                  "black oak"  = "darkblue",    
                  "chestnut oak"   = "royalblue",  
                  "red oak" = "steelblue",  
                  "white oak" = "skyblue",
                  "white x chestnut oak" = "deepskyblue", 
                  "eastern red cedar" = "coral",   
                  "shortleaf pine" = "tomato",  
                  "Virginia pine" = "sienna" ,
                  "mockernut hickory" = "turquoise" ,   
                  "black walnut" = "cyan",
                  "red maple" = "darkred",                          
                  "tree of heaven"   = "black" ,    
                  "tulip poplar" = "goldenrod1" )    

# HINT: add this to the very end of your plot code to ensure the visual groups by colors  
+ scale_color_manual(values=group.colors)

# Create the final plot using your groupings and shapefile! How can you make this plot look better? 
# Make any visual adjustments you may need to ensure the visual makes sense to an outside audience, i.e.
# check labels, titles, spacing, colors, transparency of shapefile etc..

# Congratulations - you are amazing!





