FROM williamyeh/ansible:1.9-ubuntu12.04
MAINTAINER Robert Yokota

RUN apt-get update -y
RUN apt-get install -y aptitude git
RUN git clone http://github.com/rayokota/provision-angular-dropwizard.git /tmp/ansible

WORKDIR /tmp/ansible
RUN ansible-playbook setup.yml -c local
EXPOSE 22 3000 5000 8080 9000 9292

RUN useradd -ms /bin/bash docker
USER docker
WORKDIR /home/docker
CMD ["bash"]
