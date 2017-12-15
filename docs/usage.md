# Usage

## `watchmaker` from the CLI

Once watchmaker is :doc:`installed <installation>` and a
:doc:`configuration file <configuration>` has been created (or you have decided
to use the default configuration), using watchmaker as a CLI utility is as
simple as executing `watchmaker`. Below is the output of `watchmaker --help`,
showing the CLI options.

```shell
# watchmaker --help
Usage: watchmaker [OPTIONS]

  Entry point for Watchmaker cli.

Options:
  --version                       Show the version and exit.
  -c, --config TEXT               Path or URL to the config.yaml file.
  -l, --log-level [info|debug|critical|warning|error]
                                  Set the log level. Case-insensitive.
  -d, --log-dir DIRECTORY         Path to the directory where Watchmaker log
                                  files will be saved.
  -n, --no-reboot                 If this flag is not passed, Watchmaker will
                                  reboot the system upon success. This flag
                                  suppresses that behavior. Watchmaker
                                  suppresses the reboot automatically if it
                                  encounters a failure.
  -s, --salt-states TEXT          Comma-separated string of salt states to
                                  apply. A value of 'None' will not apply any
                                  salt states. A value of 'Highstate' will
                                  apply the salt highstate.
  --s3-source                     Use S3 utilities to retrieve content instead
                                  of http/s utilities. Boto3 must be
                                  installed, and boto3 credentials must be
                                  configured that allow access to the S3
                                  bucket.
  -A, --admin-groups TEXT         Set a salt grain that specifies the domain
                                  groups that should have root privileges on
                                  Linux or admin privileges on Windows. Value
                                  must be a colon-separated string. E.g.
                                  "group1:group2"
  -a, --admin-users TEXT          Set a salt grain that specifies the domain
                                  users that should have root privileges on
                                  Linux or admin privileges on Windows. Value
                                  must be a colon-separated string. E.g.
                                  "user1:user2"
  -t, --computer-name TEXT        Set a salt grain that specifies the
                                  computername to apply to the system.
  -e, --env TEXT                  Set a salt grain that specifies the
                                  environment in which the system is being
                                  built. E.g. dev, test, or prod
  -p, --ou-path TEXT              Set a salt grain that specifies the full DN
                                  of the OU where the computer account will be
                                  created when joining a domain. E.g.
                                  "OU=SuperCoolApp,DC=example,DC=com"
  --help                          Show this message and exit.
```

## `watchmaker` as EC2 userdata

Calling watchmaker via EC2 userdata is a variation on using it as a CLI
utility. The main difference is that you must account for installing watchmaker
first, as part of the userdata. Since the userdata syntax and dependency
installation differ a bit on Linux and Windows, we provide methods for each as
examples.

```eval_rst
.. note::

    The ``pip`` commands in the examples are a bit more complex than
    necessarily needed, depending on your use case. In these examples, we are
    taking into account limitations in FIPS support in the default PyPi repo.
    This way the same ``pip`` command works for all platforms.
```

### Linux

For **Linux**, you must ensure `pip` is installed, and then you can install
`watchmaker` from PyPi. After that, run `watchmaker` using any option available
on the [CLI](#watchmaker-from-the-cli). Here is an example:

```shell
#!/bin/sh
PIP_URL=https://bootstrap.pypa.io/get-pip.py
PYPI_URL=https://pypi.org/simple

# Install pip
curl "$PIP_URL" | python - --index-url="$PYPI_URL" wheel==0.29.0

# Install watchmaker
pip install --index-url="$PYPI_URL" --upgrade pip setuptools watchmaker

# Run watchmaker
watchmaker --log-level debug --log-dir=/var/log/watchmaker
```

Alternatively, cloud-config directives can also be used on **Linux**:

```yaml
#cloud-config

runcmd:
  - |
    PIP_URL=https://bootstrap.pypa.io/get-pip.py
    PYPI_URL=https://pypi.org/simple

    # Install pip
    curl "$PIP_URL" | python - --index-url="$PYPI_URL" wheel==0.29.0

    # Install watchmaker
    pip install --index-url="$PYPI_URL" --upgrade pip setuptools watchmaker

    # Run watchmaker
    watchmaker --log-level debug --log-dir=/var/log/watchmaker
```

### Windows

For **Windows**, the first step is to install Python. `Watchmaker` provides a
simple bootstrap script to do that for you. After installing Python, install
`watchmaker` using `pip` and then run it.

```shell
<powershell>
$BootstrapUrl = "https://raw.githubusercontent.com/plus3it/watchmaker/master/docs/files/bootstrap/watchmaker-bootstrap.ps1"
$PythonUrl = "https://www.python.org/ftp/python/3.6.3/python-3.6.3-amd64.exe"
$PypiUrl = "https://pypi.org/simple"

# Download bootstrap file
$BootstrapFile = "${Env:Temp}\$(${BootstrapUrl}.split('/')[-1])"
(New-Object System.Net.WebClient).DownloadFile("$BootstrapUrl", "$BootstrapFile")

# Install python
& "$BootstrapFile" -PythonUrl "$PythonUrl" -Verbose -ErrorAction Stop

# Install watchmaker
pip install --index-url="$PypiUrl" --upgrade pip setuptools watchmaker

# Run watchmaker
watchmaker --log-level debug --log-dir=C:\Watchmaker\Logs
</powershell>
```

## `watchmaker` as a CloudFormation template

Watchmaker can be integrated into a CloudFormation template as well. This
project provides a handful of CloudFormation templates that launch instances or
create autoscaling groups, and that install and execute Watchmaker during the
launch. These templates are intended as examples for you to modify and extend
as you need.

```eval_rst
.. note::

    Note that the links in this section are intended for viewing the templates
    in a web browser. See the `Direct Downloads`_ section for links to the raw
    files.
```

### Cloudformation templates

*   [Linux Autoscale Group][lx-autoscale]
*   [Linux Instance][lx-instance]
*   [Windows Autoscale Group][win-autoscale]
*   [Windows Instance][win-instance]

### Cloudformation parameter-maps

Sometimes it is helpful to define the parameters for a template in a file, and
pass those to CloudFormation along with the template. We call those "parameter
maps", and provide one for each of the templates above.

*   [Linux Autoscale Params][lx-autoscale-params]
*   [Linux Instance Params][lx-instance-params]
*   [Windows Autoscale Params][win-autoscale-params]
*   [Windows Instance Params][win-instance-params]

[lx-autoscale]: https://github.com/plus3it/watchmaker/blob/develop/docs/files/templates/lx-autoscale/watchmaker-lx-autoscale.template
[lx-instance]: https://github.com/plus3it/watchmaker/blob/develop/docs/files/templates/lx-instance/watchmaker-lx-instance.template
[win-autoscale]: https://github.com/plus3it/watchmaker/blob/develop/docs/files/templates/win-autoscale/watchmaker-win-autoscale.template
[win-instance]: https://github.com/plus3it/watchmaker/blob/develop/docs/files/templates/win-instance/watchmaker-win-instance.template

[lx-autoscale-params]: https://github.com/plus3it/watchmaker/blob/develop/docs/files/cfn/parameter-maps/watchmaker-lx-autoscale.params.json
[lx-instance-params]: https://github.com/plus3it/watchmaker/blob/develop/docs/files/cfn/parameter-maps/watchmaker-lx-instance.params.json
[win-autoscale-params]: https://github.com/plus3it/watchmaker/blob/develop/docs/files/cfn/parameter-maps/watchmaker-win-autoscale.params.json
[win-instance-params]: https://github.com/plus3it/watchmaker/blob/develop/docs/files/cfn/parameter-maps/watchmaker-win-instance.params.json

## `watchmaker` as a Terraform template

Watchmaker can be integrated into a Terraform template as well. By wrapping
the example CloudFormation templates within their respective Terraform template
they become deployable and manageable from within the [Terraform cli](https://www.terraform.io/). These templates
are intended as examples for you to modify and extend as you need.

```eval_rst
.. note::

   * These templates assume that the accompanying CloudFormation template
     is in the same directory.

   * The links in this section are intended for viewing the templates
     in a web browser. See the `Direct Downloads`_ section for links to the raw
     files.
```

Variable values can be input interactively via the terraform console or
via a Terraform module. An example Terraform module that calls the
lx-autoscale template is shown below.

```
module "test-lx-instance" {
  source = "github.com/plus3it/watchmaker//docs/files/templates/lx-instance"

  Name      = "tf-watchmaker-lx-autoscale"
  AmiId     = "__AMIID__"
  AmiDistro = "__AMIDISTRO__"
}
```

### Terraform templates

*   [Linux Autoscale Group][dir-lx-autoscale-tf]
*   [Linux Instance][dir-lx-instance-tf]
*   [Windows Autoscale Group][dir-win-autoscale-tf]
*   [Windows Instance][dir-win-instance-tf]


## `watchmaker` as a library

Watchmaker can also be used as a library, as part of another python
application.

```python
import watchmaker

arguments = watchmaker.Arguments()
arguments.config_path = None
arguments.no_reboot = False
arguments.salt_states = 'None'
arguments.s3_source = False

client = watchhmaker.Client(arguments)
client.install()
```

```eval_rst
.. note::

    This demonstrates only a few of the arguments that are available for the
    ``watchmaker.Arguments()`` object. For details on all arguments, see the
    :any:`API Reference <api>`.
```

## Direct downloads

The following links can be used for directly fetching (e.g., via `curl`,
`wget`, etc.) resources previously noted on this page:

|CFN Template Files|CFN Parameter Files|TF Template Files|
|--------------|---------------|---------------|
|[Linux AutoScale][raw-lx-autoscale]|[Linux Autoscale][raw-lx-autoscale-params]|[Linux AutoScale][raw-lx-autoscale-tf]|
|[Linux Instance][raw-lx-instance]|[Linux Instance][raw-lx-instance-params]| [Linux Instance][raw-lx-instance-tf]|
|[Windows Autoscale][raw-win-autoscale]|[Windows Autoscale][raw-win-autoscale-params]|[Windows Autoscale][raw-win-autoscale-tf]|
|[Windows Instance][raw-win-instance]|[Windows Instance][raw-win-instance-params]|[Windows Instance][raw-win-instance-tf]|

[raw-lx-autoscale]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/templates/lx-autoscale/watchmaker-lx-autoscale.template
[raw-lx-instance]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/templates/lx-instance/watchmaker-lx-instance.template
[raw-win-autoscale]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/templates/win-autoscale/watchmaker-win-autoscale.template
[raw-win-instance]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/templates/win-instance/watchmaker-win-instance.template

[raw-lx-autoscale-params]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/cfn/parameter-maps/watchmaker-lx-autoscale.params.json
[raw-lx-instance-params]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/cfn/parameter-maps/watchmaker-lx-instance.params.json
[raw-win-autoscale-params]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/cfn/parameter-maps/watchmaker-win-autoscale.params.json
[raw-win-instance-params]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/cfn/parameter-maps/watchmaker-win-instance.params.json

[dir-lx-autoscale-tf]: https://github.com/plus3it/watchmaker/tree/develop/docs/files/templates/lx-autoscale
[dir-lx-instance-tf]: https://github.com/plus3it/watchmaker/tree/develop/docs/files/templates/lx-instance
[dir-win-autoscale-tf]: https://github.com/plus3it/watchmaker/tree/develop/docs/files/templates/win-autoscale
[dir-win-instance-tf]: https://github.com/plus3it/watchmaker/tree/develop/docs/files/templates/win-instance

[raw-lx-autoscale-tf]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/templates/lx-autoscale/watchmaker-lx-autoscale.tf
[raw-lx-instance-tf]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/templates/lx-instance/watchmaker-lx-instance.tf
[raw-win-autoscale-tf]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/templates/win-autoscale/watchmaker-win-autoscale.tf
[raw-win-instance-tf]: https://raw.githubusercontent.com/plus3it/watchmaker/develop/docs/files/templates/win-instance/watchmaker-win-instance.tf
