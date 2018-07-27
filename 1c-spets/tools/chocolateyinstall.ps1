﻿$headers = @{'Authorization' = "OAuth $env:YANDEX_DISK_TOKEN"}

$url = 'https://cloud-api.yandex.net:443/v1/disk/resources/download?path=disk%3A%2F%D0%9F%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F%2FSMT%2F2018_03_21_22_00_00_Spets.1cd&fields=href'

$toolsPath = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$toolsPath\1Cv8.1CD"
  url                    = (curl $url -Headers $headers | ConvertFrom-Json).href
  checksum               = '48cc6c834a7aea8e2372ae0eb65a1f0717e5e782a22df0cf3e6990fdd52c84f1'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

Install-Module -Name PsIni

Out-IniFile -InputObject @{'UTspets'=@{'Connect'="File=`"$toolsPath`";"}} -FilePath "$env:APPDATA\1C\1CEStart\ibases.v8i"
