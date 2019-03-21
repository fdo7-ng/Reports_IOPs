# Sample Reports using PScribo

Sample PowerShell script to generate Disk IOPS Report using PScribo

## Requirement
- PScribo Module installed
-- https://github.com/iainbrighton/PScribo

## Usage

- Connect to target vCenter using Connect-ViServer
- Edit script to get Get-VM -Location "Folder name" or Get-VM for all vms in datacenter.
- Once finishe it will result a Word, HTML and TXT file.

## Sample Report Text File

```
Disk IOPS Report

Sample Report Sorted by VM name
-------------------------------------------

Name      HardDisk    SizeGB IOPsLimitcd
----      --------    ------ -----------
vmugsvr08 Hard disk 1     40          -1
vmugsvr07 Hard disk 1     40          -1
vmugsvr06 Hard disk 1     40          -1
vmugsvr06 Hard disk 2    100          -1
vmugsvr05 Hard disk 1     40          -1
vmugsvr05 Hard disk 2     80          -1
vmugsvr04 Hard disk 1     40          -1
vmugsvr03 Hard disk 1     40          -1
vmugsvr03 Hard disk 2     80          -1
vmugsvr02 Hard disk 1     40          -1
vmugsvr09 Hard disk 1     40          -1
vmugsvr01 Hard disk 1     40          -1
vmugsvr01 Hard disk 2     80          -1

____________________________________________
```

