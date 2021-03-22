# ---------------------------------------------------------------------------------------------------------------------
# Required inputs
# ---------------------------------------------------------------------------------------------------------------------
variable "compartment_ocid" {
  type        = string
  description = "OCID for the target compartment"
}

variable "vcn_id" {
  type        = string
  description = "OCID for the target VCN"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to file containing SSH public key (used for accessing the host)"
}

variable "region" {
  type        = string
  description = "Region to deploy bastion host"
}

# ---------------------------------------------------------------------------------------------------------------------
# Optional inputs that change functionality
# ---------------------------------------------------------------------------------------------------------------------
variable "vcn_cidr_block" {
  type        = string
  description = "[VCN] CIDR Block"
  default     = "10.0.0.0/16"
}

variable "bastion_cidr_block" {
  type        = string
  description = "[Bastion Subnet] CIDR Block - Should be within the VCN range"
  default     = "10.0.1.0/27"
}

variable "wazuh_tier_cidr_block" {
  type        = string
  description = "[Wazuh] CIDR block - Used in firewall rules to access Wazuh"
  default     = "10.0.1.32/27"
}

variable "wazuh_server_ip" {
  type        = string
  description = "[Wazuh] Server IP address - Needs to be set for Wazuh functionality"
  default     = "UNDEFINED"
}

variable "bastion_instance_shape" {
  type        = string
  description = "[Bastion Instance] Shape"
  default     = "VM.Standard2.2"
}

# ---------------------------------------------------------------------------------------------------------------------
# Ingress and egress rules
# ---------------------------------------------------------------------------------------------------------------------
variable "egress_security_rules_destination" {
  type        = string
  description = "[Bastion Security List] Egress Destination"
  default     = "0.0.0.0/0"
}

variable "egress_security_rules_protocol" {
  type        = string
  description = "[Bastion Security List] Egress Protocol"
  default     = "6"
}

variable "egress_security_rules_stateless" {
  type        = bool
  description = "[Bastion Security List] Egress Stateless"
  default     = false
}

variable "egress_security_rules_tcp_options_destination_port_range_max" {
  description = "[Bastion Security List] Egress TCP Destination Port Range Max"
  default     = 65535
  type        = number
}

variable "egress_security_rules_tcp_options_destination_port_range_min" {
  description = "[Bastion Security List] Egress TCP Destination Port Range Min"
  default     = 1
  type        = number
}

variable "egress_security_rules_tcp_options_source_port_range_max" {
  description = "[Bastion Security List] Egress TCP Source Port Range Max"
  default     = 65535
  type        = number
}

variable "egress_security_rules_tcp_options_source_port_range_min" {
  description = "[Bastion Security List] Egress TCP Source Port Range Min"
  default     = 1
  type        = number
}

variable "egress_security_rules_udp_options_destination_port_range_max" {
  description = "[Bastion Security List] Egress UDP Destination Port Range Max"
  default     = 65535
  type        = number
}

variable "egress_security_rules_udp_options_destination_port_range_min" {
  description = "[Bastion Security List] Egress UDP Destination Port Range Min"
  default     = 1
  type        = number
}

variable "egress_security_rules_udp_options_source_port_range_max" {
  description = "[Bastion Security List] Egress UDP Source Port Range Max"
  default     = 65535
  type        = number
}

variable "egress_security_rules_udp_options_source_port_range_min" {
  description = "[Bastion Security List] Egress UDP Source Port Range Min"
  default     = 1
  type        = number
}

variable "ingress_security_rules_source" {
  description = "[Bastion Security List] Ingress Source"
  default     = "0.0.0.0/0"
  type        = string
}

variable "ingress_security_rules_description" {
  description = "[Bastion Security List] Description"
  default     = "Bastion Security List - Ingress"
  type        = string
}

variable "ingress_security_rules_protocol" {
  description = "[Bastion Security List] Ingress Protocol"
  default     = "6"
  type        = string
}

variable "ingress_security_rules_stateless" {
  description = "[Bastion Security List]"
  type        = bool
  default     = false
}

variable "ingress_security_rules_tcp_options_destination_port_range_max" {
  description = "[Bastion Security List] Ingress TCP Destination Port Range Max"
  default     = 22
  type        = number
}

variable "ingress_security_rules_tcp_options_destination_port_range_min" {
  description = "[Bastion Security List] Ingress TCP Destination Port Range Min"
  default     = 22
  type        = number
}

variable "ingress_security_rules_tcp_options_source_port_range_max" {
  description = "[Bastion Security List] Ingress TCP Source Port Range Max"
  default     = 65535
  type        = number
}

variable "ingress_security_rules_tcp_options_source_port_range_min" {
  description = "[Bastion Security List] Ingress TCP Source Port Range Min"
  default     = 1
  type        = number
}

variable "ingress_security_rules_udp_options_destination_port_range_max" {
  description = "[Bastion Security List] Ingress UDP Destination Port Range Max"
  default     = 22
  type        = number
}

variable "ingress_security_rules_udp_options_destination_port_range_min" {
  description = "[Bastion Security List] Ingress UDP Destination Port Range Min"
  default     = 22
  type        = number
}

variable "ingress_security_rules_udp_options_source_port_range_max" {
  description = "[Bastion Security List] Ingress UDP Source Port Range Max"
  default     = 65535
  type        = number
}

variable "ingress_security_rules_udp_options_source_port_range_min" {
  description = "[Bastion Security List] Ingress UDP Source Port Range Min"
  default     = 1
  type        = number
}


# ---------------------------------------------------------------------------------------------------------------------
# Image to region mapping
# ---------------------------------------------------------------------------------------------------------------------
variable "instance_image_ocid" {
  type = map

  default = {
    # See https://docs.us-phoenix-1.oraclecloud.com/images/
    # Oracle-Autonomous-Linux-7.9
    # Oracle-Autonomous-Linux-7.9-2021.01-0
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaadzbjqqwjzgl7yweoiqbltuh2y7kb4alzyuv4k3mambxpcpiicj3a"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaauitscop5dhasbqkegaju56brylkckgi2wfecct2cuvn4xk33d2wq"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaamv56sieig6vgu7jqg5pber3oe6xwrszjvfdbl2veka5dwrdgomea"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaay6ffduwdwuip5phglsoqrbztdxs5kq2qjt3rgqowksoltnxcjdea"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Bootstrapping setup
# ---------------------------------------------------------------------------------------------------------------------
variable "bootstrap_bucket" {
  type        = string
  description = "Name of the bucket created during bootstrapping."
  default     = "UNDEFINED"
}

variable "bastion_bootstrap_bundle" {
  type        = string
  description = "File name for the bootstrap bundle."
  default     = "UNDEFINED"
}

variable "playbook_name" {
  type        = string
  description = "Playbook name for bastion"
  default     = "oci-rsa-ansible-bastion"
}
