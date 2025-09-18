Background: 
     Given qualquer cidade selecionada

Feature: Primeira etapa de ativacao do ticket

# happy path
Scenario: Placa e setor correto
     Given placa "ABC1234" e o horario de funcionamento 08:00-18:00 
     When tenta ativar o ticket as 16:00
     Then o sistema deve permitir avançar

Scenario: Placa com menos caracteres
     Given placa tem 5 caracteres
     When tenta ativar o ticket
     Then o sistema deve exibir "Formato de placa inválido" e manter o cadastro bloqueado

Scenario: Placa com mais caracteres
     Given placa tem 8 caracteres
     When tenta ativar o ticket
     Then o sistema não deve permitir inserir o oitavo caracter

Scenario: Placa com formato correto
     Given placa "ABC1D23"
     When tenta cadastrar a placa
     Then o sistema deve aceitar e salvar a placa

Scenario: Placa com caractere numérico na posição de letra (ex.: posição 1-3)
     Given placa "A1C1D23"
     When tenta cadastrar a placa
     Then o sistema deve exibir "Formato de placa inválido"

Scenario: Placa com letra na posição de número (posições 4,6,7 são números)
     Given placa "ABCXD23"
     When tenta cadastrar a placa
     Then o sistema deve exibir "Formato de placa inválido"

Scenario: Placa com mais caracteres
     Given placa tem 8 caracteres
     When tenta ativar o ticket
     Then o sistema não deve permitir inserir o oitavo caracter

Scenario: Setor nao selecionado
     Given setor nao selecionado
     When tenta ativar o ticket
     Then o sistema deve manter o cadastro bloqueado

Scenario: Setor fora de funcionamento
     Given horário de funcionamento do setor sendo das 8:00 as 18:00
     When seleciona o setor as 18:01
     Then o sistema deve exibir "O setor encerrou o funcionamento às 18:00"

Scenario: Cadastro com placa e setor adequado ao horario
     Given horário dentro do funcionamento do setor e placa em formato adequado
     When seleciona o setor as 18:01
     Then o sistema deve exibir "O setor encerrou o funcionamento às 18:00"

