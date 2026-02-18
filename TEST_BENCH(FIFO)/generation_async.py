#D:\d\Verilog_Prac\FIFO\FIFO.sim\sim_1\behav\xsim
import random

n = 10

File_name="D:/d/Verilog_Prac/FIFO/FIFO.sim/sim_1/behav/xsim/AsyncVector.mem"
with open(File_name, "w") as f:
    for _ in range(n):
        wr_en = random.randint(0, 1)
        rd_en = random.randint(0, 1)
        data  = random.randint(0, 255)

        # Format: wr_en(1) rd_en(1) data(8)
        f.write(f"{wr_en}{rd_en}{data:08b} \n")

print("-------------FILE GENERATION-----------------------")
print(f"Vector file generated of {n} vectors.")