function[output]= geoEst(img,ref,img1)
feature_img = detectSURFFeatures(img,'MetricThreshold',6500);
feature_ref = detectSURFFeatures(ref,'MetricThreshold',6500);
[f1,v1] = extractFeatures(img,feature_img);
[f2,v2] = extractFeatures(ref,feature_ref);
indexPairs = matchFeatures(f1,f2);
mp1 = v1(indexPairs(:,1));
mp2 = v2(indexPairs(:,2));
x1 = mp1.Location(:,1);
y1 = mp1.Location(:,2);
x2 = mp2.Location(:,1);
y2 = mp2.Location(:,2);
z1 = [x1 y1];
z2 = [x2 y2];
T = fitgeotrans(z1,z2,'nonreflectivesimilarity');
output = imwarp(img1,T,'cubic','OutputView',imref2d(size(img1)));
output = output(1:512,1:512);
end

