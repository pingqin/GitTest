#############
#  main.tf
#############
provider "aws" {
  region  = "us-east-1"
}
resource "aws_transfer_user" "transfer_server_user" {
  count = length(keys(var.transfer_server_user_key))
  server_id      = var.transfer_server
  user_name      = element(keys(var.transfer_server_user_key), count.index)
  role           = var.transfer_server_role
  home_directory_type = "LOGICAL"
  home_directory_mappings {
    entry =  "/"
    target = "/${var.bucket_name}"
 }
}
resource "aws_transfer_ssh_key" "transfer_server_ssh_key" {
    count = length(var.transfer_server_user_key)
    server_id = var.transfer_server
    user_name = element(aws_transfer_user.transfer_server_user.*.user_name, count.index)
    body      = element(values(var.transfer_server_user_key), count.index)
    depends_on = [aws_transfer_user.transfer_server_user]
}

##############################
# vars.tf define variables
##############################
variable  "transfer_server" {
    description = "Transfer_server"
    type = string
    default = "s-ad41f033819941279"
}
variable "bucket_name" {
    description = " S3 bucket name"
    type = string
    default = "ohiobucket2/folder2"
}
variable  "transfer_server_role" {
    description = "Transfer_server"
    type = string
    default = "arn:aws:iam::013700525790:role/role_ohb"
}

variable "transfer_server_user_key"  {
    description = "Transfer_server_user_key"
    type = map
}

