library(ggplot2)
num_simulations = 10
num_samples = 4
lambda = 0.2
sample_means = NULL
sample_variances = NULL

for (sim_idx in 1:num_simulations) {
    sim_data = rexp(num_samples, rate = lambda)
    sample_means = c(sample_means, mean(sim_data))
    sample_variances = c(sample_variances, var(sim_data))
}
sample_means <- data.frame(mean=sample_means) 
sample_vars <- data.frame(var=sample_variances)
g <- ggplot(sample_means, aes(x=mean)) + 
    geom_histogram(aes(y=..density..), binwidth=1)
g
# COMPARE THE SAMPLE MEAN
# the expectation of the sample mean
print(mean(sample_means))
# the logical expectation of the sample mean
population_mean = 1/lambda
print(population_mean)

# COMPARE THE SAMPLE VARIANCE
# the expectation of the sample variance
print(mean(sample_variances))
# the logical expectation of the sample variance
population_variance = 1/lambda**2
print(population_variance)

# FURTHER COMPARE THE SAMPLE MEAN
# the variance of the sample mean
print(var(sample_means))
# the logical estimate of the sample mean
print(population_variance / num_samples)