FROM nginx:alpine
# Copy the web files to the default Nginx directory
COPY web/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
