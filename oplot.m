function han = oplot(varargin)
%% 如果是PPT展示，请用参数"PPT"（要加引号）

if nargin==0
    base_font_size=10;
    base_line_width=1;
elseif lower(varargin{1})=="ppt"
    base_font_size=20;
    base_line_width=2;
else
    error('好像出错了')
end


%% 线型与标记方案
line_style={":","-","--","-."};
line_marker={"*","^","o","d","p"};

%% 配色方案(暂时不用，用matlab自带的就很好)
% colorspace=readlines("Generic Gradient.txt");

%% 线段
h=findobj('type','line');
objnum = length(h);
if objnum>5;disp("吐槽：线段有点多");end
for sb = 1:objnum % sb的写法
    set(h(sb) ...
        ,linestyle=line_style{mod(sb,length(line_style))+1} ...
        ,Marker=line_marker(rem(sb,length(line_style))+1) ...
        ,LineWidth=base_line_width)
end

%% 坐标轴
box off

%% 标题与坐标文本
% set(gca,"FontName","Times new roman") % 个人用
% 罗马宋（times new roman 与宋体的结合）不想要字体文件参考https://zhuanlan.zhihu.com/p/355314689
set(gca,"FontName","宋体")
set(gca,"fontsize",base_font_size,"TitleFontSizeMultiplier",1.618,"LineWidth",1.618*base_line_width)

%% 图例
if isempty(gca().Legend)==1
else
    set(gca().Legend,"box",'off','FontSize',base_font_size)
end

%% 紧凑边距
set(gca,'LooseInset',[0.1 0.1 0.1 0.1].*0.01)


