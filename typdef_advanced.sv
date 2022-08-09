//usage of typedef : can be used to defined our own data types
//In case of packed array we an access single location or whole array
//Try to create Mysigned sd user defined data type as initially as a packed array which can be returned in function 

//limitation : typedef cant be declared for multidimensional array 
//can be used for one dimensional 
//dyn ARRAY of queues
//Ass Array of Quuees // When working with scoreboard and multiple fifos
//1 locatin of dyn/Ass array into 1 location of queue

module top();
  typedef bit signed [7:0] MysignedByte;
  typedef bit[7:0] MyByte;
  typedef MyByte MyByteQ[$];
  typedef MyByte MyByteDynArry[];
  //typedef MyByteDynArry MyByteDynArry[$];
  // typedef MyByteDynArry MyByteDynArryQ[$]; //cant be used multidimensional and unknow both parameters as dynamic
  
  bit [7:0] data[$]; //Queue
  MysignedByte signedData; //can be used here as data type from packed array
  MyByteQ byte_q;
  
  initial begin
    
    signedData = 'hAF;
    $display("signed value : %d",signedData);
    
    signedData[3] = 1'b0;
    $display("signed value : %d",signedData);
    
    $display("signed value from Func : %d",getMySignedByte(-10));
    
    data = getByteArray();
    
    while(data.size > 0) begin
      $display("DATA : %d",data.pop_front());
    end
  end
  
  function MysignedByte getMySignedByte(int A);
    return A;
  endfunction
  
  function MyByteQ getByteArray();
    bit[7:0] data[$];
    
    data.push_back('h01);
    data.push_back('h02);
    data.push_back('h03);
    data.push_back('h04);
    data.push_back('h05);
    data.push_back('h07);
    
    return data;
  endfunction
  
endmodule
