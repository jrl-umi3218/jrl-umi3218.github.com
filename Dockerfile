FROM ruby:3.1

WORKDIR /root
ADD Gemfile /root
ADD Gemfile.lock /root
RUN bundle config set system true
RUN bundle install

WORKDIR /site
EXPOSE 4000
ENTRYPOINT [ "bundle", "exec", "jekyll" ]
