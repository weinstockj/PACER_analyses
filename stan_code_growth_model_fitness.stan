data {
    int<lower=0> N; // samples
    int<lower=0> N_cases; // samples
    int chip[N]; // 1 = has chip 0 = no chip
    int y[N]; // counts of mutations
    int chip_index[N];
    real<lower=0> artifact_mean;
    real age[N];
    int <lower=0> N_study;
    int<lower=0, upper=N_study> study_index[N];
}
parameters {
    vector<lower=0,upper=1>[N_cases] time_prop;
    real <lower=0> mutation_rate;
    vector<lower=0>[N_study] artifact_rate;
    real <lower=0> chip_dispersion;
    real <lower=0> control_dispersion;
    vector[N_cases] fitness;
}
transformed parameters {
    vector<lower=0>[N_cases] time;
    vector<lower=0>[N] eta;
    vector<lower=0>[N] dispersion;
    for(i in 1:N) {
        if(chip[i] == 1) {
            time[chip_index[i]] = time_prop[chip_index[i]] * age[i];
            eta[i] = mutation_rate * time[chip_index[i]] + fitness[chip_index[i]] * (1.0 - time_prop[chip_index[i]]) * age[i] + artifact_rate[study_index[i]];
            //print(\" at i=\", i, \" time[chip_index[i]]: \", time[chip_index[i]]);
            dispersion[i] = chip_dispersion;
        } else {
            eta[i] = artifact_rate[study_index[i]];
            dispersion[i] = control_dispersion;
        }
    }
}
model {
    target += normal_lpdf(artifact_rate | artifact_mean, 20);
    target += normal_lpdf(fitness | 0, 1.0);
    target += gamma_lpdf(mutation_rate | 14.2 * .7 * 20, 20); // set mean at 14.2 subs per year * 70% of mutation spectrum 
    target += beta_lpdf(time_prop | 1.59, 1); // pbeta(.5, 1.59, 1) = .33 => clone twice as likely to appear in second half of life than in the first half
    // target += neg_binomial_2_lpmf(y | exp(eta), dispersion);
    target += neg_binomial_2_lpmf(y | eta, dispersion);
}
generated quantities {
    vector[N] y_rep;
    vector[N] log_lik;
    for(i in 1:N) {
        // if(eta[i] > 15) {
       //      y_rep[i] = -1;
      //   } else {
      //       y_rep[i] = neg_binomial_2_rng(exp(eta[i]), dispersion[i]);
      //   }
        // y_rep[i] = neg_binomial_2_rng(exp(eta[i]), dispersion[i]);
        y_rep[i] = neg_binomial_2_rng(eta[i], dispersion[i]);
        // log_lik[i] = neg_binomial_2_lpmf(y[i] | exp(eta[i]), dispersion[i]);
        log_lik[i] = neg_binomial_2_lpmf(y[i] | eta[i], dispersion[i]);
    }
}
