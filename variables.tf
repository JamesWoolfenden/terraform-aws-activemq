variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "mq_broker" {
  default = {
    name               = "example"
    engine_type        = "ActiveMQ"
    engine_version     = "5.15.0"
    host_instance_type = "mq.t2.micro"
  }
}

variable "subnet_ids" {
  type = list
}

variable "logs" {
  type = map
  default = {
    general = "true"
    audit   = "false"
  }
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
  type = string
}
