function Select-TextItem 
{ 
PARAM  
( 
    [Parameter(Mandatory=$true)] 
    $options, 
    $displayProperty 
) 
 
    [int]$optionPrefix = 1 
    # Create menu list 
    foreach ($option in $options) 
    { 
        if ($displayProperty -eq $null) 
        { 
            Write-Host ("{0,3}: {1}" -f $optionPrefix,$option) 
        } 
        else 
        { 
            Write-Host ("{0,3}: {1}" -f $optionPrefix,$option.$displayProperty) 
        } 
        $optionPrefix++ 
    } 
    Write-Host ("{0,3}: {1}" -f 0,"To cancel")  
    [int]$response = Read-Host "Select which server to Shadow" 
    $val = $null 
    if ($response -gt 0 -and $response -le $options.Count) 
    { 
        $val = $options[$response-1] 
    } 
    return $val 
}    
 
 
$values = "hcaze0243asrv.ad005.onehc.net" , "hcaze0244asrv.ad005.onehc.net","hcaze0245asrv.ad005.onehc.net" , "hcaze0246asrv.ad005.onehc.net" ,"hcaze0367asrv.ad005.onehc.net","hcaze0368asrv.ad005.onehc.net","hcaze0369asrv.ad005.onehc.net", "hcaze0370asrv.ad005.onehc.net","hcaze0371asrv.ad005.onehc.net", "hcaze0715asrv.ad005.onehc.net" , "hcaze0716asrv.ad005.onehc.net" , "hcaze0717asrv.ad005.onehc.net", "hcaze0718asrv.ad005.onehc.net" , "hcaze0976asrv.ad005.onehc.net" ,"hcaze0977asrv.ad005.onehc.net", "hcaze0978asrv.ad005.onehc.net", "hcaze0979asrv.ad005.onehc.net" , "hcaze0980asrv.ad005.onehc.net" , "hcaze1144asrv.ad005.onehc.net" ,  "hcaze1146asrv.ad005.onehc.net" ,"hcaze1176asrv.ad005.onehc.net" , "hcaze1177asrv.ad005.onehc.net", "hcaze1189asrv.ad005.onehc.net" , "hcaze1190asrv.ad005.onehc.net", "Other"
$val = Select-TextItem $values 
$val 
    
    if ($val -eq "Other")
    { 
        [string]$response = Read-Host "Insert the name of computer" 
        $val = $response 
        query.exe session /server:$val
        $sessionid=Read-Host -Prompt "Select the Session Number"
        Mstsc.exe /V:$val /shadow:$sessionid /noConsentPrompt
         
    }
    else
    {
        query.exe session /server:$val
        $sessionid=Read-Host -Prompt "Select the Session Number"
        Mstsc.exe /V:$val /shadow:$sessionid /noConsentPrompt
    }
