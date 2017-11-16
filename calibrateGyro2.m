function [calibX, calibY, calibZ] = calibrateGyro2(gyroStruct)
    temp = gyroStruct.Temp;
    
    calibX = gyroStruct.GyroX - 0.11 - 0.024.*temp;
    calibY = gyroStruct.GyroY + 0.49 - 0.022.*temp;
    calibZ = gyroStruct.GyroZ - 0.1 + 0.0046.*temp;

end