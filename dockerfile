# Use the latest official Nginx image
FROM nginx:latest

# Create the user and group 'llp'
RUN groupadd -r llp && useradd -r -m -g llp llp

# Set the working directory to the home folder of the llp user
WORKDIR /home/llp

# Copy the .jar file from /target to /home/llp
# Assuming you have the jar file in your local 'target' folder
COPY ./target/test.jar /home/llp/

# Copy the setup.sh script to the same location
# Assuming you have the setup.sh in your project directory
COPY ./setup.sh /home/llp/

# Give all permissions to execute the jar and setup.sh
RUN chmod +x /home/llp/test.jar /home/llp/setup.sh

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx when the container is run
CMD ["nginx", "-g", "daemon off;"]
