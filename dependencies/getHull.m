function hull = getHull(points)
x = points(:,1);
y = points(:,2);
k = convhull(x,y);
hull = [x(k) y(k)];

        
