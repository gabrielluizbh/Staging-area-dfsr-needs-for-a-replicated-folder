# Scripts para encontrar os 32 maiores arquivos para determinar a área mínima de preparo exigida pelo DFSR para uma pasta replicada - Créditos Gabriel Luiz - www.gabrielluiz.com #



Get-ChildItem D:\Dados\Setores\MAKETING  -recurse | Sort-Object length -descending | select-object -first 32 | ft name,length -wrap –auto

<#

Explicação do comando:

Esse comando retornará os nomes de arquivo e o tamanho dos arquivos em bytes. 
Útil se você quiser saber quais são os 32 arquivos que são o maior na pasta replicada para que você possa "visitar" seus proprietários.

#>



Get-ChildItem D:\Dados\Setores\MAKETING -recurse | Sort-Object length -descending | select-object -first 32 | measure-object -property length –sum

<#

Explicação do comando:

Esse comando retornará o número total de bytes dos 32 maiores arquivos na pasta sem listar os nomes de arquivo.

#>


$big32 = Get-ChildItem D:\MARKETING -recurse | Sort-Object length -descending | select-object -first 32 | measure-object -property length –sum

$big32.sum /1gb

<#

Explicação do comando:

Esse comando obterá o número total de bytes de 32 maiores arquivos na pasta e fará o cálculo para converter bytes em gigabytes para você. 


#>


<#

Referências:


https://learn.microsoft.com/pt-br/windows/win32/fileio/maximum-file-path-limitation?WT.mc_id=5003815

https://learn.microsoft.com/pt-br/windows-server/troubleshoot/how-to-determine-the-minimum-staging-area-dfsr-needs-for-a-replicated-folder?WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.3&WT.mc_id=5003815


#>