// Autor: Thaís Laura Anício Andrade
// 
// Data de criação:   23/06/2024 
// Nome do módulo:    register
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


Módulo principal: register 

Descrição:
Os registradores são circuitos digitais capazes de armazenar e deslocar informações binárias, e são tipicamente usados como um dispositivo de armazenamento temporário. A aplicação se resume a quatro registradores paralelos formados por Flip Flops Tipo-D, nos quais são armazenados o mesmo dado (um barramento de Size bits); porém, as entradas de enable organizam qual registrador armazenará a entrada.

Parâmetros:
- Size: quantidade de bits 
Output:
- q3, q2, q1, q0: valor atualizado (resetado, mantido igual ao anterior ou atualizado)
Input:
- en3, en2, en1, en0: entradas enable para cada um dos registradores (se for 0, não há mudança na saída)
- clk: entrada de clock
- clr_n: entrada de reset/clear
- d: dado a ser registrado

Módulo auxilar: dff

Descrição:
Um Flip Flop Tipo-D: é uma transferência de dado da entrada para a saída, uma vez que a saída (q) é igual à entrada (d) caso o enable esteja ativado (positivo). Nesta aplicação, utiliza-se a borda positiva do clock ou a borda negativa do reset (clr_n) para a atualização da saída. 

Parâmetros:
- Size: quantidade de bits 
Output:
- q: valor atualizado (resetado, mantido igual ao anterior ou atualizado)
- qb: valor contrário ao de q
Input:
- en: entrada enable (se for 0, não há mudança na saída)
- clk: entrada de clock
- clr_n: entrada de reset/clear
- d: dado a ser registrado
*/

`timescale 1 ns/100 ps

module dff #(parameter Size=8)
	(output reg [Size-1:0] q, output [Size-1:0] qb, input en, clk, clr_n, input [Size-1:0] d);

	always @ (posedge clk or negedge clr_n) begin
		if (~clr_n)
			q = 8'b00000000;
      	else begin
			if(en)
            	q = d;
		end
	end
	assign qb = ~q;

endmodule


module register #(parameter Size=8)
   (output reg [Size-1:0] q0, q1, q2, q3, input en0, en1, en2, en3, clk, clr_n, input [Size-1:0] d);

   dff #(Size) u0 (.q(q0), .qb(), .en(en0), .clk(clk), .clr_n(clr_n), .d(d));
   dff #(Size) u1 (.q(q1), .qb(), .en(en1), .clk(clk), .clr_n(clr_n), .d(d));
   dff #(Size) u2 (.q(q2), .qb(), .en(en2), .clk(clk), .clr_n(clr_n), .d(d));
   dff #(Size) u3 (.q(q3), .qb(), .en(en3), .clk(clk), .clr_n(clr_n), .d(d));

endmodule