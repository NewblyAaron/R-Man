# Use Ruby 3.1.2 version
FROM ruby:3.1.2

# Install needed dependencies
RUN apt-get update -qq && apt-get install -y build-essential nodejs sqlite3

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Setup the Rails files
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

# Expose the port
EXPOSE 3000

# Run "bash" so it automatically goes to shell
CMD ["rails", "server", "-b", "0.0.0.0"]