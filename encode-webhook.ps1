Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  R6Check Webhook Encoder" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Enter your Discord webhook URL:" -ForegroundColor Yellow
Write-Host "(Example: https://discord.com/api/webhooks/123456789/abcdefg)" -ForegroundColor Gray
Write-Host ""
$webhookUrl = Read-Host "Webhook URL"

if (-not $webhookUrl) {
    Write-Host "[!] No webhook URL provided. Exiting." -ForegroundColor Red
    exit 1
}

if ($webhookUrl -notmatch '^https://discord\.com/api/webhooks/') {
    Write-Host "[!] Invalid webhook URL format!" -ForegroundColor Red
    Write-Host "[!] Must start with: https://discord.com/api/webhooks/" -ForegroundColor Red
    exit 1
}

$bytes = [System.Text.Encoding]::UTF8.GetBytes($webhookUrl)
$encodedHash = [System.Convert]::ToBase64String($bytes)

Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host "  ENCODED WEBHOOK HASH" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
Write-Host ""
Write-Host $encodedHash -ForegroundColor White
Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  ONE-LINE COMMAND FOR USERS" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Send this command to suspects (copy everything):" -ForegroundColor Yellow
Write-Host ""

$oneLiner = "irm https://raw.githubusercontent.com/dyvertigo/R6Check/main/R6Check.ps1 | iex; R6Check.ps1 -WebhookHash `"$encodedHash`""

Write-Host $oneLiner -ForegroundColor Green
Write-Host ""


Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  SHORTER VERSION (Download & Run)" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$shortVersion = "iwr https://raw.githubusercontent.com/dyvertigo/R6Check/main/R6Check.ps1 -OutFile R6Check.ps1; .\R6Check.ps1 -WebhookHash `"$encodedHash`""

Write-Host $shortVersion -ForegroundColor Green
Write-Host ""


try {
    $oneLiner | Set-Clipboard
    Write-Host "[+] One-line command copied to clipboard!" -ForegroundColor Green
} catch {
    Write-Host "[~] Could not copy to clipboard (copy manually above)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  SECURITY NOTES" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "✅ Your webhook is Base64 encoded (obfuscated)" -ForegroundColor Green
Write-Host "✅ Not easily readable by users" -ForegroundColor Green
Write-Host "⚠️  Can still be decoded by advanced users" -ForegroundColor Yellow
Write-Host "⚠️  Don't post the encoded hash publicly" -ForegroundColor Yellow
Write-Host "✅ Send via DM to specific suspects only" -ForegroundColor Green
Write-Host ""

Write-Host "Press Enter to exit..."
Read-Host | Out-Null
