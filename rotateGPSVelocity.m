function speed = rotateGPSVelocity(Vx, Vy)
    speed = sqrt((Vx*111000)^2 + (Vy*111000)^2);
end