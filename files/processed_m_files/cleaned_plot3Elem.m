function [ ] = plot3Elem( X,nX,N )
%Plot 3D elements with the unit normals
%INPUT
%X(j,n,i)   rectangulr element array
%nX         # of elements
%N(j,i)     Unit normal to the element
scale=0.1;
Nline=zeros(3,2);
%f=figure();
%3D rectangulr elements
%Unit normal at the centroid
%saveas(f,[folder 'mesh/3dmesh.fig']);
%close;