# !powershell
#AnsibleRequires -CSharpUtil Ansible.Basic
#AnsibleRequires -PowerShell Ansible.ModuleUtils.JelloWorld

$result = @{
    changed = $false
}

$spec = @{
    options = @{
        message_1 = @{ type = "str"; required = $true }
        message_2 = @{ type = "str"; required = $true }
        my_fp = @{ type = "str"; required = $true }
    }
}
$module = [Ansible.Basic.AnsibleModule]::Create($args, $spec)

try {
    $message = Join-HelloWorld -Hello $Module.Params.message_1 -World $Module.Params.message_2
}
catch {
    $module.FailJson("Failed to get message :: Line: $($_.InvocationInfo.ScriptLineNumber), Char: $($_.InvocationInfo.OffSetInLine) :: Exception: $_")
}

$module.Result.msg = "Success"
$module.Result.changed = $true
$module.Result.return_payload = $message

$module.ExitJson()  
