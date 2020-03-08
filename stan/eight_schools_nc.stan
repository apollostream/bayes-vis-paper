/* 8-schools non-centered parameterization */
data {
  int<lower=0> J;            // number of schools
  real y[J];                 // estimated treatment effect (school j)
  vector<lower=0>[J] sigma;  // std err of effect estimate (school j)
}
parameters {
  real mu;
  real<lower=0> tau;
  vector[J] theta_tilde;
}
transformed parameters {
  vector[J] theta;
  theta = tau * theta_tilde + mu;
}
model {
  theta_tilde ~ normal(0, 1);
  mu          ~ normal(0, 30);
  tau         ~ cauchy(0, 10); 
  y           ~ normal(theta, sigma);
} 

