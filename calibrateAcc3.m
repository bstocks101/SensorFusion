function [tempX, tempY, tempZ] = calibrateAcc3(data)

a =  [[0.9918   -0.0085   -0.0145];
   [-0.0055    0.9979    0.0219];
   [-0.0355   -0.0076    0.9891];
    [0.0450   -0.0295   -0.0107]];
Y = [data.AccX, data.AccY, data.AccZ, ones(size(data.AccX, 1), 1)]*a;
tempX = Y(:, 1) * 9.81;
tempY = Y(:, 2) * -9.81;
tempZ = (Y(:, 3) * 9.81);

end