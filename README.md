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
	terraform {
	  required_providers {
		yandex = {
		  source = "yandex-cloud/yandex"
		}
	  }

	  backend "s3" {
		endpoint   = "storage.yandexcloud.net"
		bucket     = "terraform-object-storage-romantix74"
		region     = "ru-central1"
		key        = "terraform.tfstate"
		access_key = "YOUR_KEY_IDENTIFIER"
		secret_key = "YOUR_KEY"

		skip_region_validation      = true
		skip_credentials_validation = true
	  }
	}

4 Create metadata file for ssh keys


5 terraform validate
6 terraform plan
7 terrform apply 
