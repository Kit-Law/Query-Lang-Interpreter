INPUT F.csv : f1, f2, f3; G.csv : g1, g2, g3;
WHERE f2 != NOTHING && f3 != NOTHING && f2 == g1 && f3 == g2
OUT f1,
	g3