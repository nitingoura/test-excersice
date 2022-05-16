locals {
  naming_convention = lower(join("-", compact(tolist([var.environment, var.region]))))

  default_tags = (merge(
    tomap({
      "Provisioner" = "terraform",
      "Environment" = "${var.environment}",
      "Region"      = "${var.region}"
    }),
  var.mandatory_tags))

  vpc_name = "${local.naming_convention}-vpc"
}
