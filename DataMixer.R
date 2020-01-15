#Setting our measurements.csv into a variable called "MData" that reads the file
#Used View function to ensure correctness

MData = read.csv("C:/Users/Jayan/Desktop/BIOL432/BIOL432-Assignment-2/Data/measurements.csv")
View(MData)

#Calculating the volume using the length and width from the previous sets of data
#Need to get the categories and then multiply them, and then set this into a new variable "Volume"
#The tricky part, is making sure the units are equivalent. The solution, is either dividing any "mm" measurement by 10 (10mm = 1cm)
#Or multiplying any "cm" measurements by 10 (1 cm = 10 mm)

#Used a loop to go and check each row ([i]) of the data frame, and if the column called "unitsW" has "cm", i.e.
#if unitsW == "cm" is TRUE, then the Limb.Width of that same row [i] is multiplied by 10. In addition, with that same
#condition being TRUE, it will change the unitsW of that same row [i] into "mm", since we converted cm into mm

for (i in 1:nrow(MData)){
  if (MData$unitsW [i] == "cm") {
    MData$Limb.Width [i] = (MData$Limb.Width[i]*10)
    MData$unitsW [i] = "mm"}
  }

#Repeated for the Limb.Length


for (i in 1:nrow(MData)){
  if (MData$unitsL [i] == "cm") {
    MData$Limb.Length [i] = (MData$Limb.Length[i] *10)
    MData$unitsL [i] = "mm"}
}

#The volume of a cylinder is the radius^2 * pi * height. Here:
#Height = Length
#Radius^2 = (Width/2)^2
#So we need to take the data from the Length (Limb.Length) and Width (Limb.Width) and insert into an appropriate formula

Volume = (0.5*(MData$Limb.Width))^2 * MData$Limb.Length * pi
print (Volume)


#Part 3
#Used ggplot2 to create graph. qplot function creates graphs based on conditions
#X-axis is set to Limb.Width, and y to Limb.Length from the data set MData
#Shape is set to a value that corresponds to circles, colour is the colour of the border via light theory
#Colour being set to (0,0,0) is no colours, and therefore darkness/black
#Size is set to the size of each individual points, and Fill corresponds to the colour within the points
#xlab and ylab are the axes labels, and the theme is set to classic with a base_size of 20

library(ggplot2)
qplot(x=Limb.Width, y=Limb.Length, data=MData, shape=I(21), 
      colour=I(rgb(0,0,0)),size=I(5), fill=I("red"), 
      xlab = "Limb Width (mm)", 
      ylab = "Limb Length(mm)") + theme_classic(base_size = 20)
      
