# Left-Outer-Join

# Part 1: Import Data Using CSV Module
import csv

table1 = []  # employee table
with open('LeftOuterJoinEmps.csv') as csv1:
    reader = csv.DictReader(csv1)
    for row in reader:
        table1.append(row)

table2 = []  # department table
with open('LeftOuterJoinDepts.csv') as csv2:
    reader = csv.DictReader(csv2)
    for row in reader:
        table2.append(row)

table3 = []  # output table

# Part 2: Perform the Left-Outer-Join
for a in table1:
    flag = False
    for b in table2:
        if a['DeptName'] == b['DeptName']:
            tempMan = b['Manager']
            flag = True
            break
    table3.append(a)
    a['Manager'] = tempMan if flag else 'Null'

# Part 3: Print Output Table
with open('LeftOuterJoinOutput.csv', 'w') as output:
    for r in table3:
        output.write(str(r) + '\n')
