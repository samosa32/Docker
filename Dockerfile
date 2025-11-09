# Use the official Nginx base image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy your zip file into a temporary folder
COPY childrensapp.zip /tmp/childrensapp.zip

# Install unzip, clean default files, unzip your app, and clean up
RUN apt-get update && \
    apt-get install -y unzip && \
    rm -rf /usr/share/nginx/html/* && \
    unzip /tmp/childrensapp.zip -d /usr/share/nginx/html && \
    rm /tmp/childrensapp.zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose nginx port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
