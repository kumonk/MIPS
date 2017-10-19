/*                            *
 * test_mux21.v               *
 * mux21 のテストベンチ       *
 *                            */

`timescale 1ns / 1ns    // シミュレーションの単位時間 / 精度
                        // 1 ns = 1/1000000000 sec
`include "mux21.v"   // mux21.v の取り込み

module test_mux21 ;           // テストベンチモジュール, 入出力ポート無し
   // mux21 の入力用 flip-flop(1-bit レジスタ) の宣言
   reg S1, D0, D1;  // flip-flop

   // mux21 の出力用 wire(信号線) の宣言
   wire Y;         // 1-bit 信号線

   // module mux21 (S1, D0, D1, Y) の実体化
   mux21 mux21a(S1, D0, D1, Y);

   
   // シミュレーションパタン
   initial begin
       // S1, D0, D1 の初期値
       S1 = 0; D0 = 0; D1 = 0;

       // 20 単位時間(20 ns)後
       #20  S1 = 0; D0 = 1; D1 = 0;

       // 更に 20 単位時間(20 ns)後
       #20  S1 = 1; D0 = 1; D1 = 0;

       // 更に 20 単位時間(20 ns)後
       #20  S1 = 0; D0 = 0; D1 = 0;

       // 更に 80 単位時間(80 ns)後, 終了
       #80 $finish;
   end
endmodule
