# Use the official peaceiris image for Hugo 0.141.0 extended
FROM peaceiris/hugo:v0.141.0-full

# Set working directory
WORKDIR /src

# Expose Hugo default port
EXPOSE 1313

# Command to run hugo
CMD ["hugo"]

