function [  ] = plot2Elm_g6( Xn,nXn,npoly,color,lw )
%Plot a group of polygonal elements in x-y plane
%INPUT
%Xn(j,n,i)  polynomial element array
%nXn        # of elements
%nploy      order of polygon
%color      color in the plot
%lw         line width
%f=figure();
cx=Xn(1,npoly+1,i);
cy=Xn(2,npoly+1,i);
%saveas(f,['2dmesh.fig']);
%close;