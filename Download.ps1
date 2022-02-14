$links = (
    "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9003/DiscordSetup.exe",  
    "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe", 
    "https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe", 
    "https://download.scdn.co/SpotifySetup.exe",
    "https://c2rsetup.officeapps.live.com/c2r/downloadVS.aspx?sku=community&channel=Release&source=VSLandingPage&version=VS2022&cid=0af3dced929141b7ac16eceb8ba6199f"
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
    $fileName = $link.Split("/")
    $length = $fileName.Length - 1
    $x = $fileName[$length]
    if($downloadWithoutQuestion)
    {
        $client.DownloadFile($link, $x);
    }
    else
    {
        $download = Read-Host "Vill du tanka ner $($x) y/n"
        if($download -eq "y")
        {
            $client.DownloadFile($link, $x);
        }
    }
}