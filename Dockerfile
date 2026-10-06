# Use Ubuntu as base image
FROM ubuntu:22.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Copy your website files into Apache web directory
COPY index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
