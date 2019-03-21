$vmlist = get-vm -location vmug-test

$rpt = @()

foreach ($vm in $vmlist){

    $disklist = $vm | Get-HardDisk
    foreach ($disk in $disklist){
        $tmp = $vm | select Name, HardDisk, SizeGB, IOPsLimit
        $tmp.Name = $vm.Name
        $tmp.HardDisk = $disk.Name
        $tmp.SizeGB = $disk.CapacityGB
        $tmp.IOPsLimit = $disk.ExtensionData.StorageIOAllocation.Limit
        $rpt += $tmp

    }
}
$rpt | Sort-Object Name
# Export to SCSV
$rpt | Sort-Object Name, HardDisk, SizeGB, IOPsLimit | Export-Csv -NoTypeInformation ".\IOPsRPT.csv"


######  Section Uses PS Scribo to Turn table in to HTML, TXT, DOC
$document = Document 'Report' -Verbose {
    
    <# WARNING: 
        Microsoft Word will include paragraphs styled with 'Heading*' style names to the TOC. 
        To avoid this, define an identical style with a name not beginning with 'Heading'! 
    #>
    
    Paragraph -Style Heading1 'Disk IOPS Report'
    Section -Style Heading2 "Sample Report Sorted by VM name" {
            #Paragraph -Style Heading3 'Example of an autofit table width, autofit contents and no cell highlighting.'
            #Paragraph "Services ($($services.Count) Services found):"
            $rpt | Table -Columns Name,HardDisk,SizeGB,IOPsLimit -Headers Name,HardDisk,SizeGB,IOPsLimitcd -Width 0
    }

}
# Generates output in Word,HTML and TEXT
$document | Export-Document -Path .\ -Format Word,Html,Text -Verbose;