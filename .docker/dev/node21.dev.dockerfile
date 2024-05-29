FROM node:21

############################################################################
# Install system commands and libraries
############################################################################
RUN apt-get -y update \
    && apt-get install -y \
       curl \
       wget \
       git \
       zip \
       unzip

############################################################################
# Install Nodemon
############################################################################
RUN npm install -g nodemon

############################################################################
# Create proper security higene for enviornemnt.
# Manage SSH keys https://medium.com/trabe/use-your-local-ssh-keys-inside-a-docker-container-ea1d117515dc
############################################################################
ENV GIT_SSL_NO_VERIFY="1"
RUN useradd -m user \
    && mkdir -p /home/user/.ssh \
    && echo "Host *\n\tStrictHostKeyChecking no\n" >> /home/user/.ssh/config \
    && chown -R user:user /home/user/.ssh \
    && echo "naked\nnaked" | passwd root \
    && echo "alias mysql='mysql --user=root'" >> /home/user/.bashrc

USER user
WORKDIR /app
# Add our script files to the path so they can be found
ENV PATH /app/bin:$PATH
CMD ["/bin/bash"]