function ecef = NED2ECEF1(NED) %assume NED(1) = lat = Py0

ecef = [0, 0];
NED(1) = NED(1) / 100111;
NED(2) = NED(2) / 100111;

ecef = [(NED(1)-25.6762), (NED(2)+27.9245)];


end