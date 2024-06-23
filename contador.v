// Autor: Thaís Laura Anício Andrade
// 
// Data de criação:   23/06/2024 
// Nome do módulo:    cont
// Nome do projeto:   Projeto Final de Sistemas Digitais
// Versão: v1
/* Descrição: a terceira parte do trabalho foi desenvolver (implementar), analisar e testar diversos módulos que comporão um Sistema Digital Complexo:
              decodificador 2x4 (o decodificador deve ter uma entrada de enable - en), multiplexador 2x1, multiplexador 4x1, somador/subtrator (o             	      somador/subtrator deve ter uma saída de carry), registrador paralelo com clock enable (en) positivo, contador binário com clock enable (en)     	      positivo, carga paralela (ld) positiva e reset assíncrono negativo (clr_n).

COPYING
=======

Copyright:  Copyright (C) 2024 Thaís Laura
Licence:    GPL-3.0-ou-posterior

This file is part of Projeto Final de Sistemas Digitais.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>6.


Módulo: cont

Descrição:
Um contador permite indicar uma quantidade dependendo dos parâmetros de entrada: é atualizado à cada borda positiva do clock e à cada borda negativa do reset (clr_n). Se a carga paralela estiver ativada (positiva), significa que se inicializa a variável de saída (q) com algum valor (d_in) já definido (diferente ou não de zero). Também, é possível incrementar (mais = 1) ou decrementar (mais = 0) uma unidade do contador. Essas duas últimas atividades podem ser executadas de acordo com o enable (en) positivo. É importante ressaltar que se utiliza uma variável registradora para a saída (q), a fim de se utilizar o bloco "always".

Parâmetros:
- Size: quantidade de bits 
Output:
- q: valor atualizado (incrementado, decrementado, zerado ou inicializado)
Input:
- d_in: valor inicial 
- en: entrada enable (se for 0, não há mudança na saída)
- clk: entrada de clock
- clr_n: entrada de reset/clear
- ld: indica que é necessária uma inicialização da saída
- mais: indica um incremento (1) ou decremento (0)
*/

`timescale 1 ns / 100 ps

module cont #(parameter Size=8)
	(output reg [Size-1:0] q, input [Size-1:0] d_in, input en, clk, clr_n, ld, mais);

    always @(posedge clk or negedge clr_n) begin
        if (~clr_n)
            q <= 0;
        else if (en) begin
            if (ld)
                q <= d_in;
            else if (mais)
                q <= q + 1;
            else
                q <= q -1;
        end
    end
endmodule
