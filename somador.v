// Autor: Thaís Laura Anício Andrade
// 
// Data de criação:   23/06/2024 
// Nome do módulo:    soma_subt
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


Módulo principal: soma_subt 

Descrição:
Um somador ou subtrator de acordo com a entrada (op). Para cada posição das entradas (a, b), utiliza o módulo auxiliar (add_1bit) para realizar a operação de 1 bit. Em conjunto, eles formam um circuito que vincula a saída de um (carry out) com a entrada de outro (carry in). Além disso, é válido informar que a subtração é feita a partir do complemento de 2 do subtraendo (b), em vez de se trabalhar com outra variável de 'borrow', o que permite simplificar as duas operações para um módulo compacto.

Parâmetros:
- Size: quantidade de bits 
Output:
- s: resultado final da soma (barramento de Size bits)
- co: carry out da soma final (1 bit)
Input:
- a, b: valores a serem somados ou subtraídos (barramentos de Size bits)
- ci: possível carry in
- op: indica a operação a ser realizada (1 para subtração, 0 para soma)
Wires:
- c: barramento formado pelos carry out de todas as posições
- b_mod: possível complemento do subtraendo ou o próprio subtraendo
- cp2: complemento de 2 do subtraendo


Módulo auxiliar: add_1bit

Descrição:
Um circuito que recebe dois valores principais (a, b) e um carry in (cin), e retorna uma saída que é a soma binária desses três. Também, retorna o carry out (cout) da soma binária dos termos. Todas as operações explicadas utilizam variáveis de apenas 1 bit. 

Output:
- s: resultado soma de a, b e cin
- cout: carry out da soma
Input:
- a, b: valores de uma posição de dois barramentos (1 bit cada)
- cin: carry in da soma dos bits de uma posição anterior à atual (1 bit)
*/

`timescale 1 ns/100 ps

module add_1bit (output s, cout, input a, b, cin);

   assign s = a ^ b ^ cin;
   assign cout = (a & b) | (a & cin) | (b & cin);

endmodule

module soma_subt #(parameter Size=8)
	       (output [Size-1:0] s, output co, input [Size-1:0] a, b, input ci, op);

	wire [Size:0] c;
	wire [Size-1:0] b_mod;
	wire cp2;

// se op == 1, então soma a com o complemento de 2 de b (subtração)
   	assign b_mod = (op == 1'b1) ? (~b) : b;
	assign cp2 = (op == 1'b1) ? 1'b1 : 1'b0;


    assign c[0] = ci ^ cp2;

	genvar i;
	generate						//Verilog-2001
	for (i=0; i<Size; i=i+1)
		begin: row
	    	add_1bit ui (s[i], c[i+1], a[i], b_mod[i], c[i]);
	    end
	endgenerate

	assign co = c[Size];

endmodule