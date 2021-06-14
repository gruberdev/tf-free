output "id" {
 value = module.vpc.vpc_id
}
output "cidr_block" {
 value = module.vpc.vpc_cidr_block
}
output "database_subnets" {
 value = module.vpc.database_subnets
}
output "public_subnets" {
 value = module.vpc.public_subnets
}
