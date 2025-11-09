# Use the official Nginx base image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy all files from your repo (including the zip)
COPY . /usr/share/nginx/html/

# Install unzip, extract childrensapp.zip, and remove it
RUN apt-get update && \
    apt-get install -y unzip && \
    unzip /usr/share/nginx/html/childrensapp.zip -d /usr/share/nginx/html && \
    rm /usr/share/nginx/html/childrensapp.zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
