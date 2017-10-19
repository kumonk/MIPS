/*                   *
 * adder16.v         *
 * 16 ビット加算回路 *
 * 入力 x,y, 出力 y  *
 *                   */

module adder16 (x,y,cin,sum,cout);
	input [15:0] x,y;
	input cin;
	output [15:0] sum;
	output cout;

	assign {cout,sum} = x + y + cin;
endmodule

