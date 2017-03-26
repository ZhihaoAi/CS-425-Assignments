'''
SELECT 	    SupplierID, CategoryID, COUNT(*)
FROM 		products
GROUP BY 	SupplierID, CategoryID
HAVING 	    COUNT(*) > 2;
'''

def Groupby(SELECT, GROUPBY, input='p1in.csv', output='p1out.csv'):
    p1in = open(input, "r")
    p1out = open(output, "w")

    grps = {}
    grporder = []
    attr = p1in.readline().split(',')
    idx = tuple(map(attr.index, GROUPBY))

    for r in p1in:
        row = r.split(',')
        x = tuple(row[i] for i in idx)
        if x not in grps:
            grps[x] = []
            grporder.append(x)
        grps[x].append(row)

    # SELECT SupplierID, CategoryID, COUNT(*)
    p1out.write(','.join(SELECT) + '\n')
    for g in grporder:
        # HAVING COUNT(*) > 2
        if len(grps[g]) > 2:
            p1out.write(','.join(g))
            if 'COUNT(*)' in SELECT:
                p1out.write(',' + str(len(grps[g])))
            p1out.write('\n')

Groupby(SELECT=('SupplierID', 'CategoryID', 'COUNT(*)'), GROUPBY=('SupplierID', 'CategoryID'))
