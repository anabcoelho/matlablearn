function exporttags (x)
csv=csvread(x);
tagsraw= csv();
save('tag.mat','tagsraw')