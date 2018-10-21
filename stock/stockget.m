%stockget.m
%从新浪提供的数据抓取
%https://wenku.baidu.com/view/0616e1d8ee06eff9aff807ba.html?from=search

clc
StockCode=300191;%
if(999999 == StockCode)
    symbol=strcat('sh000001')
elseif(StockCode >= 600000 )
    symbol=strcat('sh',num2str(StockCode))
else
    symbol = strcat('sz',num2str(StockCode))
end

url2Read = ['http://hq.sinajs.cn/list=',symbol]
s = urlread(url2Read)
result=textscan(s,'%s','delimiter',',')
result = result{1}
Name = cell2mat(result(1))%名称
Name = Name(22:end)
date = result{31}
OpenPrice=str2double(result{2})  %今日开盘价
time = result{32}
TPrice = str2double(result{4})
HighPrice=str2double(result{5})
LowPrice=str2double(result{6})
Vol=str2double(result{9})/100%成交量

disp(['股票名称： ',Name,' 股票代码：',symbol,' 日期：',date]);
disp(['开盘价:',result{2}]);
disp(['当前时间:',time]);
disp(['当前价格：',result{4}]);
disp(['当前最高价: ',result{5}]);
disp(['当前最低价: ',result{6}]);
disp(['成交量: ',num2str(Vol)]);
disp(['买1数量: ',result{11}]);
disp(['买1价格: ',result{12}]);
disp(['买2数量: ',result{13}]);
disp(['买2价格: ',result{14}]);
disp(['买3数量: ',result{15}]);
disp(['买3价格: ',result{16}]);
disp(['买4数量: ',result{17}]);
disp(['买4价格: ',result{18}]);
disp(['买5数量: ',result{19}]);
disp(['买5价格: ',result{20}]);

disp(['卖1数量: ',result{21}]);
disp(['卖1价格: ',result{22}]);
disp(['卖2数量: ',result{23}]);
disp(['卖2价格: ',result{24}]);
disp(['卖3数量: ',result{25}]);
disp(['卖3价格: ',result{26}]);
disp(['卖4数量: ',result{27}]);
disp(['卖4价格: ',result{28}]);
disp(['卖5数量: ',result{29}]);
disp(['卖5价格: ',result{30}]);

time([3,6])=[];
timehour = str2double(time(1:2))
timeminute=str2double(time(3:4))
timesecond=str2double(time(5:6))
timereal = timehour+timeminute/60+timesecond/3600;
%xlswrite('gupiao.xls',[timereal,TPrice],'');
%%
%写入文件
%写入文档中记录实时的股票数据
datawrite=[num2str(timereal),'',...
           num2str(TPrice),' ',...
           num2str(Vol),' ',...
           result{11},' ',...
           result{12},' ',...
           result{13},' ',...
           result{14},' ',...
           result{15},' ',...
           result{16},' ',...
           result{17},' ',...
           result{18},' ',...
           result{19},' ',...
           result{20},' ',...
           result{21},' ',...
           result{22},' ',...
           result{23},' ',...
           result{24},' ',...
           result{25},' ',...
           result{26},' ',...
           result{27},' ',...
           result{28},' ',...
           result{29},' ',...
           result{30}];
       
filenote=['股票',date,'.txt'];
           
fid = fopen(filenote,'at')
%data_all_1=num2str(importdata(filenote));
%data_all_2=reshape(data_all_1,1,[]);
%bull = strfind(data_all_2,datawrite);
%if(bull == 0)
%fprintf(fid,'%s\n',datawrite);
%end

fprintf(fid,'%s\n',datawrite);


%作图
fclose(fid);
data_all = importdata(filenote);
timenow = data_all(:,1);
pricenow=data_all(:,2);
chenjiaoliang = data_all(:,3);
buynum = data_all(:,[4,6,8,10,12]);
buyprice = data_all(:,[5,7,9,11,13]);
sellnum = data_all(:,[14,16,18,20,22]);
sellprice = data_all(:,[15,17,19,21,23]);
subplot(2,1,1);
%做出时间价格曲线
plot(timenow,pricenow)
xlabel('时间');
ylabel('价格');
grid on;
subplot(2,1,2);

%做出时间成交量曲线
plot(timenow,chengjiaoliang)
xlabel('时间');
ylabel('成交量');
grid on;

%set(gcf,'WindowButtondownFcn','pt=get(gca,"CurrentPoint");text(pt(1,1),pt(1,2),num2str(pt(1,1:2)))');
%
% figure(2);
% subplot(2,2,1)
% plot(timenow,buynum(:,1),'b',timenow,buynum(:,2),'r',timenow,buynum(:,3),'k',timenow,buynum(:,4),'y',timenow,buynum(:,5),'g');
% title('买1到买5量变化');
% grid on;
% legend('买1','买2','买3','买4','买5');
% subplot(2,2,2);

% plot(timenow,buyprice(:,1),'b',timenow,buyprice(:,2),'r',timenow,buyprice(:,3),'k',timenow,buyprice(:,4),'y',timenow,buyprice(:,5),'g');
% title('买1到买5价格变化');
% grid on;
% legend('买1','买2','买3','买4','买5');
% subplot(2,2,3);

% plot(timenow,sellnum(:,1),'b',timenow,sellnum(:,2),'r',timenow,sellnum(:,3),'k',timenow,sellnum(:,4),'y',timenow,sellnum(:,5),'g');
% title('卖1到卖5价格变化');
% grid on;
% legend('卖1','卖2','卖3','卖4','卖5');
% subplot(2,2,4);

% plot(timenow,sellprice(:,1),'b',timenow,sellprice(:,2),'r',timenow,sellprice(:,3),'k',timenow,sellprice(:,4),'y',timenow,sellprice(:,5),'g');
% title('卖1到卖5价格变化');
% grid on;
% legend('卖1','卖2','卖3','卖4','卖5');
           
           
x1 = 1;
tt = timer('timerFcn','stockget','Period',5,'ExecutionMode','fixedSpacing','TasksToExecute',1000000);
start(tt);
localtime=clock;
           