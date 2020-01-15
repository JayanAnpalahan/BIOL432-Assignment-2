#Character vector called "Species", and the 10 species names displayed.

Species = c("Panthera leo", "Panthera tigris", "Setonix brachyurus", "Canis lupus", "Felis catus", "Homo sapiens", 
            "Ailuropoda melanoleuca", "Pan troglodytes", "Bos taurus", "Capra aegagrus")

#Character vector called "Limb.Width", which calls upon a random sample of 10 numbers from a normal distribution that has...
#...a mean of 10 and a standard deviation of 10.
#The absolute number function (abs) covers this sample of numbers, ensuring that only positive values are displayed.

Limb.Width = abs(rnorm(10, mean = 10, sd = 10))
print (Limb.Width)

#This is a random generation method using Boolean logic
#"unitsW" is the variable used to describe the units that will be applied to the "Limb.Width" variable above
#This starts with a randomly generated set of 10 numbers from a binomial distribution
#The size is set to 1 in order for there to be only the possibility of "0" or "1" to appear
#"0" or "1" is then given a condition, using if and else statements, which assigns them to the units "cm", if "1", or "mm", if "0"

unitsW = c(rbinom(10, 1, prob = 0.5)) 
for(i in 1:length (unitsW)){
  if(unitsW[i] == "1"){
    unitsW[i]= "cm"}else{
      if(unitsW[i]=="0"){
        unitsW[i]="mm"}           
    }
  print(unitsW[i])
  }                                   
  
#This is another random generation method using the "sample" function
#It is much more simple. "x" is set to what the user wants as their randomly selected objects or numbers
#the probability of each object is then set by "prob", respectively, i.e. the order of objects in "x" is the same
#The "size" is the number of times the probability is applied, i.e. the number of times an object is selected
#"replace" is whether or not that object is removed from the sample, or kept in. In this case, we want the "cm' and "mm" to stay.
#If it was "FALSE", then there would only be 2 displayed objects. If "mm" is removed, then so will "cm" until no objects remain
unitsW = sample(x = c("mm","cm") ,
                prob = c(0.5,0.5),
                size = 10,
                replace = TRUE)
print(unitsW)

#A repetition of "Limb.Width" except with the variable "Limb.Length", and a standard deviation and mean of 100

Limb.Length = abs(rnorm(10, mean = 100, sd = 100))
print (Limb.Length)

#A repetition of "unitsW", except using the variable "unitsL"

unitsL = sample(x = c("mm","cm") ,
                prob = c(0.5,0.5),
                size = 10,
                replace = TRUE)
print(unitsL)

#A data frame called "MyData" combining the variables created

MyData = data.frame(Species, Limb.Width, unitsW, Limb.Length, unitsL)

#The "write.csv" function allows the transfer of a data frame into a path that the user can select
#In this case, it is "MyData". "row.names" set to TRUE simply keeps the row names assigned rather than removing (via FALSE)

write.csv(MyData,"C:/Users/Jayan/Desktop/BIOL432/BIOL432-Assignment-2/MyData.csv", row.names = TRUE)

