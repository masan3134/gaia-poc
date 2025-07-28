FROM gitpod/workspace-full

# Sabit Node.js sürümü
RUN nodenv install 18.16.0 && nodenv global 18.16.0
