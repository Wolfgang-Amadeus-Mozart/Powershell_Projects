function scheduled_trigger_for-backup {
    $daily =  New-JobTrigger -Daily -at 2pm
    $once =  New-JobTrigger -Once -at 2pm
    $weekly =  New-JobTrigger -Weekly -at 2pm

Register-ScheduledJob -Name AWS_Backup -Trigger $daily -ScriptBlock { #here we could determine if dayle, once or weekly, using dayly
    aws s3 cp 'C:\Windows\Temp\Folder to Backup' s3://powershell-filipe --recursive #run an AWS CLI command that recursively  copy this folder's items to an AWS s3 bucket
}
}