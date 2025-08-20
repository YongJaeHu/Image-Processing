function hole_temp_match = lea_tearfin_temp3(glove)
[xi,yi,zi]=size(glove);
if zi==1
    glove_img=glove;
else
glove_img=rgb2gray(glove);
end;
tp3=imread('leather_glove_tearfin_temp3.jpg');%part of image
[xt,yt,zt]=size(tp3);
if zt==1
    temp3=tp3;
else
temp3=rgb2gray(tp3);
end;
[xt,yt,zt]=size(temp3);
[xi,yi,zi]=size(glove_img);
for i=1:(xi-xt);
    for j=1:(yi-yt);
        b=0;a=0;
        for k=1:xt;
            for l=1:yt;
                a=abs(double(glove_img(i+k,j+l))-double(temp3(k,l)));
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
    display('Tearing on Fingertips Defect is found in given picture')
    msgbox('Yes, It is Tearing on Fingertips Defect.', 'Error', 'error');
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
    glove_img(i(k),j(k):j(k)+yt)=1;glove_img(i(k),j(k):2:j+yt)=0;
    glove_img(i(k):i(k)+xt,j(k)+yt)=1;glove_img(i(k):2:i(k)+xt,j(k)+yt)=0;
    glove_img(i(k)+xt,j(k):j(k)+yt)=1;glove_img(i(k)+xt,j(k):2:j(k)+yt)=0;
    glove_img(i(k):i(k)+xt,j(k))=1;glove_img(i(k):2:i(k)+xt,j(k))=0;
end;
else
     display('Reloading')
     lea_tearfin_temp4(glove);
end;  
 