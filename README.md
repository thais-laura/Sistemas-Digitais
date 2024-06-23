# Projeto Final de Sistemas Digitais

## Autor:
Thaís Laura Anício Andrade - Graduanda em Engenharia de Computação na USP, campus de São Carlos

## Descrição
O trabalho é construído em partes e todo o código é escrito na linguagem de descrição de hardware, Verilog, processado no software Leonardo Spectrum.

### Parte 1:
Criação do módulo ordenador básico (BN - Basic Network), que possui um comparador de 'Size' bits (A menor que B) e dois multiplexadores, os quais retornam o número 'max' e 'min'. 

### Parte 2:
Utiliza-se o módulo ordenador, que possui diversos módulos básicos de ordenação (Basic Network - BN) em paralelo, para ordenar oito números com 'Size' bits de forma decrescente (y1 é o máximo, y8, o mínimo). Em conjunto com os módulos, o projeto também estuda e compara a área, o delay e a quantidade de processamento em função da quantidade de bits das variáveis de input.

### Parte 3:
A terceira parte do trabalho foi desenvolver (implementar), analisar e testar diversos módulos que comporão um Sistema Digital Complexo: decodificador 2x4 (o decodificador deve ter uma entrada de enable - en), multiplexador 2x1, multiplexador 4x1, somador/subtrator (o somador/subtrator deve ter uma saída de carry), registrador paralelo com clock enable (en) positivo, contador binário com clock enable (en) positivo, carga paralela (ld) positiva e reset assíncrono negativo (clr_n).

## Histórico de Versões
- **v0.3** - 23/06/2024: Construção de módulos para a criação de um Banco de Registradores (decod24, mux41 e register), além da adição de outros módulos a serem utilizados posteriormente (somador e contador).
- **v0.2** - 16/06/2024: Adicionado o módulo ordenador, além de comp e mux21 simplificados e otimizados.
- **v0.1** - 12/06/2024: Versão inicial com funcionalidades básicas: módulos BN, comp e mux21.

## Licença
Este projeto é licenciado sob os termos da licença GPL-3.0-or-later. Veja o arquivo [COPYING](COPYING) para mais detalhes.
