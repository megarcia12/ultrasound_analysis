% M3 Lab
% ultrasoundAnalysis.m
% Created 8 November 2022
% Mario Garcia | nfq3bd@virginia.edu

%% Does Data need to be imported
clc
fprintf('Do you need to load new data?\n')
promt = input('[Y|N]\n','s') ;

%% Data Import
if strcmpi(promt,'y')
    close all; clear; clc;
    pathName = uigetdir('.mat') ; % Select folder containing data
    filePattern = fullfile(pathName,'*.mat') ; % From the folder chosen, only looks at mat files within that space
    matFiles = dir(filePattern) ; % Gets all the mat files in one place
    sub = matFiles(1).name; % Gets the filename
    sub = sub(1:3); % Gets the subject ID - may need to be changed if we change the way we name files
    for i = 1:length(matFiles) % Determines how many files will be imported
        baseFileName = matFiles(i).name ;
        fullFileName = fullfile(pathName, baseFileName) ;
        matdata = load(fullFileName) ;
        tempName = strcat(convertCharsToStrings(sub),'_mCap_',num2str(i-1)); % Creates temporary name
        assignin('base', tempName, matdata) % Assigns the temporary name as the new name
        clear matdata % Clears the raw data of the file that was made - avoids accidently putting information from previous file into the next
    end
    clear baseFileName filePattern fullFileName i matFiles pathName tempName sub promt% Clears all the temp variables used to import data
else
    clear promt
end

%% Data Extraction Example
staticRANK(:,1) = M03_mCap_0.Markers.RANK(:,1);
staticRANK(:,2) = M03_mCap_0.Markers.RANK(:,2);
staticRANK(:,3) = M03_mCap_0.Markers.RANK(:,3);

staticRHFBx = M03_mCap_0.Markers.RANK(:,1);
staticRHFBy = M03_mCap_0.Markers.RANK(:,2);
staticRHFBz = M03_mCap_0.Markers.RANK(:,3);

%% Changes