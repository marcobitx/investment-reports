$body = @{content="⚡ **SAVAITĖS INVESTICINĖ ATASKAITA** | 2026-04-19-25`n`n**Svarbiausia:** S&P 500 ir Nasdaq naujuose rekorduose. Intel +23%, MaxLinear +66%. Iran-USA taika.`n`n📈 Savaite: S&P +0.6%, Nasdaq +1.5%`n✅ Pilnas reportas: https://marcobitx.github.io/investment-reports/weekly-2026-04-25.html"} | ConvertTo-Json -Compress
$token = "MTA5ODk1MzE4ODE2Njc4ODkyNjg.GxB3Ew.XXXX"
$headers = @{"Authorization"="Bot $token"}
Invoke-WebRequest -Uri "https://discord.com/api/v10/channels/1471596380782067916/messages" -Method POST -Headers $headers -ContentType "application/json" -Body $body