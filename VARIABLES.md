## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.41.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_instance.bastion](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_instance) | resource |
| [oci_core_security_list.bastion_security_list](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_subnet.bastion_subnet](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_images.autonomous_images](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_images) | data source |
| [oci_core_instance.bastion_host](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_instance) | data source |
| [oci_identity_availability_domains.ad](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |
| [template_file.bootstrap](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_bootstrap_bundle"></a> [bastion\_bootstrap\_bundle](#input\_bastion\_bootstrap\_bundle) | File name for the bootstrap bundle. | `string` | `"UNDEFINED"` | no |
| <a name="input_bastion_cidr_block"></a> [bastion\_cidr\_block](#input\_bastion\_cidr\_block) | [Bastion Subnet] CIDR Block - Should be within the VCN range | `string` | `"10.0.1.0/27"` | no |
| <a name="input_bastion_instance_shape"></a> [bastion\_instance\_shape](#input\_bastion\_instance\_shape) | [Bastion Instance] Shape | `string` | `"VM.Standard2.2"` | no |
| <a name="input_bootstrap_bucket"></a> [bootstrap\_bucket](#input\_bootstrap\_bucket) | Name of the bucket created during bootstrapping. | `string` | `"UNDEFINED"` | no |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | OCID for the target compartment | `string` | n/a | yes |
| <a name="input_egress_security_rules_destination"></a> [egress\_security\_rules\_destination](#input\_egress\_security\_rules\_destination) | [Bastion Security List] Egress Destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_egress_security_rules_protocol"></a> [egress\_security\_rules\_protocol](#input\_egress\_security\_rules\_protocol) | [Bastion Security List] Egress Protocol | `string` | `"6"` | no |
| <a name="input_egress_security_rules_stateless"></a> [egress\_security\_rules\_stateless](#input\_egress\_security\_rules\_stateless) | [Bastion Security List] Egress Stateless | `bool` | `false` | no |
| <a name="input_egress_security_rules_tcp_options_destination_port_range_max"></a> [egress\_security\_rules\_tcp\_options\_destination\_port\_range\_max](#input\_egress\_security\_rules\_tcp\_options\_destination\_port\_range\_max) | [Bastion Security List] Egress TCP Destination Port Range Max | `number` | `65535` | no |
| <a name="input_egress_security_rules_tcp_options_destination_port_range_min"></a> [egress\_security\_rules\_tcp\_options\_destination\_port\_range\_min](#input\_egress\_security\_rules\_tcp\_options\_destination\_port\_range\_min) | [Bastion Security List] Egress TCP Destination Port Range Min | `number` | `1` | no |
| <a name="input_egress_security_rules_tcp_options_source_port_range_max"></a> [egress\_security\_rules\_tcp\_options\_source\_port\_range\_max](#input\_egress\_security\_rules\_tcp\_options\_source\_port\_range\_max) | [Bastion Security List] Egress TCP Source Port Range Max | `number` | `65535` | no |
| <a name="input_egress_security_rules_tcp_options_source_port_range_min"></a> [egress\_security\_rules\_tcp\_options\_source\_port\_range\_min](#input\_egress\_security\_rules\_tcp\_options\_source\_port\_range\_min) | [Bastion Security List] Egress TCP Source Port Range Min | `number` | `1` | no |
| <a name="input_egress_security_rules_udp_options_destination_port_range_max"></a> [egress\_security\_rules\_udp\_options\_destination\_port\_range\_max](#input\_egress\_security\_rules\_udp\_options\_destination\_port\_range\_max) | [Bastion Security List] Egress UDP Destination Port Range Max | `number` | `65535` | no |
| <a name="input_egress_security_rules_udp_options_destination_port_range_min"></a> [egress\_security\_rules\_udp\_options\_destination\_port\_range\_min](#input\_egress\_security\_rules\_udp\_options\_destination\_port\_range\_min) | [Bastion Security List] Egress UDP Destination Port Range Min | `number` | `1` | no |
| <a name="input_egress_security_rules_udp_options_source_port_range_max"></a> [egress\_security\_rules\_udp\_options\_source\_port\_range\_max](#input\_egress\_security\_rules\_udp\_options\_source\_port\_range\_max) | [Bastion Security List] Egress UDP Source Port Range Max | `number` | `65535` | no |
| <a name="input_egress_security_rules_udp_options_source_port_range_min"></a> [egress\_security\_rules\_udp\_options\_source\_port\_range\_min](#input\_egress\_security\_rules\_udp\_options\_source\_port\_range\_min) | [Bastion Security List] Egress UDP Source Port Range Min | `number` | `1` | no |
| <a name="input_ingress_security_rules_description"></a> [ingress\_security\_rules\_description](#input\_ingress\_security\_rules\_description) | [Bastion Security List] Description | `string` | `"Bastion Security List - Ingress"` | no |
| <a name="input_ingress_security_rules_protocol"></a> [ingress\_security\_rules\_protocol](#input\_ingress\_security\_rules\_protocol) | [Bastion Security List] Ingress Protocol | `string` | `"6"` | no |
| <a name="input_ingress_security_rules_source"></a> [ingress\_security\_rules\_source](#input\_ingress\_security\_rules\_source) | [Bastion Security List] Ingress Source | `string` | `"0.0.0.0/0"` | no |
| <a name="input_ingress_security_rules_stateless"></a> [ingress\_security\_rules\_stateless](#input\_ingress\_security\_rules\_stateless) | [Bastion Security List] | `bool` | `false` | no |
| <a name="input_ingress_security_rules_tcp_options_destination_port_range_max"></a> [ingress\_security\_rules\_tcp\_options\_destination\_port\_range\_max](#input\_ingress\_security\_rules\_tcp\_options\_destination\_port\_range\_max) | [Bastion Security List] Ingress TCP Destination Port Range Max | `number` | `22` | no |
| <a name="input_ingress_security_rules_tcp_options_destination_port_range_min"></a> [ingress\_security\_rules\_tcp\_options\_destination\_port\_range\_min](#input\_ingress\_security\_rules\_tcp\_options\_destination\_port\_range\_min) | [Bastion Security List] Ingress TCP Destination Port Range Min | `number` | `22` | no |
| <a name="input_ingress_security_rules_tcp_options_source_port_range_max"></a> [ingress\_security\_rules\_tcp\_options\_source\_port\_range\_max](#input\_ingress\_security\_rules\_tcp\_options\_source\_port\_range\_max) | [Bastion Security List] Ingress TCP Source Port Range Max | `number` | `65535` | no |
| <a name="input_ingress_security_rules_tcp_options_source_port_range_min"></a> [ingress\_security\_rules\_tcp\_options\_source\_port\_range\_min](#input\_ingress\_security\_rules\_tcp\_options\_source\_port\_range\_min) | [Bastion Security List] Ingress TCP Source Port Range Min | `number` | `1` | no |
| <a name="input_ingress_security_rules_udp_options_destination_port_range_max"></a> [ingress\_security\_rules\_udp\_options\_destination\_port\_range\_max](#input\_ingress\_security\_rules\_udp\_options\_destination\_port\_range\_max) | [Bastion Security List] Ingress UDP Destination Port Range Max | `number` | `22` | no |
| <a name="input_ingress_security_rules_udp_options_destination_port_range_min"></a> [ingress\_security\_rules\_udp\_options\_destination\_port\_range\_min](#input\_ingress\_security\_rules\_udp\_options\_destination\_port\_range\_min) | [Bastion Security List] Ingress UDP Destination Port Range Min | `number` | `22` | no |
| <a name="input_ingress_security_rules_udp_options_source_port_range_max"></a> [ingress\_security\_rules\_udp\_options\_source\_port\_range\_max](#input\_ingress\_security\_rules\_udp\_options\_source\_port\_range\_max) | [Bastion Security List] Ingress UDP Source Port Range Max | `number` | `65535` | no |
| <a name="input_ingress_security_rules_udp_options_source_port_range_min"></a> [ingress\_security\_rules\_udp\_options\_source\_port\_range\_min](#input\_ingress\_security\_rules\_udp\_options\_source\_port\_range\_min) | [Bastion Security List] Ingress UDP Source Port Range Min | `number` | `1` | no |
| <a name="input_instance_image_id"></a> [instance\_image\_id](#input\_instance\_image\_id) | Provide an Oracle Autonomous Linux image id for bastion host. | `string` | `"Autonomous"` | no |
| <a name="input_instance_operating_system_version"></a> [instance\_operating\_system\_version](#input\_instance\_operating\_system\_version) | the version of Oracle Autonomous Linux | `string` | `"7.9"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy bastion host | `string` | n/a | yes |
| <a name="input_ssh_public_key_path"></a> [ssh\_public\_key\_path](#input\_ssh\_public\_key\_path) | Path to file containing SSH public key (used for accessing the host) | `string` | n/a | yes |
| <a name="input_vcn_cidr_block"></a> [vcn\_cidr\_block](#input\_vcn\_cidr\_block) | [VCN] CIDR Block | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | OCID for the target VCN | `string` | n/a | yes |
| <a name="input_wazuh_server_ip"></a> [wazuh\_server\_ip](#input\_wazuh\_server\_ip) | [Wazuh] Server IP address - Needs to be set for Wazuh functionality | `string` | `"UNDEFINED"` | no |
| <a name="input_wazuh_tier_cidr_block"></a> [wazuh\_tier\_cidr\_block](#input\_wazuh\_tier\_cidr\_block) | [Wazuh] CIDR block - Used in firewall rules to access Wazuh | `string` | `"10.0.1.32/27"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_ip"></a> [bastion\_ip](#output\_bastion\_ip) | Return the public bastion IP address  |
