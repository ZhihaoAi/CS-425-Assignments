'''
SELECT 	    ProductName, SupplierName
FROM 		products, suppliers
WHERE       products.SupplierID = suppliers.SupplierID
'''

def Join(SELECT, where1, where2, prds='p1in.csv', input='p3in.csv', output='p3out.csv'):
    table1 = open(prds, 'r')
    p3in = open(input, "r")
    p3out = open(output, "w")

    attr1 = table1.readline().split(',')
    attr2 = p3in.readline().split(',')
    table2 = tuple(map(str.strip, p3in.readlines()))
    whereidx1, whereidx2 = attr1.index(where1), attr2.index(where2)
    idx = [attr1.index(e) if e in attr1 else -attr2.index(e) for e in SELECT]

    p3out.write(','.join(SELECT) + '\n')
    for r1 in table1:
        row1 = r1.split(',')
        for r2 in table2:
            row2 = r2.split(',')
            if row1[whereidx1] == row2[whereidx2]:
                x = tuple(row1[i] if i>0 else row2[-i] for i in idx)
                p3out.write(','.join(x) + '\n')

Join(SELECT=('ProductName', 'SupplierName'), where1='SupplierID', where2='SupplierID')
