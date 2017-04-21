clear
clc

% Adding file path %
filename ='D:\btp new';

% With 3 parameters- a: numeric data, b: textual data, c: all %
[a,b,c] = xlsread(filename);




[row1, col1] = size(c);
c1 = c(2:row1,1:col1);
[row, col] = size(c1);


%%% List of variables depicting cells %%%


% Selecting unique users %
unqValue = unique(c(2:row,8));

% Individual cell for each user's posts %
M = cell(length(unqValue),1);

   % Ucell = cell(length(unqValue),4); %
   
% Dividing each user into two parts %
U = cell(length(unqValue),2);

% List of features 1-6 %

% for day freq vector %
F1 = cell(length(unqValue),2);

% for period of day freq vector%
F2 = cell(length(unqValue),2);

% type of day freq vector%
F3 = cell(length(unqValue),2);

% hour freq vector %
F4 = cell(length(unqValue),2);

% month freq vector%
F5 = cell(length(unqValue),2);

% date freq vector %
F6 = cell(length(unqValue),2);

% Cosine matching of features %

sim1 = cell(length(unqValue),1);
sim2 = cell(length(unqValue),1);
sim3 = cell(length(unqValue),1);
sim4 = cell(length(unqValue),1);
sim5 = cell(length(unqValue),1);
sim6 = cell(length(unqValue),1);



        %%% Code Bocks %%%

% Code for finding unique users %
for uq = 1:length(unqValue)
for i = 1:row
    if strcmp(c1(i,8),unqValue(uq))
       User(i,:,uq) = c1(i,:);
    end
end 
end

% Generating index and storing each user's details in M %
for i=1:length(unqValue)
    clear asas
    asas = User(:,8,i);
    index = find(strcmp(asas,unqValue(i)));
    
    for j=1:length(index)
     MM(j,:) = User(index(j),:,i);
    end
    M{i} =MM;
    clear MM
end
%RANDOMLY Distributing the sub users in A and B %
 
% for i=1:length(unqValue)
% [rs,cols] = size(M{i});
% vectR= randperm(rs,rs)
% 
% sas = M{i};
% U{i,1} = sas(vectR(1,1:(round(rs/2))),:);
% U{i,2} = sas(vectR(1,round((rs/2)+1):rs),:);
% clear sas
% clear vectR
% end
% 
% [ur, uc] = size(U);
% 
% 

% Sequential Dividing users into A and B sub users %
for i=1:length(unqValue)
[rs,cols] = size(M{i});
sas = M{i};
U{i,1} = sas(1: round(rs/2),:);
U{i,2} = sas(round((rs/2)+1):rs,:);
clear sas
end

[ur, uc] = size(U);


% Frequency Count for Day feature %

for i = 1:ur
    for j = 1:uc
       
       DayArray = zeros(1,7);
        [uur,uuc] = size(U{i,j});
for i1 = 1:uur

    if strcmp(U{i ,j}(i1,2),'Sun')       
        DayArray(1) = DayArray(1)+1;
    end
    
    if strcmp(U{i ,j}(i1,2),'Mon')       
        DayArray(2) = DayArray(2)+1;
    end
       
    if strcmp(U{i ,j}(i1,2),'Tue')       
        DayArray(3) = DayArray(3)+1;
    end
   
    if strcmp(U{i ,j}(i1,2),'Wed')       
        DayArray(4) = DayArray(4)+1;
    end
    
    if strcmp(U{i ,j}(i1,2),'Thu')       
        DayArray(5) = DayArray(5)+1;
    end
    
    if strcmp(U{i ,j}(i1,2),'Fri')       
        DayArray(6) = DayArray(6)+1;
    end
       
    if strcmp(U{i ,j}(i1,2),'Sat')       
        DayArray(7) = DayArray(7)+1;
    end
   
end

% Combine frequency %
F1(i,j) = mat2cell(DayArray);
    end
end


% Frequency Count for Period of Day feature %

for i = 1:ur
    for j = 1:uc
        
       Prd_dayArray = zeros(1,6);
        [uur,uuc] = size(U{i,j});
for i1 = 1:uur
    
    if strcmp(U{i ,j}(i1,13),'Early Morning')       
        Prd_dayArray(1) = Prd_dayArray(1) +1;
    end
    
       if strcmp(U{i ,j}(i1,13),'Morning')       
        Prd_dayArray(2) = Prd_dayArray(2) +1;
       end
       
         if strcmp(U{i ,j}(i1,13),'Mid Day')       
           Prd_dayArray(3) = Prd_dayArray(3) +1;
    end
    
       if strcmp(U{i ,j}(i1,13),'Evening')       
        Prd_dayArray(4) = Prd_dayArray(4) +1;
       end
         if strcmp(U{i ,j}(i1,13),'Night')       
        Prd_dayArray(5) = Prd_dayArray(5) +1;
    end
    
       if strcmp(U{i ,j}(i1,13),'Midnight')       
        Prd_dayArray(6) = Prd_dayArray(6) +1;
       end
       
    
end
 
 % Combine frequency %
    F2(i,j) = mat2cell(Prd_dayArray);
    end
end


% Frequency Count for Type of Day feature %

for i = 1:ur
    for j = 1:uc
        
       Typ_dayArray = zeros(1,2);
        [uur,uuc] = size(U{i,j});
for i1 = 1:uur
    
    if strcmp(U{i ,j}(i1,14),'Weekday')       
        Typ_dayArray(1) = Typ_dayArray(1) +1;
    end
    
       if strcmp(U{i ,j}(i1,14),'Weekend')       
        Typ_dayArray(2) = Typ_dayArray(2) +1;
       end
    
end
 
 % Combine frequency %
    F3(i,j) = mat2cell(Typ_dayArray);
    end
end


% Frequency Count for Hour of Day feature %

for i = 1:ur
    for j = 1:uc
        
       Hr_dayArray = zeros(1,24);
        [uur,uuc] = size(U{i,j});
for i1 = 1:uur
    
    if cell2mat(U{i ,j}(i1,15)) == 0
        Hr_dayArray(1) = Hr_dayArray(1) +1;
    end
    
    if cell2mat(U{i ,j}(i1,15)) == 1       
        Hr_dayArray(2) = Hr_dayArray(2) +1;
    end
       
    if cell2mat(U{i ,j}(i1,15)) == 2       
        Hr_dayArray(3) = Hr_dayArray(3) +1;
    end
    
    if cell2mat(U{i ,j}(i1,15)) == 3     
        Hr_dayArray(4) = Hr_dayArray(4) +1;
    end
    
    if cell2mat(U{i ,j}(i1,15)) == 4       
        Hr_dayArray(5) = Hr_dayArray(5) +1;
    end
    
    if cell2mat(U{i ,j}(i1,15)) == 5       
        Hr_dayArray(6) = Hr_dayArray(6) +1;
    end
       
    if cell2mat(U{i ,j}(i1,15)) == 6       
        Hr_dayArray(7) = Hr_dayArray(7) +1;
    end
       
    if cell2mat(U{i ,j}(i1,15)) == 7       
        Hr_dayArray(8) = Hr_dayArray(8) +1;
    end
    
    if cell2mat(U{i ,j}(i1,15)) == 8       
        Hr_dayArray(9) = Hr_dayArray(9) +1;
    end
       
    if cell2mat(U{i ,j}(i1,15)) == 9       
        Hr_dayArray(10) = Hr_dayArray(10) +1;
    end
    
    if cell2mat(U{i ,j}(i1,15)) == 10     
        Hr_dayArray(11) = Hr_dayArray(11) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 11      
        Hr_dayArray(12) = Hr_dayArray(12) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 12      
        Hr_dayArray(13) = Hr_dayArray(13) +1;
    end
       
    if cell2mat(U{i ,j}(i1,12)) == 13      
        Hr_dayArray(14) = Hr_dayArray(14) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 14       
        Hr_dayArray(15) = Hr_dayArray(15) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 15       
        Hr_dayArray(16) = Hr_dayArray(16) +1;
    end
       
    if cell2mat(U{i ,j}(i1,12)) == 16       
        Hr_dayArray(17) = Hr_dayArray(17) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 17     
        Hr_dayArray(18) = Hr_dayArray(18) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 18       
        Hr_dayArray(19) = Hr_dayArray(19) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 19       
        Hr_dayArray(20) = Hr_dayArray(20) +1;
    end
       
    if cell2mat(U{i ,j}(i1,12)) == 20       
        Hr_dayArray(21) = Hr_dayArray(21) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 21       
        Hr_dayArray(22) = Hr_dayArray(22) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 22       
        Hr_dayArray(23) = Hr_dayArray(23) +1;
    end
    
    if cell2mat(U{i ,j}(i1,12)) == 23       
        Hr_dayArray(24) = Hr_dayArray(24) +1;
    end
   
end

  % Combine frequency %
    F4(i,j) = mat2cell(Hr_dayArray);
    end
end


% Frequency Count for Month feature %

for i = 1:ur
    for j = 1:uc
        
       MonthArray = zeros(1,12);
        [uur,uuc] = size(U{i,j});
for i1 = 1:uur
    
    if strcmp(U{i ,j}(i1,3),'Jan')       
        MonthArray(1) = MonthArray(1) +1;
    end
    
       if strcmp(U{i ,j}(i1,3),'Feb')       
        MonthArray(2) = MonthArray(2) +1;
       end
       
         if strcmp(U{i ,j}(i1,3),'Mar')       
           MonthArray(3) = MonthArray(3) +1;
    end
    
       if strcmp(U{i ,j}(i1,3),'Apr')       
        MonthArray(4) = MonthArray(4) +1;
       end
       
       if strcmp(U{i ,j}(i1,3),'May')       
        MonthArray(5) = MonthArray(5) +1;
       end
    
       if strcmp(U{i ,j}(i1,3),'Jun')       
        MonthArray(6) = MonthArray(6) +1;
       end
       
       if strcmp(U{i ,j}(i1,3),'Jul')       
        MonthArray(7) = MonthArray(7) +1;
       end
    
       if strcmp(U{i ,j}(i1,3),'Aug')       
        MonthArray(8) = MonthArray(8) +1;
       end
       
       if strcmp(U{i ,j}(i1,3),'Sep')       
        MonthArray(9) = MonthArray(9) +1;
       end
    
       if strcmp(U{i ,j}(i1,3),'Oct')       
        MonthArray(10) = MonthArray(10) +1;
       end
       
         if strcmp(U{i ,j}(i1,3),'Nov')       
       MonthArray(11) = MonthArray(11) +1;
    end
    
       if strcmp(U{i ,j}(i1,3),'Dec')       
       MonthArray(12) = MonthArray(12) +1;
       end
       
     
end

% Combine frequency %
    F5(i,j) = mat2cell(MonthArray);
 end
end



% Frequency Count for Date feature %

for i = 1:ur
    for j = 1:uc
        
       DateArray = zeros(1,31);
        [uur,uuc] = size(U{i,j});
for i1 = 1:uur
    
    if cell2mat(U{i ,j}(i1,4)) == 1       
        DateArray(1) = DateArray(1) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 2       
        DateArray(2) = DateArray(2) +1;
    end
       
    if cell2mat(U{i ,j}(i1,4)) == 3       
        DateArray(3) = DateArray(3) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 4     
        DateArray(4) = DateArray(4) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 5       
        DateArray(5) = DateArray(5) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 6       
        DateArray(6) = DateArray(6) +1;
    end
       
    if cell2mat(U{i ,j}(i1,4)) == 7       
        DateArray(7) = DateArray(7) +1;
    end
       
    if cell2mat(U{i ,j}(i1,4)) == 8       
        DateArray(8) = DateArray(8) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 9       
        DateArray(9) = DateArray(9) +1;
    end
       
    if cell2mat(U{i ,j}(i1,4)) == 10       
        DateArray(10) = DateArray(10) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 11      
        DateArray(11) = DateArray(11) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 12      
        DateArray(12) = DateArray(12) +1;
    end
       
    if cell2mat(U{i ,j}(i1,4)) == 13      
        DateArray(13) = DateArray(13) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 14       
        DateArray(14) = DateArray(14) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 15       
        DateArray(15) = DateArray(15) +1;
    end
       
    if cell2mat(U{i ,j}(i1,4)) == 16       
        DateArray(16) = DateArray(16) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 17     
        DateArray(17) = DateArray(17) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 18       
        DateArray(18) = DateArray(18) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 19       
        DateArray(19) = DateArray(19) +1;
    end
       
    if cell2mat(U{i ,j}(i1,4)) == 20       
        DateArray(20) = DateArray(20) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 21       
        DateArray(21) = DateArray(21) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 22       
        DateArray(22) = DateArray(22) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 23       
        DateArray(23) = DateArray(23) +1;
    end
   
    if cell2mat(U{i ,j}(i1,4)) == 24     
        DateArray(24) = DateArray(24) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 25       
        DateArray(25) = DateArray(5) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 26       
        DateArray(26) = DateArray(26) +1;
    end
       
    if cell2mat(U{i ,j}(i1,4)) == 27       
        DateArray(27) = DateArray(27) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 28       
        DateArray(28) = DateArray(28) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 29       
        DateArray(29) = DateArray(29) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 30       
        DateArray(30) = DateArray(30) +1;
    end
    
    if cell2mat(U{i ,j}(i1,4)) == 31      
        DateArray(31) = DateArray(31) +1;
    end
   
end
 
  % Combine frequency %
    F6(i,j) = mat2cell(DateArray);
    end
end



% Cosine similarity between UA and UB %


for i=1:length(unqValue)
    for j=1:length(unqValue)
             c=dot( F1{i,1}, F1{j,2});
              a1=norm( F1{i,1});
               a2=norm( F1{j,2});
                cosine=c/(a1*a2);
                 sim1{i,j} = cosine;
                
  
             c=dot( F2{i,1}, F2{j,2});
              a1=norm( F2{i,1});
               a2=norm( F2{j,2});
                cosine=c/(a1*a2);
                 sim2{i,j} = cosine;
                 
             c=dot( F3{i,1}, F3{j,2});
              a1=norm( F3{i,1});
               a2=norm( F3{j,2});
                cosine=c/(a1*a2);
                 sim3{i,j}= cosine;
                 
             c=dot( F4{i,1}, F4{j,2});
              a1=norm( F4{i,1});
               a2=norm( F4{j,2});
                cosine=c/(a1*a2);
                 sim4{i,j} = cosine;
                     
             c=dot( F5{i,1}, F5{j,2});
              a1=norm( F5{i,1});
               a2=norm( F5{j,2});
                cosine=c/(a1*a2);
                 sim5{i,j} = cosine;
                 
             c=dot( F6{i,1}, F6{j,2});
              a1=norm( F6{i,1});
               a2=norm( F6{j,2});
                cosine=c/(a1*a2);
                 sim6{i,j} = cosine;
                 
    end
end

T = cell(1:length(unqValue),6);

for i=1:length(unqValue)
   T{i,1}=sim1(i,:);
   T{i,2}=sim2(i,:);
   T{i,3}=sim3(i,:);
   T{i,4}=sim4(i,:);
   T{i,5}=sim5(i,:);
   T{i,6}=sim6(i,:);
   
end
% cell denoting the best match user corresponding to a given user(top 1 brief) %
compcell=cell(1:length(unqValue),6);


for i=1:length(unqValue)
    for j=1:6
%         min1=1;
%         min2=1;
%         min3=1;
%         min4=1;
%         min5=1;      
%         for k=1:length(unqValue)
%            val=cell2mat(T{i,j}(1,k));
       % incompc=cell(1:2,1:length(unqValue));
        vectA =cell2mat(T{i,j}(1,1:length(unqValue)));
        [vectB,I]=sort(vectA);
        incompc(1,:)=I;
        incompc(2,:)=vectB;
     compcell{i,j}=incompc;
    clear vectA
    clear vectB
    clear I
    clear incompc
    
    end
    
end
for j= 1: 6
    clear count
    clear avg
    count= 0;
    avg=0;
    for i=1: length(unqValue)
        clear val
        val=5;
        if compcell{i,j}(1,1)==i
                count=count+1;
        end
        for t=2:val
            if compcell{i,j}(1,t)==i
                count=count+1;
                break
            elseif compcell{i,j}(2,t-1)==compcell{i,j}(2,t)
                val=val+1;
              
            end
        end
    end
    avg=(count)/(length(unqValue));
    Taccu(1,j)=avg;
end


%PLOT percentage of posts vs day %
for i=1:389
    pery=[81,81,56,32,16,63,60];
   
    %day=['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
    valx=[1,2,3,4,5,6,7];
    plot(valx,pery)
     xlabel('DAY','FontSize',12,'FontWeight','bold','Color','b')
    ylabel('No of Posts','FontSize',12,'FontWeight','bold','Color','b')
        
end









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                           % End %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 