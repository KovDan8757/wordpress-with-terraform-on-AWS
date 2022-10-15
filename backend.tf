terraform {
  backend "s3" {
    //Change to your bucket and create with hand!
    bucket = "academy-bucket-dk" 
    key    = "terraform-statefile"
    region = "us-east-1"
  }
}