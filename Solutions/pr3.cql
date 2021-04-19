INPUT P.csv : p1, p2, p3, p4; Q.csv : q1, q2, q3, q4;
WHERE p1 == q1
OUT p1,
    p2 != NOTHING ? p2 : q2,
    p3 != NOTHING ? p3 : q3,
    p4 != NOTHING ? p4 : q4