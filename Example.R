############################################
# Three functions of the pacakge of BMASEM
# BMASEM(from.vars, to.vars, data, OR=20, start.link=NA)
# summary(object)
# predict(object, newdata, bma.model) # bma.model=0 for BMASEM; bma.model=n for nth model in BMASEM 

# Example for running the package "BMASEM"
############################################
# !!Please set working directory where the following zip file exists
#setwd("")

install.packages("lavaan")

# manually install the BMASEM package
install.packages("BMASEM_1.0.tar.gz", repos = NULL, type="source")
library(BMASEM)

#1. Read the learning data sets
## use train and test in BMASEM
? train
head(train)

#2. Set arguments for BMASEM

# Input pairs of link for the full model
from.vars <- c("x1","x1","x2","x2","y1")
to.vars   <- c("y1","y2","y1","y2","y2")

# the cut-off score for occam's window, OR
## default : 20

# link for the starting model
## defalut : NA (randomly selected)
start.link <- c(1, 0, 0, 1, 1) # an example

#3. call BMASEM (from.vars, to.vars, data, OR=20, start.link=NA)
model <- BMASEM (from.vars, to.vars, data=train, start.link=start.link)

#4. Summary the object of BMASEM
summary(model)

#5. Read the test data set
? test
head(test)

#6. Predict the final y 
## Predict BMASEM
y.hat <- predict(model, test)

## Predict the best model in BMASEM
y.hat <- predict(model, test, bma.model=1)
