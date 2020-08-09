variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "mq_broker" {
  type        = map
  description = "MQ broker details"
}

variable "subnet_ids" {
  description = "Contains subnet ids"
  type        = list
}

variable "audit" {
  description = "To enable audit logging"
  type        = bool
  default     = "false"
}

variable "maintenance_window_start_time" {
  description = "Describe the Maintenance window block"
  type        = map
  default = {
    day_of_week = "MONDAY"
    time_of_day = "12:05"
    time_zone   = "GMT"
  }
}


variable "vpc_id" {
  description = "The VPC id"
  type        = string
}

variable "my_config" {
  description = "MQ Config"
  type        = map
}

variable "mq_username" {
  type    = string
  default = "ExampleUser"
}

variable "logging" {
  description = "To enable Logging to Cloudwatch"
  type        = bool
  default     = true
}

variable "username" {
  type        = string
  description = ""
}

variable "password" {
  type        = string
  description = ""
}

variable "ingress" {
  type    = list
  default = ["0.0.0.0/0"]
}

variable "security_group_name" {
  type        = string
  default     = "Broker"
  description = "Broker Security group name"
}
