##Assumes that watchmaker-win-instance.template is stored in same directory as watchmaker-win-instance.tf

resource "aws_cloudformation_stack" "watchmaker-win-instance" {
name = "tf-watchmaker-win-instance"

parameters {
#ID of the AMI to launch
AmiId = ""

#Parameter string to pass to the application script. Ignored if \"AppScriptUrl\" is blank
AppScriptParams = ""

#Shell with which to execute the application script. Ignored if \"AppScriptUrl\" is blank
AppScriptShell = "powershell"

#(Optional) Region-based HTTPS URL to the application script in an S3 bucket. Leave blank to launch without an application script. If specified, an appropriate \"InstanceRole\" is required
AppScriptUrl = ""

#(Optional) Device to mount an extra EBS volume. Leave blank to launch without an extra application volume
AppVolumeDevice = ""

#Type of EBS volume to create. Ignored if \"AppVolumeDevice\" is blank
AppVolumeType = "gp2"

#Size in GB of the EBS volume to create. Ignored if \"AppVolumeDevice\" is blank
AppVolumeSize = "1"

#Public/private key pairs allow you to securely connect to your instance after it launches
KeyPairName = ""

#(Optional) IAM instance role to apply to the instance(s)
InstanceRole = ""

#Amazon EC2 instance type
InstanceType = "t2.micro"

#(Optional) Set a static, primary private IP. Leave blank to auto-select a free IP
PrivateIp = ""

#Controls whether to assign the instance a public IP. Recommended to leave at \"true\" _unless_ launching in a public subnet
NoPublicIp = "false"

#Controls whether to reboot the instance as the last step of cfn-init execution
NoReboot = "false"

#List of security groups to apply to the instance
SecurityGroupIds = ""

#List of subnets to associate to the Autoscaling Group
SubnetId = ""

#URL to the PyPi Index
PypiIndexUrl = "https://pypi.org/simple"

#URL to the Python Installer Executable
PythonInstaller = "https://www.python.org/ftp/python/3.6.2/python-3.6.2-amd64.exe"

#(Optional) Colon-separated list of domain groups that should have admin permissions on the EC2 instance)
WatchmakerAdminGroups = ""

#(Optional) Colon-separated list of domain users that should have admin permissions on the EC2 instance
WatchmakerAdminUsers = ""

#Flag that tells watchmaker to use its instance role to retrieve watchmaker content from S3
WatchmakerS3Source = "false"

#URL to the Watchmaker PowerShell bootstrapper for Windows",
WatchmakerBootstrapper = ""

#(Optional) URL to a Watchmaker config file",
WatchmakerConfig = ""

#Environment in which the instance is being deployed
WatchmakerEnvironment = "test"

#(Optional) DN of the OU to place the instance when joining a domain. If blank and \"WatchmakerEnvironment\" enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if \"WatchmakerEnvironment\" is \"$false\"
WatchmakerOuPath = ""

#(Optional) Sets the hostname/computername within the OS
WatchmakerComputerName = ""

#(Optional) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com
CfnEndpointUrl = "https://cloudformation.us-east-1.amazonaws.com"

#A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence
ToggleCfnInitUpdate = "A"

}
#on_failure = "DO_NOTHING" #DO_NOTHING , ROLLBACK, DELETE


template_body = "${file("${path.module}/watchmaker-win-instance.template")}"

}
