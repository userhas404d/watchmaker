# watchmaker

Applied Configuration Management

--------------

## Overview

Watchmaker is intended to help provision a system from its initial installation
to its final configuration. It was inspired by a desire to eliminate static
system images with embedded configuration settings (e.g. gold disks) and the
pain associated with maintaining them.

Watchmaker works as a sort of task runner. It consists of "_managers_" and
"_workers_". A _manager_ implements common methods for multiple platforms
(Linux, Windows, etc). A _worker_ exposes functionality to a user that helps
bootstrap and configure the system. _Managers_ are primarily internal
constructs; _workers_ expose configuration artifacts to users. Watchmaker then
uses a common :doc:`configuration file <configuration>` to determine what
_workers_ to execute on each platform.

## Contents

```eval_rst
.. toctree::
    :maxdepth: 1

    installation.md
    configuration.md
    usage.md
    faq.md
    api.md
    contributing.rst
    changelog.rst
```

## Supported Operating Systems

*   Enterprise Linux 7 (RHEL/CentOS/etc)
*   Enterprise Linux 6 (RHEL/CentOS/etc)
*   Windows Server 2016
*   Windows Server 2012 R2
*   Windows Server 2008 R2
*   Windows 10
*   Windows 8.1

## Supported Python Versions

*   Python 3.3 and later
*   Python 2.6 and later
