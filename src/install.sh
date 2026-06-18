#!/bin/sh
mkdir -p /opt/devcontainer-feature-socat
for PORT in SOCAT_PORTS
do
    echo socat TCP-LISTEN:$PORT,fork,reuseaddr TCP:host.containers.internal:$PORT \& >> /opt/devcontainer-feature-socat/entrypoint.sh
done
END

# Create the entrypoint script
chmod +x /opt/devcontainer-feature-socat/entrypoint.sh \
    && chown ${USERNAME}:root /opt/devcontainer-feature-socat/entrypoint.sh
