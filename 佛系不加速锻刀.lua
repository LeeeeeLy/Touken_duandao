--这是一个基于KanColleAuto运行的script
--软件地址：http://kan.moehex.com/

--[[

佛系锻刀

基于日服简易加速锻刀修改的不加速佛系锻刀脚本
原脚本发布地址：http://kancode.moehex.com/2020/03/01/%e5%88%80_%e6%97%a5%e6%9c%8d%e7%ae%80%e6%98%93%e5%8a%a0%e9%80%9f%e9%94%bb%e5%88%80/
请先进入锻刀界面并进行一次锻刀，目的是为了将锻刀的各种资源值固定
然后停留在锻刀界面运行脚本
运行前留出足够空刀位
-此版为不加速锻刀，适用于限锻时期睡觉挂机【合理利用每一分钟好耶！

]]



--[[---------------------------------设置区域-----------------------------------]]


--锻刀次数
runCount = 100

--开启锻刀位（2-4）
FacNum = 2

--无空位时等待刷新时间 （分钟）
waitmin = 10

--[[---------------------------------------------------------------------------]]


function Jiushibujiasu()

--[[取得可用的锻造位 1 - FacNum ]]
function GetPositionIndex()
	for i = 1, FacNum do
		if Base.IsColor(413,166 + (i - 1) * 113,16777215) then --白色空床位
			return i;
		elseif Base.IsColor(349,150 + (i - 1) * 113,2031390) then -- 绿色完成锻造
			--点击空位
			Base.Click(413,166 + (i - 1) * 113);
			Base.Sleep(800);
			Base.SleepSec(8);
			--Next 回到锻刀
			Base.Click(863,525);
			Base.Sleep(50);
			Base.Click(863,525);
			Base.Print("等待回到锻刀...");
			Base.Click(863,525);
			Base.Sleep(2500);
			return i;
		end
	end
	return 0;
end
for i = 1, runCount do
	Base.Print("开始第" .. i .. "次");

	index = GetPositionIndex();
	
	Base.Print("使用" .. index .. "号位置");

	if index == 0 then
		--输出无空位了
		Base.Print("0号位置就是没空位啦！");
		Base.Print("等待ing");
		Base.SleepSec(60*waitmin);
		Jiushibujiasu();
	end

	--点击空位
	Base.Click(413,166 + (index - 1) * 113);
	Base.Sleep(800);



	Base.Print("点击锻造");
	--点击锻造
	Base.Click(655, 518);
	Base.SleepSec(8);
	Base.Click(863,525);
	Base.Sleep(50);
	Base.Click(863,525);
	Base.Print("等待回到锻刀...");
	Base.Click(863,525);
	Base.SleepSec(10);
    
end--#coding=utf8
end
Jiushibujiasu();
