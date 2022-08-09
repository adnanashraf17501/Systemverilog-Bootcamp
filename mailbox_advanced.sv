//Mailboxes have internal semaphores
//Tasks like put / get which are waiting
//used to avoid overflow/underflow conditions for a buffer 

module top();
mailbox#(bit [7:0]) data_q;
initial begin
	data_q= new(5);
fork
//Transmitter
begin
forever begin
#1;
data_q.put($urandom());
end
end
//Reciever
begin
bit [7:0] data;
forever begin
#2;    //delay given for synchronisation for reciever and transmitter 
data_q.get(data);
$display("Recieved Data : %d",data); 
end
end
begin
#50;
end
join_any
$display("%f : out of fork join_any", $time);
#10;
disable fork;
$display("%f : After disable fork", $time);
#10;
$finish();
end
endmodule
