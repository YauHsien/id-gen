param (
    [parameter()]
    [string] $FilePath
)
& swipl -s .\id-gen.prolog -g "go_1, halt." | Out-File -FilePath $FilePath
