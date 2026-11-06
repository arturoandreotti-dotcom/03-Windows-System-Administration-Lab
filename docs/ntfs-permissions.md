# NTFS Permissions Lab

## Objective

Configure and validate NTFS file system permissions in a Windows 11 virtual machine.

The goal is to demonstrate how access control lists (ACLs), permission inheritance, and security groups determine what users can do with files and directories, following the principle of least privilege.

## Lab Environment

| Component | Configuration |
|---|---|
| Operating System | Windows 11 Enterprise Evaluation |
| Virtualization | Oracle VirtualBox |
| Administrative Account | LabAdmin |
| Standard User Account | TestUser |
| Test Directory | `C:\AdminLab\PermissionsLab` |
| Test File | `C:\AdminLab\PermissionsLab\test.txt` |

## NTFS Permissions Configuration

A dedicated directory was created to test NTFS access control.

Inheritance was disabled on `PermissionsLab`, while existing inherited permissions were preserved as explicit entries.

```powershell
$acl = Get-Acl ".\PermissionsLab"
$acl.SetAccessRuleProtection($true, $true)
Set-Acl -Path ".\PermissionsLab" -AclObject $acl
```

The `Authenticated Users` access rules were then removed from the test directory.

```powershell
$acl = Get-Acl ".\PermissionsLab"
$acl.PurgeAccessRules(
    [System.Security.Principal.NTAccount]"NT AUTHORITY\Authenticated Users"
)
Set-Acl -Path ".\PermissionsLab" -AclObject $acl
```

The resulting permissions were:

| Security Principal | Permissions |
|---|---|
| SYSTEM | Full Control |
| Administrators | Full Control |
| Users | Read & Execute |

The test file inherited the permissions configured on its parent directory.

## Permission Validation

The standard user account `TestUser` was used to validate effective NTFS permissions.

### Read Access

```powershell
Get-Content "C:\AdminLab\PermissionsLab\test.txt"
```

**Result:** Successful. The file contents were displayed.

### Write Access

```powershell
Add-Content -Path "C:\AdminLab\PermissionsLab\test.txt" -Value "Modified by TestUser"
```

**Result:** Access denied.

### Delete Access

```powershell
Remove-Item -Path "C:\AdminLab\PermissionsLab\test.txt"
```

**Result:** Access denied.

### File Integrity

```powershell
Get-Content "C:\AdminLab\PermissionsLab\test.txt"
```

**Result:** The original contents remained unchanged.

## Test Results

| Operation | Expected | Actual | Status |
|---|---|---|---|
| Read file | Allowed | Allowed | PASS |
| Modify file | Denied | Denied | PASS |
| Delete file | Denied | Denied | PASS |
| Verify file integrity | Unchanged | Unchanged | PASS |

## Conclusion

The lab successfully demonstrated NTFS access control using Windows security groups and file system permissions.

The standard user could read the protected file but could neither modify nor delete it.

This exercise demonstrated the importance of permission inheritance, ACL configuration, effective permissions, and the principle of least privilege in Windows system administration.
