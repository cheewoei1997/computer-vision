function gp = addnoise(f, r)
 
c = find(r == 1);
gp = f;
gp(c) = 255;
