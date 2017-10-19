module bcd1 (clk, reset, x, bcd1_out);
  input clk, reset, x;
  output [3:0] bcd1_out;

  reg [3:0] count_reg;    // 4-bit レジスタ

  assign bcd1_out = count_reg; // count_regは現在の値を記録しておく

  always @(posedge clk or negedge reset) begin
    if (reset == 1'b0) begin
      /*** レジスタの初期値設定 ***/
       count_reg <= 4'b0000;
    end else begin
      if ( x == 1'b1 ) begin  // x が 1'b1 のときカウンタが動く
        if ( count_reg == 4'b1001  ) begin  // 「ある条件でカウンタの値を 0 に戻す」 or 「カウントアップ」
          /*** カウンタの値を 0 に ***/
           count_reg <= 4'b000;
        end else begin
          /*** カウントアップ ***/
	   // 0000 → 0001 → 0010 → ... → 1001 → 0000  → ...
	   count_reg <= count_reg + 1;
        end  // END: if ( ) begin  // 「ある条件でカウンタの値を 0 に戻す」 or 「カウントアップ」
      end  // END: if ( ) begin  // x が 1'b1 のときカウンタが動く
    end  // END: if (reset == 1'b0) begin
  end  // END: always @(posedge clk or negedge reset) begin
endmodule // bcd1
