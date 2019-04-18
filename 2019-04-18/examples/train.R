model <- lm(sale_price ~ area + beds + age, hpiR::seattle_sales)
saveRDS(model, "model.rds")