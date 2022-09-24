terraform {
  required_providers {
    yandex = {
      source = "terraform-providers/yandex"
    }
  }
}

provider "yandex" {
  token     = "AQAAAAAGEVytAATuwbG45A6-XkQ1hI_bHh0dUz4"
  cloud_id  = "b1ghaq177q6g5noa48fh"
  folder_id = "b1g7s2jj07pt6rc3i44m"
  zone      = "ru-central1-a"
}

resource "yandex_storage_bucket" "bucket" {
  access_key = "SF6Nl3uPH7Oi3YxKnPnB"
  secret_key = "35aoVpqFYXKjZ6n4_-_4zXpPQ3QAfQznITaO2T-d"
  bucket = "bucket-for-trigger74"
}