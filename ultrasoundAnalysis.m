% M3 Lab
% ultrasoundAnalysis.m
% Created 8 November 2022
% Mario Garcia | nfq3bd@virginia.edu 

close all; clear; clc;

%% Data Import
pathName = uigetdir('.mat') ; % Select folder containing data
filePattern = fullfile(pathName,'*.mat') ;
matFiles = dir(filePattern) ; % Finds mat files that will be imported
sub = matFiles(1).name;
sub = sub(1:3);
for i = 1:length(matFiles) % Determines how many files will be imported
    baseFileName = matFiles(i).name ; 
    fullFileName = fullfile(pathName, baseFileName) ;
    matdata = load(fullFileName) ;
tempName = strcat(convertCharsToStrings(sub),'_mCap_',num2str(i));
assignin('base', tempName, matdata)
    clear matdata
end
clear baseFileName filePattern fullFileName i matFiles pathName tempName sub

%% Next Steps