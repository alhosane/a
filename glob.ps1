$headers = @{
    "accept" = "*/*"
    "accept-encoding" = "gzip, deflate, br, zstd"
    "accept-language" = "ar,en-US;q=0.9,en;q=0.8"
    "content-type" = "multipart/form-data; boundary=----WebKitFormBoundaryMAKwgQcUHOY7zpU4"
    "dnt" = "1"
    "origin" = "https://vote.globesoccer.com"
    "referer" = "https://vote.globesoccer.com/"
    "sec-ch-ua" = '"Google Chrome";v="129", "Not=A?Brand";v="8", "Chromium";v="129"'
    "sec-ch-ua-mobile" = "?1"
    "sec-ch-ua-platform" = '"Android"'
    "sec-fetch-dest" = "empty"
    "sec-fetch-mode" = "cors"
    "sec-fetch-site" = "cross-site"
    "user-agent" = "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36"
}

function Generate-MultipartData {
    param (
        [string]$voterId
    )

    $boundary = "----WebKitFormBoundaryMAKwgQcUHOY7zpU4"
    $data = @"
--$boundary
Content-Disposition: form-data; name="eventCode"

MECLUB24
--$boundary
Content-Disposition: form-data; name="voterId"

$voterId
--$boundary
Content-Disposition: form-data; name="hash"

--$boundary
Content-Disposition: form-data; name="vote"

0
--$boundary--
"@
    return $data
}

$url = "https://gs-voting.oddb.co/votes"

while ($true) {
    $randomVoterId = [guid]::NewGuid().ToString()  # Generate random voter ID
    $data = Generate-MultipartData -voterId $randomVoterId

    try {
        $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $data -ContentType "multipart/form-data; boundary=----WebKitFormBoundaryMAKwgQcUHOY7zpU4"
        
        if ($response.status -eq 200 -and $response.message -eq "Voting successful." -and $response.more_info -eq "Voting successful.") {
            Write-Host -ForegroundColor Green "Vote submitted successfully for voterId $randomVoterId: $response"
        } else {
            Write-Host "Unexpected response for voterId $randomVoterId: $response"
        }
    } catch {
        Write-Host -ForegroundColor Yellow "Failed to submit vote for voterId $randomVoterId: $_.Exception.Message"
        Write-Host "Waiting 30 seconds before retrying..."
        Start-Sleep -Seconds 30  # Wait for 30 seconds before retrying
    }
}
