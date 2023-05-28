# A samba Docker image
A lightweight docker image running on samba on Alpine
Make sure to have docker before you start

## Installation 
1. Clone the repository:
```
git clone https://github.com/sivabalansm/samba-docker.git
``` 
2. In the `.env` file, replace `<your-username>` and `<your-password>` with your username and password. You may also replace `/mnt/storage` if you have another location for the storage of your files otherwise it will be created at runtime:
```
USERNAME=<your-username>
PASSWORD=<your-password>
LOCATION=/mnt/storage
```
3. (optional) You can modify the `smb.conf` file to exclude or include shares. By default `<you-username>`, `data` and `guest` shares are created. 

## Usage
1. Run:

```
docker compose up
```
2. Place files and folders using a client of your choice.
