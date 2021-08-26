# ---------------------------------------------------------------------------------------------------------------------
# Get the image id of Oracle Autonomous Linux
# ---------------------------------------------------------------------------------------------------------------------
data "oci_core_images" "autonomous_images" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Oracle Autonomous Linux"
  operating_system_version = var.instance_operating_system_version
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

# ---------------------------------------------------------------------------------------------------------------------
# Get a list of availability domains
# ---------------------------------------------------------------------------------------------------------------------
data "oci_identity_availability_domains" "ad" {
  compartment_id = var.compartment_ocid
}

# ---------------------------------------------------------------------------------------------------------------------
# Bootstrap script and variables
# ---------------------------------------------------------------------------------------------------------------------
data "template_file" bootstrap {
  template = file("${path.module}/userdata/bootstrap")

  vars = {
    bootstrap_bucket = var.bootstrap_bucket
    wazuh_server_ip  = var.wazuh_server_ip
    playbook_name = var.playbook_name
  }
}

data "oci_core_instance" "bastion_host" {
  instance_id = oci_core_instance.bastion.id
}