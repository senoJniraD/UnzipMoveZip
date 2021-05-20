
#Use to unzip, move specified file types out of file, then rezip - DJ154


#Starting File Name
$StartingFile = "H:\TEST_With_Images.zip"

#Unzip To Working Folder Location
$UnzipWorking = "H:\UnzipWorking"

#Final Zip Destination With Filename
$DestinationFolder = "H:\Completed.zip"

#Image Folder Location
$ImageMoveTo = "H:\Images"

#Image File Type, Must Be In Format "\*.'Type'"
$ImageFormat = "\*.jpg"




###CodeBlock
$PathSearch = ($UnzipWorking + $ImageFormat)
Write-Host "Unzip Starting..."
Expand-Archive -LiteralPath $StartingFile -DestinationPath $UnzipWorking
Write-Host "Move Images Starting..."
Get-ChildItem -Path $PathSearch -Recurse | Move-Item -Destination $ImageMoveTo
Write-Host "Rezipping Starting..."
Compress-Archive -Path $UnzipWorking -DestinationPath $DestinationFolder
Write-Host "Zip Complete..."
###End