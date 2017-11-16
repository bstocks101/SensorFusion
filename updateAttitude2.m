function a = updateAttitude2(angles, gyros, angles1, gyros1)
    newState = sym(zeros(3,1));
    temp = rotate_gyros(gyros1, angles1);
    rotGyro = rotate_gyros(gyros, [0, angles]);
    
    newState(1) = 0 + rotGyro(1)/100;
    newState(2) = angles(1) + rotGyro(2)/100;
    newState(3) = angles(2) + (rotGyro(3)-temp(3))/100;
    
    a = [newState(2);newState(3)];

end