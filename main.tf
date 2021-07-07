# ---------------------------------------------------------------------------------------------------------------------
# Bastion subnet and security list
# ---------------------------------------------------------------------------------------------------------------------
resource "oci_core_subnet" "bastion_subnet" {
  cidr_block          = var.bastion_cidr_block
  display_name        = "BastionSubnet"
  dns_label           = "bastionsubnet"
  security_list_ids   = [oci_core_security_list.bastion_security_list.id]
  compartment_id      = var.compartment_ocid
  vcn_id              = var.vcn_id
# Commented out to use the default route for the VCN
# route_table_id      = var.route_table_id

  freeform_tags = {
    "Description" = "Bastion subnet"
    "Function"    = "Subnet for bastion resources"
  }
}

resource "oci_core_security_list" "bastion_security_list" {
  compartment_id      = var.compartment_ocid
  vcn_id              = var.vcn_id
  display_name        = "Bastion Security List"
  freeform_tags = {
    "Description" = "Bastion security lists"
    "Function"    = "Ingress and egress rules for bastion service"
  }

  egress_security_rules {
    destination = var.wazuh_tier_cidr_block
    description = "Wazuh agent communication"
    protocol    = 17
    udp_options {
      max = 1514
      min = 1514
    }
  }

  egress_security_rules {
    destination = var.egress_security_rules_destination
    protocol = var.egress_security_rules_protocol
    stateless = var.egress_security_rules_stateless
    tcp_options {
      max = var.egress_security_rules_tcp_options_destination_port_range_max
      min = var.egress_security_rules_tcp_options_destination_port_range_min
      source_port_range {
        max = var.egress_security_rules_tcp_options_source_port_range_max
        min = var.egress_security_rules_tcp_options_source_port_range_min
      }
    }
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol
    source = var.ingress_security_rules_source
    description = var.ingress_security_rules_description
    stateless = var.ingress_security_rules_stateless
    tcp_options {
      max = var.ingress_security_rules_tcp_options_destination_port_range_max
      min = var.ingress_security_rules_tcp_options_destination_port_range_min
      source_port_range {
        max = var.ingress_security_rules_tcp_options_source_port_range_max
        min = var.ingress_security_rules_tcp_options_source_port_range_min
      }
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Create single bastion instance
# ---------------------------------------------------------------------------------------------------------------------
resource "oci_core_instance" "bastion" {
  compartment_id                      = var.compartment_ocid
  availability_domain                 = lookup(data.oci_identity_availability_domains.ad.availability_domains[0],"name")
  shape                               = var.bastion_instance_shape
  is_pv_encryption_in_transit_enabled = true
  display_name                        = "bastion"

  freeform_tags = {
    "Description" = "Bastion host"
    "Function"    = "Allows secure connections for admin work"
  }

  create_vnic_details {
    assign_public_ip = true
    display_name     = "bastion-vnic"
    hostname_label   = "bastion"
    subnet_id        = oci_core_subnet.bastion_subnet.id
  }

  metadata = {
    ssh_authorized_keys = file (var.ssh_public_key_path)
    user_data           = base64encode(data.template_file.bootstrap.rendered)
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.autonomous_images.images.0.id
  }

  launch_options {
    is_pv_encryption_in_transit_enabled = true
    network_type                        = "PARAVIRTUALIZED"
  }

  timeouts {
    create = "10m"
  }
}
