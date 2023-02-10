
close all;
clear all;                                                          

%% question 1 part a
Link_1=Link([0, 0, 0,0, 0]); %% rotary base
Link_2=Link([0, 0, 0,-pi/2, 1]); %% prizmatic 1
Link_3=Link([0, 0, 0, 0, 1]); %% prizmatic 2\


Link_2.qlim = [0 6]; %% prizmatic 1 can vary between 0-6
Link_3.qlim = [0 6]; %% prizmatic 2 can vary between 0-6
Link_1.qlim = [0 2*pi]; %% rotary can turn 360 degrees

Link_2.offset = 1;
Link_3.offset = 4;
q = [0 3 3];
r = SerialLink([Link_1 Link_2 Link_3]);

%% question 1 part b
r.plotopt = {'workspace', [-13 13 -13 13 -1 13]};
r.name = 'RPP robot arm';
r.teach(q);



T = r.fkine(q);


