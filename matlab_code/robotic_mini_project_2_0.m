close all;
clear all;                                                          


Link_1=Link([0, 0, 0, pi/2, 0]); %% rotary base
Link_2=Link([0, 0, 0, 0, 1]); %% prizmatic 1

Link_2.d = cos(Link_1.theta);


Link_2.qlim = [-10 10]; %% prizmatic 1 can vary between 0-10

Link_1.qlim = [0 2*pi]; %% rotary can turn 360 degrees
Link_2.d = cos(Link_1.theta);
%%Link_1 = 40Sine(Link_2)Tangent(Link_2); %% rotary can turn 360 degrees

%%Link_2.offset = 1;

%%q = [3 3];
r = SerialLink([Link_1 Link_2]);


r.plotopt = {'workspace', [-15 15 -15 15 -1 13]};
r.name = 'RP robot arm';
%%r.teach(q);




%%T = r.fkine(q);

%%initial positions
qi = [0 0];

%%final positions
qf = [2*pi 9];

r.fkine(qi);
t = 0:.15:5;
q = jtraj(qi, qf, t);
T = r.fkine(q);
r.teach(q);