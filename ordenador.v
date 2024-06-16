// Autor: Thaís Laura Anício Andrade
// 
// Data de criação:   16/06/2024 
// Nome do módulo:    ordenador
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
Licence:    GPL-3.0-or-later

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
Módulo: ordenador

Descrição:
Esse módulo integra diversos BN (Basic Network) para ordenar uma sequência de valores de entrada.
Retorna a sequência de forma decrescente.

Parâmetros:
- Size: quantidade de bits 
Output:
- y1, y2, y3, y4, y5, y6, y7, y8: oito valores ordenados decrescentemente
Input:
- x1, x2, x3, x4, x5, x6, x7, x8: oito valores a serem ordenados

*/

`timescale 1 ns/100 ps

module ordenador #(parameter Size=8) (
    output [Size-1:0] y1, y2, y3, y4, y5, y6, y7, y8,
    input [Size-1:0] x1, x2, x3, x4, x5, x6, x7, x8
);

wire [Size-1:0] x11, x12, x13, x14, x15, x16, x17, x18;
wire [Size-1:0] x21, x22, x23, x24, x25, x26, x27, x28;
wire [Size-1:0] x31, x32, x33, x34, x35, x36, x37, x38;
wire [Size-1:0] x41, x42, x43, x44, x45, x46, x47, x48;
wire [Size-1:0] x51, x52, x53, x54, x55, x56, x57, x58;
wire [Size-1:0] x61, x62, x63, x64, x65, x66, x67, x68;
wire [Size-1:0] x71, x72, x73, x74, x75, x76, x77, x78;


BN #(Size) u_11 (.max(x11), .min(x12), .A(x1), .B(x2));
BN #(Size) u_12 (.max(x13), .min(x14), .A(x3), .B(x4));
BN #(Size) u_13 (.max(x15), .min(x16), .A(x5), .B(x6));
BN #(Size) u_14 (.max(x17), .min(x18), .A(x7), .B(x8));

assign x21 = x11;
assign x28 = x18;

BN #(Size) u_21 (.max(x22), .min(x23), .A(x12), .B(x13));
BN #(Size) u_22 (.max(x24), .min(x25), .A(x14), .B(x15));
BN #(Size) u_23 (.max(x26), .min(x27), .A(x16), .B(x17));

BN #(Size) u_31 (.max(x31), .min(x32), .A(x21), .B(x22));
BN #(Size) u_32 (.max(x33), .min(x34), .A(x23), .B(x24));
BN #(Size) u_33 (.max(x35), .min(x36), .A(x25), .B(x26));
BN #(Size) u_34 (.max(x37), .min(x38), .A(x27), .B(x28));

assign x41 = x31;
assign x48 = x38;

BN #(Size) u_41 (.max(x42), .min(x43), .A(x32), .B(x33));
BN #(Size) u_42 (.max(x44), .min(x45), .A(x34), .B(x35));
BN #(Size) u_43 (.max(x46), .min(x47), .A(x36), .B(x37));

BN #(Size) u_51 (.max(x51), .min(x52), .A(x41), .B(x42));
BN #(Size) u_52 (.max(x53), .min(x54), .A(x43), .B(x44));
BN #(Size) u_53 (.max(x55), .min(x56), .A(x45), .B(x46));
BN #(Size) u_54 (.max(x57), .min(x58), .A(x47), .B(x48));

assign x61 = x51;
assign x68 = x58;

BN #(Size) u_61 (.max(x62), .min(x63), .A(x52), .B(x53));
BN #(Size) u_62 (.max(x64), .min(x65), .A(x54), .B(x55));
BN #(Size) u_63 (.max(x66), .min(x67), .A(x56), .B(x57));

BN #(Size) u_71 (.max(x71), .min(x72), .A(x61), .B(x62));
BN #(Size) u_72 (.max(x73), .min(x74), .A(x63), .B(x64));
BN #(Size) u_73 (.max(x75), .min(x76), .A(x65), .B(x66));
BN #(Size) u_74 (.max(x77), .min(x78), .A(x67), .B(x68));

assign y1 = x71;
assign y8 = x78;

BN #(Size) u_81 (.max(y2), .min(y3), .A(x72), .B(x73));
BN #(Size) u_82 (.max(y4), .min(y5), .A(x74), .B(x75));
BN #(Size) u_83 (.max(y6), .min(y7), .A(x76), .B(x77));

endmodule
