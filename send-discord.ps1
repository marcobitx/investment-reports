$token = Get-Content "C:\Users\nj\.openclaw\workspace\config\discord-token.txt" -ErrorAction SilentlyContinue
if (-not $token) { 
    Write-Host "No token found"
    exit 1 
}

$message = @"
**⚡ Kasdienė Investicinė Ataskaita — 2026-04-29**

**Svarbiausi rodikliai:**
• S&P 500: 7,173.91 | Nasdaq: 24,887.10
• Brent: `$103-111 | Fed: 3.5-3.75%

**Pagrindinės naujienos:**
• Tech rally stringa prieš didžiuosius (GOOG, MSFT, AMZN, META šiandien po close)
• Taiwan aplenkė Kanadą - 6-a pagal dydį (`$4.47T)
• HSBC kelia US iki BUY - pelno augimas +14%
• Fed palieka rates nepakitus
• Brent `$111 - infliacija 3.3%

**🏆 TOP INVESTICIJOS:**
1. NVDA - `$208, tikslas `$280
2. TSM - `$142, tikslas `$180  
3. MSFT - `$424, tikslas `$500
4. TER - `$128, +87% Q1 pajamų
5. INTC - `$22, turnaround

**📜 1973/74 paralelė:**
OPEC embargo → S&P -48%. Skirtumas: AI gali blokuoti.

**🔴 Dėmesio:**
OpenAI revenue MISS, nafta aukšta

📎 Ataskaita: https://marcobitx.github.io/investment-reports/investment-2026-04-29.html
"@

$body = @{
    content = $message
} | ConvertTo-Json -Depth 3

$headers = @{
    "Authorization" = "Bot $token"
    "Content-Type" = "application/json"
}

$url = "https://discord.com/api/v10/channels/1471596380782067916/messages"

try {
    $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body
    Write-Host "Message sent successfully"
    $response
} catch {
    Write-Host "Error: $_"
    $_.Exception.Response
}