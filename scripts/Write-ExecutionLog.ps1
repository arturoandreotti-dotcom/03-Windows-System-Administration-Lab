$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host $timestamp

Add-Content -Path "C:\AdminLab\execution.log" -Value "$timestamp - Scheduled task executed successfully"
