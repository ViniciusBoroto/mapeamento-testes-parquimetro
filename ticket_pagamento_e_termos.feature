Background:
     Given placa "ABC1234" e setor com horario 08:00-18:00 as 13:00 e categoria selecionada "automovel"

Feature: Gerar pagamento
Scenario: Em londrina, categorias devem ser automovel e caminhao
     Given cidade "londrina-pr"
     Then categorias disponiveis devem ser ["automovel ou utilitario", "caminhao"]

Scenario: Em Cambe, categorias devem ser automovel, moto e caminhao
     Given cidade "londrina-pr"
     Then categorias disponiveis devem ser ["automovel ou utilitario", "moto", "caminhao"]

Scenario:
     Given cidade "londrina-pr"
     Then categorias disponiveis devem ser ["automovel ou utilitario", "caminhao"]