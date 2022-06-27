% 对选定文件夹内的批量文件进行改名
% 末尾有' - 副本'的，删除该信息，并将开头1改为2，然后将文件名改为这个新文件名。
% 2022-6-27
selpath = uigetdir;   % 选择文件夹
file_type = '\*.txt';   % 文件类型，注意前面要加一个\
path_file_type = strcat(selpath,file_type); % 拼接路径和文件类型字符串

str_nfiles = dir(path_file_type); % 获取指定路径下文件列表，并存在str_nfiles结构体中
for ii=1:length(str_nfiles)
    if ~isempty(strfind(str_nfiles(ii).name,'副本'))
        newname = erase(str_nfiles(ii).name,' - 副本');  % 删除匹配字符并替换原来的字符串
        newname(1)='2';
        movefile(str_nfiles(ii).name,newname);   % 弃用eval方式，因不能采用变量作为其中的参数实现批量文件改名。
    end
end








% %
% file = dir('*.txt');
% len = length(file);
% for ii=1:len
%     oldname =file(ii).name;
%     newname = num2str(ii,'txt%03i.jpg');
%     eval(['!rename',' ',oldname,' ',newname]);
% End
% %
% 以上已测试通过
% %
%
% 下面是批量创建文件,已测试
% for ii=1:10
%     newname = num2str(ii,'%05i.txt');
%     fid = fopen(newname,'w+');
%     fprintf(fid,'%2i',ii);
%     fclose(fid);
% end
% 
% 字符串中删除特定字符  erase,   newStr = erase(str,match)
% 字符串替换 strrep
% 字符串中查找是否包含特定字符。应用，若包含，进行某些操作。
% findstr, strtok, strmatch
% movefile可以实现文件重命名

%以下这种方式也可以创建很多新文件。
% newFile = 'learnEval';
% fileExtension = '.dat';
% for files = 1 : 5
%     filename = [newFile, int2str(files), fileExtension];
%     eval (['save ', filename , ' files'])
% end



% Matlab rename files and folders: https://programmerall.com/article/90271080922/
 