variable "name" {
  description = "Name of the instance."
  type        = string
}

variable "region_supernet_map" {
  description = "Map of region to supernet. ie us-east4 = 10.0.0.0/24, us-west1 = 10.1.0.0/24"
  type        = map(string)
}