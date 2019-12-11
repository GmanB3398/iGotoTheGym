# Unused Code and Visualizations

# Boxplot of Pickups by Exercise 
ggplot(data) +
  aes(x = ex, y = pickups) +
  geom_boxplot(fill = "maroon")

# Boxplot of Pickups by Exercise by Day Type
ggplot(data) +
  aes(x = ex, y = pickups, fill = DayType) +
  geom_boxplot() +
  scale_fill_manual(values = c("maroon","#7A3E20","red2"))