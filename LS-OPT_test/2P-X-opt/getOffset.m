function offset = getOffset(Cds,t,in_out)
x = Cds(1,:);
y = Cds(2,:);

n = length(x);

for i = 1:n
    x1 = x(i);
    y1 = y(i);
    
    if i < n
        x2 = x(i+1);
        y2 = y(i+1);
    else
        x2 = x(1);
        y2 = y(1); 
    end
    dy = y2 - y1;
    dx = x2 - x1;
    
    theta = atan2(dy,dx);
    
    xm = mean([x1 x2]);
    ym = mean([y1 y2]);
    
    tx = t*cos(theta-pi/2);
    ty = t*sin(theta-pi/2);
    
    % create new point
    xmt = xm + tx;
    ymt = ym + ty;
    
    % check if point lies in triangle
    if inpolygon(xmt,ymt,x,y)
        sign = 1;
    else
        sign = -1;
    end
    
    if strcmp(in_out,'in')
        % create line
        xstart = x1 + sign*tx;
        xend   = x2 + sign*tx;
        
        ystart = y1 + sign*ty;
        yend   = y2 + sign*ty;
    elseif strcmp(in_out,'out')
        xstart = x1 - sign*tx;
        xend   = x2 - sign*tx;
        
        ystart = y1 - sign*ty;
        yend   = y2 - sign*ty;
        
        dx = 10*t*cos(theta);
        dy = 10*t*sin(theta);
        
        xstart = xstart - dx;
        xend   = xend   + dx;
        
        ystart = ystart - dy;
        yend   = yend   + dy;
    end
    
    Lx(i,:) = [xstart xend];
    Ly(i,:) = [ystart yend];
    
%     plot([x1 x2],[y1 y2],'k'); hold on;
%     plot(Lx(i,:),Ly(i,:),'b'); hold on;
%     axis equal;
end

if n == 3
    [xc1,yc1] = linexline(Lx(1,:),Ly(1,:),Lx(3,:),Ly(3,:),0);
    [xc2,yc2] = linexline(Lx(1,:),Ly(1,:),Lx(2,:),Ly(2,:),0);
    [xc3,yc3] = linexline(Lx(2,:),Ly(2,:),Lx(3,:),Ly(3,:),0);
    
%     plot(xc1,yc1,'.r');
%     plot(xc2,yc2,'.r');
%     plot(xc3,yc3,'.r');
%     text(xc1,yc1,'1');
%     text(xc2,yc2,'2');
%     text(xc3,yc3,'3');
    offset = [xc1 xc2 xc3
              yc1 yc2 yc3];
else
    [xc1,yc1] = linexline(Lx(1,:),Ly(1,:),Lx(4,:),Ly(4,:),0);
    [xc2,yc2] = linexline(Lx(1,:),Ly(1,:),Lx(2,:),Ly(2,:),0);
    [xc3,yc3] = linexline(Lx(2,:),Ly(2,:),Lx(3,:),Ly(3,:),0);
    [xc4,yc4] = linexline(Lx(3,:),Ly(3,:),Lx(4,:),Ly(4,:),0);
    
%     plot(xc1,yc1,'.r');
%     plot(xc2,yc2,'.r');
%     plot(xc3,yc3,'.r');
%     plot(xc4,yc4,'.r');
%     text(xc1,yc1,'1');
%     text(xc2,yc2,'2');
%     text(xc3,yc3,'3');
%     text(xc4,yc4,'4');
    
    offset = [xc1 xc2 xc3 xc4
              yc1 yc2 yc3 yc4];
end
% end function
end