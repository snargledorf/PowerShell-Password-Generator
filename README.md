# PowerShell Password Generator

A cryptographically secure password generator module for PowerShell. This module uses `System.Security.Cryptography.RandomNumberGenerator` to ensure passwords are generated with high entropy.

## Features

- **Cryptographically Secure**: Uses industry-standard RNG for password generation.
- **Customizable**: Control password length and character sets (uppercase, lowercase, numbers, symbols).
- **Clipboard Support**: Optionally copy the generated password directly to your clipboard.

## Installation

### Manual Installation

1. Clone or download this repository.
2. Move the `PasswordGenerator` folder to one of your PowerShell module directories (e.g., `$Home\Documents\PowerShell\Modules`).
3. Import the module:
   ```powershell
   Import-Module PasswordGenerator
   ```

## Usage

### Basic Usage

Generate a default 16-character password:
```powershell
New-RandomPassword
```

### Advanced Usage

Generate a 32-character password without symbols and copy it to the clipboard:
```powershell
New-RandomPassword -Length 32 -ExcludeSymbols -CopyToClipboard
```

Generate a password consisting only of numbers:
```powershell
New-RandomPassword -ExcludeUppercase -ExcludeLowercase -ExcludeSymbols
```

## Parameters

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `-Length` | `int` | `16` | The length of the password to generate. |
| `-ExcludeUppercase` | `switch` | `$false` | Exclude uppercase letters (A-Z). |
| `-ExcludeLowercase` | `switch` | `$false` | Exclude lowercase letters (a-z). |
| `-ExcludeNumbers` | `switch` | `$false` | Exclude numbers (0-9). |
| `-ExcludeSymbols` | `switch` | `$false` | Exclude special characters (!@#$%^&*...). |
| `-CopyToClipboard` | `switch` | `$false` | Copies the generated password to the system clipboard. |

## Author

**Ryan Esteves**

## License

(c) 2026 Ryan Esteves. All rights reserved.
