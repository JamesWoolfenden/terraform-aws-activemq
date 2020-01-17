resource "aws_mq_configuration" "broker" {
  description    = var.my_config["description"]
  name           = var.my_config["name"]
  engine_type    = var.my_config["engine_type"]
  engine_version = var.my_config["engine_version"]

  data = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
  </plugins>
</broker>
DATA

  tags = var.common_tags

}
