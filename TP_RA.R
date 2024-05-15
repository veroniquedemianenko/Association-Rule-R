# caillerie emilie, demianenko veronique

library(arules)

data <- read.csv("Desktop/data/règles d'associations/store_data.csv", header=FALSE)
View(data)



data_disc <- discretizeDF(data)



trans <- as(data_disc, "transactions")

algo_apriori <- apriori(trans, parameter = list(support = 0.2, confidence = 0.7, maxlen = 5))

inspect(algo_apriori)


rules <- apriori(data_disc, control = list(verbose=F),
                 parameter = list(minlen=2, supp=0.005, conf=0.8),
                 appearance = list(rhs=c("shrimp", "eggs"),
                                   default="lhs"))
rules
inspect(rules)
plot(rules)
plot(rules, method="graph")



partie_droite <- apriori(Groceries, parameter = list(support = 0.001, confidence = 0.5), appearance = list(rhs = c("bottled water"), default = "lhs"))


# Appliquer l'algorithme Apriori pour extraire les itemsets fréquents et maximaux
frequent_itemsets <- apriori(trans, parameter = list(support = 0.2, maxlen = 3))
maximal_itemsets <- apriori(trans, parameter = list(support = 0.2, maxlen = 3, target = "maximal"))

# Afficher les itemsets fréquents
inspect(frequent_itemsets)

# Afficher les itemsets maximaux
inspect(maximal_itemsets)
View(inspect(frequent_itemsets))


