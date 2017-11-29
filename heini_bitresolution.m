close all
clear all
folder='/tmp/eglerean/nifti/';

files=dir([folder '*.nii']);
for f=1:length(files)
	nii=load_untouch_nii([folder files(f).name]);
	[h]=histc(nii.img(:),0:4096);
	semilogy(0:4096,h)
	hold on
	legend(files(f).name);
    temp=[double(max(nii.img(:))) length(find(nii.img(:)>=4095))/length(nii.img(:))];
    
    disp(num2str(temp))
end


