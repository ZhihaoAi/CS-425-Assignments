# Anti-Join

# Part 1: Import Data Using CSV Module
import csv

deptname = set()
table1 = []  # employee table
with open('AntiJoinEmps.csv') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        table1.append(row)

table2 = []  # department table
with open('AntiJoinDepts.csv') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        table2.append(row)
        deptname.add(row['DeptName'])

table3 = []

# Part 2: Perform Anti-Join
for a in table1:
    if a['DeptName'] not in deptname:
        table3.append(a)

# Part 3: Print Output Table
with open('AntiJoinOutput.csv', 'w') as output:
    for r in table3:
        output.write(str(r) + '\n')
