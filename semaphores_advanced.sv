--------------------------------------@COPYRIGHTS----------------------------------------------------------
--------------------------------------AUTHOR : ADNAN ASHRAF------------------------------------------------
--------------------------------------Design verification Engineer-----------------------------------------
--------------------------------------Email:adnan.workday.amd@gmail.com------------------------------------
--------------------------------------Contact : +91 9682512130---------------------------------------------
--------------------------------------Free Copyrights : Anyone can use, reimplement and modify the code as per his/her need---------------------------------
module top();

bit[7:0] data_q[$:4]; //limited the queue size, not the size of the queue as size is still not declared and 0
//	semaphore sem;

		initial begin
		//sem = new(1);
fork
//Transmitter
begin
forever begin
//sem.get(1);
#1;
data_q.push_back($urandom());
//sem.put(1);
end
end
//Reciever
begin
forever begin
#2; //reciver is 1/2 times slower than transmitter hence we need to use keys and a manager task to synchronise between Tx and Rx
$display("Recieved DATA : %d",data_q.pop_front());
end
end
//Manager task
begin
forever begin
wait(data_q.size()==5);
//sem.get(1); //snatches the key from transmitter
wait(data_q.size()<5);
//sem.put(1);
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

//Synchronisation issues between TX and RX seen , as TX is faster than than RX and underflow condition occurs ... Hence semaphores assign key to TX to send down to 4 and then snatches key hence gives buffer to reciever to maintain TX speed 

//waits for queue to become full
//in opposite case waits for queue to become empty if TX is slower than reciever....




