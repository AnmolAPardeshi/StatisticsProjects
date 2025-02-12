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

veg_deletion_rows=find(veg_mc(:,4)=="-1" | veg_mc(:,5)=="-1");
veg_mc(veg_deletion_rows(:,1),:)=[];
nveg_deletion_rows=find(nvg_mc(:,4)=="-1" | nvg_mc(:,5)=="-1");
nvg_mc(nveg_deletion_rows(:,1),:)=[];

veg_prep_time=double(veg_mc(:,4));
veg_cook_time=double(veg_mc(:,5));
nvg_prep_time=double(nvg_mc(:,4));
nvg_cook_time=double(nvg_mc(:,5));

temp=[veg_prep_time(:,1) , ones(size(veg_prep_time,1),1)];
temp2=[nvg_prep_time(:,1) , 2*ones(size(nvg_prep_time,1),1)];
prepTime_DS=[temp;temp2];
clear temp temp2
temp=[veg_cook_time(:,1) , ones(size(veg_cook_time,1),1)];
temp2=[nvg_cook_time(:,1) , 2*ones(size(nvg_cook_time,1),1)];
cookTime_DS=[temp;temp2];