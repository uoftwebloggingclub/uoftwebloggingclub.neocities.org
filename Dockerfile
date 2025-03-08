# Use an official Ruby image as a base
FROM ruby:3.2

# Install dependencies
RUN apt-get update && apt-get install -y faketime

# Set the working directory
WORKDIR /app

# Copy the Gemfile
COPY Gemfile ./

# Install gems
RUN bundle install

# Copy the rest of the project files
COPY . .

# Expose port 4000 for Jekyll
EXPOSE 4000

# Default command to run Jekyll server
RUN chmod +x runlocal.sh
CMD ["./runlocal.sh"]
