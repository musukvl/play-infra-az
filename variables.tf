variable location {
  default = "West Europe"
}

variable "tags" {
  type = map(string)
  default = {
    type = "test"
  }
}

variable admin_username {
  default = "ary_admin"
}


/*

variable client_id {

}

variable client_secret {

}
*/