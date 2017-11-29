close all
clear all


files={
'/m/nbe/scratch/braindata/saalas1/narrative/narr_subj_29/compA/epi.nii'
'/m/nbe/scratch/braindata/afadilm1/Ingroup-outgroup/Hetero-subjects-rawdata/subject_19_HT/epi.nii'
}
temp=load_untouch_nii(files{1});
satu=bramila_uiv(temp.img);

temp=load_untouch_nii(files{2});
mamdooh=bramila_uiv(temp.img);

for x=1:300
    for y=1:300
        out(x,y)=length(intersect(find(satu==x),find(mamdooh==y)));
    end
end
        


folders=dir('/m/nbe/scratch/braindata/eglerean/ABIDE/0*');
xi=0:.1:12;
all_subj=zeros(length(xi),length(folders));
for f=1:length(folders)    
    f
    epi=load_untouch_nii(['/m/nbe/scratch/braindata/eglerean/ABIDE/' folders(f).name '/epi.nii']);
    vol_out=bramila_uiv(epi.img);
    fi=ksdensity(log2(vol_out(:)),xi);
    all_subj(:,f)=fi;
end