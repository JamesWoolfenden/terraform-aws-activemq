variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}
variable "vpc_name_tag" {
  type        = string
  description = "String to help find VPC"
  default     = "*poc*"
}
variable "sub_private_tag" {
  type        = string
  description = "String to help find private subnets"
  default     = "*private*"
}
variable "sub_public_tag" {
  type        = string
  description = "String to help find public subnets"
  default     = "*public*"
}
