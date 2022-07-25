variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "resourcegroup" {
  type = string
  default = "wordpressrg"
}

variable "local" {
  type = string
  default = "West US 3"
}