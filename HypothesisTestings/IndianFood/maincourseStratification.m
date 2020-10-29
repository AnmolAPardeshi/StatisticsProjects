clear all
close all
clc

load('maincourse.mat');

veg_mc=string([]);nvg_mc=string([]);
for i=1:length(maincourse)
    if maincourse(i,3)=="vegetarian"
        veg_mc=[veg_mc ; maincourse(i,:)];
    elseif maincourse(i,3)=="non vegetarian"
        nvg_mc=[nvg_mc ; maincourse(i,:)];
    end
end

nvg_prep_time=double(nvg_mc(:,4));nvg_prep_time(nvg_prep_time==-1)=[];
nvg_cook_time=double(nvg_mc(:,5));nvg_cook_time(nvg_cook_time==-1)=[];
veg_prep_time=double(veg_mc(:,4));veg_prep_time(veg_prep_time==-1)=[];
veg_cook_time=double(veg_mc(:,5));veg_cook_time(veg_cook_time==-1)=[];