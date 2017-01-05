function shift_pic = meanshift(pic);
    idxpic = (pic~=0);
    shift_pic = zeros(size(pic,1), size(pic,2));
    numofall = sum(sum(idxpic));
    x_sum = sum(idxpic,1);
    y_sum = sum(idxpic,2);
    total_x = 0;
    total_y = 0;
    for i = 1:length(x_sum)
        total_x = total_x + x_sum(i)*i;
        total_y = total_y + y_sum(i)*i;
    end
    cor_xmean = total_x/numofall;
    cor_ymean = total_y/numofall;
    diff_x = round(30-cor_xmean);
    diff_y = round(30-cor_ymean);
    if (diff_x >= 0)&&(diff_y >= 0)
        shift_pic(diff_y+1:end,diff_x+1:end) = pic(1:end-diff_y,1:end-diff_x);
    elseif (diff_x >= 0) && (diff_y <0)
        diff_y = abs(diff_y);
        shift_pic(1:end-diff_y, diff_x+1:end) = pic(diff_y+1:end,1:end-diff_x);
    elseif (diff_x <0) && (diff_y >=0 )
        diff_x = abs(diff_x);
        shift_pic(diff_y+1:end,1:end-diff_x) = pic(1:end-diff_y,diff_x+1:end);
    else
        diff_x = abs(diff_x);
        diff_y = abs(diff_y);
        shift_pic(1:end-diff_x,1:end-diff_y) = pic(diff_x+1:end,diff_y+1:end);
    end
end
        