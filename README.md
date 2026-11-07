# Windows System Administration Lab

## Overview

A hands-on IT portfolio project focused on developing practical Windows system administration skills in a virtualized environment.

The project demonstrates how to manage Windows systems, automate administrative tasks, configure file system permissions, and troubleshoot operating system issues using PowerShell and built-in Windows tools.

All exercises were performed in an isolated Windows 11 virtual machine to provide a safe environment for testing administrative configurations and troubleshooting procedures.

## Lab Environment

| Component | Technology |
|---|---|
| Operating System | Windows 11 Enterprise Evaluation |
| Hypervisor | Oracle VirtualBox |
| Command-Line Shell | PowerShell |
| Code Editor | Visual Studio Code |
| Version Control | Git and GitHub |
| Remote Administration | Remote Desktop Protocol (RDP) |
| Administrator Account | LabAdmin |

## Project Objectives

- Develop practical Windows administration skills.
- Manage Windows services and scheduled tasks.
- Understand local user accounts and NTFS permissions.
- Use PowerShell for system inspection and administration.
- Investigate Windows Event Logs and troubleshoot system issues.
- Practice remote administration in a virtualized environment.
- Document technical procedures and findings using professional Git workflows.

## Labs

### 1. Scheduled Task Automation

Developed a PowerShell script to record execution timestamps and configured Windows Task Scheduler to execute it automatically.

**Key activities:**
- Created and tested a PowerShell logging script.
- Configured scheduled task triggers and execution settings.
- Troubleshot execution policy and battery-related restrictions.
- Verified successful task execution and reviewed task status.

**Documentation:** [Scheduled Task Automation](docs/scheduled-task-automation.md)

**Script:** [Write-ExecutionLog.ps1](scripts/Write-ExecutionLog.ps1)

### 2. NTFS Permissions and Access Control

Configured and tested NTFS permissions using administrator and standard user accounts.

**Key activities:**
- Examined NTFS Access Control Lists (ACLs).
- Investigated permission inheritance.
- Disabled inheritance while preserving existing permissions.
- Configured access restrictions according to the principle of least privilege.
- Verified read, write, and delete permissions using a standard user account.

**Documentation:** [NTFS Permissions and Access Control](docs/ntfs-permissions.md)

### 3. Windows Event Logs Investigation

Investigated Windows system errors, warnings, and startup events using PowerShell.

**Key activities:**
- Queried System, Application, and Security Event Logs.
- Filtered events by severity, Event ID, and timestamp.
- Investigated Windows service errors and verified service status.
- Correlated unexpected shutdown and startup events.
- Examined VirtualBox time synchronization events.
- Investigated DNS resolution timeouts and DCOM warnings.
- Distinguished historical errors from ongoing operational problems.

**Documentation:** [Windows Event Logs Investigation](docs/event-logs.md)

## Additional Administration Exercises

In addition to the documented labs, the following administration tasks were practiced:

- Created and managed local Windows user accounts.
- Examined Windows services, startup types, and dependencies.
- Used PowerShell to inspect processes and system information.
- Configured and tested Remote Desktop access to the virtual machine.
- Practiced administrative troubleshooting using Windows built-in utilities.

## Skills Demonstrated

| Category | Skills |
|---|---|
| Windows Administration | Services, local accounts, scheduled tasks, system configuration |
| PowerShell | Cmdlets, pipelines, filtering, system inspection, scripting |
| Access Control | NTFS permissions, ACLs, inheritance, least privilege |
| Troubleshooting | Event Log analysis, service diagnostics, DNS troubleshooting |
| Virtualization | VirtualBox VM configuration and administration |
| Remote Administration | RDP connectivity and remote system management |
| Version Control | Git branching, commits, pull requests, merges |
| Documentation | Technical procedures, investigation results, Markdown |

## Repository Structure

```text
Windows-System-Administration-Lab/
├── docs/
│   ├── event-logs.md
│   ├── ntfs-permissions.md
│   └── scheduled-task-automation.md
├── scripts/
│   └── Write-ExecutionLog.ps1
└── README.md
```

## Key Takeaways

This project reinforced several important system administration principles:

1. **Verify before modifying:** Investigate the current system state before applying configuration changes.
2. **Apply least privilege:** Grant only the permissions required for users to perform their tasks.
3. **Correlate evidence:** Analyze multiple Event IDs and system observations instead of relying on isolated error messages.
4. **Automate repetitive tasks:** Use PowerShell and Task Scheduler to reduce manual administrative work.
5. **Document investigations:** Record commands, findings, and conclusions to make troubleshooting procedures reproducible.

## Project Status

**Completed**

This project establishes a foundation in Windows system administration and prepares for more advanced infrastructure and automation projects.
