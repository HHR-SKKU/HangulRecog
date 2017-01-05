%% Set initial condition
 
close all
clear
%% Set Data_path and collect raw data in Data_path
scan_path = fullfile('scan_data'); %ÀÌ ÇÔ¼ö°¡ ÀÖ´Â °÷¿¡ data¶ó´Â Æú´õ ¾È¿¡ ÀÌ¹ÌÁö ÆÄÀÏÀ» ÀúÀåÇØ µÑ°Í.
data_scenes = dir(fullfile(scan_path, '*.jpg')); %data Æú´õ ³»ÀÇ »çÁøµéÀ» dirÇü½ÄÀ¸·Î ÇÏ³ª¾¿ ÆÄÀÏ ÀÌ¸§¼øÀ¸·Î ÀúÀåÇØµÒ
 
%% Set label of Korean data we want
string = '°¡°¢°£°¤°¥°¦°§°¨°©°ª°«°¬°­°®°¯°°°±°²°³°´°µ°¶°·°¸°¹°º°»°¼°½°¾°¿°À°Á°Â°Ã°Ä°Å°Æ°Ç°È°É°Ê°Ë°Ì°Í°Î°Ï°Ð°Ñ°Ò°Ó°Ô°Õ°Ö°×°Ø°Ù°Ú°Û°Ü°Ý°Þ°ß°à°á°â°ã°ä°å°æ°ç°è°é°ê°ë°ì°í°î°ï°ð°ñ°ò°ó°ô°õ°ö°÷°ø°ù°ú°û°ü°ý°þ±¡±¢±£±¤±¥±¦±§±¨±©±ª±«±¬±­±®±¯±°±±±²±³±´±µ±¶±·±¸±¹±º±»±¼±½±¾±¿±À±Á±Â±Ã±Ä±Å±Æ±Ç±È±É±Ê±Ë±Ì±Í±Î±Ï±Ð±Ñ±Ò±Ó±Ô±Õ±Ö±×±Ø±Ù±Ú±Û±Ü±Ý±Þ±ß±à±á±â±ã±ä±å±æ±ç±è±é±ê±ë±ì±í±î±ï±ð±ñ±ò±ó±ô±õ±ö±÷±ø±ù±ú±û±ü±ý±þ²¡²¢²£²¤²¥²¦²§²¨²©²ª²«²¬²­²®²¯²°²±²²²³²´²µ²¶²·²¸²¹²º²»²¼²½²¾²¿²À²Á²Â²Ã²Ä²Å²Æ²Ç²È²É²Ê²Ë²Ì²Í²Î²Ï²Ð²Ñ²Ò²Ó²Ô²Õ²Ö²×²Ø²Ù²Ú²Û²Ü²Ý²Þ²ß²à²á²â²ã²ä²å²æ²ç²è²é²ê²ë²ì²í²î²ï²ð²ñ²ò²ó²ô²õ²ö²÷²ø²ù²ú²û²ü²ý²þ³¡³¢³£³¤³¥³¦³§³¨³©³ª³«³¬³­³®³¯³°³±³²³³³´³µ³¶³·³¸³¹³º³»³¼³½³¾³¿³À³Á³Â³Ã³Ä³Å³Æ³Ç³È³É³Ê³Ë³Ì³Í³Î³Ï³Ð³Ñ³Ò³Ó³Ô³Õ³Ö³×³Ø³Ù³Ú³Û³Ü³Ý³Þ³ß³à³á³â³ã³ä³å³æ³ç³è³é³ê³ë³ì³í³î³ï³ð³ñ³ò³ó³ô³õ³ö³÷³ø³ù³ú³û³ü³ý³þ´¡´¢´£´¤´¥´¦´§´¨´©´ª´«´¬´­´®´¯´°´±´²´³´´´µ´¶´·´¸´¹´º´»´¼´½´¾´¿´À´Á´Â´Ã´Ä´Å´Æ´Ç´È´É´Ê´Ë´Ì´Í´Î´Ï´Ð´Ñ´Ò´Ó´Ô´Õ´Ö´×´Ø´Ù´Ú´Û´Ü´Ý´Þ´ß´à´á´â´ã´ä´å´æ´ç´è´é´ê´ë´ì´í´î´ï´ð´ñ´ò´ó´ô´õ´ö´÷´ø´ù´ú´û´ü´ý´þµ¡µ¢µ£µ¤µ¥µ¦µ§µ¨µ©µªµ«µ¬µ­µ®µ¯µ°µ±µ²µ³µ´µµµ¶µ·µ¸µ¹µºµ»µ¼µ½µ¾µ¿µÀµÁµÂµÃµÄµÅµÆµÇµÈµÉµÊµËµÌµÍµÎµÏµÐµÑµÒµÓµÔµÕµÖµ×µØµÙµÚµÛµÜµÝµÞµßµàµáµâµãµäµåµæµçµèµéµêµëµìµíµîµïµðµñµòµóµôµõµöµ÷µøµùµúµûµüµýµþ¶¡¶¢¶£¶¤¶¥¶¦¶§¶¨¶©¶ª¶«¶¬¶­¶®¶¯¶°¶±¶²¶³¶´¶µ¶¶¶·¶¸¶¹¶º¶»¶¼¶½¶¾¶¿¶À¶Á¶Â¶Ã¶Ä¶Å¶Æ¶Ç¶È¶É¶Ê¶Ë¶Ì¶Í¶Î¶Ï¶Ð¶Ñ¶Ò¶Ó¶Ô¶Õ¶Ö¶×¶Ø¶Ù¶Ú¶Û¶Ü¶Ý¶Þ¶ß¶à¶á¶â¶ã¶ä¶å¶æ¶ç¶è¶é¶ê¶ë¶ì¶í¶î¶ï¶ð¶ñ¶ò¶ó¶ô¶õ¶ö¶÷¶ø¶ù¶ú¶û¶ü¶ý¶þ·¡·¢·£·¤·¥·¦·§·¨·©·ª·«·¬·­·®·¯·°·±·²·³·´·µ·¶···¸·¹·º·»·¼·½·¾·¿·À·Á·Â·Ã·Ä·Å·Æ·Ç·È·É·Ê·Ë·Ì·Í·Î·Ï·Ð·Ñ·Ò·Ó·Ô·Õ·Ö·×·Ø·Ù·Ú·Û·Ü·Ý·Þ·ß·à·á·â·ã·ä·å·æ·ç·è·é·ê·ë·ì·í·î·ï·ð·ñ·ò·ó·ô·õ·ö·÷·ø·ù·ú·û·ü·ý·þ¸¡¸¢¸£¸¤¸¥¸¦¸§¸¨¸©¸ª¸«¸¬¸­¸®¸¯¸°¸±¸²¸³¸´¸µ¸¶¸·¸¸¸¹¸º¸»¸¼¸½¸¾¸¿¸À¸Á¸Â¸Ã¸Ä¸Å¸Æ¸Ç¸È¸É¸Ê¸Ë¸Ì¸Í¸Î¸Ï¸Ð¸Ñ¸Ò¸Ó¸Ô¸Õ¸Ö¸×¸Ø¸Ù¸Ú¸Û¸Ü¸Ý¸Þ¸ß¸à¸á¸â¸ã¸ä¸å¸æ¸ç¸è¸é¸ê¸ë¸ì¸í¸î¸ï¸ð¸ñ¸ò¸ó¸ô¸õ¸ö¸÷¸ø¸ù¸ú¸û¸ü¸ý¸þ¹¡¹¢¹£¹¤¹¥¹¦¹§¹¨¹©¹ª¹«¹¬¹­¹®¹¯¹°¹±¹²¹³¹´¹µ¹¶¹·¹¸¹¹¹º¹»¹¼¹½¹¾¹¿¹À¹Á¹Â¹Ã¹Ä¹Å¹Æ¹Ç¹È¹É¹Ê¹Ë¹Ì¹Í¹Î¹Ï¹Ð¹Ñ¹Ò¹Ó¹Ô¹Õ¹Ö¹×¹Ø¹Ù¹Ú¹Û¹Ü¹Ý¹Þ¹ß¹à¹á¹â¹ã¹ä¹å¹æ¹ç¹è¹é¹ê¹ë¹ì¹í¹î¹ï¹ð¹ñ¹ò¹ó¹ô¹õ¹ö¹÷¹ø¹ù¹ú¹û¹ü¹ý¹þº¡º¢º£º¤º¥º¦º§º¨º©ºªº«º¬º­º®º¯º°º±º²º³º´ºµº¶º·º¸º¹ººº»º¼º½º¾º¿ºÀºÁºÂºÃºÄºÅºÆºÇºÈºÉºÊºËºÌºÍºÎºÏºÐºÑºÒºÓºÔºÕºÖº×ºØºÙºÚºÛºÜºÝºÞºßºàºáºâºãºäºåºæºçºèºéºêºëºìºíºîºïºðºñºòºóºôºõºöº÷ºøºùºúºûºüºýºþ»¡»¢»£»¤»¥»¦»§»¨»©»ª»«»¬»­»®»¯»°»±»²»³»´»µ»¶»·»¸»¹»º»»»¼»½»¾»¿»À»Á»Â»Ã»Ä»Å»Æ»Ç»È»É»Ê»Ë»Ì»Í»Î»Ï»Ð»Ñ»Ò»Ó»Ô»Õ»Ö»×»Ø»Ù»Ú»Û»Ü»Ý»Þ»ß»à»á»â»ã»ä»å»æ»ç»è»é»ê»ë»ì»í»î»ï»ð»ñ»ò»ó»ô»õ»ö»÷»ø»ù»ú»û»ü»ý»þ¼¡¼¢¼£¼¤¼¥¼¦¼§¼¨¼©¼ª¼«¼¬¼­¼®¼¯¼°¼±¼²¼³¼´¼µ¼¶¼·¼¸¼¹¼º¼»¼¼¼½¼¾¼¿¼À¼Á¼Â¼Ã¼Ä¼Å¼Æ¼Ç¼È¼É¼Ê¼Ë¼Ì¼Í¼Î¼Ï¼Ð¼Ñ¼Ò¼Ó¼Ô¼Õ¼Ö¼×¼Ø¼Ù¼Ú¼Û¼Ü¼Ý¼Þ¼ß¼à¼á¼â¼ã¼ä¼å¼æ¼ç¼è¼é¼ê¼ë¼ì¼í¼î¼ï¼ð¼ñ¼ò¼ó¼ô¼õ¼ö¼÷¼ø¼ù¼ú¼û¼ü¼ý¼þ½¡½¢½£½¤½¥½¦½§½¨½©½ª½«½¬½­½®½¯½°½±½²½³½´½µ½¶½·½¸½¹½º½»½¼½½½¾½¿½À½Á½Â½Ã½Ä½Å½Æ½Ç½È½É½Ê½Ë½Ì½Í½Î½Ï½Ð½Ñ½Ò½Ó½Ô½Õ½Ö½×½Ø½Ù½Ú½Û½Ü½Ý½Þ½ß½à½á½â½ã½ä½å½æ½ç½è½é½ê½ë½ì½í½î½ï½ð½ñ½ò½ó½ô½õ½ö½÷½ø½ù½ú½û½ü½ý½þ¾¡¾¢¾£¾¤¾¥¾¦¾§¾¨¾©¾ª¾«¾¬¾­¾®¾¯¾°¾±¾²¾³¾´¾µ¾¶¾·¾¸¾¹¾º¾»¾¼¾½¾¾¾¿¾À¾Á¾Â¾Ã¾Ä¾Å¾Æ¾Ç¾È¾É¾Ê¾Ë¾Ì¾Í¾Î¾Ï¾Ð¾Ñ¾Ò¾Ó¾Ô¾Õ¾Ö¾×¾Ø¾Ù¾Ú¾Û¾Ü¾Ý¾Þ¾ß¾à¾á¾â¾ã¾ä¾å¾æ¾ç¾è¾é¾ê¾ë¾ì¾í¾î¾ï¾ð¾ñ¾ò¾ó¾ô¾õ¾ö¾÷¾ø¾ù¾ú¾û¾ü¾ý¾þ¿¡¿¢¿£¿¤¿¥¿¦¿§¿¨¿©¿ª¿«¿¬¿­¿®¿¯¿°¿±¿²¿³¿´¿µ¿¶¿·¿¸¿¹¿º¿»¿¼¿½¿¾¿¿¿À¿Á¿Â¿Ã¿Ä¿Å¿Æ¿Ç¿È¿É¿Ê¿Ë¿Ì¿Í¿Î¿Ï¿Ð¿Ñ¿Ò¿Ó¿Ô¿Õ¿Ö¿×¿Ø¿Ù¿Ú¿Û¿Ü¿Ý¿Þ¿ß¿à¿á¿â¿ã¿ä¿å¿æ¿ç¿è¿é¿ê¿ë¿ì¿í¿î¿ï¿ð¿ñ¿ò¿ó¿ô¿õ¿ö¿÷¿ø¿ù¿ú¿û¿ü¿ý¿þÀ¡À¢À£À¤À¥À¦À§À¨À©ÀªÀ«À¬À­À®À¯À°À±À²À³À´ÀµÀ¶À·À¸À¹ÀºÀ»À¼À½À¾À¿ÀÀÀÁÀÂÀÃÀÄÀÅÀÆÀÇÀÈÀÉÀÊÀËÀÌÀÍÀÎÀÏÀÐÀÑÀÒÀÓÀÔÀÕÀÖÀ×ÀØÀÙÀÚÀÛÀÜÀÝÀÞÀßÀàÀáÀâÀãÀäÀåÀæÀçÀèÀéÀêÀëÀìÀíÀîÀïÀðÀñÀòÀóÀôÀõÀöÀ÷ÀøÀùÀúÀûÀüÀýÀþÁ¡Á¢Á£Á¤Á¥Á¦Á§Á¨Á©ÁªÁ«Á¬Á­Á®Á¯Á°Á±Á²Á³Á´ÁµÁ¶Á·Á¸Á¹ÁºÁ»Á¼Á½Á¾Á¿ÁÀÁÁÁÂÁÃÁÄÁÅÁÆÁÇÁÈÁÉÁÊÁËÁÌÁÍÁÎÁÏÁÐÁÑÁÒÁÓÁÔÁÕÁÖÁ×ÁØÁÙÁÚÁÛÁÜÁÝÁÞÁßÁàÁáÁâÁãÁäÁåÁæÁçÁèÁéÁêÁëÁìÁíÁîÁïÁðÁñÁòÁóÁôÁõÁöÁ÷ÁøÁùÁúÁûÁüÁýÁþÂ¡Â¢Â£Â¤Â¥Â¦Â§Â¨Â©ÂªÂ«Â¬Â­Â®Â¯Â°Â±Â²Â³Â´ÂµÂ¶Â·Â¸Â¹ÂºÂ»Â¼Â½Â¾Â¿ÂÀÂÁÂÂÂÃÂÄÂÅÂÆÂÇÂÈÂÉÂÊÂËÂÌÂÍÂÎÂÏÂÐÂÑÂÒÂÓÂÔÂÕÂÖÂ×ÂØÂÙÂÚÂÛÂÜÂÝÂÞÂßÂàÂáÂâÂãÂäÂåÂæÂçÂèÂéÂêÂëÂìÂíÂîÂïÂðÂñÂòÂóÂôÂõÂöÂ÷ÂøÂùÂúÂûÂüÂýÂþÃ¡Ã¢Ã£Ã¤Ã¥Ã¦Ã§Ã¨Ã©ÃªÃ«Ã¬Ã­Ã®Ã¯Ã°Ã±Ã²Ã³Ã´ÃµÃ¶Ã·Ã¸Ã¹ÃºÃ»Ã¼Ã½Ã¾Ã¿ÃÀÃÁÃÂÃÃÃÄÃÅÃÆÃÇÃÈÃÉÃÊÃËÃÌÃÍÃÎÃÏÃÐÃÑÃÒÃÓÃÔÃÕÃÖÃ×ÃØÃÙÃÚÃÛÃÜÃÝÃÞÃßÃàÃáÃâÃãÃäÃåÃæÃçÃèÃéÃêÃëÃìÃíÃîÃïÃðÃñÃòÃóÃôÃõÃöÃ÷ÃøÃùÃúÃûÃüÃýÃþÄ¡Ä¢Ä£Ä¤Ä¥Ä¦Ä§Ä¨Ä©ÄªÄ«Ä¬Ä­Ä®Ä¯Ä°Ä±Ä²Ä³Ä´ÄµÄ¶Ä·Ä¸Ä¹ÄºÄ»Ä¼Ä½Ä¾Ä¿ÄÀÄÁÄÂÄÃÄÄÄÅÄÆÄÇÄÈÄÉÄÊÄËÄÌÄÍÄÎÄÏÄÐÄÑÄÒÄÓÄÔÄÕÄÖÄ×ÄØÄÙÄÚÄÛÄÜÄÝÄÞÄßÄàÄáÄâÄãÄäÄåÄæÄçÄèÄéÄêÄëÄìÄíÄîÄïÄðÄñÄòÄóÄôÄõÄöÄ÷ÄøÄùÄúÄûÄüÄýÄþÅ¡Å¢Å£Å¤Å¥Å¦Å§Å¨Å©ÅªÅ«Å¬Å­Å®Å¯Å°Å±Å²Å³Å´ÅµÅ¶Å·Å¸Å¹ÅºÅ»Å¼Å½Å¾Å¿ÅÀÅÁÅÂÅÃÅÄÅÅÅÆÅÇÅÈÅÉÅÊÅËÅÌÅÍÅÎÅÏÅÐÅÑÅÒÅÓÅÔÅÕÅÖÅ×ÅØÅÙÅÚÅÛÅÜÅÝÅÞÅßÅàÅáÅâÅãÅäÅåÅæÅçÅèÅéÅêÅëÅìÅíÅîÅïÅðÅñÅòÅóÅôÅõÅöÅ÷ÅøÅùÅúÅûÅüÅýÅþÆ¡Æ¢Æ£Æ¤Æ¥Æ¦Æ§Æ¨Æ©ÆªÆ«Æ¬Æ­Æ®Æ¯Æ°Æ±Æ²Æ³Æ´ÆµÆ¶Æ·Æ¸Æ¹ÆºÆ»Æ¼Æ½Æ¾Æ¿ÆÀÆÁÆÂÆÃÆÄÆÅÆÆÆÇÆÈÆÉÆÊÆËÆÌÆÍÆÎÆÏÆÐÆÑÆÒÆÓÆÔÆÕÆÖÆ×ÆØÆÙÆÚÆÛÆÜÆÝÆÞÆßÆàÆáÆâÆãÆäÆåÆæÆçÆèÆéÆêÆëÆìÆíÆîÆïÆðÆñÆòÆóÆôÆõÆöÆ÷ÆøÆùÆúÆûÆüÆýÆþÇ¡Ç¢Ç£Ç¤Ç¥Ç¦Ç§Ç¨Ç©ÇªÇ«Ç¬Ç­Ç®Ç¯Ç°Ç±Ç²Ç³Ç´ÇµÇ¶Ç·Ç¸Ç¹ÇºÇ»Ç¼Ç½Ç¾Ç¿ÇÀÇÁÇÂÇÃÇÄÇÅÇÆÇÇÇÈÇÉÇÊÇËÇÌÇÍÇÎÇÏÇÐÇÑÇÒÇÓÇÔÇÕÇÖÇ×ÇØÇÙÇÚÇÛÇÜÇÝÇÞÇßÇàÇáÇâÇãÇäÇåÇæÇçÇèÇéÇêÇëÇìÇíÇîÇïÇðÇñÇòÇóÇôÇõÇöÇ÷ÇøÇùÇúÇûÇüÇýÇþÈ¡È¢È£È¤È¥È¦È§È¨È©ÈªÈ«È¬È­È®È¯È°È±È²È³È´ÈµÈ¶È·È¸È¹ÈºÈ»È¼È½È¾È¿ÈÀÈÁÈÂÈÃÈÄÈÅÈÆÈÇÈÈÈÉÈÊÈËÈÌÈÍÈÎÈÏÈÐÈÑÈÒÈÓÈÔÈÕÈÖÈ×ÈØÈÙÈÚÈÛÈÜÈÝÈÞÈßÈàÈáÈâÈãÈäÈåÈæÈçÈèÈéÈêÈëÈìÈíÈîÈïÈðÈñÈòÈóÈôÈõÈöÈ÷ÈøÈùÈúÈûÈüÈýÈþ';
% stringÀº ¿øÇÏ´Â ÇÑ±Ûµ¥ÀÌÅÍ·Î ¸ÂÃã (¿ì¸®ÀÇ °æ¿ì 2350°³ÀÇ ÇÑ±Û¿Ï¼ºÇüÀ» µ¥ÀÌÅÍ¼ÂÀ¸·Î ¼³Á¤)
 
missing_line = [0]; %½Ç¼ö·Î ³õÄ£ ¶óÀÎ ÀÔ·Â. ³õÄ£¶óÀÎ Á¦¿ÜÇÏ°í µ¥ÀÌÅÍ ¼öÁý
 
missing_help = 0:length(missing_line)-1; %´©¶ôµÈ ÁÙ °è»êÇÏ±â À§ÇØ »ý¼ºÇÑ º¯¼ö
 
missing_line = missing_help + missing_line;
 
if sum(missing_line) ~=0
    missing_line = (missing_line-1)*9+1;
end
 
string = double(string);
string_length = length(string);
string = string-44032;
 
%unicode¸¦ ÀÌ¿ëÇØ stringÀÇ ¼ø¼­´ë·Î ÇÑ±ÛÀÇ ÃÊ¼º, Áß¼º, Á¾¼ºÀÇ vector¸¦ ¸¸µê 
maxsheet = ceil(string_length./126);
 
sheetidx = 1;
stringidx = 1; %stringÀÇ n¹øÂ° µ¥ÀÌÅÍ¸¦ Ç¥½ÃÇÏ´Â index
dataidx = 1; %µ¥ÀÌÅÍ ¼ÂÀÇ ¼ø¼­¸¦ Ç¥½ÃÇÏ´Â index
% datanum=length(data_scenes)/18; 
%inidata = zeros(datanum,19);
%meddata = zeros(datanum,21);
%findata = zeros(datanum,28);
%csv°æ·Î¼³Á¤ÇÏ°í ÀÌ¸§¼³Á¤, º¯°æ, ÀúÀå ¸¸µé¾îÁà¾ßÇÔ
 
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
    %ÀÌ¹ÌÁö¸¦ graylevelÀÇ ÀÛÀº ÀÌ¹ÌÁö·Î ¼öÁ¤
    img = 255-img;
    %»ö»óÀ» ¹ÝÀü½ÃÄÑ ÀÌ¹ÌÁöÀÇ ¹è°æÀ» ±¸ºÐ
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
            
            
            sprintf('%d ¹øÂ° »çÁøÀÇ %d¹øÂ° ±ÛÀÚ°¡ »ý¼ºµÇ¾ú½À´Ï´Ù.',dataidx,stringidx)
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