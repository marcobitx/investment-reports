$token = Get-Content "C:\Users\nj\.openclaw\.token"
$body = Get-Content "C:\Users\nj\.openclaw\workspace\reports\discord-payload.json" -Raw
Invoke-RestMethod -Uri "https://discord.com/api/v10/channels/1471596380782067916/messages" -Method POST -Headers @{"Authorization" = "Bot $token"} -ContentType "application/json" -Body $body