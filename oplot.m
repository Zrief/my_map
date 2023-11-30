function han = oplot(varargin)

base_font_size=10;
base_line_width=1;

if nargin==0
elseif any(lower(varargin)=="ppt")       % 如果是PPT展示，请用参数'PPT'（要加引号）
    base_font_size=20;
    base_line_width=2;
else
    error('好像出错了')
end


%% 线型与标记方案
line_style={":","-","--","-."};
line_marker={"*","^","o","d","p","+"};

%% 配色方案(暂时不用考虑，用matlab自带的就很好)
% colorspace=readlines("Generic Gradient.txt");

%% 线段
h=findobj('type','line');
if isempty(h);disp('没有可用线条');end
objnum = length(h);

if objnum>5;disp("吐槽：线段有点多");end

for sb = 1:objnum       % sb的写法
    tmp_style=line_style{mod(sb,length(line_style))+1};
    tmp_marker=line_marker{rem(sb,length(line_marker))+1};
    if h(sb).Marker~="none"         % 判断数据量是否合适使用 标记
    elseif length(h(sb).XData)>100
        tmp_marker='none';
    end
    if h(sb).LineStyle=="none" && tmp_marker~="none";   tmp_style='none';   end         % 判断该不该用线条

    set(h(sb) ...
        ,linestyle=tmp_style ...
        ,Marker= tmp_marker...
        ,LineWidth=base_line_width)
end

%% 坐标轴
% box off
set(gca,"TickDir","out","Box","off")

%% 标题与坐标文本
% set(gca,"FontName","Times new roman") % 个人用
% 罗马宋（times new roman 与宋体的结合）不想要字体文件参考https://zhuanlan.zhihu.com/p/355314689
set(gca,"FontName","宋体")
set(gca,"fontsize",base_font_size,"TitleFontSizeMultiplier",1.618,"LineWidth",1.618*base_line_width)

%% 图例
if isempty(gca().Legend)==1
else
    set(gca().Legend,"box",'off','FontSize',base_font_size,'Location','bestoutside')
end

my_margin