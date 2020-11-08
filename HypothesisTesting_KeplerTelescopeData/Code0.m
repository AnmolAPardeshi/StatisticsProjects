clear all
close all
clc

load('kepler_planets.mat')
keplerPlanetsDS(1,:)=[];

%see how many observation each type of imaging methods has
x=unique(keplerPlanetsDS(2:end,2));
for i=1:length(x)
x(i,2)=length(find(keplerPlanetsDS(:,2)==x(i,1)));
end

%choose categories with substantial amount of data
%manually inspected and then put in the line below
rows=find(keplerPlanetsDS(:,2)=='Imaging' | keplerPlanetsDS(:,2)=='Microlensing' | keplerPlanetsDS(:,2)=='Radial Velocity' | keplerPlanetsDS(:,2)=='Transit' | keplerPlanetsDS(:,2)=='Transit Timing Variations');
keplerPlanetsReducedDS=keplerPlanetsDS(rows,:);

%again check the obserations under the imaging methods
x=unique(keplerPlanetsReducedDS(:,2));
for i=1:length(x)
x(i,2)=length(find(keplerPlanetsReducedDS(:,2)==x(i,1)));
end

%throw out the missing data rows
missing_rows=find(ismissing(keplerPlanetsReducedDS(:,3)));
keplerPlanetsReducedDS(missing_rows(:,1),:)=[];

%again check the obserations under the imaging methods
x=unique(keplerPlanetsReducedDS(:,2));
for i=1:length(x)
x(i,2)=length(find(keplerPlanetsReducedDS(:,2)==x(i,1)));
end

%manually create datasets for each imaigng type
rows=find(keplerPlanetsReducedDS(:,2)=='Imaging');imaging_ds=keplerPlanetsReducedDS(rows,:);
rows=find(keplerPlanetsReducedDS(:,2)=='Radial Velocity');rv_ds=keplerPlanetsReducedDS(rows,:);
rows=find(keplerPlanetsReducedDS(:,2)=='Transit');transit_ds=keplerPlanetsReducedDS(rows,:);
