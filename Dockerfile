FROM ruby:3

LABEL Name=bibliophile Version=0.0.1

RUN apt-get update -qq 
RUN apt-get install -y nodejs postgresql-client imagemagick

# Yarn Installation Script
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

WORKDIR /bibliophile
COPY Gemfile /bibliophile/Gemfile
COPY Gemfile.lock /bibliophile/Gemfile.lock
RUN bundle install
COPY . /bibliophile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]