function Mexp = att2mag(angles0)
Mexp = [12.391,	-3.998, -25.2151];

angles0(2) = angles0(2) - pi/2;
angles0(3) = angles0(3)-pi/4;
Mexp = rotate_vector(Mexp(1:3), angles0(1:3));

end