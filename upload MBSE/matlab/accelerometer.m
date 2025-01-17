%% Accelerometer
%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\training\Desktop\MBD\sen.xlsx
%
% Auto-generated by MATLAB on 21-Dec-2020 09:21:22

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 31);

% Specify range and delimiter
opts.DataLines = [3, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["ACCELEROMETERXms", "ACCELEROMETERYms", "ACCELEROMETERZms", "GRAVITYXms", "GRAVITYYms", "GRAVITYZms", "LINEARACCELERATIONXms", "LINEARACCELERATIONYms", "LINEARACCELERATIONZms", "GYROSCOPEXrads", "GYROSCOPEYrads", "GYROSCOPEZrads", "LIGHTlux", "MAGNETICFIELDXT", "MAGNETICFIELDYT", "MAGNETICFIELDZT", "ORIENTATIONZazimuth", "ORIENTATIONXpitch", "ORIENTATIONYroll", "PROXIMITYi", "SOUNDLEVELdB", "LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONAltitudegoogleM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "SatellitesInRange", "TimeSinceStartInMs", "YYYYMODDHHMISS_SSS"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "string", "string", "string", "double", "string", "string", "string", "categorical", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";

% Specify variable properties
opts = setvaropts(opts, ["LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "YYYYMODDHHMISS_SSS"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["LOCATIONLatitude", "LOCATIONLongitude", "LOCATIONAltitudeM", "LOCATIONSpeedKmh", "LOCATIONAccuracyM", "LOCATIONORIENTATION", "SatellitesInRange", "YYYYMODDHHMISS_SSS"], "EmptyFieldRule", "auto");

% Import the data
tbl = readtable("C:\Users\training\Desktop\MBD\sen.xlsx", opts);

%% Convert to output type
ACCELEROMETERXms = tbl.ACCELEROMETERXms;
ACCELEROMETERYms = tbl.ACCELEROMETERYms;
ACCELEROMETERZms = tbl.ACCELEROMETERZms;
GRAVITYXms = tbl.GRAVITYXms;
GRAVITYYms = tbl.GRAVITYYms;
GRAVITYZms = tbl.GRAVITYZms;
LINEARACCELERATIONXms = tbl.LINEARACCELERATIONXms;
LINEARACCELERATIONYms = tbl.LINEARACCELERATIONYms;
LINEARACCELERATIONZms = tbl.LINEARACCELERATIONZms;
GYROSCOPEXrads = tbl.GYROSCOPEXrads;
GYROSCOPEYrads = tbl.GYROSCOPEYrads;
GYROSCOPEZrads = tbl.GYROSCOPEZrads;
LIGHTlux = tbl.LIGHTlux;
MAGNETICFIELDXT = tbl.MAGNETICFIELDXT;
MAGNETICFIELDYT = tbl.MAGNETICFIELDYT;
MAGNETICFIELDZT = tbl.MAGNETICFIELDZT;
ORIENTATIONZazimuth = tbl.ORIENTATIONZazimuth;
ORIENTATIONXpitch = tbl.ORIENTATIONXpitch;
ORIENTATIONYroll = tbl.ORIENTATIONYroll;
PROXIMITYi = tbl.PROXIMITYi;
SOUNDLEVELdB = tbl.SOUNDLEVELdB;
LOCATIONLatitude = tbl.LOCATIONLatitude;
LOCATIONLongitude = tbl.LOCATIONLongitude;
LOCATIONAltitudeM = tbl.LOCATIONAltitudeM;
LOCATIONAltitudegoogleM = tbl.LOCATIONAltitudegoogleM;
LOCATIONSpeedKmh = tbl.LOCATIONSpeedKmh;
LOCATIONAccuracyM = tbl.LOCATIONAccuracyM;
LOCATIONORIENTATION = tbl.LOCATIONORIENTATION;
SatellitesInRange = tbl.SatellitesInRange;
TimeSinceStartInMs = tbl.TimeSinceStartInMs;
YYYYMODDHHMISS_SSS = tbl.YYYYMODDHHMISS_SSS;


%% Import the data
[input0_0] = xlsread('C:\Users\training\Desktop\MBD\sen.xlsx','A122:C160');
[input0_1] = xlsread('C:\Users\training\Desktop\MBD\sen.xlsx','AD122:AD160');
input = [input0_0,input0_1];

%% Create output variable
data = input;

%% Create table
data1 = table;

%% Allocate imported array to column variable names
data1.ACCELEROMETERXms = data(:,1);
data1.ACCELEROMETERYms = data(:,2);
data1.ACCELEROMETERZms = data(:,3);
data1.Timesincestartinms = data(:,4);
%% Clear temporary variables
clear opts tb1 input0_0 input0_1 R
% steps_acceleration
% Counts No of Steps from Acceleration Data
ax=data1.ACCELEROMETERXms;
ay=data1.ACCELEROMETERYms;
az=data1.ACCELEROMETERZms;
t=data1.Timesincestartinms;
stepcount = 0;
% Changes in Acceleration Sensors will indicate steps
disp('Running')
length = sqrt(sum(ax.^2 + ay.^2 + az.^2, 4));
disp(length);
% Plot magnitude
subplot(3,4,6);
stem(t, length);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Magnitude')
% Remove effects of gravity
magNoGrav = length - mean(length);
subplot(3,4,7);
stem(t, magNoGrav);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('No Gravity')
% Absolute magnitude
amag = abs(magNoGrav);
subplot(3,4,8);
stem(t, amag);
title('Absolute Magnitude')
xlabel('Time (s)');
ylabel('Acceleration Magnitude, No Gravity (m/s^2)');
% step counting
if(length>=2)
    stepcount = stepcount+2;
    disp('stepcount')
end
