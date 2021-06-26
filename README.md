# Yandex practicum

1 Install terrafform
2 Create token

	yc iam create-token
	
3 Create file "credentials.tf"
provider "yandex" {
  token     = "OAuth_token"
  cloud_id  = "cloud-id"
  folder_id = "folder-id"
  zone      = "ru-central1-a"
}

4 Create metadata file for ssh keys


5 terraform validate
6 terraform plan
7 terrform apply 
