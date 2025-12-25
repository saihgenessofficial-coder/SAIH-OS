# saih.ps1 – Wrapper PowerShell para o SAIH-CLI
# Permite usar "saih" no PowerShell chamando o CLI Linux via WSL.

param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]] $Args
)

# Comando base que será executado dentro do WSL
$cmd = "saih " + ($Args -join ' ')

Write-Host "🔗 Encaminhando para WSL: $cmd" -ForegroundColor Cyan

try {
    wsl $cmd
}
catch {
    Write-Host "❌ Não foi possível encontrar o WSL ou o comando 'saih' dentro do WSL." -ForegroundColor Red
    Write-Host "   Verifique se:" -ForegroundColor Yellow
    Write-Host "   1) O WSL está instalado (Ubuntu/Debian)." 
    Write-Host "   2) O SAIH-CLI foi instalado dentro do ambiente Linux (./instalar-saih-cli.sh)." 
}
