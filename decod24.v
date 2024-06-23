// Autor: Thaís Laura Anício Andrade
// 
// Data de criação:   18/06/2024 
// Nome do módulo:    decod41
// Nome do projeto:   Projeto Final de Sistemas Digitais
// Versão: v1
/* Descrição: a terceira parte do trabalho foi desenvolver (implementar), analisar e testar diversos módulos que comporão um Sistema Digital Complexo:
              decodificador 2x4 (o decodificador deve ter uma entrada de enable - en), multiplexador 2x1, multiplexador 4x1, somador/subtrator (o             	      somador/subtrator deve ter uma saída de carry), registrador paralelo com clock enable (en) positivo* contador binário com clock enable (en)     	      positivo*, carga paralela (ld) positiva* e reset assíncrono negativo (clr_n).

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


Módulo: decod24

Descrição:
Em um decodificador 2 para 4, as entradas são valores binários de 1 ou mais bits. Já as saídas são independentes, sendo cada uma de 1 bit (indica se está ou não acionada). Além disso, apenas uma saída pode ser acionada por vez. Nessa aplicação, são quatro entradas de 1 bit cada, acionando a saída de acordo com o seu índice (se a1a0 formar o valor binário '01', então y1 é ativado).

Parâmetros:
- Size: quantidade de bits 
Output:
- y3, y2, y1, y0: possíveis saídas (apenas 1 é acionada)
Input:
- en: entrada enable (se for 0, nenhuma das saídas é acionada)
- a1, a0: valores utilizados na decodificação da saída (a formação binária a1a0 indica o índice da saída).
*/


module decod24 #(parameter Size=8)
	(output [Size-1:0] y3, y2, y1, y0,
	 input en, input [Size-1:0] a1, a0);
	
	assign y0 = ~a1 & ~a0 & en;
	assign y1 = ~a1 & a0 & en;
	assign y2 = a1 & ~a0 & en;
	assign y3 = a1 & a0 & en;

endmodule