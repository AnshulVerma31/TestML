FROM trestletech/plumber

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev

RUN R -e 'install.packages(c("devtools"))'
RUN R -e 'install.packages(c("shiny"))'

RUN mkdir -p /app/
WORKDIR /app/
COPY deploy_credit_model.R /app/
COPY decision_tree_for_german_credit_data.RData /app/
CMD ["/app/deploy_credit_model.R"]
