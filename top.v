// 4-input, 4-bit-wide multiplexer
module mux4 #(parameter W = 4)(
    input  [W-1:0] A, B, C, D,
    input  [1:0]   Sel,
    input          Enable,
    output [W-1:0] Y
);
    wire [W-1:0] chosen;

    // Chained ternaries: the last else case can only be Sel == 3
    assign chosen = (Sel == 2'b00) ? A :
                    (Sel == 2'b01) ? B :
                    (Sel == 2'b10) ? C : D;

    assign Y = Enable ? chosen : {W{1'b0}};
endmodule

// 1-to-4 demultiplexer, 4-bit wide
module demux4 #(parameter W = 4)(
    input  [W-1:0] In,
    input  [1:0]   Sel,
    input          Enable,
    output [W-1:0] Y0, Y1, Y2, Y3
);
    // Four assigns, each with a single ternary
    assign Y0 = (Enable && Sel == 2'b00) ? In : {W{1'b0}};
    assign Y1 = (Enable && Sel == 2'b01) ? In : {W{1'b0}};
    assign Y2 = (Enable && Sel == 2'b10) ? In : {W{1'b0}};
    assign Y3 = (Enable && Sel == 2'b11) ? In : {W{1'b0}};
endmodule

module top(
    input  [15:0] sw,
    input         btnL, btnU, btnD, btnR, btnC,
    output [15:0] led
);
    wire [3:0] line;   // the single internet line between mux and demux

    wire [1:0] mux_sel   = {btnU, btnL};  // btnU = Sel[1], btnL = Sel[0]
    wire [1:0] demux_sel = {btnR, btnD};  // btnR = Sel[1], btnD = Sel[0]

    mux4 sender_valve (
        .A(sw[3:0]),      // CEO
        .B(sw[7:4]),      // You
        .C(sw[11:8]),     // Fred
        .D(sw[15:12]),    // Jill
        .Sel(mux_sel),
        .Enable(btnC),
        .Y(line)
    );

demux4 receiver_valve (
        .In(line),
        .Sel(demux_sel),
        .Enable(btnC),
        .Y0(led[3:0]),    // local_lib
        .Y1(led[7:4]),    // Fire Department
        .Y2(led[11:8]),   // School
        .Y3(led[15:12])   // Rib Shack
    );
endmodule
