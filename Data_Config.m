%Data Config file

%set to 1 if you want to run image processing
generateVisualCoords = 1;

%video files and offset between right and left video
videoDetails = struct;
videoDetails.rightVideo = './Submit/Test Data/right.MP4';
videoDetails.leftVideo = './Submit/Test Data/left.MP4';
videoDetails.offset = -161;

%test information and data location and offsets (beep in right video)
testDetails = struct;
testDetails.startFrame = 2678;
testDetails.stopFrame = 2731;
testDetails.beepFrame = 800;
testDetails.csvName = './Submit/Test Data/2016-10-09-08-12-19.csv';

%start and stop values for phone and MW sensors
phoneStart = testDetails.startFrame - testDetails.beepFrame - 23;
phoneStop = testDetails.stopFrame - testDetails.beepFrame - 23;
MWstart = phoneStart + 22;
MWstop = phoneStop + 22;

%replace all null values with 0's and read in data
find_and_replace(testDetails.csvName, 'null', '0, 0, 0');
X = csvread(testDetails.csvName, 1, 0);

%extract relevant phone and MW data for test
phoneData = struct;
phoneData.Pressure = X(phoneStart:phoneStop, 1);
phoneData.MagX = X(phoneStart:phoneStop, 2);
phoneData.MagY = X(phoneStart:phoneStop, 3);
phoneData.MagZ = X(phoneStart:phoneStop, 4);
phoneData.AccX = X(phoneStart:phoneStop, 5);
phoneData.AccY = X(phoneStart:phoneStop, 6);
phoneData.AccZ = X(phoneStart:phoneStop, 7);
phoneData.GyroX = X(phoneStart:phoneStop, 8);
phoneData.GyroY = X(phoneStart:phoneStop, 9);
phoneData.GyroZ = X(phoneStart:phoneStop, 10);
phoneData.GPSlat = X(phoneStart:phoneStop, 11);
phoneData.GPSlon = X(phoneStart:phoneStop, 12);
phoneData.GPSspeed = X(phoneStart:phoneStop, 13);
phoneData.GPSbearing = X(phoneStart:phoneStop, 14);
phoneData.GPSavailable = GPS_data(phoneData.GPSlat);

MW1data = struct;
MW1data.GyroX = X(MWstart:MWstop, 19);
MW1data.GyroY = X(MWstart:MWstop, 20);
MW1data.GyroZ = X(MWstart:MWstop, 21);
MW1data.Temp = X(MWstart:MWstop, 25);

MW2data = struct;
MW2data.GyroX = X(MWstart:MWstop, 29);
MW2data.GyroY = X(MWstart:MWstop, 30);
MW2data.GyroZ = X(MWstart:MWstop, 31);
MW2data.Temp = X(MWstart:MWstop, 35);

MW3data = struct;
MW3data.AccX = X(MWstart:MWstop, 36);
MW3data.AccY = X(MWstart:MWstop, 37);
MW3data.AccZ = X(MWstart:MWstop, 38);

%if needed, generate visual coordinates (will take a while if enabled)
if(generateVisualCoords)
    [XYZ, boolXYZ] = generateXYZ(videoDetails.rightVideo,videoDetails.leftVideo,...
        testDetails.startFrame, testDetails.stopFrame, videoDetails.offset);
    videoData = struct;
    XYZn = [XYZ(:, 3), -XYZ(:, 1), -XYZ(:, 2)-50, XYZ(:, 6), -XYZ(:, 4), -XYZ(:, 5)-50,...
    XYZ(:, 9), -XYZ(:, 7), -XYZ(:, 8)-50];
    videoData.XYZ = XYZn;
    videoData.boolXYZ = boolXYZ;
    save('videoData.mat', '-struct', 'videoData');
end

%calibrate MW data
[temp1, temp2, temp3] = calibrateGyro1(MW1data);
MW1data.GyroX = deg2rad(temp1);
MW1data.GyroY = deg2rad(temp2);
MW1data.GyroZ = deg2rad(temp3);

[temp1, temp2, temp3] = calibrateGyro2(MW2data);
MW2data.GyroX = deg2rad(temp1);
MW2data.GyroY = deg2rad(temp2);
MW2data.GyroZ = deg2rad(temp3);

[temp1, temp2, temp3] = calibrateAcc3(MW3data);
MW3data.AccX = temp1;
MW3data.AccY = temp2;
MW3data.AccZ = temp3;

%save files
save('phoneData.mat', '-struct' , 'phoneData');
save('MW1Data.mat', '-struct', 'MW1data');
save('MW2Data.mat', '-struct', 'MW2data');
save('MW3Data.mat', '-struct', 'MW3data');
