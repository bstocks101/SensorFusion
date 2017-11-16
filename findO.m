function orangeBin = findO(frame)
    orangeBin= zeros(720, 1280);
    sample = [[202 78 70]; [235 72 63];[239 38 56];[215 49 32];[196 78 86];
        [260 0 18];[163 34 43];[152 38 38];[249 126 99];[235 127 131];[240 25 35];
        [235 39 41]];
    angle_threshold = 3;
    mag_threshold = 70;
    doubleFrame = double(frame);
    normFrame = sqrt(sum(doubleFrame(:, :, :).^2, 3));

    for i = 1:size(sample, 1)
        temp = sample(i, :);
        %magDiff = abs(normFrame - sqrt(sum((temp).^2)));
        magDiff = abs(doubleFrame(:, :, 1) - temp(1)) + abs(doubleFrame(:, :, 2) - temp(2)) + abs(doubleFrame(:, :, 3) - temp(3));
        innerProduct = temp(1)*doubleFrame(:,:,1) + temp(2)*doubleFrame(:,:,2) + temp(3)*doubleFrame(:,:,3);
        angle = abs(acosd(innerProduct./(norm(temp)*normFrame)));
        orangeBin((angle<angle_threshold) .* (magDiff < mag_threshold) == 1)=250;
    end
    
    %Note: sometimes best to disable filtering for orange, test dependent
    sedisk = strel('disk', 4);
    orangeBin = imopen(orangeBin, sedisk);
end