# Use the official Nginx base image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy all files from your repo (Dockerfile + childrensapp.zip) into the container
COPY . /usr/share/nginx/html/

# Install unzip, remove default nginx files, unzip childrensapp.zip,
# move its contents to the web root, and clean up
RUN apt-get update && \
    apt-get install -y unzip && \
    rm -rf /usr/share/nginx/html/*default* && \
    unzip /usr/share/nginx/html/childrensapp.zip -d /usr/share/nginx/html/tmp && \
    mv /usr/share/nginx/html/tmp/childrensappwebsitetemplate/* /usr/share/nginx/html/ && \
    rm -rf /usr/share/nginx/html/tmp && \
    rm /usr/share/nginx/html/childrensapp.zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 80
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
#new

