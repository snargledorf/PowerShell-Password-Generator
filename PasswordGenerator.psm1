function New-RandomPassword {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [int]$Length = 16,

        [Parameter(Mandatory = $false)]
        [switch]$ExcludeUppercase,

        [Parameter(Mandatory = $false)]
        [switch]$ExcludeLowercase,

        [Parameter(Mandatory = $false)]
        [switch]$ExcludeNumbers,

        [Parameter(Mandatory = $false)]
        [switch]$ExcludeSymbols,

        [Parameter(Mandatory = $false)]
        [switch]$CopyToClipboard
    )

    process {
        $upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        $lower = "abcdefghijklmnopqrstuvwxyz"
        $numbers = "0123456789"
        $symbols = "!@#$%^&*()-_=+[]{}|;:,.<>?"

        $pool = ""
        if (-not $ExcludeUppercase) { $pool += $upper }
        if (-not $ExcludeLowercase) { $pool += $lower }
        if (-not $ExcludeNumbers) { $pool += $numbers }
        if (-not $ExcludeSymbols) { $pool += $symbols }

        if ([string]::IsNullOrEmpty($pool)) {
            throw "At least one character pool must be included."
        }

        $rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
        $password = New-Object System.Text.StringBuilder
        $poolLength = $pool.Length

        for ($i = 0; $i -lt $Length; $i++) {
            $bytes = New-Object byte[] 4
            $rng.GetBytes($bytes)
            $index = [BitConverter]::ToUInt32($bytes, 0) % $poolLength
            $null = $password.Append($pool[$index])
        }

        $result = $password.ToString()

        if ($CopyToClipboard) {
            $result | Set-Clipboard
            Write-Verbose "Password copied to clipboard."
        }

        return $result
    }
}

Export-ModuleMember -Function New-RandomPassword
