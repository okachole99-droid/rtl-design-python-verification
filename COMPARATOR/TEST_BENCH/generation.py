#D:\d\Verilog_Prac\COMPARATOR\COMPARATOR.sim\sim_1\behav\xsim
import random
n=100
File_name="D:/d/Verilog_Prac/COMPARATOR/COMPARATOR.sim/sim_1/behav/xsim/Input_AB.mem"

with open (File_name,"w") as f:
    for i in range(n):
        A=random.randint(0,15)
        B=random.randint(0,15)

        f.write(f"{A:04b}{B:04b}\n")
    
print(f"File Input_AB.mem is genrated with test vector = {n}")