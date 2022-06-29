% 批量对文件夹改名，中文名称文件夹也没问题。
% 如文件加名为testA，改为testB。具体文件夹名为：'1_2月 - 附件'改为'2_2月'
% 2022-6-28  测试成功。
selpath = uigetdir;   % 交互对话框，指定文件夹
ADir = dir(selpath);
ADir = ADir([ADir.isdir]);
AName = {ADir.name};

AName(strncmp(AName, '.', 1)) = [];  % strncmp(s1,s2,n),比较字符串s1、s2前n个字符是否相等，相等返回1.
                                     % 本行语句是与.对比，以从列表中剔除名为1个点和2个点的文件夹
for iFolder = 1:numel(AName)
    if ~isempty(strfind(AName{iFolder},'副本'))
        newname = erase(AName{iFolder},' - 副本');   % 删除' - 副本'
        newname(1)='2';                              % 前缀由1改为2
        newname = fullfile(selpath,newname);         % 改后的文件夹名及路径
        oldname = fullfile(selpath,AName{iFolder});  % 旧文件夹名及路径
        movefile(oldname,newname);                   % 执行对文件夹改名
    end

end

% 参考：https://www.mathworks.com/matlabcentral/answers/16283-renaming-a-lot-of-folders-automatically-by-matlab