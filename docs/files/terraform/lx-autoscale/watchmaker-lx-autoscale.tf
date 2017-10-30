#Assumes that watchmaker-lx-autoscale.template is stored in same directory as watchmaker-lx-autoscale.tf

resource "aws_cloudformation_stack" "watchmaker-lx-autoscale" {
name = "tf-watchmaker-lx-autoscale"

parameters {

#ID of the AMI to launch
AmiId = ""

#Linux distro of the AMI
AmiDistro = "CentOS"

#Parameter string to pass to the application script. Ignored if \"AppScriptUrl\" is blank
AppScriptParams = ""

#Shell with which to execute the application script. Ignored if \"AppScriptUrl\" is blank
AppScriptShell = "bash"

#(Optional) Region-based HTTPS URL to the application script in an S3 bucket. Leave blank to launch without an application script. If specified, an appropriate \"InstanceRole\" is required
AppScriptUrl = "https://s3-external-1.amazonaws.com/dicelab-servicenow-test/HelloWorld.sh"

#(Optional) Device to mount an extra EBS volume. Leave blank to launch without an extra application volume
AppVolumeDevice = ""

#Filesystem path to mount the extra app volume. Ignored if \"AppVolumeDevice\" is blank
AppVolumeMountPath = "/opt/data"

#Type of EBS volume to create. Ignored if \"AppVolumeDevice\" is blank
AppVolumeType = "gp2"

#Size in GB of the EBS volume to create. Ignored if \"AppVolumeDevice\" is blank
AppVolumeSize = "1"

#Public/private key pairs allow you to securely connect to your instance after it launches
KeyPairName = ""

#Amazon EC2 instance type
InstanceType = "t2.micro"

#(Optional) IAM instance role to apply to the instance(s)
InstanceRole = ""

#Minimum number of instances in the Autoscaling Group
MinCapacity = "1"

#Maximum number of instances in the Autoscaling Group
MaxCapacity = "2"

#Desired number of instances in the Autoscaling Group
DesiredCapacity = "1"

#Controls whether to assign the instance a public IP. Recommended to leave at \"true\" _unless_ launching in a public subnet
NoPublicIp = "false"

#Controls whether to reboot the instance as the last step of cfn-init execution
NoReboot = "false"

#Controls whether to run yum update during a stack update (on the initial instance launch, Watchmaker _always_ installs updates)
NoUpdates = "false"

#List of security groups to apply to the instance(s)
SecurityGroupIds = ""

#List of subnets to associate to the Autoscaling Group
SubnetIds = ""

#URL to the PyPi Index
PypiIndexUrl = "https://pypi.org/simple"

#(Optional) URL to a Watchmaker config file
WatchmakerConfig = ""

#Environment in which the instance is being deployed
WatchmakerEnvironment = "test"

#(Optional) DN of the OU to place the instance when joining a domain. If blank and \"WatchmakerEnvironment\" enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if \"WatchmakerEnvironment\" is \"false\"
WatchmakerOuPath = ""

#(Optional) Colon-separated list of domain groups that should have admin permissions on the EC2 instance
WatchmakerAdminGroups = ""

#(Optional) Colon-separated list of domain users that should have admin permissions on the EC2 instance
WatchmakerAdminUsers = ""

#Flag that tells watchmaker to use its instance role to retrieve watchmaker content from S3
WatchmakerS3Source = "false"

#(Optional) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com
CfnEndpointUrl = "https://cloudformation.us-east-1.amazonaws.com"

#URL to get-pip.py
CfnGetPipUrl = "https://bootstrap.pypa.io/get-pip.py"

#URL to aws-cfn-bootstrap-latest.tar.gz
CfnBootstrapUtilsUrl = "https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz"

#A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence
ToggleCfnInitUpdate = "A"

#A/B toggle that forces a change to instance userdata, triggering new instances via the Autoscale update policy
ToggleNewInstances = "A"
}
#on_failure = "DO_NOTHING" //DO_NOTHING , ROLLBACK, DELETE

#requires that the template
template_body = "${file("${path.module}/watchmaker-lx-autoscale.template")}"

}
