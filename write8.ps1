param (
    [parameter()]
    [string] $FilePath
)
$mid = ("{0}.n8" -f $FilePath)
& swipl -s .\id-gen.prolog -g "go_1, halt." | Out-File -FilePath $mid
& awk -f .\id-trans.awk $mid | Out-File -FilePath $FilePath
