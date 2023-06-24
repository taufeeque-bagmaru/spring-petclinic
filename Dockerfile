# Specify the base image
FROM maven:3.8.4-openjdk-17

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Build the application
RUN mvn clean compile

# Expose the necessary ports
EXPOSE 9000

# Define the command to run the application
CMD ["java", "-jar", "myapp.jar"]
