
// Autor: Thaís Laura Anício Andrade
// 
// Data de criação:   16/06/2024 
// Nome do módulo:    comp_nbits
// Nome do projeto:   Projeto Final de Sistemas Digitais
// Versão: v2
// Descrição: Esse projeto utiliza o módulo ordenador, que possui diversos módulos básicos de ordenação (Basic Network - BN)
//            em paralelo, para ordenar oito números com Size bits de forma decrescente (y1 é o máximo, y8, o mínimo). 
// 			  Dentro de cada BN, existe um comparador e dois multiplexadores, os quais retornam o número 'max' e 'min'.
// 			  Todo o código foi escrito na linguagem de hardware Verilog, processado no programa Leonardo Spectrum.
//			  Em conjunto com os módulos, o projeto também estuda e compara a área, o delay e a quantidade de processamento
//			  em função da quantidade de bits das variáveis de input.


/*COPYING
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
*/

/*
Módulo: comp_nbits

Descrição:
Esse módulo implementa um comparador de Size bits, retornando se A é menor do que B a partir da variável it.

Parâmetros:
- Size: quantidade de bits 
Output:
- it: indicador da comparação
Input:
- x, y: valores a serem comparados

*/

`timescale 1 ns/100 ps

module comp_nbits #(parameter Size=8)
	       (output it, input [Size-1:0] x, y);
	
	assign it = (x < y) ? 1'b1 : 1'b0;

endmodule