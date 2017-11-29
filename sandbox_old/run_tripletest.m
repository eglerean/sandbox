clear all
close all
addpath(genpath('/m/nbe/scratch/braindata/shared/toolboxes/bramila/bramila/'))

nii=load_nii('/m/nbe/scratch/braindata/bacham1/data_analysis/Articles_niis_and_figs/AHS/median_v2_extriplet2/results_tstat.nii');

load /m/nbe/scratch/braindata/eglerean/dilemma/git/dilemma/iscmask.mat
g=load_nii('/m/nbe/scratch/braindata/shared/toolboxes/bramila/bramila/external/grey.nii')
ids=intersect(find(iscmask>0),find(g.img>0.5));
% find ids as a grid

gridmask=zeros(91,109,91);
gridmask(1:4:end,1:4:end,1:4:end)=1;

ids=intersect(intersect(find(iscmask>0),find(gridmask>0)),find(g.img>0.5));

tvals=sort(nii.img(ids));
tic
[H,P,STATS] = triplestest(tvals)
toc
save output H P STATS tvals


for TH=1:35
    ps(TH)=length(find(nii.img>TH));
    ns(TH)=length(find(nii.img<-TH));
end

figure
plot(log10(ps),'*-r')
hold on
plot(log10(ns),'o-b')