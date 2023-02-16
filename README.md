### Dockerized CI 4 App initial build for AccessForAll

### Version 1.1 (Apache based)

## Summary
This package contains the entire tech stack for our project. It should will create all of the services required and will deploy the first MVC build with a A4A landing page. + some extra tools. I've set up persistence on all services that need it, so when you restart the containers data should be preserved.
(please let me know if issues).

## Pre-requisites
Install Docker (https://docs.docker.com/desktop/install/)

## LAMP Stack
```sh
- Linux VM (docker container)
- Apache webserver
- MySQL8 DB
- PHP (CodeIgniter 4 MVC)

#Other bits added:
- PHP Myadmin server - added as there were concerns about DB editor for Macs  (nothing great but it works) - see instructions for access.
```

### Setup Instructions

```sh
## Create a local repo folder

mkdir <localdir>
cd  <localdir>
git clone https://github.com/PSP-Team1/a4a

# Build and launch enviromnent:
cd a4a
docker-compose -f docker-compose.yml up --build

This can take a while - up to an hour (for the first time, while the packages are downloaded)

# Alternative: This mode will detach it from the shell (aka run in bg):
docker-compose -f docker-compose.yml up --build -d 



```

# Installation Output:
![docker containers](https://user-images.githubusercontent.com/93937576/214471580-b0dcb682-c8ee-4b39-b903-4d31fe740e74.png?raw=true)


### Accessing Web applications
```sh
## Main app:
Navigate to: localhost:8888/public

## PHP Myadmin access (DB development)
Navigate to: localhost:8887 
login with username `ci` and password `ci`
```

### Crack on Developing! 😎
```sh
These are the main areas to look at:
- app/controllers
- app/views
- app/models

Note: There are some bits in routing and security bits to look at too. We also need to set up assets repo (CSS, JS etc)
```

## Tips on editing code:
When editing, you can launch VSCode on your local repo (no need to connect to container!)
- All changes will automatically be made on the container (mounted volume)
![image](https://user-images.githubusercontent.com/93937576/214472876-ed577f1b-31a5-4f11-a7db-6b0ba5d7df7c.png)


### How things should look

## Landing page 
- (I just lifted from accessandinclusion.com - client's site), running in dev mode
![alt text](https://user-images.githubusercontent.com/93937576/214467255-02e00f7f-4ba5-4807-b2dc-5e177a6d6741.png?raw=true)

## PHP Myadmin
- DB editor (we'll decommission in production)
![alt text](https://user-images.githubusercontent.com/93937576/214468576-e2992f00-3baa-4108-a5cc-78d5daa249ef.png?raw=true)

![alt text](https://user-images.githubusercontent.com/93937576/214468665-7b3270e9-83c1-4af2-af3d-7b91f4641b3b.png?raw=true)

Example table created (confirmation it is able to write):
![alt text](https://user-images.githubusercontent.com/93937576/214468789-95ebd0c3-2194-48df-b67d-0d840735f928.png?raw=true)


### Other useful bits:
Docker Plugin for VSCode
![alt text](https://user-images.githubusercontent.com/93937576/214469633-add0922b-687a-4c50-b805-0981a619b8a1.png?raw=true)
