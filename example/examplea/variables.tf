variable "vpc_id" {
  type        = string
  description = "Fallback VPC ID if tag lookup returns empty"
  default     = ""

  validation {
    condition     = var.vpc_id == "" || can(regex("^vpc-[0-9a-fA-F]+$", var.vpc_id))
    error_message = "vpc_id must be empty or a valid VPC id (e.g. vpc-123abc)."
  }
}


variable "vpc_name_tag" {
  type        = string
  description = "String to help find VPC"
  default     = "*poc*"

  validation {
    condition     = length(trim(var.vpc_name_tag, " ")) > 0
    error_message = "vpc_name_tag must not be empty."
  }
}

variable "sub_private_tag" {
  type        = string
  description = "String to help find private subnets"
  default     = "*private*"

  validation {
    condition     = length(trim(var.sub_private_tag, " ")) > 0
    error_message = "sub_private_tag must not be empty."
  }
}
