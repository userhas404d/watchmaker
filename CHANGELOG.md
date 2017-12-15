## Changelog

### 0.7.2

**Commit Delta**: [Change from 0.7.1 release](https://github.com/plus3it/watchmaker/compare/0.7.1...0.7.2)

**Released**: 2017.12.13

**Summary**:

*   Installs `futures` only on Python 2 -- no functional changes

### 0.7.1

**Commit Delta**: [Change from 0.7.0 release](https://github.com/plus3it/watchmaker/compare/0.7.0...0.7.1)

**Released**: 2017.12.04

**Summary**:

*   Fixes readthedocs build -- no functional changes

### 0.7.0

**Commit Delta**: [Change from 0.6.6 release](https://github.com/plus3it/watchmaker/compare/0.6.6...0.7.0)

**Released**: 2017.11.21

**Summary**:

*   [[PR #409][409] Provides terraform modules that deploy the watchmaker
    CloudFormation templates
*   [[Issue #418][418]][[PR #419][419]] Adds an `exclude-states` argument to
    the SaltWorker; specified states will be excluded from the salt state
    execution
*   ash-windows-formula
    *   Incorporates security settings from the DISA October quarterly release
*   join-domain-formula
    *   (Windows) Adds WMI method to set DNS search suffix
    *   (Windows) Tests for the EC2Config XML settings file before modifying it
*   scap-formula
    *   (Linux) Distributes scap content from SCAP Security Guide v0.1.36-1
    *   Distributes scap content from the DISA October quarterly release
*   splunkforwarder-formula
    *   Supports configuration of splunk log sources from pillar and grains
        inputs

[409]: https://github.com/plus3it/watchmaker/pull/409
[419]: https://github.com/plus3it/watchmaker/pull/419
[418]: https://github.com/plus3it/watchmaker/issues/418

### 0.6.6

**Commit Delta**: [Change from 0.6.5 release](https://github.com/plus3it/watchmaker/compare/0.6.5...0.6.6)

**Released**: 2017.10.18

**Summary**:

*   ash-linux-formula
    *   (el7) Fixes typos in the firewalld "safety" scripts that resulted in a
        failure when firewalld was reloaded
*   mcafee-agent-formula
    *   (el7) Adds required inbound ports to all firewalld zones, to support
        the event where the default zone is modified from "public"
*   splunkforwarder-formula
    *   (el7) Adds required outbound ports to the OUTPUT chain; previously,
        they were mistakenly being added as inbound rules

### 0.6.5

**Commit Delta**: [Change from 0.6.4 release](https://github.com/plus3it/watchmaker/compare/0.6.4...0.6.5)

**Released**: 2017.09.29

**Summary**:

*   [[PR #391][391]] Updates CloudFormation templates with a parameter that
    exposes the option to use the S3 API and the instance role to retrieve the
    Watchmaker content archive
*   ash-linux-formula
    *   (el7) Updates firewalld "safety" state so that firewalld remains in the
        active state; the prior approach left firewalld dead/inactive, until
        the service was restarted or the system was rebooted

[391]: https://github.com/plus3it/watchmaker/pull/391

### 0.6.4

**Commit Delta**: [Change from 0.6.3 release](https://github.com/plus3it/watchmaker/compare/0.6.3...0.6.4)

**Released**: 2017.09.22

**Summary**:

*   [[PR #381][381]] Restricts `wheel` version on Python 2.6 to be less than or
    equal to 0.29.0, as `wheel` 0.30.0 removed support for py26.

[381]: https://github.com/plus3it/watchmaker/pull/381

### 0.6.3

**Commit Delta**: [Change from 0.6.2 release](https://github.com/plus3it/watchmaker/compare/0.6.2...0.6.3)

**Released**: 2017.08.11

**Summary**:

*   ash-linux-formula
    *   (el7) Includes a "safety" state for firewalld that ensures SSH inbound
        access will remain available, in the event the default zone is set to
        "drop"

### 0.6.2

**Commit Delta**: [Change from 0.6.1 release](https://github.com/plus3it/watchmaker/compare/0.6.1...0.6.2)

**Released**: 2017.08.07

**Summary**:

*   ash-linux-formula
    *   (el6) Improve the method of disabling the sysctl option `ip_forward`,
        to account for the behavior of the `aws-vpc-nat` rpm
*   scap-formula
    *   (elX) Updates openscap security guide content to version 0.1.34-1

### 0.6.1

**Commit Delta**: [Change from 0.6.0 release](https://github.com/plus3it/watchmaker/compare/0.6.0...0.6.1)

**Released**: 2017.08.01

**Summary**:

*   ash-linux-formula
    *   Modified the FIPS custom execution module to discover the boot
        partition and add the `boot=` line to the grub configuration

### 0.6.0

**Commit Delta**: [Change from 0.5.1 release](https://github.com/plus3it/watchmaker/compare/0.5.1...0.6.0)

**Released**: 2017.07.25

**Summary**:

*   ash-linux-formula
    *   Updates the EL7 stig baseline to manage the FIPS state. The state
        defaults to `enabled` but can be overridden via a pillar or grain,
        `ash-linux:lookup:fips-state`. The grain takes precedence over the
        pillar. Valid values are `enabled` or `disabled`
*   ash-windows-formula
    *   Updates the STIG baselines for Windows Server 2016 member servers and
        domain controllers with SCAP content from the DISA v1r1 SCAP benchmark
        release
*   join-domain-formula
    *   Fixes an issue when joining Windows 2016 servers to a domain, where the
        Set-DnsSearchSuffix.ps1 helper would fail because the builtin
        PowerShell version does not work when `$null` is used in a ValidateSet.
        The equivalent value must now be passed as the string, `"null"`
*   scap-formula
    *   Adds SCAP content for the Window Server 2016 SCAP v1r1 Benchmark

### 0.5.1

**Commit Delta**: [Change from 0.5.0 release](https://github.com/plus3it/watchmaker/compare/0.5.0...0.5.1)

**Released**: 2017.07.08

**Summary**:

*   [[Issue #341][341]][[PR #342][342]] Manages selinux around salt state
    execution. In some non-interactive execution scenarios, if selinux is
    enforcing it can interfere with the execution of privileged commands (that
    otherwise work fine when executed interactively). Watchmaker now detects if
    selinux is enforcing and temporarily sets it to permissive for the duration
    of the salt state execution

[342]: https://github.com/plus3it/watchmaker/pull/342
[341]: https://github.com/plus3it/watchmaker/issues/341

### 0.5.0

**Commit Delta**: [Change from 0.4.4 release](https://github.com/plus3it/watchmaker/compare/0.4.4...0.5.0)

**Released**: 2017.06.27

**Summary**:

*   [[Issue #331][331]][[PR #332][332]] Writes the `role` grain to the key
    expected by the ash-windows formula. Fixes usage of the `--ash-role` option
    in the salt worker
*   [[Issue #329][329]][[PR #330][330]] Outputs watchmaker version at the debug
    log level
*   [[Issue #322][322]][[PR #323][323]][[PR #324][324]] Fixes py2/py3
    compatibility bug in how the yum worker handles file opening to check the
    Linux distro
*   [[Issue #316][316]][[PR #320][320]] Improves logging when salt state
    execution fails due to failed a state. The salt output is now returned to
    the salt worker, which processes the output, identifies the failed state,
    and raises an exception with the state failure
*   join-domain-formula
    *   (Linux) Reworks the pbis config states to make the logged output more
        readable

[332]: https://github.com/plus3it/watchmaker/pull/332
[331]: https://github.com/plus3it/watchmaker/issues/331
[330]: https://github.com/plus3it/watchmaker/pull/330
[329]: https://github.com/plus3it/watchmaker/issues/329
[324]: https://github.com/plus3it/watchmaker/pull/324
[323]: https://github.com/plus3it/watchmaker/pull/323
[322]: https://github.com/plus3it/watchmaker/issues/322
[320]: https://github.com/plus3it/watchmaker/pull/320
[316]: https://github.com/plus3it/watchmaker/issues/316

### 0.4.4

**Commit Delta**: [Change from 0.4.3 release](https://github.com/plus3it/watchmaker/compare/0.4.3...0.4.4)

**Released**: 2017.05.30

**Summary**:

*   join-domain-formula
    *   (Linux) Ignores a bad exit code from pbis config utility. The utility
        will return exit code 5 when modifying the NssEnumerationEnabled
        setting, but still sets the requested value. This exit code is now
        ignored

### 0.4.3

**Commit Delta**: [Change from 0.4.2 release](https://github.com/plus3it/watchmaker/compare/0.4.2...0.4.3)

**Released**: 2017.05.25

**Summary**:

*   name-computer-formula
    *   (Linux) Uses an alternate method of working around a bad code-path in
        salt that does not handle quoted values in /etc/sysconfig/network.

### 0.4.2

**Commit Delta**: [Change from 0.4.1 release](https://github.com/plus3it/watchmaker/compare/0.4.1...0.4.2)

**Released**: 2017.05.19

**Summary**:

*   [[PR #301][301]] Sets the grains for admin_groups and admin_users so the
    keys are named as expected by the join-domain formula
*   ash-linux-formula
    *   Adds a custom module that lists users from the shadow file
    *   Gets local users from the shadow file rather than `user.list_users`.
        Prevents a domain-joined system from attempting to iterate over all
        domain users (and potentially deadlocking on especially large domains)
*   join-domain-formula
    *   Modifies PBIS install method to use RPMs directly, rather than the
        SHAR installer
    *   Updates approaches to checking for collisions and current join status
        to better handle various scenarios: not joined, no collision; not
        joined, collision; joined, computer object present; joined, computer
        object missing
    *   Disables NSS enumeration to prevent PBIS from querying user info from
        the domain for every call to getent (or equivalents); domain-based
        user authentication still works fine
*   name-computer-formula
    *   (Linux) Does not attempt to retain network settings, to avoid a bug in
        salt; will be revisited when a patched salt version has been released

[301]: https://github.com/plus3it/watchmaker/pull/301

### 0.4.1

**Commit Delta**: [Change from 0.4.0 release](https://github.com/plus3it/watchmaker/compare/0.4.0...0.4.1)

**Released**: 2017.05.09

**Summary**:

*   (EL7) Running _watchmaker_ against EL7 systems will now pin the resulting
    configuration to the watchmaker version. See the updates to the two
    formulas in this version. Previously, _ash-linux_ always used the content
    from the `scap-security-guide` rpm, which was updated out-of-sync with
    _watchmaker_, and so the resulting configuration could not be pinned by
    pinning the _watchmaker_ version. With this version, _ash-linux_ uses
    content distributed by _watchmaker_, via _scap-formula_, and so the
    resulting configuration will always be same on EL7 for a given version of
    _watchmaker_ (as has always been the case for the other supported
    operating systems).
*   ash-linux-formula
    *   Supports getting scap content locations from pillar
*   scap-formula
    *   Updates stig content with latest benchmark versions
    *   Adds openscap ds.xml content, used to support remediate actions

### 0.4.0

**Commit Delta**: [Change from 0.3.1 release](https://github.com/plus3it/watchmaker/compare/0.3.1...0.4.0)

**Released**: 2017.05.06

**Summary**:

*   [[PR #286 ][286]] Sets the computername grain with the correct key expected
    by the formula
*   [[PR #284 ][284]] Converts cli argument parsing from `argparse` to `click`.
    This modifies the `watchmaker` depedencies, which warranted a 0.x.0 version
    bump. Cli and API arguments remain the same, so the change should be
    backwards-compatible.
*   name-computer-formula
    *   Adds support for getting the computername from pillar
    *   Adds support for validating the specified computername against a
        pattern
*   pshelp-formula
    *   Attempts to address occasional stack overflow exception when updating
        powershell help

[286]: https://github.com/plus3it/watchmaker/pull/286
[284]: https://github.com/plus3it/watchmaker/pull/284

### 0.3.1

**Commit Delta**: [Change from 0.3.0 release](https://github.com/plus3it/watchmaker/compare/0.3.0...0.3.1)

**Released**: 2017.05.01

**Summary**:

*   [[PR #280][280]] Modifies the dynamic import of boto3 to use only absolute
    imports, as the previous approach (attempt absolute and relative import)
    was deprecated in Python 3.3
*   ntp-client-windows-formula:
    *   Stops using deprecated arguments on reg.present states, which cleans up
        extraneous log messages in watchmaker runs under some configurations
*   join-domain-formula:
    *   (Windows) Sets the DNS search suffix when joining the domain, including
        a new pillar config option, `ec2config` to enable/disable the EC2Config
        option that also modifies the DNS suffix list.

[280]: https://github.com/plus3it/watchmaker/pull/280

### 0.3.0

**Commit Delta**: [Change from 0.2.4 release](https://github.com/plus3it/watchmaker/compare/0.2.4...0.3.0)

**Released**: 2017.04.24

**Summary**:

*   [[Issue #270][270]] Defaults to a platform-specific log directory when
    call from the CLI:
    *   Windows: `${Env:SystemDrive}\Watchmaker\Logs`
    *   Linux: `/var/log/watchmaker`
*   [[PR #271][271]] Modifies CLI arguments to use explicit log-levels rather
    than a verbosity count. Arguments have been adjusted to better accommodate
    the semantics of this approach:
    *   Uses `-l|--log-level` instead of `-v|--verbose`
    *   `-v` and `-V` are now both used for `--version`
    *   `-d` is now used for `--log-dir`

[271]: https://github.com/plus3it/watchmaker/pull/271
[270]: https://github.com/plus3it/watchmaker/issues/270

### 0.2.4

**Commit Delta**: [Change from 0.2.3 release](https://github.com/plus3it/watchmaker/compare/0.2.3...0.2.4)

**Released**: 2017.04.20

**Summary**:

*   Fixes a bad version string

### 0.2.3

**Commit Delta**: [Change from 0.2.2 release](https://github.com/plus3it/watchmaker/compare/0.2.2...0.2.3)

**Released**: 2017.04.20

**Summary**:

*   [[Issue #262][262]] Merges lists in pillar files, rather than overwriting
    them
*   [[Issue #261][261]] Manages the enabled/disabled state of the salt-minion
    service, before and after the install
*   splunkforwarder-formula
    *   (Windows) Ignores false bad exits from Splunk clone-prep-clear-config

[262]: https://github.com/plus3it/watchmaker/issues/262
[261]: https://github.com/plus3it/watchmaker/issues/261

### 0.2.2

**Commit Delta**: [Change from 0.2.1 release](https://github.com/plus3it/watchmaker/compare/0.2.1...0.2.2)

**Released**: 2017.04.15

**Summary**:

*   [[PR #251][251]] Adds CloudFormation templates that integrate Watchmaker
    with an EC2 instance or Autoscale Group
*   join-domain-formula
    *   (Linux) Corrects tests that determine whether the instance is already
        joined to the domain

[251]: https://github.com/plus3it/watchmaker/pull/251

### 0.2.1

**Commit Delta**: [Change from 0.2.0 release](https://github.com/plus3it/watchmaker/compare/0.2.0...0.2.1)

**Released**: 2017.04.10

**Summary**:

*   ash-linux-formula
    *   Reduces spurious stderr output
    *   Removes notify script flagged by McAfee scans
*   splunkforwarder-formula
    *   (Windows) Clears system name entries from local Splunk config files

### 0.2.0

**Commit Delta**: [Change from 0.1.7 release](https://github.com/plus3it/watchmaker/compare/0.1.7...0.2.0)

**Released**: 2017.04.06

**Summary**:

*   [[Issue #238][238]] Captures all unhandled exceptions and logs them
*   [[Issue #234][234]] Stops the salt service prior to managing salt formulas,
    to ensure that the filesystem does not throw any errors about the files
    being locked
*   [[Issue #72][72]] Manages salt service so the service state after
    watchmaker completes is the same as it was prior to running watchmaker. If
    the service was running beforehand, it remains running afterwards. If the
    service was stopped (or non-existent) beforehad, the service remains
    stopped afterwards
*   [[Issue #163][163]] Modifies the `user_formulas` config option to support
    a map of `<formula_name>:<formula_url>`
*   [[PR #235][235]] Extracts salt content to the same target `srv` location
    for both Window and Linux. Previously, the salt content was extracted to
    different points in the filesystem hierarchy, which required different
    content for Windows and Linux. Now the same salt content archive can be
    used for both
*   [[PR #242][242]] Renames salt worker param `content_source` to
    `salt_content`
*   systemprep-formula
    *   Deprecated and removed. Replaced by new salt content structure that
        uses native salt capabilities to map states to a system
*   scc-formula
    *   Deprecated and removed. Replaced by scap-formula
*   scap-formula
    *   New bundled salt formula. Provides SCAP scans using either `openscap`
        or `scc`
*   pshelp-formula
    *   New bundled salt formula. Installs updated PowerShell help content to
        Windows systems

[242]: https://github.com/plus3it/watchmaker/pull/242
[235]: https://github.com/plus3it/watchmaker/pull/235
[163]: https://github.com/plus3it/watchmaker/issues/163
[72]: https://github.com/plus3it/watchmaker/issues/72
[234]: https://github.com/plus3it/watchmaker/issues/234
[238]: https://github.com/plus3it/watchmaker/issues/238

### 0.1.7

**Commit Delta**: [Change from 0.1.6 release](https://github.com/plus3it/watchmaker/compare/0.1.6...0.1.7)

**Released**: 2017.03.23

**Summary**:

*   Uses threads to stream stdout and stderr to the watchmaker log when
    executing a command via subproces
*   [[Issue #226][226]] Minimizes salt output of successful states, to
    make it easier to identify failed states
*   join-domain-formula
    *   (Linux) Exits with stateful failure on a bad decryption error
*   mcafee-agent-formula
    *   (Linux) Avoids attempting to diff a binary file
    *   (Linux) Installs `ed` as a dependency of the McAfee VSEL agent
*   scc-formula
    *   Retries scan up to 5 times if scc exits with an error

[226]: https://github.com/plus3it/watchmaker/issues/226

### 0.1.6

**Commit Delta**: [Change from 0.1.5 release](https://github.com/plus3it/watchmaker/compare/0.1.5...0.1.6)

**Released**: 2017.03.16

**Summary**:

*   ash-linux-formula
    *   Provides same baseline states for both EL6 and EL7

### 0.1.5

**Commit Delta**: [Change from 0.1.4 release](https://github.com/plus3it/watchmaker/compare/0.1.4...0.1.5)

**Released**: 2017.03.15

**Summary**:

*   ash-linux-formula
    *   Adds policies to disable insecure Ciphers and MACs in sshd_config
*   ash-windows-formula
    *   Adds `scm` and `stig` baselines for Windows 10
    *   Adds `scm` baseline for Windows Server 2016 (Alpha)
    *   Updates all `scm` and `stig` baselines with latest content
*   mcafee-agent-formula
    *   Uses firewalld on EL7 rather than iptables
*   scc-formula
    *   Skips verification of GPG key when install SCC RPM
*   splunkforwarder-formula
    *   Uses firewalld on EL7 rather than iptables

### 0.1.4

**Commit Delta**: [Change from 0.1.3 release](https://github.com/plus3it/watchmaker/compare/0.1.3...0.1.4)

**Released**: 2017.03.09

**Summary**:

*   [[Issue #180][180]] Fixes bug where file_roots did not contain formula paths

[180]: https://github.com/plus3it/watchmaker/issues/180

### 0.1.3

**Commit Delta**: [Change from 0.1.2 release](https://github.com/plus3it/watchmaker/compare/0.1.2...0.1.3)

**Released**: 2017.03.08

**Summary**:

*   [[Issue #164][164]] Aligns cli syntax for extra_arguments with other cli opts
*   [[Issue #165][165]] Removes ash_role from default config file
*   [[Issue #173][173]] Fixes exception when re-running watchmaker

[173]: https://github.com/plus3it/watchmaker/issues/173
[164]: https://github.com/plus3it/watchmaker/issues/164
[165]: https://github.com/plus3it/watchmaker/issues/165

### 0.1.2

**Commit Delta**: [Change from 0.1.1 release](https://github.com/plus3it/watchmaker/compare/0.1.1...0.1.2)

**Released**: 2017.03.07

**Summary**:

*   Adds a FAQ page to the docs
*   Moves salt formulas to the correct location on the local filesystem
*   join-domain-formula:
    *   (Linux) Modifies decryption routine for FIPS compliance
*   ash-linux-formula:
    *   Removes several error exits in favor of warnings
    *   (EL7-alpha) Various patches to improve support for EL7
*   dotnet4-formula:
    *   Adds support for .NET 4.6.2
    *   Adds support for Windows Server 2016
*   emet-formula:
    *   Adds support for EMET 5.52

### 0.1.1

**Commit Delta**: [Change from 0.1.0 release](https://github.com/plus3it/watchmaker/compare/0.1.0...0.1.1)

**Released**: 2017.02.28

**Summary**:

*   Adds more logging messages when downloading files

### 0.1.0

**Commit Delta**: N/A

**Released**: 2017.02.22

**Summary**:

*   Initial release!
