# Stage 1 - Build the Rust app
FROM rustlang/rust:nightly AS builder

# Set working directory
WORKDIR /app

# Copy all source code
COPY . .

# Build in release mode
RUN cargo build --release

# Stage 2 - Runtime image with compatible GLIBC
FROM debian:bookworm-slim

# Add necessary shared libraries
RUN apt-get update && apt-get install -y \
    libssl3 \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the built binary from builder stage
COPY --from=builder /app/target/release/nexttalk_backend /usr/local/bin/nexttalk_backend

# Expose the port your app listens on
EXPOSE 8000

# Run the app
CMD ["nexttalk_backend"]
