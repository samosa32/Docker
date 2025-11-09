# Use the official Nginx base image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy zip file into container
COPY childrensapp.zip /usr/share/nginx/html/

# Install unzip utility, remove default nginx files, and extract your app
RUN apt-get update && \
    apt-get install -y unzip && \
    rm -rf /usr/share/nginx/html/* && \
    unzip /usr/share/nginx/html/childrensapp.zip -d /usr/share/nginx/html && \
    rm /usr/share/nginx/html/childrensapp.zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 80
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
