function after_pic = noisefiltering(pic)
    idx_pic = (pic~=0);
    idx_x = sum(idx_pic,2);
    idx_y = sum(idx_pic,1);
    delpoint_x = find(idx_x == 60);
    pic(:,delpoint_x) = 0;
    delpoint_y = find(idx_y == 60);
    pic(:,delpoint_y) = 0;
    for i = 1:5
        if idx_x(i) > 6
            pic(i,:) = 0;
        end
        if idx_x(end+1-i)>10
            pic(end+1-i,:) = 0;
        end
        if idx_y(i) > 6
            pic(:,i) = 0;
        end
        if idx_y(end+1-i)>10
            pic(:,end+1-i) = 0;
        end
    end
    after_pic = pic;
end