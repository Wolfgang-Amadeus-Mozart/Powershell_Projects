function Test-Connection {
    $port = Read-host "Qual porta deseja testar"
    $address =  Read-host "Qual endereço (exemplo: services.repcenter.skf.com)"

    Write-host "Testando porta $port no endereço $address"

    $resultado = Test-NetConnection $address -port $port

    if ($resultado.TcpTestSucceeded) {
        
        Test-NetConnection $address -port $port
        Write-host "Connexao estabelecida com sucesso"

    } else {

        Write-host "A conexao nao pode ser extabelecida"
    }
    
}

Test-Connection