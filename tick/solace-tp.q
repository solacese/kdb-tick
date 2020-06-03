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


onmsg:{[dest;payload;dict]
 j:.j.k "c"$payload;
 h(".u.upd";`quote;(.z.N;exec `$sym from j;exec "f"$bid from j;exec "f"$ask from j;exec "i"$bsize from j;exec "i"$asize from j)); 
 }

.solace.setTopicMsgCallback`onmsg

.solace.subscribeTopic[`$"solace/kdb/quote/>";1b];

