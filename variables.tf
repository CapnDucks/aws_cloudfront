variable "create_distribution" {
  default     = true
  description = "Should cloudFront distribution should be created"
  type        = bool
}

variable "vpc_name" {
  default     = "zone-vpc.us-east-1-*"
  description = "Name of the VPC"
  type        = string
}

variable "domain_name" {
  default     = "renaissance-golabs.com"
  description = "Name of the apex domain"
  type        = string
}

variable "create_origin_access_identity" {
  default     = false
  description = "Should cloudFront origin access identity should be created"
  type        = bool
}

variable "origin_access_identities" {
  description = "CloudFront origin access identities (value is a comment)"
  type        = map(string)
  default     = {}
}

variable "aliases" {
  description = "Alternate domain names for this distribution."
  type        = list(string)
  default     = null
}

variable "comment" {
  description = "Comments to include about the distribution."
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "Default root object that you want CloudFront to return (for example, index.html)"
  type        = string
  default     = "index.html"
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content"
  type        = bool
  default     = true
}

variable "http_version" {
  description = "The maximum HTTP version to support on the distribution"
  type        = string
  default     = "http2"
}

variable "is_ipv6_enabled" {
  description = "Is IPv6 is enabled for the distribution"
  type        = bool
  default     = null
}

variable "price_class" {
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  type        = string
  default     = "PriceClass_100"
}

variable "retain_on_delete" {
  description = "If this is set to 'true', the distribution needs to be deleted manually"
  type        = bool
  default     = false
}

variable "wait_for_deployment" {
  description = "If this is set to 'true', the resource will wait for the distribution status to change from 'In Progress' to 'Deployed'"
  type        = bool
  default     = true
}

variable "web_acl_id" {
  description = "If you're using AWS WAF to filter CloudFront requests, the Id of the AWS WAF web ACL that is associated with the distribution. The WAF Web ACL must exist in the WAF Global (CloudFront) region and the credentials configuring this argument must have waf:GetWebACL permissions assigned. If using WAFv2, provide the ARN of the web ACL."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "origin" {
  description = "One or more origins for this distribution (multiples allowed)."
  type        = any
  default     = null
}

variable "origin_group" {
  description = "One or more origin_group for this distribution (multiples allowed)."
  type        = any
  default     = {}
}

variable "viewer_certificate" {
  description = "The SSL configuration for this distribution"
  type        = any
  default = {
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1"
  }
}

variable "geo_restriction" {
  description = "The restriction configuration for this distribution (geo_restrictions)"
  type        = any
  default     = {}
}

variable "logging_config" {
  description = "The logging configuration that controls how logs are written to your distribution (maximum one)."
  type        = any
  default     = {}
}

variable "custom_error_response" {
  description = "One or more custom error response elements"
  type        = any
  default     = {}
}

variable "default_cache_behavior" {
  description = "The default cache behavior for this distribution"
  type        = any
  default     = null
}

variable "ordered_cache_behavior" {
  description = "An ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0."
  type        = any
  default     = []
}

variable "create_monitoring_subscription" {
  description = "If enabled, the resource for monitoring subscription will created."
  type        = bool
  default     = false
}

variable "realtime_metrics_subscription_status" {
  description = "A flag that indicates whether additional CloudWatch metrics are enabled for a given CloudFront distribution. Valid values are `Enabled` and `Disabled`."
  type        = string
  default     = "Enabled"
}
