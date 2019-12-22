// File: 01logit.mod
// Author: Yan Liu
// Date: Fri Nov 12 16:43:52 2010
//
// Logit model
// 4 alternatives: not buy, gasoline, electric and hybrid

[ModelDescription]
"Example of a logit model for a transportation mode choice with 4 alternatives:"
"- not buy"
"- gasoline car"
"- electric car"
"- hybrid car"

[Choice]
choice

[Beta]
// Name Value  LowerBound UpperBound  status (0=variable, 1=fixed)
ASC_not 	0 -10              10              0
ASC_gas 	0 -10              10              1
ASC_ele 	0 -10              10              0
ASC_hyd 	0 -10              10              0

B_price         0 -10              10              0
B_mpg_s         0 -10              10              0
B_mpg           0 -10              10              0

[Utilities]
// Id Name     Avail       linear-in-parameter expression (beta1*x1 + beta2*x2 + ... )
    1 A1_not  one         ASC_not * one + B_price * curveh_price_s + B_mpg [ B_mpg_s ] * curveh_mpg_s
    2 A2_gas  one         ASC_gas * one + B_price * gasveh_price_s + B_mpg [ B_mpg_s ] * gasveh_mpg_s
    3 A3_ele  one         ASC_ele * one + B_price * bev_price_s + B_mpg [ B_mpg_s ] * bev_mpg_s
    4 A4_hyd  one         ASC_hyd * one + B_price * hev_price_s + B_mpg [ B_mpg_s ] * hev_mpg_s
 

[Expressions] 
// Define here arithmetic expressions for name that are not directly 
// available from the data
one = 1 
zero = 0 

curveh_price_s = curveh_price / 1000
curveh_mpg_s = curveh_mpg / 1000
gasveh_price_s = gasveh_price / 1000
gasveh_mpg_s = gasveh_mpg / 1000
bev_price_s = bev_price / 1000
bev_mpg_s = bev_mpg / 1000
hev_price_s = hev_price / 1000
hev_mpg_s = hev_mpg / 1000

[Draws]
1000

[Model]
// $MNL stands for "multinomial logit model", 
$MNL
