library (readr)
library(dplyr)
library(tidyr)
library(ggplot2)

# Read the data from the CSV file 
df <- readr::read_csv(
  "C:/Users/Javaughn/OneDrive/Documents/Data Portfolio/Project 2/importdata.csv",
  locale = locale(encoding = "UTF-8") # Use the correct encoding to handle special characters
)

# Display the first few rows of the dataset
head(df)

# Display the column names to understand the structure of the dataset
names(df) 

# Display the summary of the data frame 
summary(df)

# Display the structure of the data frame 
str(df)

# Plot that shows the years with the most bank closures
df %>%
  mutate(year = lubridate::year(bank_closing_date)) %>%
  count(year) %>%
  ggplot(aes(x = year, y = n)) +
  geom_col(fill = "blue") +
  labs(title = "Bank Closures by Year", x = "Year", y = "Number of Closures")

# Plot that identifies the US states with the highest bank closures 
df %>% 
  count(State_US) %>%
  arrange(desc(n)) %>%
  ggplot(aes(x = reorder(State_US, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +  # Makes it horizontal, easier to read
  labs(title = "Bank Closures by State", x = "State", y = "Number of Closures")


df_clean <- df %>% #Creation a clean data set and creating a new variable for the date closed
  filter(!is.na(Fund), !is.na(bank_closing_date)) %>%
  mutate(year_closed = lubridate::year(bank_closing_date)) %>%
  select(Fund, year_closed) 

df_scaled <- scale(df_clean) #Standardization in a scaled dataframe

pca_result <- prcomp(df_scaled, center = TRUE, scale. = TRUE)
summary(pca_result)  # Check variance explained

wss <- sapply(1:10, function(k){
  kmeans(df_scaled, centers = k, nstart = 10)$tot.withinss
})

plot(1:10, wss, type = "b", pch = 19,
     xlab = "Number of Clusters (K)", ylab = "Within-cluster SS")

k_optimal <- 3  # Adjust this based on your elbow plot
kmeans_result <- kmeans(df_scaled, centers = k_optimal, nstart = 25)

pca_data <- data.frame( 
  PC1 = pca_result$x[, 1],
  PC2 = pca_result$x[, 2],
  cluster = as.factor(kmeans_result$cluster)
) #Using PCA and K means clustering for further analysis 

library(ggplot2)#Displays the results returned from the k means klustering
ggplot(pca_data, aes(x = PC1, y = PC2, color = cluster)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "K-Means Clustering on PCA-Reduced Data",
       subtitle = paste("Number of clusters:", k_optimal),
       x = paste0("PC1 (", round(summary(pca_result)$importance[2,1]*100, 1), "% variance)"),
       y = paste0("PC2 (", round(summary(pca_result)$importance[2,2]*100, 1), "% variance)")) +
  theme_minimal() +
  theme(legend.title = element_text(size = 12),
        plot.title = element_text(size = 14, hjust = 0.5),
        plot.subtitle = element_text(size = 12, hjust = 0.5))