FROM ruby:3.2

# Systémové závislosti pro nativní gemy atd.
RUN apt-get update \
    && apt-get install -y build-essential nodejs \
    && rm -rf /var/lib/apt/lists/*

# Pracovní adresář uvnitř kontejneru
WORKDIR /site

# Zkopíruj jen Gemfile a Gemfile.lock (pokud existuje),
# aby se layer s bundle install cachoval.
COPY Gemfile Gemfile.lock* ./

# Nainstaluj bundler + gemy dopředu do /gems
ENV BUNDLE_PATH=/gems
RUN gem install bundler && bundle install

# Defaultní příkaz pro vývoj
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch", "--force_polling"]
