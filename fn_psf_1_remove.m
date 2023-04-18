function fn_psf_1_remove(ini,fin,step)
% This function is used to remove the "_1" from the PSF file name 
% when using the customized LabView PSF capture program.
% ver 1.0
% Last update: Apr 18th, 2023 by Keyi Han

    selpath = uigetdir;   % select the folder of captured exp psf
    cd(selpath)
    mkdir("removed")

    if nargin == 0   % if empty input, then use default
        ini = 45000;
        fin = 55000;
        step = 100;
    end

    for i = ini:step:fin
        img = tiffreadVolume("dcam_" + i + "_1.tif");
        imwrite(img,selpath + "\removed\"+"dcam_"+ i +".tif")
        display("frame " + i + " saved!")
    end
end