#!/usr/bin/env pwsh
[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $version
)

function Get-Hash {
    param (
        [Parameter()]
        [string]
        $version
    )

    if (!$version) {
        $version = $(git describe --tags --abbrev=0)
    }

    $result = $(git show-ref --tag $version) | Select-Object -Last 1
    $result.split(" ")[0]

}

function  Get-Url {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $source
    )
    $hash=Get-ModuleHash $source
    $splitter=$source.split("/")
    return "git::https://github.com/$($splitter[0])/terraform-$($splitter[2])-$($splitter[1]).git?ref=$($hash)"
}

function Get-ModuleHash {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $source
    )

    $splitter=$source.split("/")
    $repo="https://github.com/$($splitter[0])/terraform-$($splitter[2])-$($splitter[1])"
    write-debug $repo
    $($(git -c 'versionsort.suffix=-' `
    ls-remote --exit-code --refs --sort='version:refname' --tags $repo '*.*.*' `
    | Select-Object -Last 1).split("refs") | Select-Object -First 1).trim()
}


Get-Hash -version $version
