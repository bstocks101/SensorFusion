function pinkBin = findP(frame)
    pinkBin= zeros(720, 1280);
    %samples to be compared to (can be changed)
    sample = [[181 89 152];[250 149 197];[103 59 77];[173 114 113];[219 140 162];
        [174 108 123];[202 132 158];[76 37 37];[188 89 113];[133 93 102];
        [141 84 87];[105 51 74];[163 102 98];[123 66 62];[112 70 91];
        [104 51 69];[114 81 99];[90 52 60];[125 41 51];[150 76 85];[140 57 67];
        [166 83 75];[144 67 61];[177 93 106];[109 44 80];[166 77 120];
        [166 88 123]];
    %Thresholds for detection (can be changed)
    angle_threshold = 3;
    mag_threshold = 80;
    doubleFrame = double(frame);
    normFrame = sqrt(sum(doubleFrame(:, :, :).^2, 3));

    for i = 1:size(sample, 1)
        temp = sample(i, :);
        magDiff = abs(doubleFrame(:, :, 1) - temp(1)) + abs(doubleFrame(:, :, 2) - temp(2)) + abs(doubleFrame(:, :, 3) - temp(3));
        innerProduct = temp(1)*doubleFrame(:,:,1) + temp(2)*doubleFrame(:,:,2) + temp(3)*doubleFrame(:,:,3);
        angle = abs(acosd(innerProduct./(norm(temp)*normFrame)));
        pinkBin((angle<angle_threshold) .* (magDiff < mag_threshold) == 1)=250;
    end

    sedisk = strel('disk', 4);
    %filter out unconnected regions
    pinkBin = imopen(pinkBin, sedisk);

end