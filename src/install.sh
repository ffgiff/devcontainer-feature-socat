#!/bin/sh
mkdir -p /opt/devcontainer-feature-socat
cat > /opt/devcontainer-feature-socat/entrypoint.sh <<END
for PORT in SOCAT_PORTS
do
    socat TCP-LISTEN:$PORT,fork,reuseaddr TCP:host.containers.internal:$PORT &
done
END

# Create the entrypoint script
chmod +x /opt/devcontainer-feature-socat/entrypoint.sh \
    && chown ${USERNAME}:root /opt/devcontainer-feature-socat/entrypoint.sh
