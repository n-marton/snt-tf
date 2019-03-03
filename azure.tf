module "sentia-assessment" {
  source = "git::https://github.com/n-marton/snt-tf-modules?ref=v0.1"
  rg_name = "tfrg"
  rg_tags = {
      Company = "Sentia"
      Environment = "Test"
  }
  sa_name = "tfsa"
  vn_addr_space = ["172.16.0.0/12"]
  vn_subnets = ["172.16.1.0/24","172.16.2.0/24","172.16.3.0/24"]
}
