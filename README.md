# scriptmapping
File and Printer Share Script
Vagrant HashiCorp tarafından geliştirilen sanal makine yaratmamızı ve yönetmemizi sağlayan bir araçtır. 
vagrantfile config dosyası üzerinden yaratmak istediğim Active Directory ve Domain kontrollerı "DIR1" adı ile belirledim.
Windows server 2019 üzerine Domain Controller kurulumunu yaptım ve Active Directory kurulumlarını (install-active-directory.ps1 ile) tamamladım.
Gene aynı şekilde Client "SRV1" ismiyle kuruldu. 
Config içerisinde AD Sunucusu 192.168.0.5 ip si ve 255.255.252.0 netmask olacak şekilde ayarlandı.
Client IP'sini (daha sonra değiştirilmek üzere) ilk başta 192.168.2.3 (IK IP'si) olarak netmask te aynı şekilde 255.255.252.0 olarak belirledim.

Client ve AD ayağa kaldırıldıktan sonra join-domain.ps1 ile client ve domain controller bağlantısı yapıldı.

mapdrive powershell scripti ile client IP'sinin 3. oktetine göre File Share ve Printer sharelar map edilecek şekilde ayarlandı.
Log on Script üzerinden, client IP değişikliği tespit edildiğinde ortak klasör ve printer mapleri değişmektedir.
File share ve printer share'lar everyone full olarak sunucu üzerinde ayarlandı.

Scripting yöntemi olarak powershell scripting kullanıldı.

