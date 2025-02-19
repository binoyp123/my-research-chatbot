function [Zt,Zr,z12,z23,z34,z45,z51 ] = centerSN(n,z)
%Center contour sub nodes
%{
Map
       2*********3    1****2*********3   --->y (j)
      *          *    1              *   |
     *           *    1              *   |
    1            * to 1              *   x
     *           *    1              *  (i)
      *          *    1              *
       5*********4    1****5*********4
Introduce sub nodes along 1-2, 2-3, 3-4, 4-5, 5-6 and 1-1
%}
%INPUT
%z   corner node coordinates; complex valued
%n  # of border elements on each edge
%w  width of border elements

%OUTPUT
%Zt,Zr  element node matrix
%zij    sub nodes for edge ij
global nplot

%Sub nods along the edges
%For edge 1-2
zif=z(2)-z(1);
for k=1:n(1)+1
    z12(k)=z(1)+((k-1)/n(1))*zif;
end
%For edge 1-5
zif=z(5)-z(1);
for k=1:n(5)+1
    z15(k)=z(1)+((k-1)/n(5))*zif;
end
%For edge 2-3
zif=z(3)-z(2);
for k=1:n(2)+1
    z23(k)=z(2)+((k-1)/n(2))*zif;
end
%For edge 5-4
zif=z(4)-z(5);
for k=1:n(4)+1
    z54(k)=z(5)+((k-1)/n(4))*zif;
end
%For edge 2-5
zif=z(5)-z(2);
for k=1:n(6)+1
    z25(k)=z(2)+((k-1)/n(6))*zif;
end
%For edge 3-4
zif=z(4)-z(3);
for k=1:n(3)+1
    z34(k)=z(3)+((k-1)/n(3))*zif;
end
%Element node grid

%Tapered (sort of) region
for j=1:(n(1)+1)
    Zj=z15(j)-z12(j);
    for i=1:(n(3)+1)
        Zt(i,j)=z12(j)+((i-1)/n(3))*Zj;
        if nplot ==1
            plot(real(Zt(i,j)),imag(Zt(i,j)),'x');
            hold on;
        end
    end
end

%Rectangular (sort of) region
for j=1:(n(2)+1)
    Zj=z54(j)-z23(j);
    for i=1:(n(3)+1)
        Zr(i,j)=z23(j)+((i-1)/n(3))*Zj;
        if nplot ==1
            plot(real(Zr(i,j)),imag(Zr(i,j)),'x');
            hold on;
        end
    end
end

%Fliplr some zij
z45=fliplr(z54);
z51=fliplr(z15);


end

