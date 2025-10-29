## Oldstyle:

+ Fetch
+ sudo bundle update
+ bundle install
+ bundle exec jekyll serve

## Newstyle using docker

+ Fetch
+ modify docker file "if need"
+ build docker image: <code>docker build -t site2jekyl .</code>
+ run it: <code>docker run --rm -p 4001:4000 -v "$(pwd)":/site -v bundle_cache:/gems site2jekyl</code>


### Optionaly create compose file
<code>
services:
  jekyll:
    image: site2jekyl
    build: .
    command: bundle exec jekyll serve --host 0.0.0.0 --watch --force_polling
    ports:
      - "4000:4000"
    volumes:
      - .:/site
      - bundle_cache:/gems

volumes:
  bundle_cache:
</code>