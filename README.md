# vagrant-meteor-docker
Vagrant for building meteor into docker containers. 

Terminal One:

> vagrant up

> vagrant ssh

> cd src

> meteor create testApp --release=1.4.2.7

> meteor

Open the meteor app in your web browser running on the host:

> open http://localhost:3000/


NOTE: you can run vagrant rsync-auto in another terminal to synchronize source changes made in the host to the guest.  This
can be useful when you want to use an editor on your host (e.g. Visual Studio Code).  Since you created the meteor appolication
in the guest, you can copy it to the host so you can edit it in your editor:

Terminal One:

> cp -r ~/src/testApp /vagrant/src

And in another terminal, check in your code:

Terminal Two:

> cd src/testApp

> git init

> git add .

> git commit -m "First commit"

> git remote add origin https://github.com/chafey/testApp.git

> git remote -v

> git push orgin master

And then run vagrant-rsync-auto to sync changes from host to guest

Terminal Two: 

> vagrant rsync-auto

