# 1. Generate an SSH key pair on the client (private + public key)
ssh-keygen -t rsa

# 2. Copy the public key to the remote user's authorized_keys
#    Password may be requested once during this step
ssh-copy-id user@remote_server

# 3. Connect using the private key (no password required)
ssh user@remote_server

# Key files:
# id_rsa     = Private key → stays on the client, never share
# id_rsa.pub = Public key  → copied to the remote server

# Key permissions:
# ~/.ssh = 700
# id_rsa = 600
# authorized_keys = 600
