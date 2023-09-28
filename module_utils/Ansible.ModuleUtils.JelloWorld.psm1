
 function Join-HelloWorld {
     [CmdletBinding()]
     param(
         [Parameter()]
         [ValidateNotNullOrEmpty()]
         [string]$Hello,

         [Parameter()]
         [ValidateNotNullOrEmpty()]
         [string]$World
     )

     $message = "$Hello $World"
     return $message
 }

 Export-ModuleMember -Function Join-HelloWorld
