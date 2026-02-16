#opcode=111 A=1110 B=1010 oprand_sel=1 | Out=0101 Carry=1
#D:\d\Verilog_Prac\ALU_SELFMADE\ALU_SELFMADE.sim\sim_1\behav\xsim

Log_file="D:/d/Verilog_Prac/ALU_SELFMADE/ALU_SELFMADE.sim/sim_1/behav/xsim/simulate.log"

total_test_vector=0
pass_test=0
failed_test=0
expected = 0
error_line=[]
Opreation={0: 'ADD',1: 'SUB',2: 'AND',3: 'OR',4: 'XOR', 5: 'XNOR', 6: 'LSL',7: 'LSR'}
#Opreation = {"ADD" : 0 , "SUB" : 1 , "AND" : 2 , "OR" : 3 , "XOR" : 4 , "XNOR" : 5, "LSL" : 6,"LSR" : 7}
with open (Log_file,"r") as f:
    for lineno,line in enumerate(f,1):
        total_test_vector += 1

        if line.startswith("opcode="):
            parts=line.strip().split(" ")

            opcode_bin=parts[0].split("=")[1]
            A_bin=parts[1].split("=")[1]
            B_bin=parts[2].split("=")[1]
            oprand_sel_bin=parts[3].split("=")[1]
            Out_bin=parts[5].split("=")[1]
            Carry_bin=parts[6].split("=")[1]

            opcode = int(opcode_bin,2)
            A = int(A_bin,2)
            B = int(B_bin,2)
            oprand_sel = int(oprand_sel_bin,2)
            Out = int(Out_bin,2)
            Carry = int(Carry_bin,2)
            #golden Rule
            match opcode:
                case 0:
                    expected = A + B 
                    expected_sum = expected & 0b1111
                    expected_carry = (expected>>4)&1

                    if (Carry==expected_carry or Out==expected_sum):
                        pass_test += 1
                    else:
                        failed_test +=1
                        error_line = lineno

                case 1:
                    expected = (A - B) & 0b11111
                    expected_diff = expected & 0b1111
                    expected_borrow = 1 if A<B else 0

                    if (Carry==expected_borrow and Out==expected_diff):
                        pass_test += 1
                    else:
                        failed_test +=1
                        error_line.append((opcode,lineno))

                case 2:
                    expected = (A & B)

                    if(Out == expected):
                        pass_test += 1
                    else:
                        failed_test +=1
                        error_line.append((opcode,lineno))

                case 3:
                    expected = (A | B)

                    if(Out == expected):
                        pass_test += 1
                    else:
                        failed_test +=1
                        error_line.append((opcode,lineno))

                case 4:
                    expected = (A ^ B)

                    if(Out == expected):
                        pass_test += 1
                    else:
                        failed_test +=1
                        error_line.append((opcode,lineno))
                        
                case 5:
                    expected=~(A ^ B) & 0b1111

                    if(Out == expected):
                        pass_test += 1
                    else:
                        failed_test +=1
                        error_line.append((opcode,lineno))

                case 6:
                    if oprand_sel == 0:
                        expected = (A << 1) & 0b1111
                    else:
                        expected = (B << 1) & 0b1111                    
                    if(Out == expected):
                        pass_test += 1
                    else:
                        failed_test +=1
                        error_line.append((opcode,lineno))

                case 7:
                    if oprand_sel == 0:
                        expected = (A >> 1) & 0b1111
                    else:
                        expected = (B >> 1) & 0b1111
                                            
                    if(Out == expected):
                        pass_test += 1
                    else:
                        failed_test +=1
                        error_line.append((opcode,lineno))

print("Simulation Summary")
print("-------------------")
print("PASS count :", pass_test)
print("ERROR count:", failed_test)

if failed_test == 0:
    print("FINAL RESULT: DESIGN PASSED")
else:
    print("FINAL RESULT: DESIGN FAILED")
    print("----------------------------")
    for opcode,lineno in error_line:
        print(f"Opcode: {Opreation[opcode]} | Line number:{lineno}")
    



