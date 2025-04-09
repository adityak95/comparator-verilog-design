module FA(a,b,cin,sum,carry);
input a,b,cin;
output reg sum,carry;

{carry,sum}=a+b+cin;

endmodule 
module Comparator(a,b,cin,s,c,agb,aeb,alb);
input [3:0]a,b;
input cin;
output [3:0]s;
output carry;
output agb,aeb,alb;
wire [6:0]w;

FA g1(.carry(w[0]),.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]));
FA g2(.carry(w[1]),.a(a[1]),.b(b[1]),.cin(w[0]),.s(s[1]));
FA g3(.carry(w[2]),.a(a[2]),.b(b[2]),.cin(w[1]),.s(s[2]));
FA g4(.carry(carry),.a(a[3]),.b(b[3]),.cin(w[2]),.s(s[3]));

assign agb=carry?agb:0;
and g8(aeb,s[0],s[1],s[2],s[3]);
or g9(w[3],aeb,agb);
not g(alb,w[3]);

endmodule

