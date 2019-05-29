Add-Type -Path "D:\ODAC\odp.net\managed\common\Oracle.ManagedDataAccess.dll"
$reader=$false
$username = Read-Host -Prompt "Enter database username"
$password = Read-Host -Prompt "Enter database password"
$datasource = Read-Host -Prompt "Enter database TNS name (SID)"
$query = "SELECT first_name,last_name FROM users"
#$query = "SELECT 'Hello World' Greeting from dual"
$connectionString = 'User Id=' + $username + ';Password=' + $password + ';Data Source=' + $datasource
$connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionString)
$connection.open()
$command=$connection.CreateCommand()
$command.CommandText=$query
$reader=$command.ExecuteReader()
While ($reader.Read()) {
    $reader.GetString(0) + ' ' + $reader.GetString(1)
}
$connection.Close()