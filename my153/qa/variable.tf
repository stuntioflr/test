variable "aws_access_key_id" {
  description = "AWS ACCESS Key"
  default     = ""
}

variablr "aws_secret_access_key" {
  description = "AWS Secret ACCESS Key"
  default     = ""
}

variable "var.region" {
  description = "AWS Region"
  default     = ""
}

variable "env_name" {
  description = "Environment Name"
  default     = "Dev"
}

variable "ami_id" {
  description = "AMI-ID"
  default     = ""
}

variable "key_name" {
  description = "key-name for instances"
  default     = "t34ak"
}

variable "count" {
  description = "for Instance Count"
  default     = "3"
}

variable "vol_size" {
  description = "Volume Size For Instance"
  default     = "16"
}

variable "cpu_core" {
  description = "Specifying CPU cores"
  type        = list(string)
  default     = ["1", "1", "1"]
}
variable "security_groups" {
  description = "Security Group"
  default     = ""
}
variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["Dev-Author", "Dev-publisher", "Dev-Dispatcher"]
}
