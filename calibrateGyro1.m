function [calibX, calibY, calibZ] = calibrateGyro1(gyroStruct)
    temp = gyroStruct.Temp;
    
    calibX = gyroStruct.GyroX + 0.086 + 0.0028.*temp;
    calibY = gyroStruct.GyroY + 0.065 - 0.00092.*temp;
    calibZ = gyroStruct.GyroZ + 0.18 + 0.009.*temp;

end