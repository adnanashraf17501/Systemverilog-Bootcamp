--------------------------------------@COPYRIGHTS----------------------------------------------------------
--------------------------------------AUTHOR : ADNAN ASHRAF------------------------------------------------
--------------------------------------Design verification Engineer-----------------------------------------
--------------------------------------Email:adnan.workday.amd@gmail.com------------------------------------
--------------------------------------Contact : +91 9682512130---------------------------------------------
--------------------------------------Free Copyrights : Anyone can use, reimplement and modify the code as per his/her need---------------------------------
// Playing with queues
module top();
  
  bit[7:0] data[$];   
  //unbounded queue
    int size_of_q; 
  bit[7:0] data_q[$:5];   //bounded queue
  
  initial begin
    $display("size of queue %d",data.size());
    $display("size of Bounded queue %d",data_q.size());
     
    for(int i =0; i < 10; i++) begin
      data.push_back($urandom());
      data_q.push_back($urandom());
      $display("DATA : LOC : %d,  Data : %h",i,data[i],data.size());
    end
    
        for(int i =0; i < data.size; i++) begin
       $display("DATA : LOC : %d,  Data : %h",i,data[i],data.size());
        end
    
      $display("FRONT DATA : %h",data[0]);
      //$display("BACK DATA : %h",data[$-1]); //or data.size-1 
    $display("BACK DATA : %h",data[data.size-1]); //or data.size-1 
       //isplay("BACK DATA : %h",data[$]); //or data.size-1 
      
      //Append data at end (push_back)
      data = {data,8'h90};
      
      //Append data at front (pop_front)
      data = {8'h90,data};
      
     /* //1.underflow
      for(int i = 0; i < 10; i++) begin
        $display("DATA : LOC : %d,  Data : %h",i,data_q.pop_front(),data_q.size());
      end
    */     // due to underflow not getting prperly so lets comment 
      //2. Remove the data back way /insert data back way
                for(int i =0; i < data.size; i++) begin
                  $display("Before Insert DATA : LOC : %d,  Data : %h",i,data[i],data.size());
                end
      data.insert(3,8'hFF);
                  
          for(int i =0; i < data.size; i++) begin
            $display("After insert DATA : LOC : %d,  Data : %h",i,data[i],data.size());
          end
    data.delete(3);
    
             for(int i =0; i < data.size; i++) begin
               $display("After Delete DATA : LOC : %d,  Data : %h",i,data[i],data.size());
          end
  end
endmodule

/* [2022-08-08 06:57:20 EDT] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do "vsim -voptargs=+acc=npr; run -all; exit" -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 06:57:22 on Aug 08,2022
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling module top

Top level modules:
	top
End time: 06:57:22 on Aug 08,2022, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "vsim -voptargs=+acc=npr; run -all; exit" -voptargs="+acc=npr" 
# Start time: 06:57:22 on Aug 08,2022
# ** Note: (vsim-3812) Design is being optimized...
# //  Questa Sim-64
# //  Version 2021.3 linux_x86_64 Jul 13 2021
# //
# //  Copyright 1991-2021 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  QuestaSim and its associated documentation contain trade
# //  secrets and commercial or financial information that are the property of
# //  Mentor Graphics Corporation and are privileged, confidential,
# //  and exempt from disclosure under the Freedom of Information Act,
# //  5 U.S.C. Section 552. Furthermore, this information
# //  is prohibited from disclosure under the Trade Secrets Act,
# //  18 U.S.C. Section 1905.
# //
# Loading sv_std.std
# Loading work.top(fast)
# 
# vsim -voptargs=+acc=npr
# run -all
# size of queue           0
# size of Bounded queue           0
# DATA : LOC :           0,  Data : b8          1
# DATA : LOC :           1,  Data : 66          2
# DATA : LOC :           2,  Data : c6          3
# DATA : LOC :           3,  Data : 72          4
# DATA : LOC :           4,  Data : 67          5
# DATA : LOC :           5,  Data : 6a          6
# ** Warning: (vsim-2553) Queue operation would exceed max. right index of 5.
# 
#    Time: 0 ns  Iteration: 0  Process: /top/#INITIAL#9 File: testbench.sv Line: 15
# DATA : LOC :           6,  Data : 6f          7
# ** Warning: (vsim-2553) Queue operation would exceed max. right index of 5.
# 
#    Time: 0 ns  Iteration: 0  Process: /top/#INITIAL#9 File: testbench.sv Line: 15
# DATA : LOC :           7,  Data : 35          8
# ** Warning: (vsim-2553) Queue operation would exceed max. right index of 5.
# 
#    Time: 0 ns  Iteration: 0  Process: /top/#INITIAL#9 File: testbench.sv Line: 15
# DATA : LOC :           8,  Data : ae          9
# ** Warning: (vsim-2553) Queue operation would exceed max. right index of 5.
# 
#    Time: 0 ns  Iteration: 0  Process: /top/#INITIAL#9 File: testbench.sv Line: 15
# DATA : LOC :           9,  Data : db         10
# DATA : LOC :           0,  Data : b8         10
# DATA : LOC :           1,  Data : 66         10
# DATA : LOC :           2,  Data : c6         10
# DATA : LOC :           3,  Data : 72         10
# DATA : LOC :           4,  Data : 67         10
# DATA : LOC :           5,  Data : 6a         10
# DATA : LOC :           6,  Data : 6f         10
# DATA : LOC :           7,  Data : 35         10
# DATA : LOC :           8,  Data : ae         10
# DATA : LOC :           9,  Data : db         10
# FRONT DATA : b8
# BACK DATA : db
# Before Insert DATA : LOC :           0,  Data : 90         12
# Before Insert DATA : LOC :           1,  Data : b8         12
# Before Insert DATA : LOC :           2,  Data : 66         12
# Before Insert DATA : LOC :           3,  Data : c6         12
# Before Insert DATA : LOC :           4,  Data : 72         12
# Before Insert DATA : LOC :           5,  Data : 67         12
# Before Insert DATA : LOC :           6,  Data : 6a         12
# Before Insert DATA : LOC :           7,  Data : 6f         12
# Before Insert DATA : LOC :           8,  Data : 35         12
# Before Insert DATA : LOC :           9,  Data : ae         12
# Before Insert DATA : LOC :          10,  Data : db         12
# Before Insert DATA : LOC :          11,  Data : 90         12
# After insert DATA : LOC :           0,  Data : 90         13
# After insert DATA : LOC :           1,  Data : b8         13
# After insert DATA : LOC :           2,  Data : 66         13
# After insert DATA : LOC :           3,  Data : ff         13
# After insert DATA : LOC :           4,  Data : c6         13
# After insert DATA : LOC :           5,  Data : 72         13
# After insert DATA : LOC :           6,  Data : 67         13
# After insert DATA : LOC :           7,  Data : 6a         13
# After insert DATA : LOC :           8,  Data : 6f         13
# After insert DATA : LOC :           9,  Data : 35         13
# After insert DATA : LOC :          10,  Data : ae         13
# After insert DATA : LOC :          11,  Data : db         13
# After insert DATA : LOC :          12,  Data : 90         13
# After Delete DATA : LOC :           0,  Data : 90         12
# After Delete DATA : LOC :           1,  Data : b8         12
# After Delete DATA : LOC :           2,  Data : 66         12
# After Delete DATA : LOC :           3,  Data : c6         12
# After Delete DATA : LOC :           4,  Data : 72         12
# After Delete DATA : LOC :           5,  Data : 67         12
# After Delete DATA : LOC :           6,  Data : 6a         12
# After Delete DATA : LOC :           7,  Data : 6f         12
# After Delete DATA : LOC :           8,  Data : 35         12
# After Delete DATA : LOC :           9,  Data : ae         12
# After Delete DATA : LOC :          10,  Data : db         12
# After Delete DATA : LOC :          11,  Data : 90         12
# exit
# End time: 06:57:23 on Aug 08,2022, Elapsed time: 0:00:01
# Errors: 0, Warnings: 4
*/
