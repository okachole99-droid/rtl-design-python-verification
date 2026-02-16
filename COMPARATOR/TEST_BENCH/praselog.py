#A=0000|B=0011|eq=0|gt=0|lt=1

Log_file="D:/d/Verilog_Prac/COMPARATOR/COMPARATOR.sim/sim_1/behav/xsim/simulate.log"

test_preformed=0
pass_count=0
fail_count=0
expected_eq=0
expected_gt=0
expected_lt=0
with open(Log_file,"r") as f:
    for lines in f:
        if lines.startswith("A="):
            test_preformed += 1

            lines=lines.strip()
            parts = lines.split("|")

            A_bin  = parts[0].split("=")[1]
            B_bin  = parts[1].split("=")[1]
            eq_bin = parts[2].split("=")[1]
            gt_bin = parts[3].split("=")[1]
            lt_bin = parts[4].split("=")[1]

            A=int(A_bin,2)
            B=int(B_bin,2)

            eq = int(eq_bin,2)
            gt = int(gt_bin,2)
            lt = int(lt_bin,2)

            #Golden rule
            if (A==B):
                expected_eq=1
            elif(A>B):
                expected_gt=1
            else:
                expected_lt=1   
           
            if (expected_eq==eq or expected_gt==gt or expected_lt ==lt):
                pass_count += 1

            else:
                fail_count += 1
                
#Simulation done
print("---------------Summary-------------------")
print("Simulation Done!!!")   
print(f"Testcases Run: {test_preformed}")
print(f"Passed testcases: {pass_count}") 
print(f"Failed testcases: {fail_count}")  
