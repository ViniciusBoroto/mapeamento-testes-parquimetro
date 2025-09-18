Background:
     Given placa "ABC1234" e setor com horario 08:00-18:00 as 13:00

Feature: Selecao de categoria
Scenario: Em londrina, categorias devem ser automovel e caminhao
     Given cidade "londrina-pr"
     Then categorias disponiveis devem ser ["automovel ou utilitario", "caminhao"]

Scenario: Em Cambe, categorias devem ser automovel, moto e caminhao
     Given cidade "londrina-pr"
     Then categorias disponiveis devem ser ["automovel ou utilitario", "moto", "caminhao"]

Scenario: Forma de pagamento nao selecionada
     Given cidade "londrina-pr" categoria "caminhao"
     When apertar em avancar
     Then sistema deve exigir selecionar a forma de pagamento

Scenario: Apenas termos nao aceitos
     Given cidade "londrina-pr" categoria "caminhao" pagamento "pix" e termos nao aceitos
     When apertar em avancar
     Then sistema deve exigir os termos estarem aceitos

Scenario: Apenas termos nao aceitos
     Given cidade "londrina-pr" categoria "caminhao" pagamento "pix" e termos aceitos
     When apertar em avancar
     Then sistema deve gerar o pix para pagamento
