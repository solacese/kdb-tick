\l solace.q

default.host :"localhost:55555"
default.vpn  :"default"
default.user :"default"
default.pass :"default"


if[not "w"=first string .z.o;system "sleep 1"];


sendToSolace:{[t;d]
        if[not 98h=type d;:(::)];
        d:update `g#sym from d;
        s:exec distinct sym from d;
        topics:{[t;s] "/" sv ("solace/kdb";string t;string s)}[t] each s;
        json:{[d;s] .j.j select from d where sym=s}[d] each s;
        .solace.sendDirect'[topics;json]
    }


upd:sendToSolace;


/ get the ticker plant and history ports, defaults are 5010,5012
.u.x:.z.x,(count .z.x)_(":5010";":5012");


/ init schema and sync up from log file;cd to hdb(so client save can run)
.u.rep:{(.[;();:;].)each x;if[null first y;:()];-11!y;system "cd ",1_-10_string first reverse y};
/ HARDCODE \cd if other than logdir/db

/ connect to ticker plant for (schema;(logcount;log))
.u.rep .(hopen `$":",.u.x 0)"(.u.sub[`;`];`.u `i`L)";





