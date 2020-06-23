\l solace.q

default.host :"localhost:55555"
default.vpn  :"default"
default.user :"default"
default.pass :"default"

params:.Q.def[`$1_default].Q.opt .z.x


-1"### Initializing session";
initparams:params`SESSION_HOST`SESSION_VPN_NAME`SESSION_USERNAME`SESSION_PASSWORD!`host`vpn`user`pass;
if[0>.solace.init initparams;-2"### Initialization failed";exit 1];

h:neg hopen `:localhost:5010; /connect to tickerplant 


0op

