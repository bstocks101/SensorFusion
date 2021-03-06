function [XYZ, boolXYZ] = generateXYZ(film1, film2, start, stop, offset)
load('/Users/bradstocks/Documents/MATLAB/Thesis/calibration_struct.mat')
load('/Users/bradstocks/Documents/MATLAB/Thesis/Stereo_Calib_Results.mat')

XYZ = [];
boolXYZ = [];
%read in films
video1 = VideoReader(film1); 
video2 = VideoReader(film2);

cp1 = stereoParams.CameraParameters1;  cp2 = stereoParams.CameraParameters2;  
P1 = [stereoParams.CameraParameters1.IntrinsicMatrix' [0;0;0]];
Rt2 = [stereoParams.RotationOfCamera2' stereoParams.TranslationOfCamera2'];
P2 = stereoParams.CameraParameters2.IntrinsicMatrix'*Rt2;

% figure
% hold on

for i = start:stop
    i
    %read in individual frames
    image1 = read(video1, i);
    image2 = read(video2, i + offset); %offset for synchronisation


    [orangeFinal1, orangeFinal2, orangeFound1, orangeFound2] = generateOrangeXYZ(image1, image2);
    [greenFinal1, greenFinal2, greenFound1, greenFound2] = generateGreenXYZ(image1, image2);
    [pinkFinal1, pinkFinal2, pinkFound1, pinkFound2] = generatePinkXYZ(image1, image2);
    
    undistOrange1 = undistortPoints(orangeFinal1,cp1) ;
    undistOrange2 = undistortPoints(orangeFinal2,cp2);
    
    undistGreen1 = undistortPoints(greenFinal1,cp1); 
    undistGreen2 = undistortPoints(greenFinal2,cp2);
    
    %following used to get world points for each camera (not implemented)
    %fGreen1 = pointsToWorld(cp1, eye(3), [0 0 1], undistGreen1)
    %fGreen2 = pointsToWorld(cp2, stereoParams.RotationOfCamera2, stereoParams.TranslationOfCamera2, undistGreen2)
    
    undistPink1 = undistortPoints(pinkFinal1,cp1); 
    undistPink2 = undistortPoints(pinkFinal2,cp2);
    
    if(orangeFound1 == 1 && orangeFound2 == 1) 
        %Using matlab triangulation
        %orangeTriang = triangulate(undistOrange1, undistOrange2, P1', P2');
        
        %Using Stanford calibration (better)
        [left_orange, orangeTriang] = stereo_triangulation(undistOrange2', undistOrange1', om, T, fc_left, cc_left,...
            kc_left,alpha_c_left,fc_right,cc_right,kc_right,alpha_c_right);

        %Marker thresholds to detect basic errors
        if(orangeTriang(3) < 100||orangeTriang(3)>700)
            orangeZ = 0;
            %debugging, can remove
            a = 'ox'
        else
            orangeZ = 1;
            a = 'o'
        end
        
    else
        orangeTriang = [0; 0; 0];
        orangeZ = 0;
    end
    
    if(greenFound1 == 1 && greenFound2 == 1) 
        %greenTriang = triangulate(undistGreen1, undistGreen2, P1', P2');
        [left_green, greenTriang] = stereo_triangulation(undistGreen2', undistGreen1', om, T, fc_left, cc_left,...
            kc_left,alpha_c_left,fc_right,cc_right,kc_right,alpha_c_right);
        %plot3(greenTriang(1), greenTriang(2), greenTriang(3), 'gx');
        if(greenTriang(3) < 200||greenTriang(3) > 1500)
            greenZ = 0;
            a = 'gx'
        else
            greenZ = 1;
            a = 'g'
        end
    else
        greenTriang = [0; 0; 0];
        greenZ = 0;
    end
    
    if(pinkFound1 == 1 && pinkFound2 == 1) 
        %pinkTriang = triangulate(undistPink1, undistPink2, P1', P2');
        [left_pink, pinkTriang] = stereo_triangulation(undistPink2', undistPink1', om, T, fc_left, cc_left,...
            kc_left,alpha_c_left,fc_right,cc_right,kc_right,alpha_c_right);
        %plot3(pinkTriang(1), pinkTriang(2), pinkTriang(3), 'bx');
        if(pinkTriang(3) < 200||pinkTriang(3)>1500)
            i
            a= 'px'
            pinkZ = 0;
        else
            a = 'p'
            pinkZ = 1;
        end
        plot3(pinkTriang(1), pinkTriang(2), pinkTriang(3), 'rx');
        
    else
        pinkTriang = [0; 0; 0];
        pinkZ = 0;
    end
    

%Note the order returned, assumes orange at base, pink at middle, green at
%tip, may need to change
XYZ = [XYZ; orangeTriang', pinkTriang' , greenTriang'];
boolXYZ = [boolXYZ; orangeZ, pinkZ, greenZ];
    
end
end