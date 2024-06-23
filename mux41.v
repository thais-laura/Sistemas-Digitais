// Autor: Thaís Laura Anício Andrade
// 
// Data de criação:   18/06/2024 
// Nome do módulo:    mux41
// Nome do projeto:   Projeto Final de Sistemas Digitais
// Versão: v2
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


Módulo: mux41

Descrição:
Esse módulo implementa multiplexador 4x1

Parâmetros:
- Size: quantidade de bits 
Output:
- y: número selecionado
Input:
- s1, s0: selecionadores para os dois mux21 utilizados
- a3, a2, a1, a0: valores a serem selecionados
Wires:
- d1, d0: valores selecionados pelos dois mux21 auxiliares
*/


`timescale 1 ns/100 ps

module mux41 #(parameter Size=8) 
			(output [Size-1:0] y, input s1, s0, input [Size-1:0] a3, a2, a1, a0);
	
	wire d0, d1;
	assign d0 = s0 ? a1 : a0;
	assign d1 = s0 ? a3 : a2;
	assign y = s1 ? d1 : d0;
	 
endmodule