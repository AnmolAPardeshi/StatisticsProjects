clear all
close all
clc

[num,text,raw]=xlsread('indian_food.csv');
x=cell2str(raw);

snacks=string([]);starters=string([]);maincourse=string([]);desserts=string([]);
for i=2:length(x)
    if x(i,7)=="snack"
        snacks=[snacks ; x(i,:)];
    elseif x(i,7)=="starter"
        starters=[starters ; x(i,:)];
    elseif x(i,7)=="main course"
        maincourse=[maincourse ; x(i,:)];
    else
        desserts=[desserts ; x(i,:)];
    end
end

save('maincourse.mat','maincourse');