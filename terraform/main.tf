provider "aws" {
  region = var.aws_region
}

module "create-one-sns-topic" {
  //source = "./sns"
  source = "git::ssh://git@github.com/kotireddy555/modules.git//sns?ref=master"

  display_name = var.display_name
  name = var.name
  subscribe_identifiers = var.subscribe_identifiers
  publish_identifiers = var.publish_identifiers
}

variable "aws_region" {default = "us-west-2"}

#SNS
variable "name" {
  description = "The SNS Topic's name"
  default = "test-sns-topic"
}

variable "display_name" {
  description = "The SNS Topic's display name"
  default = "test-sns-topic"
}

variable "subscribe_identifiers" {
  type = list(string)
  description = "List of AWS user or role ARNs that have permissions to subscribe to the SNS topic."
  default = ["592144301084"]
}

variable "publish_identifiers" {
  type = list(string)
  description = "List of AWS user or role ARNs that have permission to publish to the SNS topic"
  default = ["592144301084"]
}