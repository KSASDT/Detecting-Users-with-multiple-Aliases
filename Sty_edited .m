clear
clc

% Adding file path %
filename = 'D:\btp new\final\final 30 users\finaltop30.csv';

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
U = cell(length(unqValue),5);

% List of features 1-5 %

% Word length freq vector %
S1 = cell(length(unqValue),1);

% Alphabet freq vector %
S2 = cell(length(unqValue),1);

% Digit freq vector %
S3 = cell(length(unqValue),1);

% Special char freq vector %
S4 = cell(length(unqValue),1);

% Smiley freq vector %
% S5 = cell(length(unqValue),1);

Sty = cell(length(unqValue),5);
Cmb = cell(length(unqValue),5);


% Tokenizing tweets to calculate word length %
token = cell(length(unqValue),5);
tokenLen = cell(length(unqValue),5); 

% Alphabets Array for comparison %
alpha = {'a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'}';

% Digits Array for comparison %
digit = {'0','1','2','3','4','5','6','7','8','9'};

% Special Characters Array for comparison %
spcChar = {'.','?','!',',',':',';','(',')','/','"','*','-','_','@','#','$','&',''''};

% Smileys Array for comparison %
% smi = {':'')', ':-)',':P',':D',':X','xD','<3',':)',';)',':-(',':(',':*',':|','%',':$',':@'};

 
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

% Dividing users into A and B sub users %
for i=1:length(unqValue)
[rs,cols] = size(M{i});
sas = M{i};
U{i,1} = sas(1: round(rs/5),:);
U{i,2} = sas(round((rs/5)+1):round(2*(rs/5)),:);
U{i,3} = sas(round(2*(rs/5)+1):round(3*(rs/5)),:);
U{i,4} = sas(round(3*(rs/5)+1):round(4*(rs/5)),:);
U{i,5} = sas(round(4*(rs/5)+1):rs,:);
clear sas
end

[ur, uc] = size(U);

% Displaying the posts only of each user for analysis in Sty %
for i=1:length(unqValue)
for k=1:5
  [uur,uuc] = size(U{i,k});
  for z=1:uur
  Sty{i,k}{z,1} = U{i,k}{z,9};
  end
 
end
end

% Combing all posts into one string with spaces in Cmb %
for i=1:length(unqValue)
   
    for j=1:5
         s = [];  count=1;
        [uur,uuc] = size(U{i,j});
        for k=1:uur
            s1 = Sty{i,j}{k,1};
            s = [s ' ' s1];
            
        end
        
            Cmb{i,j}{count,1} = s;   
      count =count+1;
    end
   
end

% Tokenizing the posts %
for i=1:length(unqValue)
    for j=1:5
[uur,uuc] = size(Cmb{i,j});
        for k=1:uuc
        token{i,j} = strsplit(Cmb{i,j}{1,1});
        end
    end
end

% Calculating length of each token %
for i=1:length(unqValue)
    for j=1:5
[uur,uuc] = size(token{i,j});
 for k=1:uuc
     tokenLen{i,j}{1,k} = length(token{i,j}{1,k});
 end
    end
end



% Frequency Count for Word Length feature %

for i = 1:ur
    for j = 1:uc
       WordLen = zeros(1,20);
        [uur,uuc] = size(tokenLen{i,j});
for k = 1:uuc
    
    if tokenLen{i,j}{1,k} == 1
        WordLen(1) = WordLen(1) +1;
    end
    
    if tokenLen{i,j}{1,k} == 2       
        WordLen(2) = WordLen(2) +1;
    end
       
    if tokenLen{i,j}{1,k} == 3      
        WordLen(3) = WordLen(3) +1;
    end
    
    if tokenLen{i,j}{1,k} == 4     
        WordLen(4) = WordLen(4) +1;
    end
    
    if tokenLen{i,j}{1,k} == 5       
        WordLen(5) = WordLen(5) +1;
    end
    
    if tokenLen{i,j}{1,k} == 6       
        WordLen(6) = WordLen(6) +1;
    end
       
    if tokenLen{i,j}{1,k} == 7
        WordLen(7) = WordLen(7) +1;
    end
       
    if tokenLen{i,j}{1,k} == 8       
        WordLen(8) = WordLen(8) +1;
    end
    
    if tokenLen{i,j}{1,k} == 9       
        WordLen(9) = WordLen(9) +1;
    end
       
    if tokenLen{i,j}{1,k} == 10       
        WordLen(10) = WordLen(10) +1;
    end
    
    if tokenLen{i,j}{1,k} == 11     
        WordLen(11) = WordLen(11) +1;
    end
    
    if tokenLen{i,j}{1,k} == 12      
        WordLen(12) = WordLen(12) +1;
    end
    
    if tokenLen{i,j}{1,k} == 13      
        WordLen(13) = WordLen(13) +1;
    end
       
    if tokenLen{i,j}{1,k} == 14      
        WordLen(14) = WordLen(14) +1;
    end
    
    if tokenLen{i,j}{1,k} == 15       
        WordLen(15) = WordLen(15) +1;
    end
    
    if tokenLen{i,j}{1,k} == 16       
        WordLen(16) = WordLen(16) +1;
    end
       
    if tokenLen{i,j}{1,k} == 17       
        WordLen(17) = WordLen(17) +1;
    end
    
    if tokenLen{i,j}{1,k} == 18     
        WordLen(18) = WordLen(18) +1;
    end
    
    if tokenLen{i,j}{1,k} == 19       
        WordLen(19) = WordLen(19) +1;
    end
    
    if tokenLen{i,j}{1,k} == 20       
        WordLen(20) = WordLen(20) +1;
    end
       
    
end

  % Combine frequency %
    S1(i,j) = mat2cell(WordLen);
    end
end


% Frequency Count for Alphabet feature %

for i=1:length(unqValue)
    for j=1:5
        [uur,uuc] = size(Cmb{i,j});
        for k=1:uuc
            tt = lower(char(Cmb{i,j}{1,k}));
            [tr,tc] = size(tt);
            temp = zeros(1,26);
            for d=2:tc
                for g=1:length(alpha)
                
                    if strcmp(tt(d),alpha(g))
                        temp(1,g) = temp(1,g)+1;
                    end
                end
            end
        end
        S2(i,j) = mat2cell(temp);
        
    end
end

% Frequency Count for Digit feature %
for i=1:length(unqValue)
    for j=1:5
        [uur,uuc] = size(Cmb{i,j});
        temp1 = zeros(1,length(digit));
        for k=1:uuc
          temp = regexp(Cmb{i,j}{1,k},'[0-9]','match');
           for d=1:length(temp)
                for g=1:10
                    if strcmp(temp(d),digit(g))
                        temp1(1,g) = temp1(1,g)+1;
                    end
                end
            end
        end
        S3(i,j) = mat2cell(temp1);
        
    end
end


% Frequency Count for Special Characters feature %
for i=1:length(unqValue)
    for j=1:5
        [uur,uuc] = size(Cmb{i,j});
        for k=1:uuc
            tt = char(Cmb{i,j}{1,k});
            [tr,tc] = size(tt);
            temp = zeros(1,length(spcChar));
            for d=2:tc
                for g=1:length(spcChar)
                
                    if strcmp(tt(d),spcChar(g))
                        temp(1,g) = temp(1,g)+1;
                    end
                end
            end
        end
        S4(i,j) = mat2cell(temp);
        
    end
end


% % Frequency Count for Smileys feature %
% for i=1:length(unqValue)
%     for j=1:5
%         [uur,uuc] = size(Cmb{i,j});
%         for k=1:uuc
%             tt = char(Cmb{i,j}{1,k});
%             [tr,tc] = size(tt);
%             temp = zeros(1,length(smi));
%             for d=2:tc
%                 for g=1:length(smi)
%                     if strcmp(tt(d),smi(g))
%                         temp(1,g) = temp(1,g)+1;
%                     end
%                 end
%             end
%         end
%         S5(i,j) = mat2cell(temp);
%         
%     end
% end


% for matrix of word length


k=1;
for i=1:length(unqValue)
    for j=1:5
        for l=1:20
           matwrdl(k,l)=S1{i,j}(1,l); 
        end 
         matwrdl(k,21)=i;
        k=k+1;
    end 
end


%for matrix of alphabet

k2=1;
for i=1:length(unqValue)
    for j=1:5
        for l=1:26
           matalf(k2,l)=S2{i,j}(1,l); 
        end 
         matalf(k2,27)=i;
        k2=k2+1;
    end 
end

% for matrix of integers

k3=1;
for i=1:length(unqValue)
    for j=1:5
        for l=1:10
           matdig(k3,l)=S3{i,j}(1,l); 
        end 
         matdig(k3,11)=i;
        k3=k3+1;
    end 
end

% for matrix of special character

k4=1;
for i=1:length(unqValue)
    for j=1:5
        for l=1:18
           matspch(k4,l)=S4{i,j}(1,l); 
        end 
           matspch(k4,18)=i;
        k4=k4+1;
    end 
end



% writing into csv file matrix matalf

% csvwrite('Alpha.dat',matalf);

csvwrite('Alpha.csv',matalf);

csvwrite('Digits.csv',matdig);


csvwrite('SpecChar.csv',matspch);

csvwrite('WordLen.csv',matwrdl);



% k5=1;
% for i=1:length(unqValue)
%     for j=1:5
%         for l=1:16
%            matsmi(k5,l)=S5{i,j}(1,l); 
%         end 
%         k5=k5+1;
%     end 
% end

% sim = [S1,S2,S3,S4,S5];
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%                            % End %
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
