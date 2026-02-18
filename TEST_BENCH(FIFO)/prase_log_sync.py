# #Cycle=4 wr_en=1 rd_en=1 data_in=01100100 data_out=01100100 full=0 empty=0
print("Analysing the file........")
Log_file = "D:/d/Verilog_Prac/FIFO/FIFO.sim/sim_1/behav/xsim/simulate.log"

DEPTH = 16

ERROR_COUNT = 0
PASS_COUNT = 0
TEST_VECTOR = 0
Underflow = 0
Overflow = 0
fifo = []

with open(Log_file, "r") as f:
    for lines in f:

        if lines.startswith("Cycle="):
            TEST_VECTOR += 1

            parts = lines.strip().split(" ")

            Cycle_bin = parts[0].split("=")[1]
            wr_en_bin = parts[1].split("=")[1]
            rd_en_bin = parts[2].split("=")[1]
            data_in_bin = parts[3].split("=")[1]
            data_out_bin = parts[4].split("=")[1]

            Cycle = int(Cycle_bin, 10)
            wr_en = int(wr_en_bin, 2)
            rd_en = int(rd_en_bin, 2)
            data_in = int(data_in_bin, 2)
            data_out = int(data_out_bin, 2)

            read_valid = False
            model_full = (len(fifo) == DEPTH)
            model_empty = (len(fifo) == 0)

            if rd_en:
                if not model_empty:
                    read_valid = True
                    expected_data_out = fifo.pop(0)
                elif wr_en:
                    read_valid = True
                    expected_data_out = data_in
            

            if wr_en and (not model_full or rd_en):
                fifo.append(data_in)

            if read_valid:
                if data_out == expected_data_out:
                    PASS_COUNT += 1
                else:
                    ERROR_COUNT += 1
                    print(f"Mismatch at Cycle {Cycle} | Expected={expected_data_out} Actual={data_out}")

            if model_full and wr_en:
                Overflow += 1
            if model_empty and rd_en:
                Underflow += 1        

print("--------------SUMMARY------------")
print(f"Total Cycles Parsed: {TEST_VECTOR}")
print(f"Total Valid Reads Checked: {PASS_COUNT}")
print(f"Underflow Attempts:{Underflow}")
print(f"Overflow Attempts:{Overflow}")
print(f"Errors:{ERROR_COUNT}")


if ERROR_COUNT == 0:
    print(f"Test passed: {PASS_COUNT}")
else:
    print(f"Test failed. Errors: {ERROR_COUNT}")

