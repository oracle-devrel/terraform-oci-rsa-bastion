# ---------------------------------------------------------------------------------------------------------------------
# Return the public bastion IP address
# ---------------------------------------------------------------------------------------------------------------------
output "bastion_ip" {
  value = data.oci_core_instance.bastion_host.public_ip
}