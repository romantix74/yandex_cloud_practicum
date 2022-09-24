terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token  =  "AQAAAAAGEVytAATuwbG45A6-XkQ1hI_bHh0dUz4"
  cloud_id  = "b1ghaq177q6g5noa48fh"
  folder_id = "b1g7s2jj07pt6rc3i44m"
  zone      = "ru-central1-a"
}