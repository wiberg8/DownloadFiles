$links = (
    "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9003/DiscordSetup.exe",  
    "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe", 
    "https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe", 
    "https://download.scdn.co/SpotifySetup.exe"
);
$client = New-Object System.Net.WebClient;
$downloadWithoutQuestion = $false
$withoutQuestionInput = Read-Host "Vill du tanka ner allt på en gång y/n"
if($withoutQuestionInput -eq "y")
{
    $downloadWithoutQuestion = $true
}

foreach($link in $links)
{
    $linkSplit = $link.Split("/")
    $length = $linkSplit.Length - 1
    $fileName = $linkSplit[$length]
    if($downloadWithoutQuestion)
    {
        $client.DownloadFile($link, $fileName);
    }
    else
    {
        $download = Read-Host "Vill du tanka ner $($x) y/n"
        if($download -eq "y")
        {
            $client.DownloadFile($link, $fileName);
        }
    }
}