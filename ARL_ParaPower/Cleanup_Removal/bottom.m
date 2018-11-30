function [cbm,bdry]=bottom(row,col,lay,h,Mat,kond,dx,dy,dz)
% global h Mat kond dx dy dz
if lay==1
    if h(5)==0 || Mat(row,col,lay)==0
        cbm=0;
    else
        cbm=1/(1/(h(5)*dx(col)*dy(row))+dz(lay)/(2*kond(row,col,lay)*dx(col)*dy(row)));
    end
    bdry1=1;
end
if lay>1
    if Mat(row,col,lay-1)==0 || Mat(row,col,lay)==0
        cbm=0;
    else
        cbm=1/(dz(lay-1)/(2*kond(row,col,lay-1)*dx(col)*dy(row))+dz(lay)/(2*kond(row,col,lay)*dx(col)*dy(row)));
    end
    bdry1=0;
end

if nargout>1 
    bdry=bdry1;
end

end