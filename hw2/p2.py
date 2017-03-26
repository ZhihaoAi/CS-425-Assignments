'''
SELECT 	    ProductName, SupplierID, CategoryID, Price
FROM 		products
WHERE       SupplierID in
            (SELECT     SupplierID
            FROM        products
            GROUP BY    SupplierID
            HAVING 	    COUNT(*) > 2);
'''

from p1 import *
def In(SELECT, prds='p1in.csv', input='p2in.csv', output='p2out.csv'):
    products = open(prds, 'r')
    p2in = open(input, "r")
    p2out = open(output, "w")

    attr = products.readline().split(',')
    where = p2in.readline().strip() # where = SupplierID
    whereidx = attr.index(where)
    idx = tuple(map(attr.index, SELECT))
    enum = tuple(map(str.strip, p2in.readlines()))

    p2out.write(','.join(SELECT) + '\n')
    for r in products:
        row = r.split(',')
        if row[whereidx] in enum:
            x = tuple(row[i] for i in idx)
            p2out.write(','.join(x) + '\n')

Groupby(SELECT=('SupplierID',), GROUPBY=('SupplierID',), output='p2in.csv')
In(SELECT=('ProductName', 'SupplierID', 'CategoryID', 'Price'))
