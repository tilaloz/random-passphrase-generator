function randomPhraseGenerator()
% Generate random phrases from a random list of words
%#ok<*AGROW>

answer = inputdlg({'Seed','Minimum Number of Characters','Index'},'Enter preferences for Random Phrase Generator',1,{'','15',''});
seed = eval(answer{1});
n = str2num(answer{2});
index = str2num(answer{3});

filename = uigetfile('*.txt','Choose a text file for source words');



%% Prep the random number generator
s = RandStream('twister','Seed',seed);

%% Read in the list of random words
fid = fopen(filename,'r');

list ={};
tline = fgetl(fid);
while ischar(tline)
   list{end+1} = tline;
   tline = fgetl(fid);
end

fclose(fid);

%% Shuffle the list
shuffledList = list(s.randperm(numel(list)));
ii = 1;
jj = 1;
while ii < numel(shuffledList)
   phrase = ''; 
   while numel(phrase) < n && ii <= numel(shuffledList)
      phrase = [phrase shuffledList{ii} ' '];
      ii = ii + 1;
   end
   output{1,jj} = [num2str(jj) ' ' phrase] ;
   jj = jj + 1;
end

figure;
uicontrol(gcf,'style','listbox','Units','Normalized','Position',[0.03 0.03 0.94 0.94],'String',output)
%msgbox(output{index});

