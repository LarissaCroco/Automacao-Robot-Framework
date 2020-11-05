# QA_challenge

# Requisitos para executar os testes do site:

- Editor de texto ou IDE
- Robot framework instalado
- Selenium library instalada

## Como executar os testes do site:

1. Pode executar a suíte toda de uma vez:
    robot -d ./results test_suite_site

2. Ou executar um cenário de teste por vez:
    robot -d ./results -t <"Cenário X"> test_suite_site
    
## Relatórios de execução:

Ficam armazenados no diretório ./results

# Requisitos para executar os testes da API:

- [Postman](https://www.postman.com/downloads/) instalado. 

## Como executar os testes da API:

1. Importar a collection Weather
2. Importar as variáveis globais criadas para os testes
3. No postman, selecionar a opção Runner
4. Selecionar a collection importada
5. Clicar em "Run Weather"

## Relatório de execução:

É exibido após a execução da collection e pode ser exportado em formato .json .


