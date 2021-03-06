library(caret)
library(rpart.plot)
mushrooms <- read.csv('mushrooms.csv')
mushrooms <- mushrooms[-17]
str(mushrooms)
indtrain = createDataPartition(y = mushrooms$class, p = 0.75, list = FALSE)
dataset.train = mushrooms[indtrain, ]
dataset.test = mushrooms[-indtrain, ]
trctrl = trainControl(method = "repeatedcv", number = 3, repeats = 50)
t = train(class ~ ., data = dataset.train, method = "rpart2", trControl = trctrl, tuneLength = 15)
t
image(plot(t))