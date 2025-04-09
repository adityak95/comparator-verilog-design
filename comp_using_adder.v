module FA(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;

{carry,sum}=a+b+cin;

endmodule 
module CA(a,b,cin,s,c);
input [3:0]a,b;
input cin;
output [3:0]s;
output carry;
wire [2:0]w;

FA g1(.carry(w[0]),.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]));
FA g2(.carry(w[1]),.a(a[1]),.b(b[1]),.cin(w[0]),.s(s[1]));
FA g3(.carry(w[2]),.a(a[2]),.b(b[2]),.cin(w[1]),.s(s[2]));
FA g4(.carry(carry),.a(a[3]),.b(b[3]),.cin(w[2]),.s(s[3]));
 
endmodule

module comparator(agb,aeb,alb,a,b);
input [3:0]a,b;
output agb,aeb,alb;
wire [3:0]w;

and g2(aeb,w[3],w[2],w[1],w[0]);
nor g3(alb,aeb,agb);
parallel g1 (w,agb,a,~b,1'b0);

endmodule
