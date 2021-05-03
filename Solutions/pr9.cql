INPUT R.csv : root, n1a; R.csv : n1b, n2a; R.csv : n2b, tail;
WHERE n1a == n1b && n2a == n2b
OUT root, tail