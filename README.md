Vagrant + gcloud (GAE) + python
==============

Google App Engine (and related) provides solid cloud hosting for the masses, but as i was unable to find any vagrant boxes that uses the new gcloud SDK, i made one.

This is a lightweight Vagrant box for setting up the new gcloud SDK with python installed and support for GAE modules, running on Ubuntu 14.04.1 LTS. It comes with [Darth-Vendor](https://github.com/jonparrott/Darth-Vendor), an easy python vendoring helper, for sand-boxed environments like GAE. For provisioning, we use old-school bash scripts as its light and transparent.

**App Engine Modules**  
The new Google Cloud infrastructure supports App Engine modules that that lets developers factor large applications into logical components that can share stateful services and communicate in a secure fashion. See more: https://cloud.google.com/appengine/docs/python/modules/

**Directory structure**  
Each module resides in its own root folder, e.g. /module1. To get you easy started, I've made an /app dir for your first module (feel free to rename/change it).

Setup & installation
--------------

Make sure you have the following installed

- virtualbox
- vagrant

0) **Create a GAE project** on http://console.developers.google.com

1) **Clone this git rep** to your local machine and cd into it

2) Get the **box up and running** by provisioning and booting the vagrant machine

    vagrant up

3) It's alive! **Lets dive in by ssh'ing** in as user 'vagrant'

	vagrant ssh

4) **Authenticate the gcloud CLI** to your google account

	gcloud auth login

5) **Define the GAE project name** for the gcloud utility to use (as set up in Google Console)

	gcloud config set project 'your-name'

6) Get the **dev app-server online** by running (replace "app" with any module)

	app-server app

You should now be able to see the running webserver by opening chrome to `http://localhost:8080` - hurray!

Note that you can also start multiple of the modules at the same time by running e.g. `app-server module1 module2 module3`. Then each app module will run on its own port, starting from :8080 up to :8089.

7) When you're ready to **deploy your changes**, you can do it by running (replace "app" with any module)

	app-deploy app

8) All other **gcloud utility commands** (see https://cloud.google.com/sdk/gcloud/) are available under

	gcloud your-command-here
