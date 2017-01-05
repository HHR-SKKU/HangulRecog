%% Set initial condition
 
close all
clear
%% Set Data_path and collect raw data in Data_path
scan_path = fullfile('scan_data'); %�� �Լ��� �ִ� ���� data��� ���� �ȿ� �̹��� ������ ������ �Ѱ�.
data_scenes = dir(fullfile(scan_path, '*.jpg')); %data ���� ���� �������� dir�������� �ϳ��� ���� �̸������� �����ص�
 
%% Set label of Korean data we want
string = '�������������������������������������������������������������������°ðİŰưǰȰɰʰ˰̰ͰΰϰаѰҰӰ԰հְװذٰڰ۰ܰݰް߰������������������������������������������������������������������������������������������������������������±ñıűƱǱȱɱʱ˱̱ͱαϱбѱұӱԱձֱױرٱڱ۱ܱݱޱ߱������������������������������������������������������������������������������������������������������������²òĲŲƲǲȲɲʲ˲̲ͲβϲвѲҲӲԲղֲײزٲڲ۲ܲݲ޲߲������������������������������������������������������������������������������������������������������������³óĳųƳǳȳɳʳ˳̳ͳγϳгѳҳӳԳճֳ׳سٳڳ۳ܳݳ޳߳������������������������������������������������������������������������������������������������������������´ôĴŴƴǴȴɴʴ˴̴ʹδϴдѴҴӴԴմִ״شٴڴ۴ܴݴ޴ߴ������������������������������������������������������������������������������������������������������������µõĵŵƵǵȵɵʵ˵̵͵εϵеѵҵӵԵյֵ׵صٵڵ۵ܵݵ޵ߵ������������������������������������������������������������������������������������������������������������¶öĶŶƶǶȶɶʶ˶̶Ͷζ϶жѶҶӶԶնֶ׶ضٶڶ۶ܶݶ޶߶������������������������������������������������������������������������������������������������������������·÷ķŷƷǷȷɷʷ˷̷ͷηϷзѷҷӷԷշַ׷طٷڷ۷ܷݷ޷߷������������������������������������������������������������������������������������������������������������¸øĸŸƸǸȸɸʸ˸̸͸θϸиѸҸӸԸոָ׸ظٸڸ۸ܸݸ޸߸������������������������������������������������������������������������������������������������������������¹ùĹŹƹǹȹɹʹ˹̹͹ιϹйѹҹӹԹչֹ׹عٹڹ۹ܹݹ޹߹������������������������������������������������������������������������������������������������������������ºúĺźƺǺȺɺʺ˺̺ͺκϺкѺҺӺԺպֺ׺غٺںۺܺݺ޺ߺ������������������������������������������������������������������������������������������������������������»ûĻŻƻǻȻɻʻ˻̻ͻλϻлѻһӻԻջֻ׻ػٻڻۻܻݻ޻߻������������������������������������������������������������������������������������������������������������¼üļżƼǼȼɼʼ˼̼ͼμϼмѼҼӼԼռּ׼ؼټڼۼܼݼ޼߼������������������������������������������������������������������������������������������������������������½ýĽŽƽǽȽɽʽ˽̽ͽνϽнѽҽӽԽսֽ׽ؽٽڽ۽ܽݽ޽߽������������������������������������������������������������������������������������������������������������¾þľžƾǾȾɾʾ˾̾;ξϾоѾҾӾԾվ־׾ؾپھ۾ܾݾ޾߾������������������������������������������������������������������������������������������������������������¿ÿĿſƿǿȿɿʿ˿̿ͿοϿпѿҿӿԿտֿ׿ؿٿڿۿܿݿ޿߿���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿������������������������������������������������������������������������������������������������������������������������������áâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ������������������������������������������������������������������������������������������������������������������������������ġĢģĤĥĦħĨĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿ������������������������������������������������������������������������������������������������������������������������������šŢţŤťŦŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽžſ������������������������������������������������������������������������������������������������������������������������������ơƢƣƤƥƦƧƨƩƪƫƬƭƮƯưƱƲƳƴƵƶƷƸƹƺƻƼƽƾƿ������������������������������������������������������������������������������������������������������������������������������ǡǢǣǤǥǦǧǨǩǪǫǬǭǮǯǰǱǲǳǴǵǶǷǸǹǺǻǼǽǾǿ������������������������������������������������������������������������������������������������������������������������������ȡȢȣȤȥȦȧȨȩȪȫȬȭȮȯȰȱȲȳȴȵȶȷȸȹȺȻȼȽȾȿ������������������������������������������������������������������������������������������������������������������������������';
% string�� ���ϴ� �ѱ۵����ͷ� ���� (�츮�� ��� 2350���� �ѱۿϼ����� �����ͼ����� ����)
 
missing_line = [0]; %�Ǽ��� ��ģ ���� �Է�. ��ģ���� �����ϰ� ������ ����
 
missing_help = 0:length(missing_line)-1; %������ �� ����ϱ� ���� ������ ����
 
missing_line = missing_help + missing_line;
 
if sum(missing_line) ~=0
    missing_line = (missing_line-1)*9+1;
end
 
string = double(string);
string_length = length(string);
string = string-44032;
 
%unicode�� �̿��� string�� ������� �ѱ��� �ʼ�, �߼�, ������ vector�� ���� 
maxsheet = ceil(string_length./126);
 
sheetidx = 1;
stringidx = 1; %string�� n��° �����͸� ǥ���ϴ� index
dataidx = 1; %������ ���� ������ ǥ���ϴ� index
% datanum=length(data_scenes)/18; 
%inidata = zeros(datanum,19);
%meddata = zeros(datanum,21);
%findata = zeros(datanum,28);
%csv��μ����ϰ� �̸�����, ����, ���� ����������
 
%% take scanned data and seperate it along the line.
for k = 1:length(data_scenes)
    if sheetidx > maxsheet
        stringidx = 1;
        sheetidx = 1;
        dataidx = dataidx+1;
    end
    img = imread( fullfile( scan_path, data_scenes(k).name ));
    if(size(img,3) > 1)
        img = rgb2gray(img);
    end
    img = imgresize(img,[960,690]);
    %�̹����� graylevel�� ���� �̹����� ����
    img = 255-img;
    %������ �������� �̹����� ����� ����
    pic = character_dist(img);
        idxmatrix = (pic ~= 0 );
    projection_1 = sum(idxmatrix,1);
    projection_2 = sum(idxmatrix,2);
%    white_region1 = find(projection_1 >= 240);
%    white_region2 = find(projection_2 >= 240);
    x_pick = zeros(1,1);
    y_pick = zeros(1,1);
    pick_idx = 1;
    imgsize = [60 60];
    threshold = 200;
    countidx = [0 0];
    breakloop = 0;
    breakloop2 = 0;
    while length(x_pick) ~= 10
        x_pick = zeros(1,1);
        x_candidate = find(projection_1 >= threshold);
        candnum_x = length(x_candidate);
        x_candidate(2:candnum_x+1) = x_candidate;
        x_candidate(1) = 0;
    
        for i = 1:length(x_candidate)-1
            temp = x_candidate(i+1)-x_candidate(i);
            if temp > 10
                x_pick(pick_idx) = x_candidate(i+1);
                pick_idx=pick_idx+1;
            end
        end
        if length(x_pick) > 10
            threshold = threshold + 10;
            countidx(1) = 1;
        end
        if length(x_pick) < 10
            threshold = threshold - 10;
            countidx(2) = 1;
        end
        if sum(countidx) ==2
            breakloop2 = 1;
            break;
        end
        pick_idx = 1;
    end
    if breakloop2 == 1
        sheetidx = sheetidx+1;
        stringidx = stringidx+126;
        continue
    end
    countidx = [0 0];
    while length(y_pick) ~= 15
        
        y_pick = zeros(1,1);
        y_candidate = find(projection_2 >= threshold);
        candnum_y = length(y_candidate);
        y_candidate(2:candnum_y+1) = y_candidate;
        y_candidate(1) = 0;
        for i = 1:candnum_y-1
            temp = y_candidate(i+1) - y_candidate(i);
            if temp > 10
                y_pick(pick_idx) = y_candidate(i+1);
                pick_idx = pick_idx+1;
            end
        end
        if length(y_pick) > 15
            threshold = threshold + 10;
            countidx(1) = 1;
        end
        if length(y_pick) < 15
            threshold = threshold - 10;
            countidx(2) = 1;
        end
        if sum(countidx) == 2
            breakloop2 = 1;
            break
        end
        pick_idx = 1;
    end
    
    if breakloop2 == 1
        sheetidx = sheetidx+1;
        stringidx = stringidx+126;
        continue
    end
    x_point = zeros(0,length(x_pick));
    y_point = zeros(0,length(y_pick));
    
    for i = 1:length(x_pick)
 %       temp_proj = projection_1(i:i+x_partition-1);
 %       pickpoint = x_partition*rotation_num + find(temp_proj==min(temp_proj))(1);
        x_point(pick_idx) = x_pick(i)-5;
        pick_idx = pick_idx+1;
        x_point(pick_idx) = x_pick(i)+5;
        pick_idx = pick_idx+1;
%        rotation_num = rotation_num+1;
    end
    pick_idx = 1;
    %rotation_num = 0;
    diff_x = diff(x_pick);
    diff_y = diff(y_pick);
    returnidx = min(min(diff_x),min(diff_y));
    if returnidx < 50
        sheetidx = sheetidx+1;
        stringidx = stringidx+126;
        continue
    end
    for j = 1:length(y_pick)
   %     temp_proj = projection_2(j:j+y_partition-1);
   %     pickpoint = y_partition*rotation_num + find(temp_proj==max(temp_proj));
        y_point(pick_idx) = y_pick(j)-5;
        pick_idx = pick_idx+1;
        y_point(pick_idx) = y_pick(j)+5;
        pick_idx = pick_idx+1;
   %     rotation_num = rotation_num+1;
    end
    x_point = x_point(2:end-1);
    y_point = y_point(2:end-1);
    %pick_idx = 1;
    for j = 1:2:28
        if breakloop ==1
            break;
        end
        for i = 1:2:18
            if sum(stringidx == missing_line) == 1
                stringidx = stringidx+9;
            end
            %if pick_idx >112
            %   break
            %end
            start_x = x_point(i);
            end_x = x_point(i+1);
            start_y = y_point(j);
            end_y = y_point(j+1);
            charimg = pic(start_y:end_y,start_x:end_x);
            charimg = imgresize(charimg, imgsize);
            charimg2 = charimg;
            charimg = noisefiltering(charimg);
            charimg = meanshift(charimg);
            charimg = noisefiltering(charimg);
            charimg = meanshift(charimg);
            charimg = sum(charimg,3)/size(charimg,3);
 
            ini = floor(string(stringidx)/588);
            temp = mod(string(stringidx),588);
            med = floor(temp/28);
            fin = mod(temp,28);
            
            dir_path_ini = sprintf('1_%d',ini);
            dir_path_med = sprintf('2_%d',med);
            dir_path_fin = sprintf('3_%d',fin);
            
            data_number_ini = length(dir(fullfile(dir_path_ini, '*.jpg'))); 
            data_number_med = length(dir(fullfile(dir_path_med, '*.jpg'))); 
            data_number_fin = length(dir(fullfile(dir_path_fin, '*.jpg'))); 
            
 
            data_path_ini = sprintf('%s/%d.jpg' ,dir_path_ini ,data_number_ini);
            imwrite(charimg,data_path_ini);
            
            data_path_med = sprintf('%s/%d.jpg' ,dir_path_med, data_number_med);
            imwrite(charimg,data_path_med);
            
            data_path_fin = sprintf('%s/%d.jpg' ,dir_path_fin, data_number_fin);
            imwrite(charimg,data_path_fin);
            
            
            sprintf('%d ��° ������ %d��° ���ڰ� �����Ǿ����ϴ�.',dataidx,stringidx)
            stringidx = stringidx+1;
            if stringidx > string_length
                stringidx = 1;
                breakloop = 1;
                break;
            end
        end
        
        
    end
    sheetidx = sheetidx+1;
    if breakloop ==1
        continue;
    end
end