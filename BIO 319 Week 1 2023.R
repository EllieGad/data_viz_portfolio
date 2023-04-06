#BIO 319 workshop 1 EKG 23/01/2023
#Alt key plus - = <- 

#Calculation with BODMAS
(2-1)/4
#0.25
x<-40
y<-30
x-y
#You can check whether your variable is numeric using the is.numeric() , class() function on any variable to check what class the data are. class is numeric or character.
#Logical data exists, can make something true or false. Useful with conditional statements.
a<-TRUE
#We can ask logical statements or R
1<2 #True
2<1 #False
1>2 #False
2>1 #True
y<x #True
#Important operations
#<= is less than or equal to
#>= is greater than or equal to
#== is equal to
#!= is not equal to

#& is and, | is or. | asks is either expression is true/false
1 < 2 & 1 > 0 #True both are correct
1 < 2 | 1 > 0 #True
1 < 2 & 1 < 0 #False only one is correct now
1 < 2 | 1 < 0 #True

#4.2 Challenge time
#Q5)Make an object with the value 'The cake' and another with the value 'A lie'. Create a logical expression to test whether these two values are the same
M <- 'The cake'
N <- 'A lie'
M==N #[1] FALSE
#Q6)Make a logical expression that tests whether your first name is greater than or equal to 6 letters long
nchar('Ellie') >=6#[1] FALSE

#Q7)Make a logical expression that tests whether your name is less than 6 letters long and is not James, Janelle, Jamil or Jessica
nchar('Ellie')<6 & 'Ellie'!='James' |'Ellie'!='Janelle' |'Ellie'!='Jamil' | 'Ellie'!='Jessica'#[1] TRUE


# object types: Scalars, Vectors and Matrices
#5.1. Creating vectors with c()
#Scalars contain a single value (e.g. x <- 1 or cheese <- 'delicious'). Thus everything that we have covered so far in this workshop has been a scalar.

#Vectors, on the other hand, contain multiple values in a single object
#We generally create vectors by combining elements using the c()
x <- c(1, 2, 3, 4)
y <- c(FALSE, TRUE, FALSE, TRUE, FALSE)
z <- c('I', 'got', 'the', 'right', 'temperature', 'to', 'shelter', 'you', 'from', 'the', 'storm')
class(x)## [1] "numeric"
class(y)### [1] "logical"
class(z)#[1] "character"

#There are a couple of other useful ways to create vectors that are worth knowing about.
#The rep() function will repeat a vector or scalar multiple times to create a vector.
rep(x = c(1, 2, 3), times = 3) # [1] 1 2 3 1 2 3 1 2 3
rep(l<- c('I', 'will', 'not', 'tell', 'lies'), times=100)
#solution = lines <- rep(c('I','will','not','tell','lies'), times = 20)
lines <- rep(c('I','will','not','tell','lies'), times = 20)#100 elements so words not sentences
lines <- rep(c('a','b','c'), each = 5)
lines#[1] "a" "a" "a" "a" "a" "b" "b" "b" "b" "b" "c" "c" "c" "c" "c"
# note, make sure to get them to work this out using the function help rather than giving them the answer


x <- letters[1:3] 
x# "a" "b" "c"
rep(x, each = 5)

#5.2. Creating vectors with seq()
#seq() function creates numeric sequences. This function will create a series of numbers between two values, separated by as many divisions as you specify.
seq(from = 1, to = 10) #  [1]  1  2  3  4  5  6  7  8  9 10
seq(from = 10, to = -2)#  [1] 10  9  8  7  6  5  4  3  2  1  0 -1 -2
seq(from = 1, to = 101, by = 10)#  [1]   1  11  21  31  41  51  61  71  81  91 101
seq(from = 10, to = 15, by = 0.5)#  [1] 10.0 10.5 11.0 11.5 12.0 12.5 13.0 13.5 14.0 14.5 15.0

seq(from = 0, to = 15, by = 0.1)#15cm ruler incliuding mm measures

#5.3. ‘:’ and subscripting
#The final shorthand way to create a sequence of numbers in R is to use the : symbol. This creates a sequence of the integers between the values specified.
1:3#[1] 1 2 3
3:9# [1] 3 4 5 6 7 8 9
12:-2#  [1] 12 11 10  9  8  7  6  5  4  3  2  1  0 -1 -2
#This shorthand is commonly used to subset data using subscripting. We can subscript using square brackets [] after our object. Take the following example:
x <- c('a', 'b', 'd', 'e', 'f', 'g', 'h')
#We can specify which elements we want using integer positions:
x[1]#[1] "a"
x[3]#[1] "d"
x[3:5]#[1] "d" "e" "f"
x[5:3]## [1] "f" "e" "d"
x[seq(from = 1, to = 5, by = 2)]## [1] "a" "d" "f"

#We can also subscript vectors (and matrices and dataframes) using logical statements.Take the following example:
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2, 1)
x > 5# [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE

#We can see that by running x > 5 R returns a vector of logical data indicating whether the individual elements are greater than 5 or not. We can use this to subset the vector as follows:
y <- x[x > 5]
print(y)#[1] 6 7 8 9 8 7 6
#As you can see, the new vector y only contains the values of x where the statement x > 5 was TRUE

#Create a vector containing the numbers 2 through 15. Subscript this vector to make a new vector only containing numbers less than or equal to 7.
o <- 2:15
k<- o[o <= 7]
k#[1] 2 3 4 5 6 7
#Using the %% operator, subscript your vector to only contain values that are a multiple of 3 You may need to look up what the %% operator does!
z <- k[k %% 3 == 0]#%% function
z
#‘%%’ indicates ‘x mod y’The result of the %% operator is the REMAINDER of a division,
75%%4#Eg. [1] 3
#I noticed if the dividend is lower than the divisor, then R returns the same dividend value.
4%%75#Eg.  [1] 4



z#[1] 3 6
  #5.4 Matrices
#By increasing the dimensionality of our object one more time we move a linear vector, to a two-dimensional matrix (or matrices if plural). We we do not want to go into too much detail as we tend to use dataframes (covered below) for 2D data, though matrices do crop up in data science too so are worth covering briefly.
#We can create matrices using the the matrix() function:
mat1.data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
mat1 <- matrix(mat1.data,
               nrow = 3,
               ncol = 3,
               byrow = TRUE)
mat1
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9
#Copy the above code into your R script and change the byrow argument to FALSE. What has changed about your matrix?
mat1.data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
mat1 <- matrix(mat1.data,nrow = 3,ncol = 3,byrow = FALSE)
mat1
#     [,1] [,2] [,3]
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9
#matrix is filled by columns instead of rows when byrow is false

#Create a matrix of the first 12 letters of the alphabet that has 3 rows and 4 columns. The first column should contain 'a','b','c'.
mat2.data <- c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i','j','k','l')
mat2 <- matrix(mat2.data, nrow = 3, ncol = 4, byrow = FALSE)
mat2
#We can subscript matrices in a similar way to subscripting vectors. With matrices we need to use two numbers rather than one in the square brackets, as there are two dimensions to the object. The first number is the row, and the second is the column (separated by a comma!) e.g. mat1[1,3] would give you the first element of the third column.
#Equally, leaving a one side of the comma blank returns all rows or columns e.g. mat1[,2] would return the all the rows of the second column of the matrix, while mat1[1:3,] would return the 1st, 2nd and 3rd rows of every column.
#Use subscripting to return the 3rd element of the 4th column of your alphabet matrix
mat2[3,4]#[1] "l"
#Use subscripting to return the 2nd AND 3rd rows of the 1st column of your alphabet matrix.
mat2[2:3,1]#[1] "b" "c"
#Use subscripting to return all the elements EXCEPT those in the 1st row of your alphabet matrix.
mat2[2:3,]
#[,1] [,2] [,3] [,4]
#[1,] "b"  "e"  "h"  "k" 
#[2,] "c"  "f"  "i"  "l" 
mat2[-1,]#also works the same

#6. The Dataframe
#6.1. The basics

#The most commonly used data structure in data science in R is the dataframe. Generally when we read in the data we are describing/visualising/analysing in our scripts, they will be dataframes. In a matrix, all the data are of one class, meaning that you cannot have one column of logical data (TRUE or FALSE), with another of numeric data. In a dataframe, on the other hand, our columns can all be different classes.
#Read the NYTBestsellers.csv dataset into R using the read.csv() function.
df <- read.csv('NYTBestsellers.csv')
str(df)
#This dataframe is the first 100 rows of a dataset of all the New York Times best sellers from 1931. Where the column headers are as follows:
#id - an arbitrary unique id for the novel title - the title of the novel, as reported by the New York Times author - the author of the novel, as reported by the New York Times year - the first year that the novel appears on the bestseller list different from the publication year. total_weeks - the total number of weeks the title was on the list first_week - the first week that the novel appears on the bestseller list debut_rank - the book’s bestseller rank in the week of its first appearance.
#We can subscript data in a dataframe in the same way as a matrix (using the square brackets and two numbers separated by a comma). E.g.:
df[1:3, 2:5]
#title      author year total_weeks
#1 H IS FOR HOMICIDE Sue Grafton 1991          15
#2 I IS FOR INNOCENT Sue Grafton 1992          11
#3  G IS FOR GUMSHOE Sue Grafton 1990           6

#Try getting the information from row 3 using a subscript.
df [3:3, 1:8]#  id            title      author year total_weeks first_week debut_rank best_rank
             #3 10 G IS FOR GUMSHOE Sue Grafton 1990           6 06/05/1990          4         8
row3 <- df[3,]#this also works
row3
#We can also subscript using the column names in place of the numbers.
#Try using the subscript [1:5, 'title'] to access the first five elements of the title column.
df[1:5, 'title']#[1] "H IS FOR HOMICIDE" "I IS FOR INNOCENT" "G IS FOR GUMSHOE"  "A DOGS JOURNEY"    "CHANGING FACES"   

#6.2. The $

#An additional way to refer to columns in a dataframe is using the $ symbol. For example, if your dataframe were saved as an object df and you wanted to use the number of weeks to produce a histogram of the total weeks column, you could run the code hist(df$total_weeks). Try this for yourself.
hist(df$total_weeks)
#You can then subscript a single column using the square brackets. For example df[1:5, 'title'] will produce the same output as running df$title[1:5]. Which you use is a matter of personal preference.
#Have a play around with the dataframe and try subscripting different parts of it using the different methods.

#We can create new columns in a dataframe by referencing column names that do not exist yet. For example we can create a new column called personal_rating and filling it with the term ‘brilliant’ using the following code:
df$personal_rating <- rep('brilliant', times = nrow(df))

#Try creating your own new column called ‘number_of_pages’ that creates a column with 100 for the first 20 books, 200 for the next 20 and so on until the last 20 books are 500.
#100 books total, 20 per each change ,100,200,300,400,500
df$number_of_pages <- rep(c(100,200,300,400,500),each=20)
#Adapt your previous answer to make use of the seq() function to create the input for the rep() function.
df$number_of_pages <- rep(seq(100,500, by=100),each=20)
                          
                          