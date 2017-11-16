function newState = updateAttitude(angles, gyros)
    newState = sym(zeros(3,1));
    rotGyro = rotate_gyros(gyros, angles);
    
    newState(1) = angles(1) + rotGyro(1)/100;
    newState(2) = angles(2) + rotGyro(2)/100;
    newState(3) = angles(3) + rotGyro(3)/100;

end