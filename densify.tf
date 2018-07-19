provider "aws" {
  # connect to Densify AWS lab
  region     = "us-east-2"
}
provider "google" {
  project     = "pm-testing-160714"
  region      = "us-central1"
}