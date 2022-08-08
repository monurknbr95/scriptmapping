$ErrorActionPreference = "SilentlyContinue"

# IPv4 adresi stringe donustur
$ipv4 = (Test-Connection -ComputerName $env:computername -count 1).IPV4Address.ipaddressTOstring

# Array olustur oktetleri
$sub = $ipv4.Split('.')

# birinci ve ikinci oktetleri check et
if ($sub[0] -eq 192 -and $sub[1]-eq 168) {

    # ücüncü oktete gore map drive
    if ($sub[2] -eq 1) {
        net use m: /delete
        net use m: \\DIR1\ITFolder /user:vagrant\vagrant vagrant

        wmic printer where "Local='FALSE'" delete
        rundll32 printui.dll,PrintUIEntry /in /n\\DIR1\ITPrinter
        write-host("IT Printerı ve klasörü eklenmiştir")

    }
    elseif ($sub[2] -eq 2) {
        net use m: /delete
        net use m: \\DIR1\AccountingFolder /user:vagrant\vagrant vagrant
        
        wmic printer where "Local='FALSE'" delete
        rundll32 printui.dll,PrintUIEntry /in /n\\DIR1\AccountingPrinter
        write-host("Account Printerı ve klasörü eklenmiştir")

    }
	elseif ($sub[2] -eq 3) {
        net use m: /delete
        net use m: \\DIR1\IKFolder /user:vagrant\vagrant vagrant 
        write-host("IK Klasoru eklenmiştir")
 
        wmic printer where "Local='FALSE'" delete
        rundll32 printui.dll,PrintUIEntry /in /n\\DIR1\IKPrinter
        write-host("IK Printerı ve klasörü eklenmiştir")
    }
    else {
        net use m: /delete
        write-host("Ortak Klasor Silinmistir")}
}
Add-Type -AssemblyName PresentationFramework
