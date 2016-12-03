
declare function local:inccount($slot){
replace value of node $slot/count with '2'
};


for $x in doc("mancala.xml")/game/slot
where $x/@ID ="1" 
return $x
