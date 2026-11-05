# Scheduled Task Automation

## Objective

Automate the execution of a PowerShell script using Windows Task Scheduler and verify successful execution through a log file.

## Environment

The lab was performed in an isolated virtual environment to safely practice Windows system administration without affecting the host operating system.

| Component | Technology |
|---|---|
| Host Operating System | Windows 11 |
| Virtualization Platform | Oracle VirtualBox |
| Guest Operating System | Windows 11 Enterprise Evaluation |
| Scripting Language | PowerShell |
| Development Environment | Visual Studio Code |
| Version Control | Git and GitHub |
| Documentation Format | Markdown |

PowerShell scripts and documentation were developed on the host machine using Visual Studio Code. A VirtualBox shared folder provided access to the project files from the guest operating system, where scripts were deployed, executed, and tested.

## Implementation

### PowerShell Execution Logging

A PowerShell script named `Write-ExecutionLog.ps1` was developed to record execution timestamps in a persistent log file.

The script performs the following operations:

1. Retrieves the current system date and time.
2. Displays the timestamp in the PowerShell console.
3. Appends a timestamped execution message to `C:\AdminLab\execution.log`.

The script is stored in the repository under `scripts/` and deployed to `C:\AdminLab\Scripts\` inside the virtual machine.

### Scheduled Task Configuration

Windows Task Scheduler was configured to execute the PowerShell script automatically using the following settings:

| Setting | Configuration |
|---|---|
| Task Name | `AdminLab-ExecutionLog` |
| Executable | `powershell.exe` |
| Script Path | `C:\AdminLab\Scripts\Write-ExecutionLog.ps1` |
| Trigger | Daily at 09:00 |
| User Account | `LabAdmin` |
| Logon Type | Interactive |
| Run Level | Limited |
| Battery Restrictions | Disabled |

The task was configured to run under the interactive user session without requiring elevated privileges.

## Testing and Verification

The PowerShell script was initially executed manually to verify that it successfully created and updated the execution log.

The scheduled task was then executed manually using PowerShell:

```powershell
Start-ScheduledTask -TaskName "AdminLab-ExecutionLog"
```

The execution log was inspected using:

```powershell
Get-Content "C:\AdminLab\execution.log"
```

The log contained timestamped entries confirming successful script execution.

### Scheduled Task Verification

The task's execution status and scheduling information were retrieved using:

```powershell
Get-ScheduledTaskInfo -TaskName "AdminLab-ExecutionLog" |
    Select-Object LastRunTime, NextRunTime, LastTaskResult
```

The following results were recorded:

| Property | Result |
|---|---|
| Last Run | 2026-11-05 01:56:02 |
| Next Scheduled Run | 2026-11-06 09:00:00 |
| Last Task Result | `0` |

A `LastTaskResult` value of `0` indicates that the previous task execution completed successfully.

**Verification Status:** Manual script execution and scheduled-task execution were successful. The daily trigger was configured and its next execution time confirmed. Execution at the scheduled time has not yet been observed.

## Troubleshooting

### PowerShell Execution Policy

**Issue:** The PowerShell script initially failed to execute because script execution was restricted.

**Cause:** The effective PowerShell execution policy prevented `.ps1` files from running.

**Resolution:** The execution policy was configured for the current user:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

This allowed locally created PowerShell scripts to execute without changing the execution policy for all users.

**Note:** PowerShell execution policies help prevent accidental script execution but are not a security boundary.

### Scheduled Task Battery Restrictions

**Issue:** During earlier Task Scheduler testing, the `AdminLab-Notepad` task remained in the `Queued` state instead of executing.

**Cause:** Windows detected a battery-powered environment, and the task's default settings prevented execution while running on battery power.

**Resolution:** Battery-related execution restrictions were disabled using:

```powershell
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
```

The updated settings were applied to the scheduled task.

For `AdminLab-ExecutionLog`, battery restrictions were disabled during initial task registration to avoid the same issue.