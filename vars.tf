variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.micro"
    }
    user = {
      name = "user"
      type = "t3.small"
    }
    frontend = {
      name = "frontend"
      type = "t3.micro"
    }
    redis = {
      name = "redis"
      type = "t3.small"
    }
    mysql = {
      name = "mysql"
      type = "t3.micro"
    }
    shipping = {
      name = "shipping"
      type = "t3.small"
    }
    mongodb = {
      name = "mongodb"
      type = "t3.micro"
    }
    cart = {
      name = "cart"
      type = "t3.small"
    }
  }
}