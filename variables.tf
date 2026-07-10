
variable "mq_broker" {
  type        = map(any)
  description = "MQ broker details"

  validation {
    condition     = length(var.mq_broker) > 0
    error_message = "mq_broker must not be empty."
  }
}

variable "subnet_ids" {
  description = "Contains subnet ids"
  type        = list(any)

  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "subnet_ids must not be empty."
  }
}

variable "maintenance_window_start_time" {
  description = "Describe the Maintenance window block"
  type        = map(any)
  default = {
    day_of_week = "MONDAY"
    time_of_day = "12:05"
    time_zone   = "GMT"
  }

  validation {
    condition = alltrue([
      contains(["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"], lookup(var.maintenance_window_start_time, "day_of_week", "")),
      can(regex("^(?:[01]\\d|2[0-3]):[0-5]\\d$", lookup(var.maintenance_window_start_time, "time_of_day", ""))),
      length(trimspace(lookup(var.maintenance_window_start_time, "time_zone", ""))) > 0,
    ])
    error_message = "maintenance_window_start_time must include a valid day_of_week (MONDAY..SUNDAY), time_of_day in HH:MM 24-hour format, and non-empty time_zone."
  }
}

variable "vpc_id" {
  description = "The VPC id"
  type        = string

  validation {
    condition     = length(trimspace(var.vpc_id)) > 0
    error_message = "The vpc_id must not be empty."
  }
}

variable "my_config" {
  description = "MQ Config"
  type        = map(any)

  validation {
    condition     = length(var.my_config) > 0
    error_message = "The my_config map must not be empty."
  }
}

variable "username" {
  type        = string
  description = "The username for the ActiveMQ user. This is sensitive and should be handled securely."
  default     = "ExampleUser"

  validation {
    condition     = length(trimspace(var.username)) > 0
    error_message = "The username must not be empty."
  }
}

variable "password" {
  type        = string
  description = "The password for the ActiveMQ user. This is sensitive and should be handled securely."
  sensitive   = true

  validation {
    condition     = length(trimspace(var.password)) > 0
    error_message = "The password must not be empty."
  }
}

variable "ingress" {
  description = "Ingress rules for the broker security group"
  type        = list(any)

  validation {
    condition     = length(var.ingress) > 0
    error_message = "ingress must not be empty."
  }
}

variable "security_group_name" {
  type        = string
  default     = "Broker"
  description = "Broker Security group name"

  validation {
    condition     = length(trimspace(var.security_group_name)) > 0
    error_message = "The security_group_name must not be empty."
  }
}

variable "kms_key_id" {
  description = "KMS key id for encryption (optional). Empty string disables custom key."
  type        = string
  sensitive   = true
  validation {
    condition     = length(trimspace(var.kms_key_id)) > 0 || var.kms_key_id == ""
    error_message = "The kms_key_id must not be empty unless you want to disable custom key."
  }
}

variable "publicly_accessible" {
  description = "Whether the broker should be publicly accessible"
  type        = bool
  default     = false
}
