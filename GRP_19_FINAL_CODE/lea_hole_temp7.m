function hole_temp_match = lea_hole_temp7(glove)
[xi,yi,zi]=size(glove);
if zi==1
    img1=glove;
else
img1=rgb2gray(glove);
end;
tp1=imread('leather_glove_hole_temp7.jpg');%part of image
[xt,yt,zt]=size(tp1);
if zt==1
    temp1=tp1;
else
temp1=rgb2gray(tp1);
end;
[xt,yt,zt]=size(temp1);
[xi,yi,zi]=size(img1);
for i=1:(xi-xt);
    for j=1:(yi-yt);
        b=0;a=0;
        for k=1:xt;
            for l=1:yt;
                a=abs(double(img1(i+k,j+l))-double(temp1(k,l)));
                b=b+a;
            end
        end
        c(i,j)=b;
    end
end
th=10;
mx=max(max(c));
mn=min(min(c));
t=mx/mn;
if t>10
    th=(mx/10)
else
    th=10;
end;
if(min(min(c))<th)% for big or noisy images can keep threshold 50;
    display('Hole Defect is found in given picture')
    msgbox('Yes, It is Hole Defect.', 'Error', 'error');
    [r1,c1]=size(c);
n=0;
clear i;clear j;
for i1=1:r1
    for j1=1:c1
        if c(i1,j1)<th
            n=n+1;
            i(n)=i1;
            j(n)=j1;
            
        end;
    end;
end;
for k=1:n
    img1(i(k),j(k):j(k)+yt)=1;img1(i(k),j(k):2:j+yt)=0;
    img1(i(k):i(k)+xt,j(k)+yt)=1;img1(i(k):2:i(k)+xt,j(k)+yt)=0;
    img1(i(k)+xt,j(k):j(k)+yt)=1;img1(i(k)+xt,j(k):2:j(k)+yt)=0;
    img1(i(k):i(k)+xt,j(k))=1;img1(i(k):2:i(k)+xt,j(k))=0;
end;
else
     display('Nope')
     msgbox('No, It is not a Hole Defect.', 'Error', 'error');
end;  
