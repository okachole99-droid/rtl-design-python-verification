#D:\d\Verilog_Prac\ALU_SELFMADE\ALU_SELFMADE.sim\sim_1\behav\xsim
import random
File_name="D:/d/Verilog_Prac/ALU_SELFMADE/ALU_SELFMADE.sim/sim_1/behav/xsim/ALU_input.mem"
#----------------------Random testing-------------------------------
# n=100
# with open (File_name,"w") as f:
#         for i in range(n):
#             A=random.randint(0,15)
#             B=random.randint(0,15)
#             opcode=random.randint(0,7)
#             oprand_sel=random.randint(0,1)

#             f.write(f"{A:04b}{B:04b}{opcode:03b}{oprand_sel:01b}\n")

# print("------------File created sucessfully------------------")
# print("Name:ALU_input.mem")
# print(f"Number of Test vector:{n}")
# print(f"Location: {File_name}")

#----------------------Exhaustive testing-------------------------------
count = 0
with open (File_name,"w") as f:
        for i in range(16):
            for j in range(16):
                for k in range(8):
                    for l in range(1):
                        A=random.randint(0,15)
                        B=random.randint(0,15)
                        opcode=random.randint(0,7)
                        oprand_sel=random.randint(0,1)

                        f.write(f"{A:04b}{B:04b}{opcode:03b}{oprand_sel:01b}\n")
                        count += 1

print("------------File created sucessfully------------------")
print("Name:ALU_input.mem")
print(f"Number of Test vector:{count}")
print(f"Location: {File_name}")

