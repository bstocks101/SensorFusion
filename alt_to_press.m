function press = alt_to_press(alt)
temp = alt;
press = 1013.25 * (1-(temp/44307.7))^(1/0.190204);

end
