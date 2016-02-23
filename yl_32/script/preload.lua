--固定预先加载的脚本，会是所有脚本加载的第一个

--调试输出辅助函数，输出一些只用于调试而无关游戏功能的信息
--一般提交时应把所有调试信息删掉，为了防止忘记删除及区别真正要输出的信息而设此函数而不要直接用print
--在此设_DbgOut为空，调试模式时可在某处转向为print
function _DbgOut()
end


-- 载入游戏模块
--print(unpack(_G));
--print(KScheduleTask)
--print(KLib)
print('--------------------------------------');
local tbData		= KLib.LoadTabFile("/setting/scripttable.txt");
local tbModuleBase	= { szModuleName = "__ModuleBase" };
local tbMoudleMT	= { __index	= tbModuleBase };
local tbModelSet	= {};
for nRow = 2, #tbData do
	local szModule	= tbData[nRow][1];
	tbModelSet[szModule]	= 1;
	if (_G[szModule]) then
		--print("Warring, "..szModule.."已经被定义过，此时将被覆盖");
	end
	_G[szModule]	= setmetatable({ szModuleName = szModule }, tbMoudleMT);
	--print(szModule .. "\n")
end

--Lang  = Lang or {}
--error("111111");
--assert(nil)
--os.exit()
Env.tbModelSet		= tbModelSet;
--== 模块基类函数定义 ==--
function tbModuleBase:DbgOut(...)
	Dbg:Output(self.szModuleName, unpack(arg));
end
function tbModuleBase:WriteLog(nLevel, ...)
	Dbg:WriteLogEx(nLevel, self.szModuleName, unpack(arg));
end
function tbModuleBase:GetPlayerTempTable(pPlayer)
	return pPlayer.GetTempTable(self.szModuleName)
end

local tbMoudleMT	= { __index	= tbModuleBase };
for nRow = 2, #tbData do
	local szModule	= tbData[nRow][1];
	_G[szModule]	= setmetatable({ szModuleName = szModule }, tbMoudleMT);
end

	tbModelSet["Lang"]	= 1;
	if (_G["Lang"]) then
		--print("Warring, "..szModule.."已经被定义过，此时将被覆盖");
	end
	_G["Lang"]	= setmetatable({ szModuleName = "Lang" }, tbMoudleMT);
Env.tbModelSet = {};

for nRow = 2, #tbData do
	local szModule	= tbData[nRow][1];
	Env.tbModelSet[szModule] = 1;
end
--Env.tbModelSet["Lang"] = 1;

if (not GetLocalDate) then	-- 临时解决GC没有对应函数
	GetLocalDate	= os.date;
end

--禁用脚本指令
dofile		= nil;
loadfile	= nil;
io			= nil;
math.random	= nil;
math.randomseed	= nil;

--目录结构
Lang={
	pet={},
	ai = {},
	arena = {},
	awardlobby = {},
	buffer_ = {},
	character = {},
	chat = {},
	config ={},
	currency = {},
	doodad = {},
	eighttrigram = {},
	escort = {},
	expscene = {},
	fightskill = {},
	gcscript = {},
	gloaldata = {},
	item = {},
	kin = {},
	lib = {},
	mail = {},
	makeup = {},
	meditation = {},
	misc = {},	
	title = {},
	task = {target = {}},
	scene = {},
	reward = {},
	quiz={},
	npc ={},
	mission = {},
	player = {},
}	

Lang.Idx=1 --语言索引
Lang.Language="zh" --vi 越南  zh 中文

Lang.ai.argment1 = {"我列个大去","","","","",""}
Lang.ai.argment2 = {"阁下果然不俗，今日姑且到此，后会有期！","","","","",""}
Lang.ai.argment3 = {"找你好久了，真是踏破铁鞋无觅处","","","","",""}
Lang.ai.argment4 = {"置你于死地！看招！","","","","",""}
Lang.ai.argment5 = {"找你好久了，想不到你在这，真是踏破铁鞋无觅处","","","","",""}
Lang.ai.argment6 = {"一闪一闪亮晶晶","","","","",""}
Lang.ai.argment7 = {"置你于死地！看招","","","","",""}
Lang.ai.argment8 = {"满天都是小星星","","","","",""}
Lang.ai.argment9 = {"582号技能","","","","",""}
Lang.ai.argment10 = {"10号技能","","","","",""}
Lang.ai.argment11 = {"测试测试","","","","",""}
Lang.ai.argment12 = {"你们快去上边击败铁尸，拿到钥匙，我才能带你们离开这里","","","","",""}
Lang.ai.argment13 = {"我已经拿到钥匙了，我们快离开这里吧","","","","",""}
Lang.ai.argment14 = {"我只是路过","","","","",""}
Lang.ai.argment15 = {"你们根本没有拿到钥匙，快去，不然时间就不够了","","","","",""}
Lang.ai.argment16 = {"你们还没有拿到钥匙，快去，不然时间就不够了","","","","",""}
Lang.ai.argment17 = {"萨达四大大声道","","","","",""}
Lang.ai.argment18 = {"我们聊一聊人生！吃饭了吗？","","","","",""}
Lang.ai.argment19 = {"半吊子！看招！","","","","",""}
Lang.ai.argment20 = {"大胆妖物！全给拿下！","","","","",""}
Lang.ai.argment21 = {"谁挡秒谁！","","","","",""}
Lang.ai.argment22 = {"我没血了！你还打！","","","","",""}
Lang.ai.argment23 = {"肉啊！快给我咬一口！","","","","",""}
Lang.ai.argment24 = {"肉啊！快给我咬一口吧！","","","","",""}
Lang.ai.argment25 = {"无名小卒竟敢在这闹事！看我怎么收拾你！","","","","",""}
Lang.ai.argment26 = {"快给我过来！","","","","",""}

Lang.arena.str1 = {"最大次数了！无法增加次数","","","","",""}
Lang.arena.str2 = {"挑战次数不足，是否花费10元宝购买一次挑战次数","","","","",""}
Lang.arena.str3 = {"当前CD时间不为0，是否花费10元宝清空CD，立即战斗","","","","",""}
Lang.arena.str4 = {"已达到次数上限!","","","","",""}
Lang.arena.str5 = {"英雄出少年, <%s>在竞技场中已经取得了5连胜！","","","","",""}
Lang.arena.str6 = {"英雄出少年, <%s>在竞技场中已经取得了10连胜！","","","","",""}
Lang.arena.str7 = {"宝剑锋从磨砺出, <%s>在竞技场中已经取得了15连胜！","","","","",""}
Lang.arena.str8 = {"宝剑锋从磨砺出, <%s>在竞技场中已经取得了20连胜！","","","","",""}
Lang.arena.str9 = {"<%s>在竞技场如入无人之境,已经取得了惊人的25连胜！","","","","",""}
Lang.arena.str10 = {"<%s>在竞技场如入无人之境,已经取得了惊世骇俗的%d连胜！","","","","",""}

Lang.awardlobby.str1 = {"当月补签次数已到上限,明天再来吧!","","","","",""}
Lang.awardlobby.str2 = {"补签需要%s元宝，您的元宝不足","","","","",""}

Lang.buffer_.str1 = {"%s要复活你，接受复活吗","","","","",""}

Lang.chat.str1 = {"您已被禁言至：","","","","",""}
Lang.chat.str2 = {"您不能在此频道发言","","","","",""}
Lang.chat.str3 = {"您的线聊喇叭个数已经用完，不能在线聊频道发送消息，请及时购买！","","","","",""}
Lang.chat.str4 = {"您的全区喇叭个数已经用完，不能在世界频道发送消息，请及时购买！","","","","",""}
Lang.chat.str5 = {"您发送得太频繁了，请过%d秒再尝试发送。","","","","",""}
Lang.chat.str6 = {"不能禁言自己","","","","",""}
Lang.chat.str7 = {"禁言有时间间隔限制","","","","",""}

Lang.doodad.str1 = {"搜刮一番","","","","",""}
Lang.doodad.str2 = {"砸掉","","","","",""}
Lang.doodad.str3 = {"算了","","","","",""}
Lang.doodad.str4 = {"一个装饰精美的箱子，里面有神马东东呢？","","","","",""}
Lang.doodad.str5 = {"好心人，谢谢你放我出来。我被关了整整四百年了，就让我杀了你作为答谢吧！","","","","",""}
Lang.doodad.str6 = {"打开中","","","","",""}

Lang.eighttrigram.str1 = {"卦生阴阳，逆天改命！[name] 炼卦达到10重，实乃大吉大利之兆！","","","","",""}
Lang.eighttrigram.str2 = {"卦生阴阳，逆天改命！[name] 炼卦达到20重，实乃大吉大利之兆！","","","","",""}
Lang.eighttrigram.str3 = {"卦生阴阳，逆天改命！[name] 炼卦达到30重，实乃吉星高照之兆！","","","","",""}
Lang.eighttrigram.str4 = {"卦生阴阳，逆天改命！[name] 炼卦达到40重，实乃吉星高照之兆！","","","","",""}
Lang.eighttrigram.str5 = {"卦生阴阳，逆天改命！[name] 炼卦达到50重，实乃百无禁忌之兆！","","","","",""}
Lang.eighttrigram.str6 = {"卦生阴阳，逆天改命！[name] 炼卦达到60重，实乃百无禁忌之兆！","","","","",""}
Lang.eighttrigram.str7 = {"卦生阴阳，逆天改命！[name] 炼卦达到70重，实乃百无禁忌之兆！","","","","",""}
Lang.eighttrigram.str8 = {"卦生阴阳，逆天改命！[name] 炼卦达到80重，实乃百无禁忌之兆！","","","","",""}
Lang.eighttrigram.str9 = {"卦生阴阳，逆天改命！[name] 炼卦达到90重，实乃百无禁忌之兆！","","","","",""}
Lang.eighttrigram.str10 = {"卦生阴阳，逆天改命！[name] 炼卦达到100重，实乃百无禁忌之兆！","","","","",""}

Lang.eighttrigram.str11 = {"您的战魂不足","","","","",""}
Lang.eighttrigram.str12 = {"您已经满级了，无法再升了","","","","",""}
Lang.eighttrigram.str13 = {"炼卦时间结束,才可升至下一重","","","","",""}
Lang.eighttrigram.str14 = {"您的元宝不足","","","","",""}

Lang.escort.str1 = {"当前vip等级未开启此功能，请升级vip!","","","","",""}
Lang.escort.str2 = {"今天购买次数已到上限，明天再来吧~","","","","",""}
Lang.escort.str3 = {"购买修仙次数需要%s元宝，您的元宝不足","","","","",""}
Lang.escort.str4 = {"是否花费%d元宝购买一次修仙次数","","","","",""}
Lang.escort.str5 = {"购买刷新次数需要%s元宝，您的元宝不足","","","","",""}
Lang.escort.str6 = {"是否花费%d元宝购买一次刷新次数","","","","",""}
Lang.escort.str7 = {"购买劫驾次数需要%s元宝，您的元宝不足","","","","",""}
Lang.escort.str8 = {"是否花费%d元宝购买一次劫驾次数","","","","",""}
Lang.escort.str9 = {"购买劫驾次数需要%s元宝，您的元宝不足","","","","",""}
Lang.escort.str10 = {"购买救驾次数需要%s元宝，您的元宝不足","","","","",""}
Lang.escort.str11 = {"是否花费%d元宝购买一次救驾次数","","","","",""}
Lang.escort.str12 = {"Th?ng c?p Thành ??n c?p {0}\nThành c?p {1} c? dan t?i ?a là {2}\nThành c?p {3} b? tranh ?o?t hoàn tr? :{4}%\nTh?ng c?p t?n:{5}\nPh?nh hi?n có:{6}","","","","",""}
Lang.escort.str13 = {"%s已经不在劫驾状态中，无法救驾","","","","",""}
Lang.escort.str14 = {"%s邀请你在修仙中护驾，可以获得护驾奖励，你愿意参加吗","","","","",""}
Lang.escort.str15 = {"%s同意了你的邀请，将为你本次修仙保驾护航","","","","",""}
Lang.escort.str16 = {"%s已经开始了修仙，护驾失败","","","","",""}
Lang.escort.str17 = {"你获得了%d点真气作为护驾奖励","","","","",""}

Lang.expscene.str1 = {"副本【%d】信息为空","","","","",""}

Lang.gcscript.str1 = {"<%s>拳打脚踢，口咬头撞，终于荣获今日竞技场排名第一的美誉","","","","",""}
Lang.gcscript.str2 = {"目标家族申请队列已满","","","","",""}
Lang.gcscript.str3 = {"系统没找到合适的副本","","","","",""}
Lang.gcscript.str4 = {"您的等级为%d级, 不能进入等级要求为%d级的副本","","","","",""}
Lang.gcscript.str5 = {"您的队友%s的等级为%d级，不能进入等级要求为%d级的副本","","","","",""}
Lang.gcscript.str6 = {"您的等级为%d级，不能进入等级要求为%d级的关卡","","","","",""}
Lang.gcscript.str7 = {"您的队友%s的等级为%d级，不能进入等级要求为%d级的关卡","","","","",""}
Lang.gcscript.str8 = {"系统没找到合适的副本关卡","","","","",""}
Lang.gcscript.str9 = {"您已经离开关卡等待队列","","","","",""}
Lang.gcscript.str10 = {"您已经离开副本等待队列","","","","",""}
Lang.gcscript.str11 = {"您已进入关卡队列，系统正在为您匹配玩家","","","","",""}
Lang.gcscript.str12 = {"您已进入副本队列，系统正在为您匹配玩家","","","","",""}
Lang.gcscript.str13 = {"匹配成功，您有%d秒时间选择进入还是离开","","","","",""}
Lang.gcscript.str14 = {"您同意进入副本关卡","","","","",""}
Lang.gcscript.str15 = {" 同意进入副本关卡","","","","",""}
Lang.gcscript.str16 = {"您拒绝进入副本关卡","","","","",""}
Lang.gcscript.str17 = {" 拒绝进入副本关卡","","","","",""}
Lang.gcscript.str18 = {"您进入副本关卡超时","","","","",""}
Lang.gcscript.str19 = {" 进入副本关卡超时。已离开等待队列","","","","",""}
Lang.gcscript.str20 = {"你已经离开关卡队列","","","","",""}
Lang.gcscript.str21 = {"你已经离开副本队列","","","","",""}
Lang.gcscript.str22 = {"有组队成员下线，等队成员上线或离开队伍才可以排队","","","","",""}
Lang.gcscript.str23 = {"您的副本次数为0了，不能进行排队","","","","",""}
Lang.gcscript.str24 = {"您的关卡次数为0了，不能进行排队","","","","",""}
Lang.gcscript.str25 = {"您的队友%s副本次数为0了，不能进行排队","","","","",""}
Lang.gcscript.str26 = {"您的队友%s关卡次数为0了，不能进行排队","","","","",""}
Lang.gcscript.str27 = {"您已经在战斗地图中，不能进行排队","","","","",""}
Lang.gcscript.str28 = {"您的队友%s已经在战斗地图中，不能进行排队","","","","",""}
Lang.gcscript.str29 = {"您在关卡扫荡中，不能进入闯关","","","","",""}
Lang.gcscript.str30 = {"您的队友%s在关卡扫荡中，不能闯关","","","","",""}
Lang.gcscript.str31 = {"添加失败，要成为指定密友需要等级达到%s级。","","","","",""}
Lang.gcscript.str32 = {"添加失败，要成为密友需要亲密度等级达到%s级。","","","","",""}
Lang.gcscript.str33 = {"添加失败，要知道知己的数量只能有1个。","","","","",""}
Lang.gcscript.str34 = {"添加失败，同性别的玩家是不能结为知己的。","","","","",""}
Lang.gcscript.str35 = {"添加失败，被介绍人的等级最高不能超过%s级。","","","","",""}
Lang.gcscript.str36 = {"添加失败，介绍人的等级至少要比被介绍人的高出%s级。","","","","",""}
Lang.gcscript.str37 = {"你们不能成为师徒，师傅每个月最多只能收%s个徒弟。","","","","",""}
Lang.gcscript.str38 = {"你们不能成为师徒，师傅至少要达到%s级才能收徒。","","","","",""}
Lang.gcscript.str39 = {"你们不能成为师徒，每个师傅当前的未出师弟子最多只能有%s个。","","","","",""}
Lang.gcscript.str40 = {"你们不能成为师徒，师傅不能是其他的未出师弟子。","","","","",""}
Lang.gcscript.str41 = {"你们不能成为师徒，只有在%s级至%s级之间的玩家才可以拜师。","","","","",""}
Lang.gcscript.str42 = {"你们不能成为师徒，玩家不能在已经有师傅的情况下再拜其他人为师。","","","","",""}
Lang.gcscript.str43 = {"的徒弟","","","","",""}
Lang.gcscript.str44 = {"的师傅","","","","",""}
Lang.gcscript.str45 = {"%s拒绝成为你的师父，你们可以再聊聊或者通过师徒面板寻找其他合适的师父","","","","",""}
Lang.gcscript.str46 = {"%s拒绝成为你的徒弟，你们可以再聊聊或者通过师徒面板寻找其他合适的徒弟","","","","",""}
Lang.gcscript.str47 = {"你与对方为仇人关系，请先从仇人列表把对方删除再添加好友。","","","","",""}
Lang.gcscript.str48 = {"你的好友人数已达上限。","","","","",""}
Lang.gcscript.str49 = {"你不能添加自己为好友","","","","",""}
Lang.gcscript.str50 = {"您与<color=yellow>%s<color>的亲密度达到%d级，获得%d绑定%s的奖励。","","","","",""}
Lang.gcscript.str51 = {"此外，您获得原好友1级亲密度奖励%d次，剩余1级好友亲密度奖励<color=yellow>%d次<color>。","","","","",""}
Lang.gcscript.str52 = {"您已领过亲密度为%d级的奖励%d次，剩余%d级好友亲密度奖励<color=yellow>%d次<color>。","","","","",""}
Lang.gcscript.str53 = {"您目前处于账号锁定状态，不能进行该操作。","","","","",""}
Lang.gcscript.str54 = {"在跨服副本中不能使用这个功能","","","","",""}
Lang.gcscript.str55 = {"您要加入的好友不存在","","","","",""}
Lang.gcscript.str56 = {"你把[%s]添加为仇人了。 ","","","","",""}
Lang.gcscript.str57 = {"你把[%s]添加到了黑名单。","","","","",""}
Lang.gcscript.str58 = {"你和[%s]成为好友了。","","","","",""}
Lang.gcscript.str59 = {"添加失败，您与[%s]已经有这种人际关系了，不必再次添加。","","","","",""}
Lang.gcscript.str60 = {"添加失败，对方可能不在线。","","","","",""}
Lang.gcscript.str61 = {"添加[%s]为好友失败，对方可能不存在。","","","","",""}
Lang.gcscript.str62 = {"添加失败，该玩家不存在或不符合与你成为好友的条件。","","","","",""}
Lang.gcscript.str63 = {"密友关系","","","","",""}
Lang.gcscript.str64 = {"介绍人关系","","","","",""}
Lang.gcscript.str65 = {"师徒关系","","","","",""}
Lang.gcscript.str66 = {"你与<color=yellow>%s<color>的%s将在一周内到期。","","","","",""}
Lang.gcscript.str67 = {"您的好友数量已达上限，请先删除再添加！","","","","",""}
Lang.gcscript.str68 = {"您的黑名单数量已达上限，请先删除再添加！","","","","",""}
Lang.gcscript.str69 = {"玩家[%s]已下线或者不存在","","","","",""}
Lang.gcscript.str70 = {"添加失败，你或对方的该人际关系数量已经达到上限。","","","","",""}
Lang.gcscript.str71 = {"你们已经存在着这种人际关系了，不用再次添加。","","","","",""}
Lang.gcscript.str72 = {"操作失败，你们需要先建立其他类型的人际关系才能进行该操作。","","","","",""}
Lang.gcscript.str73 = {"操作失败，你们要建立的关系与其他现有关系冲突。","","","","",""}
Lang.gcscript.str74 = {"操作失败，因为你们之间有其他类型的人际关系存在而不能删除该人际关系。","","","","",""}
Lang.gcscript.str75 = {"师徒相关","","","","",""}
Lang.gcscript.str76 = {"介绍人相关","","","","",""}
Lang.gcscript.str77 = {"指定密友","","","","",""}
Lang.gcscript.str78 = {"领取密友奖励","","","","",""}
Lang.gcscript.str79 = {"成就系统相关","","","","",""}
Lang.gcscript.str80 = {"我只是随便来看看","","","","",""}
Lang.gcscript.str81 = {"<color=yellow>资料片新系统开放奖励<color>","","","","",""}
Lang.gcscript.str82 = {"申请拜师","","","","",""}
Lang.gcscript.str83 = {"进行出师仪式","","","","",""}
Lang.gcscript.str84 = {"解除师徒关系","","","","",""}
Lang.gcscript.str85 = {"领取师徒同心符","","","","",""}
Lang.gcscript.str86 = {"修复已完成固定成就","","","","",""}
Lang.gcscript.str87 = {"更换师徒称号","","","","",""}
Lang.gcscript.str88 = {"获取弟子称号","","","","",""}
Lang.gcscript.str89 = {"进入师徒副本","","","","",""}
Lang.gcscript.str90 = {"开启师徒副本","","","","",""}
Lang.gcscript.str91 = {"我这里可以帮您处理一些人际关系的问题，有什么我可以帮到你的吗？","","","","",""}
Lang.gcscript.str92 = {"我只是随便来看看","","","","",""}
Lang.gcscript.str93 = {"师徒相关","","","","",""}
Lang.gcscript.str94 = {"你现在没有可以解除关系的师父或徒弟啊。","","","","",""}
Lang.gcscript.str95 = {"和师傅解除关系","","","","",""}
Lang.gcscript.str96 = {"和徒弟解除关系","","","","",""}
Lang.gcscript.str97 = {"我只是随便来看看","","","","",""}
Lang.gcscript.str98 = {"建立介绍人关系以后，你每次在奇珍阁消费，你的介绍人就会获得5%的消费奖励。<color=yellow>介绍人关系将维持一年，到期后将自动解除。当两人亲密度达到6级时，也可在我这里申请转成指定密友关系。<color>\n\n确认要和其建立介绍人关系吗？","","","","",""}
Lang.gcscript.str99 = {"开启师徒副本","","","","",""}
Lang.gcscript.str100 = {"确认我的介绍人","","","","",""}
Lang.gcscript.str101 = {"我们想成为密友","","","","",""}
Lang.gcscript.str102 = {"成为密友后，一方在奇珍阁消费时另一方将获得消费返还奖励。<color=yellow>密友关系将维持一年，到期后将自动解除密友关系，需要重新到我这里指定密友。<color>\n\n你们确定要成为密友吗？解除密友关系时需要支付一定的手续费用，请考虑清楚哦。","","","","",""}
Lang.gcscript.str103 = {"我想删除密友","","","","",""}
Lang.gcscript.str104 = {"领取密友奖励","","","","",""}
Lang.gcscript.str105 = {"我要领取绑定%s","","","","",""}
Lang.gcscript.str106 = {"你已经有师傅了，不能再拜师","","","","",""}
Lang.gcscript.str107 = {"你的等级还不够<color=yellow>%s<color>级，不能拜师","","","","",""}
Lang.gcscript.str108 = {"你的等级已经超过<color=yellow>%s<color>级，不能拜师。","","","","",""}
Lang.gcscript.str109 = {"你今天已经拜师<color=yellow>%s<color>次了，不能再拜师","","","","",""}
Lang.gcscript.str110 = {"必须两人组队过来才能进行拜师","","","","",""}
Lang.gcscript.str111 = {"你们需要先结为好友才能拜师。","","","","",""}
Lang.gcscript.str112 = {"对方等级不足%s级，暂时不能接受弟子，你还是拜别人为师吧。","","","","",""}
Lang.gcscript.str113 = {"对方等级至少需要大于您<color=yellow>%s<color>级，所以对方不能接受你为弟子，你还是拜别人为师吧。","","","","",""}
Lang.gcscript.str114 = {"对方已经有%s个弟子了，不能再接受弟子，你还是拜别人为师吧。","","","","",""}
Lang.gcscript.str115 = {"必须两个人组队过来才能成为密友啊！","","","","",""}
Lang.gcscript.str116 = {"必须要两个人一起组队过来，才能成为密友。","","","","",""}
Lang.gcscript.str117 = {"是的，我们确定要成为密友","","","","",""}
Lang.gcscript.str118 = {"我还是考虑考虑吧","","","","",""}
Lang.gcscript.str119 = {"江湖险恶，你们还年少无知，还是等<color=red>61级<color>之后再来吧。","","","","",""}
Lang.gcscript.str120 = {"你们的亲密度必须超过<color=red>6级<color>才能成为密友啊，你们还是以后再来吧。","","","","",""}
Lang.gcscript.str121 = {"你们已经是密友了。","","","","",""}
Lang.gcscript.str122 = {"你们已经是师徒了，不能再成为指定密友。","","","","",""}
Lang.gcscript.str123 = {"只能和4个人指定成为密友，你们的密友数量已经满了。","","","","",""}
Lang.gcscript.str124 = {"您已经超过了11级，不能再确定介绍人了。","","","","",""}
Lang.gcscript.str125 = {"您必须和您的介绍人两人一起组队过来，而且您的介绍人等级至少得比您大<color=red>30级<color>以上，我才能帮助你们建立密友关系。","","","","",""}
Lang.gcscript.str126 = {"你已经有介绍人了。","","","","",""}
Lang.gcscript.str127 = {"你们需要先成为好友才能确认介绍人关系。","","","","",""}
Lang.gcscript.str128 = {"您已经成功和%s建立了密友关系，以后他也能享受您的成长，如果有什么不明白的，多问问他吧。","","","","",""}
Lang.gcscript.str129 = {"只有自己指定的密友是可以被删除的。给我<color=red>20万银两<color>，我就帮你解除密友关系。你确定要删除密友吗？","","","","",""}
Lang.gcscript.str130 = {"是的，我要删除密友","","","","",""}
Lang.gcscript.str131 = {"我还是考虑考虑吧","","","","",""}
Lang.gcscript.str132 = {"你没有密友","","","","",""}
Lang.gcscript.str133 = {"你想删除哪个密友呢？","","","","",""}
Lang.gcscript.str134 = {"你确定要和<color=yellow>%s<color>解除密友关系吗？","","","","",""}
Lang.gcscript.str135 = {"是的，我要和%s解除密友关系","","","","",""}
Lang.gcscript.str136 = {"必须付<color=red>200000<color>才能删除密友，你还是带够了钱再来吧！","","","","",""}
Lang.gcscript.str137 = {"您花费了20万银两，与 %s 解除了密友关系。","","","","",""}
Lang.gcscript.str138 = {"密友关系解除通知","","","","",""}
Lang.gcscript.str139 = {"您好，您的密友%s已经和你解除了密友关系。节哀啊节哀。","","","","",""}
Lang.gcscript.str140 = {"你现在没有可以解除关系的师父呀","","","","",""}
Lang.gcscript.str141 = {"你确定想和<color=yellow>%s<color>解除师徒关系吗？如果你们的关系解除，以后你们相关的各种师徒奖励都将再不能享受，你可得考虑清楚。另外解除师徒关系还需要<color=red>10000<color>两银子。","","","","",""}
Lang.gcscript.str142 = {"是的，我知道后果了，我要和他解除师徒关系","","","","",""}
Lang.gcscript.str143 = {"那我还是想想再来吧","","","","",""}
Lang.gcscript.str144 = {"解除师徒关系需要<color=red>10000<color>两银子，你身上银子不够，带够了再来吧。","","","","",""}
Lang.gcscript.str145 = {"去除自定义称号","","","","",""}
Lang.gcscript.str146 = {"师徒关系解除通知","","","","",""}
Lang.gcscript.str147=  {"您好，您的弟子%s已经单方面和你解除了师徒关系。节哀啊节哀。","","","","",""}
Lang.gcscript.str148=  {"你和<color=yellow>%s<color>的师徒关系已经成功解除了，以后你们就天各一方，互不相干了。","","","","",""}
Lang.gcscript.str149=  {"你现在没有可以解除关系的弟子呀。","","","","",""}
Lang.gcscript.str150=  {"算了，我还是想想再来","","","","",""}
Lang.gcscript.str151=  {"你想和谁解除师徒关系呢？","","","","",""}
Lang.gcscript.str152=  {"你确定想和<color=yellow>%s<color>解除师徒关系吗？如果你们的关系解除，以后你们相关的各种师徒奖励都将再不能享受，你可得考虑清楚。","","","","",""}
Lang.gcscript.str153=  {"是的，我知道后果了，我要和他解除师徒关系","","","","",""}
Lang.gcscript.str154=  {"您好，您的师傅%s已经单方面和你解除了师徒关系。节哀啊节哀。","","","","",""}
Lang.gcscript.str155=  {"副本数量已达到上限。","","","","",""}
Lang.gcscript.str156=  {"必须由师徒两人组队才能进入！","","","","",""}
Lang.gcscript.str157=  {"你当前没有拜师，不需要修复成就。","","","","",""}
Lang.gcscript.str158=  {"在师徒成就系统发布之前，如果您已经完成所有固定成就对应的事件，导致无法获得固定成就，以致无法出师的话，可以在这里修复。修复后的结果可以在师徒面板中查看。","","","","",""}
Lang.gcscript.str159=  {"我已经知道了，要修复成就","","","","",""}
Lang.gcscript.str160=  {"我还是一会再来吧","","","","",""}
Lang.gcscript.str161=  {"你已拥有师徒同心符了！","","","","",""}
Lang.gcscript.str162=  {"你需要达到20级才可以领取师徒同心符。","","","","",""}
Lang.gcscript.str163=  {"背包已满","","","","",""}
Lang.gcscript.str164=  {"必须两个人组队过来才能成为出师啊！","","","","",""}
Lang.gcscript.str165=  {"请你师傅来主持出师仪式吧。","","","","",""}
Lang.gcscript.str166=  {"我明白了。","","","","",""}
Lang.gcscript.str167=  {"你们两没有师徒关系，或已经出师！","","","","",""}
Lang.gcscript.str168=  {"你们两没有师徒关系！","","","","",""}
Lang.gcscript.str169=  {"弟子还没有加入门派，不能出师。","","","","",""}
Lang.gcscript.str170=  {"固定成就","","","","",""}
Lang.gcscript.str171=  {"弟子需要完成所有固定成就才能出师。","","","","",""}
Lang.gcscript.str172=  {"必须师徒两人一同组队前来，由师父来开启出师仪式，弟子必须加入门派，达到90级并且完成所有固定成就才能出师。","","","","",""}
Lang.gcscript.str173=  {"进行出师仪式","","","","",""}
Lang.gcscript.str174=  {"我只是随便看看。","","","","",""}
Lang.gcscript.str175=  {"弟子还没有达到90级，你们以后再来吧。","","","","",""}
Lang.gcscript.str176=  {"您的弟子%s已成功出师，从此以后，%s将成为您的密友，他在奇珍阁消费额度的5%将作为您对他培养的奖励返还给您。<color=yellow>师徒关系将维持一年，到期后将自动解除。<color>","","","","",""}
Lang.gcscript.str177=  {"你已经成功出师，以后可以独自行侠江湖了！","","","","",""}
Lang.gcscript.str178=  {"成就系统即将开放，敬请期待。","","","","",""}
Lang.gcscript.str179=  {"你可以在我这里进行成就系统相关的一些操作。请问你要做什么？","","","","",""}
Lang.gcscript.str180=  {"修复已完成成就","","","","",""}
Lang.gcscript.str181=  {"成就侠义值商店","","","","",""}
Lang.gcscript.str182=  {"如果成就系统发布之前，您已经达成了某些成就，可以在这里点击修复，把这些成就找回来。请问，现在要修复吗？","","","","",""}
Lang.gcscript.str183=  {"是的","","","","",""}
Lang.gcscript.str184=  {"离开","","","","",""}
Lang.gcscript.str185=  {"目前没有可领取的绑定%s。","","","","",""}
Lang.gcscript.str186=  {"全部领取完了","","","","",""}
Lang.gcscript.str187=  {"退出","","","","",""}
Lang.gcscript.str188=  {"继续领取其他密友的返还%s","","","","",""}
Lang.gcscript.str189=  {"确定","","","","",""}
Lang.gcscript.str190=  {"下次再来领取","","","","",""}
Lang.gcscript.str191=  {"您的密友 %s 在奇珍阁进行了消费，您获得返还绑定%s<color=red>","","","","",""}
Lang.gcscript.str192=  {"您的密友 %s 在奇珍阁进行了消费，您获得返还绑定%s<color=red>%d<color>个","","","","",""}
Lang.gcscript.str193=  {"您的绑定%s到达上限了，领取失败。","","","","",""}



Lang.item.str1 = {"篝火活动开始才能使用篝火令","","","","",""}
Lang.item.str2 = {"篝火令只能在主城使用","","","","",""}
Lang.item.str3 = {"篝火令不能在水域中使用","","","","",""}
Lang.item.str4 = {"篝火活动开始才能使用篝火令","","","","",""}
Lang.item.str5 = {"家族族长才能使用篝火令","","","","",""}
Lang.item.str6 = {"篝火令已经使用过了","","","","",""}
Lang.item.str7 = {"家族的篝火已经熊熊燃起啦，童鞋们快快打开家族活动面板参加吧！","","","","",""}
Lang.item.str8 = {"包裹里需要有%d个空位，先整理下包裹吧","","","","",""}
Lang.item.str9 = {"开启该箱子需要%s元宝，您的元宝不足","","","","",""}
Lang.item.str10 = {"是否花费%d元宝开启该箱子","","","","",""}
Lang.item.str11 = {"新手村","","","","",""}
Lang.item.str12 = {"无上峰","","","","",""}
Lang.item.str13 = {"沐剑山庄","","","","",""}
Lang.item.str14 = {"幽冥列岛","","","","",""}
Lang.item.str15 = {"百花谷","","","","",""}
Lang.item.str16 = {"繁烟柳地","","","","",""}
Lang.item.str17 = {"天外村","","","","",""}
Lang.item.str18 = {"无极天域","","","","",""}
Lang.item.str19 = {"岩湾镇","","","","",""}
Lang.item.str20 = {"寂岭荒村","","","","",""}
Lang.item.str21 = {"深山谷底","","","","",""}
Lang.item.str22 = {"城镇","","","","",""}
Lang.item.str23 = {"野外","","","","",""}
Lang.item.str24 = {"请问你想要传送到哪？","","","","",""}
Lang.item.str25 = {"取消","","","","",""}
Lang.item.str26 = {"请选择需要传送的地区","","","","",""}
Lang.item.str27 = {"不需要转换","","","","",""}
Lang.item.str28 = {"当前装备不可使用，但可以转化为以下合适门派的相同装备，<color=green>装备的一切属性都将等价转换，不会有任何损失。<color>","","","","",""}
Lang.item.str29 = {" 未强化","","","","",""}
Lang.item.str30 = {" 改","","","","",""}
Lang.item.str31 = {"<color=red>！！此物品为复制品，将会被系统没收！！\n谨防上当，请勿交易<color>\n","","","","",""}
Lang.item.str32 = {"耐 久 度：","","","","",""}
Lang.item.str33 = {"\n装备等级：%d级","","","","",""}
Lang.item.str34 = {"   五行属性：","","","","",""}
Lang.item.str35 = {"<color=gray>%s（？） %s（？） 角色（？） <color>","","","","",""}
Lang.item.str36 = {"\n\n<color=blue>五行激活（%d/%d）\n","","","","",""}
Lang.item.str37 = {"<color=gray>角色（%s）<color>","","","","",""}
Lang.item.str38 = {"<color=white>角色（%s）<color>","","","","",""}
Lang.item.str39 = {"强化","","","","",""}
Lang.item.str40 = {"（强化+%d）","","","","",""}
Lang.item.str41 = {"\n<color=blue>改造<color>","","","","",""}
Lang.item.str42 = {"（强化+%d 改）","","","","",""}
Lang.item.str43 = {"(+ %d 改)","","","","",""}
Lang.item.str44 = {"\n可以改变%s的外观","","","","",""}
Lang.item.str45 = {"免费","","","","",""}
Lang.item.str46 = {"两","","","","",""}
Lang.item.str47 = {"\n<color=yellow>普修费用：","","","","",""}
Lang.item.str48 = {"\n<color=yellow>特修费用：%d (优先使用绑定银两) 或 %d点金犀耐久值<color>","","","","",""}
Lang.item.str49 = {"\n<color=yellow>不需要修复最大耐久<color>","","","","",""}
Lang.item.str50 = {"\n\n<color=orange>可拆解物品（消耗%d活力）：<color>\n","","","","",""}
Lang.item.str51 = {"力量","","","","",""}
Lang.item.str52 = {"身法","","","","",""}
Lang.item.str53 = {"外功","","","","",""}
Lang.item.str54 = {"内功","","","","",""}
Lang.item.str55 = {"背包空间不足，使用道具失败。","","","","",""}
Lang.item.str56 = {"合成失败，未知错误，请联系GM！","","","","",""}
Lang.item.str57 = {"恭喜您，成功合成%d个<color=yellow>%s","","","","",""}
Lang.item.str58 = {"材料不足，缺少%d个<color=yellow>%s","","","","",""}
Lang.item.str59 = {"元宝","","","","",""}
Lang.item.str60 = {"银两","","","","",""}
Lang.item.str61 = {"游龙真气","","","","",""}
Lang.item.str62 = {"战魂","","","","",""}
Lang.item.str63 = {"其他","","","","",""}
Lang.item.str64 = {"合成失败，缺少<color=red>%s%s","","","","",""}
Lang.item.str65 = {"侠士%s开启【%s】获得%s经验，真是鸿运当头！","","","","",""}
Lang.item.str66 = {"侠士%s开启【%s】获得%s银两，真是鸿运当头！","","","","",""}
Lang.item.str67 = {"侠士%s开启【%s】获得%s游龙真气，真是鸿运当头！","","","","",""}
Lang.item.str68 = {"侠士%s开启【%s】获得%n个%s，真是鸿运当头！","","","","",""}
Lang.item.str69 = {"你当前没有恶人值，不能使用赦免令","","","","",""}
Lang.item.str70 = {"此物品不能拾取。","","","","",""}
Lang.item.str71 = {"<color=0x8080ff>该任务需要获得2000000点修炼经验值方可完成。<color>","","","","",""}
Lang.item.str72 = {"<color=0x8080ff>该任务需要获得6000000点修炼经验值方可完成。<color>","","","","",""}
Lang.item.str73 = {"<color=0x8080ff>该任务需要获得18000000点修炼经验值方可完成。<color>","","","","",""}
Lang.item.str74 = {"取出药","","","","",""}
Lang.item.str75 = {"放回药","","","","",""}
Lang.item.str76 = {"我再想想","","","","",""}
Lang.item.str77 = {"你打开了药箱，想要做什么呢？","","","","",""}
Lang.item.str78 = {"开启","","","","",""}
Lang.item.str79 = {"请输入取出的数量：","","","","",""}
Lang.item.str80 = {"该道具禁止在本地图使用！","","","","",""}
Lang.item.str81 = {"你的背包不足，需要%s格背包空间。","","","","",""}
Lang.item.str82 = {"一个装有<color=yellow>%s<color>的箱子，<color=yellow>右键点击<color>使用可取出箱内物品。\n","","","","",""}
Lang.item.str83 = {"箱子里面还剩<color=green>%d<color>个","","","","",""}
Lang.item.str84 = {"这个药箱已满，无法再放入药品了。","","","","",""}
Lang.item.str85 = {"你的背包中并没有此种药品。","","","","",""}
Lang.item.str86 = {"请输入放回的数量：","","","","",""}
Lang.item.str87 = {"篝火活动开始才能使用玉琼浆","","","","",""}
Lang.item.str88 = {"玉琼浆只能在主城使用","","","","",""}
Lang.item.str89 = {"玉琼浆不能在水域中使用","","","","",""}
Lang.item.str90 = {"篝火活动开始才能使用玉琼浆","","","","",""}
Lang.item.str91 = {"帽子","","","","",""}
Lang.item.str92 = {"衣服","","","","",""}
Lang.item.str93 = {"腰带","","","","",""}
Lang.item.str94 = {"武器","","","","",""}
Lang.item.str95 = {"鞋子","","","","",""}
Lang.item.str96 = {"护腕","","","","",""}
Lang.item.str97 = {"护身符","","","","",""}
Lang.item.str98 = {"戒指","","","","",""}
Lang.item.str99 = {"项链","","","","",""}
Lang.item.str100 = {"腰坠","","","","",""}
Lang.item.str101 = {"马牌","","","","",""}
Lang.item.str102 = {"缠手","","","","",""}
Lang.item.str103 = {"剑","","","","",""}
Lang.item.str104 = {"刀","","","","",""}
Lang.item.str105 = {"棍","","","","",""}
Lang.item.str106 = {"枪","","","","",""}
Lang.item.str107 = {"锤","","","","",""}
Lang.item.str108 = {"镖","","","","",""}
Lang.item.str109 = {"飞刀","","","","",""}
Lang.item.str110 = {"箭矢","","","","",""}
Lang.item.str111 = {"<color=yellow>金系门派<color>","","","","",""}
Lang.item.str112 = {"<color=green>木系门派<color>","","","","",""}
Lang.item.str113 = {"<color=blue>水系门派<color>","","","","",""}
Lang.item.str114 = {"<color=red>火系门派<color>","","","","",""}
Lang.item.str115 = {"<color=gray>土系门派<color>","","","","",""}
Lang.item.str116 = {"马","","","","",""}
Lang.item.str117 = {"披风","","","","",""}
Lang.item.str118 = {"这件装备已经强化到最高等级","","","","",""}
Lang.item.str119 = {"已经强化到最高等级，请装备升级后再来强化","","","","",""}
Lang.item.str120 = {"你的银两不足，需要%s","","","","",""}
Lang.item.str121 = {"一键强化银两不足","","","","",""}
Lang.item.str122 = {"一身绿装的<%s>，尽显其潇洒飘逸之本色！","","","","",""}
Lang.item.str123 = {"<%s>穿上一身蓝装，顿时感觉自己实力大增！","","","","",""}
Lang.item.str124 = {"紫装加身的<%s>，真是集高贵与强大于一身啊！","","","","",""}
Lang.item.str125 = {"<%s>那一身的橙装，竟然隐隐散发出一股危险的气息！","","","","",""}
Lang.item.str126 = {"<%s>身上的，究竟是敌人鲜血染红的战袍，还是月老附身的红装！","","","","",""}
Lang.item.str127 = {"是什么如此闪亮？<%s>身上的竟然是一身金装吗？我快要被亮瞎啦！","","","","",""}

Lang.item.str128 = {"个%s","","","","",""}
Lang.item.str129 = {"军需点","","","","",""}
Lang.item.str130 = {"绑定银两","","","","",""}
Lang.item.str131 = {"点机关耐久度","","","","",""}
Lang.item.str132 = {"帮会建设资金","","","","",""}
Lang.item.str133 = {"道具使用失败，该道具不允许在本场景使用！","","","","",""}
Lang.item.str134 = {"你的元宝不足，需要%d元宝","","","","",""}
Lang.item.str135 = {"\n\n<color=green>不可交易期：","","","","",""}
Lang.item.str136 = {"\n\n<color=green>可以交易<color>","","","","",""}
Lang.item.str137 = {"\n<color=yellow><当前装备><color>","","","","",""}
Lang.item.str138 = {"无效","","","","",""}
Lang.item.str139 = {"亿","","","","",""}
Lang.item.str140 = {"万","","","","",""}
Lang.item.str141 = {"\n推荐","","","","",""}
Lang.item.str142 = {"使用","","","","",""}
Lang.item.str143 = {"未炼化","","","","",""}
Lang.item.str144 = {"炼化<color=gold>%d<color>级","","","","",""}
Lang.item.str145 = {"不可炼化","","","","",""}
Lang.item.str146 = {"不可兑换","","","","",""}
Lang.item.str147 = {"可兑换","","","","",""}
Lang.item.str148 = {"获取绑定","","","","",""}
Lang.item.str149 = {"已绑定","","","","",""}
Lang.item.str150 = {"不绑定","","","","",""}
Lang.item.str151 = {"装备绑定","","","","",""}
Lang.item.str152 = {"\n<color=blue>战斗力 +%g<color>","","","","",""}
Lang.item.str153 = {"<color=blue>   排名：%d<color>","","","","",""}
Lang.item.str154 = {" 不可拆解","","","","",""}
Lang.item.str155 = {" 可拆解","","","","",""}
Lang.item.str156 = {"小时","","","","",""}
Lang.item.str157 = {"分","","","","",""}
Lang.item.str158 = {"秒","","","","",""}
Lang.item.str159 = {"使用时间间隔：","","","","",""}
Lang.item.str160 = {"使用等级需求：%d级","","","","",""}
Lang.item.str161 = {"<color=yellow>买入价格：","","","","",""}
Lang.item.str162 = {"\n消耗 %d点帮会行动力","","","","",""}
Lang.item.str163 = {"购买条件：","","","","",""}
Lang.item.str164 = {"声望达到%s[%d级]","","","","",""}
Lang.item.str165 = {"声望需求未知","","","","",""}
Lang.item.str166 = {"\n购买条件：","","","","",""}
Lang.item.str167 = {"\n以下任意一项满足\n武林荣誉达到%d级\n财富荣誉达到%d级\n领袖荣誉达到%d级","","","","",""}
Lang.item.str168 = {"\n<color=%s>官衔等级到达%d级<color>","","","","",""}
Lang.item.str169 = {"\n<color=%s>战斗力总排名达到前%d名<color>","","","","",""}
Lang.item.str170 = {"<color=yellow>回购价格：","","","","",""}
Lang.item.str171 = {"\n<color=red>不可出售<color>","","","","",""}
Lang.item.str172 = {"<color=red>（不能售店）<color>","","","","",""}
Lang.item.str173 = {"<color=yellow>贩卖单价：","","","","",""}
Lang.item.str174 = {"\n<color=yellow>贩卖总价：","","","","",""}
Lang.item.str175 = {"<color=yellow>收购数量：%d个\n收购单价：","","","","",""}
Lang.item.str176 = {"\n<color=yellow>收购总价：","","","","",""}
Lang.item.str177 = {"绑定","","","","",""}
Lang.item.str178 = {"\n\n<color=yellow>优惠%s\n优惠开始时间：%s\n优惠结束时间：%s<color>","","","","",""}
Lang.item.str179 = {"<color=yellow>此物品的使用时间至：%d年%d月%d日%d时%d分。<color>","","","","",""}
Lang.item.str180 = {"<color=yellow>此物品剩余的使用时间为：%d天%d时%d分。<color>","","","","",""}
Lang.item.str181 = {"该道具禁止在本地图使用","","","","",""}
Lang.item.str182 = {"该道具仅允许在%s使用","","","","",""}
Lang.item.str183 = {"该道具已经和帮会[%s]绑定！","","","","",""}
Lang.item.str184 = {"该道具已经和其他帮会绑定！","","","","",""}
Lang.item.str185 = {"<color=yellow>卖出价格：","","","","",""}
Lang.item.str186 = {"<color=red>（不能售店）<color>","","","","",""}
Lang.item.str187 = {"%Y年%m月%d日 %H:%M:%S","","","","",""}
Lang.item.str188 = {"你的元宝不足，需要%s两","","","","",""}
Lang.item.str189 = {"<%s>在洗炼时手一抖眼一闭，居然给<%s>洗出了金色属性！","","","","",""}
Lang.item.str190 = {"已合成到最高级的宝石不能合成","","","","",""}
Lang.item.str191 = {"宝石的等级不一致无法合成","","","","",""}
Lang.item.str192 = {"材料不足，是否花费%d元宝补齐材料","","","","",""}
Lang.item.str193 = {"你得到一颗%d级%s！","","","","",""}
Lang.item.str194 = {"<%s>捧着合成出来的%s，实力大涨的他还有谁人能挡！","","","","",""}
Lang.item.str195 = {"背包空间不足，请清理后再拆除","","","","",""}
Lang.item.str196 = {"是否花费%d绑定元宝打开这个孔","","","","",""}
Lang.item.str197 = {"打开这个孔需要%s元宝，您的元宝不足","","","","",""}
Lang.item.str198 = {"是否花费%d元宝打开这个孔","","","","",""}
Lang.item.str199 = {"绑定元宝不足","","","","",""}
Lang.item.str200 = {"%s 已经升到了最高级","","","","",""}
Lang.item.str201 = {"人物达到%d级才能升级这件装备","","","","",""}
Lang.item.str202 = {"材料不足","","","","",""}
Lang.item.str203 = {"弹劾族长需要弹劾令","","","","",""}
Lang.item.str204 = {"你是三界神皇，无法移交族长职务","","","","",""}
Lang.item.str205 = {"你加入了[仙]阵营","","","","",""}
Lang.item.str206 = {"你加入了[佛]阵营","","","","",""}
Lang.item.str207 = {" 弹劾族长成功，成为新一任族长","","","","",""}
Lang.item.str208 = {"弹劾失败!需要族长连续7天不在线方可弹劾","","","","",""}
Lang.item.str209 = {"族长<%s>把家族升到%d级"..",感谢大家辛勤的付出！","","","","",""}
Lang.item.str210 = {"退出家族当天不能加入新的家族","","","","",""}
Lang.item.str211 = {"你的银两不足，需要%d银两","","","","",""}
Lang.item.str212 = {"银两不足","","","","",""}
Lang.item.str213 = {"各位大神请注意！家族<color=red>【%s】 <color=235,123,49>正在火热招募中，快快<color=green>\\b\\p%s\\p点击\\b#<color=235,123,49>加入吧！","","","","",""}

Lang.lib.str1 = {"天","","","","",""}
Lang.lib.str2 = {"小时","","","","",""}
Lang.lib.str3 = {"分钟","","","","",""}
Lang.lib.str4 = {"秒","","","","",""}
Lang.lib.str5 = {"一","","","","",""}
Lang.lib.str6 = {"二","","","","",""}
Lang.lib.str7 = {"三","","","","",""}
Lang.lib.str8 = {"四","","","","",""}
Lang.lib.str9 = {"五","","","","",""}
Lang.lib.str10 = {"六","","","","",""}
Lang.lib.str11 = {"七","","","","",""}
Lang.lib.str12 = {"八","","","","",""}
Lang.lib.str13 = {"九","","","","",""}
Lang.lib.str14 = {"十","","","","",""}
Lang.lib.str15 = {"百","","","","",""}
Lang.lib.str16 = {"千","","","","",""}
Lang.lib.str17 = {"万","","","","",""}
Lang.lib.str18 = {"亿","","","","",""}
Lang.lib.str19 = {"零","","","","",""}
Lang.lib.str20 = {"负","","","","",""}
Lang.lib.str21 = {"个半小时","","","","",""}
Lang.lib.str22 = {"%d分%d秒","","","","",""}
Lang.lib.str23 = {"%.1f小时","","","","",""}
Lang.lib.str24 = {"%.1f天","","","","",""}

Lang.mail.str1 = {"信件发送成功！","","","","",""}
Lang.mail.str2 = {"信件发送失败，","","","","",""}
Lang.mail.str3 = {"信箱已满！","","","","",""}
Lang.mail.str4 = {"收件人不正确！","","","","",""}
Lang.mail.str5 = {"银两不足","","","","",""}
Lang.mail.str6 = {"物品错误！","","","","",""}
Lang.mail.str7 = {"当前禁止发送邮件！","","","","",""}
Lang.mail.str8 = {"未知错误！","","","","",""}
Lang.mail.str9 = {"有新邮件！","","","","",""}
Lang.mail.str10 = {"已超过今天邮件发送次数: %d，请明天再发送！","","","","",""}
Lang.mail.str11 = {"发送邮件信息为空!","","","","",""}
Lang.mail.str12 = {"发件人Id非法!","","","","",""}
Lang.mail.str13 = {"邮件类型错误，玩家发送不能为系统邮件!","","","","",""}
Lang.mail.str14 = {"当前禁止发送邮件","","","","",""}
Lang.mail.str15 = {"不能给自己发送邮件","","","","",""}
Lang.mail.str16 = {"检查收件人，协议包发送失败","","","","",""}
Lang.mail.str17 = {"待发邮件为空","","","","",""}
Lang.mail.str18 = {"发件人Id非法!","","","","",""}
Lang.mail.str19 = {"收件人不合法","","","","",""}
Lang.mail.str20 = {"没有返回收件人Id","","","","",""}
Lang.mail.str21 = {"邮资不够","","","","",""}
Lang.mail.str22 = {"附件有问题","","","","",""}
Lang.mail.str23 = {"发送邮件协议包失败","","","","",""}
Lang.mail.str24 = {"发送邮件信息为空!","","","","",""}
Lang.mail.str25 = {"发送邮件失败，检查收件人发包失败！","","","","",""}
Lang.mail.str26 = {"检查收件人失败！","","","","",""}
Lang.mail.str27 = {"系统发送邮件，协议包发送失败！","","","","",""}
Lang.mail.str28 = {"发送失败！","","","","",""}
Lang.mail.str29 = {"待发邮件为空","","","","",""}
Lang.mail.str30 = {"待发邮件为空","","","","",""}
Lang.mail.str31 = {"收件人不合法","","","","",""}
Lang.mail.str32 = {"发送邮件失败，没有返回收件人Id","","","","",""}
Lang.mail.str33 = {"没有返回收件人Id","","","","",""}
Lang.mail.str34 = {"系统发送邮件，协议包发送失败！","","","","",""}
Lang.mail.str35 = {"未知的发送人类型","","","","",""}

Lang.makeup.str1 = {"你获得了5000元宝的补偿奖励","","","","",""}

Lang.meditation.str1 = {"离线打坐时间 获得离线经验: ","","","","",""}
Lang.meditation.str2 = {"有未领取离线经验: ","","","","",""}
Lang.meditation.str3 = {"此次领取需要消耗%d元宝，元宝不足!","","","","",""}

Lang.misc.str1 = {"带参指令*","","","","",""}
Lang.misc.str2 = {"[客户端] 打开Console控制台","","","","",""}
Lang.misc.str3 = {"[客户端] 解锁镜头","","","","",""}
Lang.misc.str4 = {"[客户端] 锁定镜头","","","","",""}
Lang.misc.str5 = {"客户端指令","","","","",""}
Lang.misc.str6 = {"请输入参数 然后选择指令","","","","",""}
Lang.misc.str7 = {"[区] 全区喇叭","","","","",""}
Lang.misc.str8 = {"[区] 系统广播","","","","",""}
Lang.misc.str9 = {"召唤Npc","","","","",""}
Lang.misc.str10 = {"常用脚本指令表","","","","",""}
Lang.misc.str11 = {"带参指令需要在输入框先敲入参数","","","","",""}
Lang.misc.str12 = {"Player[%s] not Found. 玩家不在本线。","","","","",""}
Lang.misc.str13 = {"白装","","","","",""}
Lang.misc.str14 = {"蓝装","","","","",""}
Lang.misc.str15 = {"紫装","","","","",""}
Lang.misc.str16 = {"橙装","","","","",""}
Lang.misc.str17 = {"主城","","","","",""}
Lang.misc.str18 = {"新手村 - 点1","","","","",""}
Lang.misc.str19 = {"新手村 - 点2","","","","",""}
Lang.misc.str20 = {"无上M4","","","","",""}
Lang.misc.str21 = {"幽冥","","","","",""}
Lang.misc.str22 = {"森罗（未开放）","","","","",""}
Lang.misc.str23 = {"天曜（未开放）","","","","",""}
Lang.misc.str24 = {"野外","","","","",""}
Lang.misc.str25 = {"百花谷M4","","","","",""}
Lang.misc.str26 = {"采石场","","","","",""}
Lang.misc.str27 = {"繁烟柳地M4","","","","",""}
Lang.misc.str28 = {"劫火寨AM4","","","","",""}
Lang.misc.str29 = {"寂岭荒村","","","","",""}
Lang.misc.str30 = {"盐湾镇","","","","",""}
Lang.misc.str31 = {"沐剑山庄M4","","","","",""}
Lang.misc.str32 = {"破庙M4","","","","",""}
Lang.misc.str33 = {"天外村M4","","","","",""}
Lang.misc.str34 = {"无极天域M4","","","","",""}
Lang.misc.str35 = {"深山谷底M4","","","","",""}
Lang.misc.str36 = {"副本","","","","",""}
Lang.misc.str37 = {"百里坡M4","","","","",""}
Lang.misc.str38 = {"百花密径M4","","","","",""}
Lang.misc.str39 = {"琼华殿M4","","","","",""}
Lang.misc.str40 = {"迷踪林M4","","","","",""}
Lang.misc.str41 = {"飞来寨","","","","",""}
Lang.misc.str42 = {"关卡","","","","",""}
Lang.misc.str43 = {"本线无此玩家：","","","","",""}
Lang.misc.str44 = {"领取每日福利","","","","",""}
Lang.misc.str45 = {"进入自由pk场","","","","",""}
Lang.misc.str46 = {"获取战场药品","","","","",""}
Lang.misc.str47 = {"玩法","","","","",""}
Lang.misc.str48 = {"GM指令集","","","","",""}
Lang.misc.str49 = {"请选择要做的事情","","","","",""}
Lang.misc.str50 = {"传送（可开启副本及关卡）","","","","",""}
Lang.misc.str51 = {"领取各种玩意","","","","",""}
Lang.misc.str52 = {"增加经验","","","","",""}
Lang.misc.str53 = {"获取游龙真气","","","","",""}
Lang.misc.str54 = {"设置等级","","","","",""}
Lang.misc.str55 = {"清空背包","","","","",""}
Lang.misc.str56 = {"清空宠物背包","","","","",""}
Lang.misc.str57 = {"上一页","","","","",""}
Lang.misc.str58 = {"这里是gm指令啊，只有gm能用啊，魂淡","","","","",""}
Lang.misc.str59 = {"宠物岛","","","","",""}
Lang.misc.str60 = {"退出当前副本","","","","",""}
Lang.misc.str61 = {"上一页","","","","",""}
Lang.misc.str62 = {"选择相关玩法的指令集","","","","",""}
Lang.misc.str63 = {"进入宠物岛","","","","",""}
Lang.misc.str64 = {"刷新宠物岛宠物","","","","",""}
Lang.misc.str65 = {"开始跟宠物战斗","","","","",""}
Lang.misc.str66 = {"领取适合装备","","","","",""}
Lang.misc.str67 = {"领取宠物","","","","",""}
Lang.misc.str68 = {"领取外装","","","","",""}
Lang.misc.str69 = {"领取武器","","","","",""}
Lang.misc.str70 = {"领取防具","","","","",""}
Lang.misc.str71 = {"选择需要领取的装备类型","","","","",""}
Lang.misc.str72 = {"返回","","","","",""}
Lang.misc.str73 = {"请选择需要传送的地区","","","","",""}
Lang.misc.str74 = {"关卡","","","","",""}
Lang.misc.str75 = {"简单","","","","",""}
Lang.misc.str76 = {"中等(暂不开放)","","","","",""}
Lang.misc.str77 = {"困难(暂不开放)","","","","",""}
Lang.misc.str78 = {"下一页","","","","",""}
Lang.misc.str79 = {"是","","","","",""}
Lang.misc.str80 = {"否","","","","",""}
Lang.misc.str81 = {"是否需要开启副本","","","","",""}
Lang.misc.str82 = {"请先组队","","","","",""}
Lang.misc.str83 = {"该难度暂未开放","","","","",""}
Lang.misc.str84 = {"领取狐小美","","","","",""}
Lang.misc.str85 = {"领取帅小呆","","","","",""}
Lang.misc.str86 = {"领取熊小团","","","","",""}
Lang.misc.str87 = {"领取孙小囧","","","","",""}
Lang.misc.str88 = {"下一页","","","","",""}
Lang.misc.str89 = {"返回","","","","",""}
Lang.misc.str90 = {"请选择要获取的宠物形象","","","","",""}
Lang.misc.str91 = {"领取螃蟹","","","","",""}
Lang.misc.str92 = {"领取飞鱼","","","","",""}
Lang.misc.str93 = {"领取狮子","","","","",""}
Lang.misc.str94 = {"领取小龙","","","","",""}
Lang.misc.str95 = {"上一页","","","","",""}
Lang.misc.str96 = {"领取性格一宠物","","","","",""}
Lang.misc.str97 = {"领取性格二宠物","","","","",""}
Lang.misc.str98 = {"领取性格三宠物","","","","",""}
Lang.misc.str99 = {"领取性格四宠物","","","","",""}
Lang.misc.str110 = {"领取性格五宠物","","","","",""}
Lang.misc.str111 = {"领取性格六宠物","","","","",""}
Lang.misc.str112 = {"领取性格七宠物","","","","",""}
Lang.misc.str113 = {"请选择要获取的宠物性格","","","","",""}
Lang.misc.str114 = {"你的神仙栏已经满了，请开锁后再来领取天神令","","","","",""}
Lang.misc.str115 = {"你获得了宠物: ","","","","",""}
Lang.misc.str116 = {"圣诞套装","","","","",""}
Lang.misc.str117 = {"熊猫套装","","","","",""}
Lang.misc.str118 = {"蛋疼套装（未开放）","","","","",""}
Lang.misc.str119 = {"切克闹套装（未开放）","","","","",""}
Lang.misc.str120 = {"给力套装（未开放）","","","","",""}
Lang.misc.str121 = {"请选择要获取的外装","","","","",""}
Lang.misc.str122 = {"短剑","","","","",""}
Lang.misc.str123 = {"书","","","","",""}
Lang.misc.str124 = {"大剑","","","","",""}
Lang.misc.str125 = {"盾","","","","",""}
Lang.misc.str126 = {"柱子","","","","",""}
Lang.misc.str127 = {"双锤","","","","",""}
Lang.misc.str128 = {"弓弩","","","","",""}
Lang.misc.str129 = {"双匕","","","","",""}
Lang.misc.str130 = {"白装","","","","",""}
Lang.misc.str131 = {"蓝装","","","","",""}
Lang.misc.str132 = {"紫装","","","","",""}
Lang.misc.str133 = {"橙装","","","","",""}
Lang.misc.str134 = {"全部","","","","",""}
Lang.misc.str135 = {"级","","","","",""}
Lang.misc.str136 = {"选择武器品质","","","","",""}
Lang.misc.str137 = {"没有合适的装备","","","","",""}
Lang.misc.str138 = {"护甲","","","","",""}
Lang.misc.str139 = {"护腕","","","","",""}
Lang.misc.str140 = {"腰带","","","","",""}
Lang.misc.str141 = {"鞋子","","","","",""}
Lang.misc.str142 = {"项链","","","","",""}
Lang.misc.str143 = {"戒指","","","","",""}
Lang.misc.str144 = {"护符","","","","",""}
Lang.misc.str145 = {"玉佩","","","","",""}
Lang.misc.str146 = {"选择需要的防具类型","","","","",""}
Lang.misc.str147 = {"选择防具品质（尽量不要两个都选全部）","","","","",""}
Lang.misc.str148 = {"选择防具等级","","","","",""}
Lang.misc.str149 = {"无上轩辕","","","","",""}
Lang.misc.str150 = {"诛邪天曜","","","","",""}
Lang.misc.str151 = {"赤炼幽冥","","","","",""}
Lang.misc.str152 = {"魅影森罗","","","","",""}
Lang.misc.str153 = {"选择门派限制","","","","",""}
Lang.misc.str154 = {"没有合适的装备","","","","",""}
Lang.misc.str155 = {"增加1000角色经验","","","","",""}
Lang.misc.str156 = {"增加10000角色经验","","","","",""}
Lang.misc.str157 = {"增加100000角色经验","","","","",""}
Lang.misc.str158 = {"请选择要获得的经验","","","","",""}
Lang.misc.str159 = {"请选择要获得的游龙真气数量","","","","",""}
Lang.misc.str160 = {"输入等级（1 ~ 60）","","","","",""}
Lang.misc.str161 = {"今天的福利已经领取过了，明天再来吧","","","","",""}
Lang.misc.str162 = {"加入战神堂","","","","",""}
Lang.misc.str163 = {"加入武魂居","","","","",""}
Lang.misc.str164 = {"请选择要加入的阵营","","","","",""}
Lang.misc.str165 = {"选择武器类型。","","","","",""}
Lang.misc.str166 = {"增加1000000角色经验","","","","",""}
Lang.misc.str167 = {"小时","","","","",""}
Lang.misc.str168 = {"分钟","","","","",""}
Lang.misc.str169 = {"秒","","","","",""}
Lang.misc.str170 = {"[ShutdownHelper]定时关服 剩余秒数","","","","",""}
Lang.misc.str171 = {"[ShutdownHelper]定时关服已取消","","","","",""}
Lang.misc.str172 = {"<bgclr=yellow>服务器将在%d内关闭","","","","",""}


--Lang.title.str1[Lang.Idx]
Lang.title.str1 = {"只能同时拥有三个称号","","","","",""}

--Lang.task.actions.str1[Lang.Idx]
Lang.task.str1 = {"[产出]%s","","","","",""}
Lang.task.str2 = {"总量","","","","",""}
Lang.task.str3 = {"结束对话","","","","",""}
Lang.task.str4 = {"目标尚未完成：%s","","","","",""}
Lang.task.str5 = {"指定触发物品不存在！","","","","",""}
Lang.task.str6 = {"请清理出%d个背包空间，再来领奖！","","","","",""}
Lang.task.str7 = {"%s-领奖","","","","",""}




Lang.task.str8 = {"还未完成 %s","","","","",""}
Lang.task.str9  = {"等级尚未达到 %d 级","","","","",""}
Lang.task.str10 = {"等级已经超过 %d 级","","","","",""}
Lang.task.str11 = {"门派不符合要求","","","","",""}
Lang.task.str12 = {"门派不符合要求","","","","",""}
Lang.task.str13 = {"现金不足 %d","","","","",""}
Lang.task.str14 = {"技能尚未达到要求","","","","",""}
Lang.task.str15 = {"恶名值未到 %d","","","","",""}
Lang.task.str16 = {"未到达指定位置","","","","",""}
Lang.task.str17 = {"没有指定Npc","","","","",""}
Lang.task.str18 = {"Npc未到达指定位置","","","","",""}
Lang.task.str19 = {"没有指定Npc","","","","",""}
Lang.task.str20 = {"声望尚未达到要求","","","","",""}
Lang.task.str21 = {"称号尚未达到要求","","","","",""}
Lang.task.str22 = {"称号尚未达到要求","","","","",""}
Lang.task.str23 = {"包裹空间不够","","","","",""}
Lang.task.str24 = {"没完成指定的任务","","","","",""}
Lang.task.str25 = {"性别不符要求","","","","",""}
Lang.task.str26 = {"您身上没有蓝色装备","","","","",""}
Lang.task.str27 = { "您身上没有此物品","","","","",""}
Lang.task.str28 = {"您身上没有%d个%s","","","","",""}
Lang.task.str29 = {"包裹空间不够，无法获得物品！","","","","",""}
Lang.task.str30 = {"江湖威望尚未达到 %d 点","","","","",""}
Lang.task.str31 = {"家族不符合","","","","",""}
Lang.task.str32 = {"队伍只能有两个人","","","","",""}
Lang.task.str33 = {"性别相同","","","","",""}
Lang.task.str34 = {"队伍只能有两个人","","","","",""}
Lang.task.str35 = {"性别相同","","","","",""}




Lang.task.str36 = {"经验","","","","",""}
Lang.task.str37 = {"绑定银两","","","","",""}
Lang.task.str38 = {"绑定银两","","","","",""}
Lang.task.str39 = {"银两","","","","",""}
Lang.task.str40 = {"活力","","","","",""}
Lang.task.str41 = {"义军声望","","","","",""}
Lang.task.str42 = {"一次取消任务的机会","","","","",""}
Lang.task.str43 = {"精力","","","","",""}
Lang.task.str44 = {"称号","","","","",""}
Lang.task.str45 = {"声望","","","","",""}
Lang.task.str46 = {"点","","","","",""}


Lang.task.str47 = {"请找%s接此任务","","","","",""}
Lang.task.str48 = {"使用%s触发任务","","","","",""}
Lang.task.str49 = {"经验","","","","",""}
Lang.task.str50 = {"物品","","","","",""}
Lang.task.str51 = {"物品","","","","",""}
Lang.task.str52 = {"绑定银两","","","","",""}
Lang.task.str53 = {"银两","","","","",""}
Lang.task.str54 = {"请找%s接此任务","","","","",""}
Lang.task.str55 = {"使用%s触发任务","","","","",""}

Lang.task.str56 = {"今日可接的重复任务已达上限，不能接受您的共享","","","","",""}
Lang.task.str57 = {"请先完成当前的修仙任务！","","","","",""}
Lang.task.str58 = {"您已经完成过此任务！","","","","",""}
Lang.task.str59 = {"任务重复","","","","",""}

Lang.task.str60 = {"重复任务每天只能接10次！","","","","",""}
Lang.task.str61 = {"拒绝了你共享的任务","","","","",""}
Lang.task.str62 = {"接受了你共享的任务","","","","",""}

Lang.task.str63 = {"您的任务已经满了！","","","","",""}
Lang.task.str64 = {"指定触发物品不存在，无法接受此任务！","","","","",""}
Lang.task.str65 = {"获得新的任务：","","","","",""}


Lang.task.str66 = {"主线：","","","","",""}
Lang.task.str67 = {"未知任务 - ","","","","",""}
Lang.task.str68 = {"重复任务 - ","","","","",""}



Lang.task.str69 = {"放弃失败：无此任务","","","","",""}
Lang.task.str70 = {"放弃失败：本任务不可放弃","","","","",""}
Lang.task.str71 = {"共享失败：无此任务","","","","",""}


Lang.task.str72 = {"共享失败：本任务不可共享","","","","",""}
Lang.task.str73 = {"共享失败：没有组队！","","","","",""}
Lang.task.str74 = {"共享失败：队伍没有成员！","","","","",""}


Lang.task.str75 = {"共享失败：不在本任务的第一个子任务","","","","",""}
Lang.task.str76 = {"没有达到接任务的条件，无法接此任务！","","","","",""}
Lang.task.str77 = {"已经有这个任务了！","","","","",""}
Lang.task.str78 = {"太远了，无法共享任务！","","","","",""}


Lang.task.str79 = {"未领奖励就不能完成此任务，您可以随时回来补领。","","","","",""}
Lang.task.str80 = {"无此任务，或尚未完成。","","","","",""}
Lang.task.str81 = {"请清理出%d个背包空间，再来领奖","","","","",""}

Lang.task.str82 = {"请随身携带%s个%s再来领取该奖励。","","","","",""}
Lang.task.str83 = {"使用%s个%s，失败！！！！","","","","",""}
Lang.task.str84 = {"获得新手装备","","","","",""}


Lang.task.str85 = {"[产出]","","","","",""}
Lang.task.str86 = {"总量","","","","",""}
Lang.task.str87 = {"使用%s个%s，获得一个%s，成功！！！","","","","",""}


Lang.task.str88 = {"完成%s，任务ID：%x，支线任务ID：%x","","","","",""}
Lang.task.str89 = {"没有Id为 %x 的任务！","","","","",""}
Lang.task.str90 = {"%s获得了1个%s","","","","",""}
Lang.task.str91 = {"任务获得物品","","","","",""}


Lang.task.str92 = {"放弃任务：","","","","",""}
Lang.task.str93 = {"任务失败：","","","","",""}

Lang.task.str94 = {"[主线]","","","","",""}
Lang.task.str95 = {"[支线]","","","","",""}
Lang.task.str96 = {"修仙坐骑","","","","",""}
Lang.task.str97 = {"环跑","","","","",""}


Lang.task.str98 = {"此物品所触发的任务正在进行中！","","","","",""}
Lang.task.str99 = {"未知任务","","","","",""}


Lang.task.str100 = {"建议组队","","","","",""}
Lang.task.str101 = {"极限难度，欢迎挑战","","","","",""}
Lang.task.str102 = {"可重复任务","","","","",""}


Lang.task.target.str1 = {"  没有使用任务道具！","","","","",""}
Lang.task.target.str2 = {"将%s摆放在%s","","","","",""}


Lang.task.target.str3 = {"回答","","","","",""}
Lang.task.target.str4 = {"%s的问题","","","","",""}
Lang.task.target.str5 = {"你要找的不是本地图的%s请前往%s","","","","",""}
Lang.task.target.str6 = {"你没有%d两银子，无法进入答题","","","","",""}
Lang.task.target.str7 = {"以后再答","","","","",""}
Lang.task.target.str8 = {"开始答题","","","","",""}
Lang.task.target.str9 = {"回答错误，请继续回答","","","","",""}



Lang.task.target.str10 = {"需要%s：%d/%d","","","","",""}
Lang.task.target.str11 = {"需要%s：%d","","","","",""}
Lang.task.target.str12 = {"包裹空间","","","","",""}

Lang.task.target.str13 = {"  没有使用任务道具！","","","","",""}
Lang.task.target.str14 = {"  您所在的位置不对，请先去到指定位置。","","","","",""}
Lang.task.target.str15 = {"使用","","","","",""}


Lang.task.target.str16 = {"击败","","","","",""}
Lang.task.target.str17 = {"的","","","","",""}
Lang.task.target.str18 = {"%s并捉到%s：%d/%d","","","","",""}
Lang.task.target.str19 = {"%s%d  个","","","","",""}
Lang.task.target.str20 = {"包裹已满，无法装载新的物品！","","","","",""}
Lang.task.target.str21 = {"捉到一个 %s","","","","",""}

Lang.task.target.str22 = {": 完成","","","","",""}

Lang.task.target.str23 = {"错误次数已经达到最大错误上限!","","","","",""}

Lang.task.target.str24 = {"然后","","","","",""}
Lang.task.target.str25 = {"与 ","","","","",""}
Lang.task.target.str26 = {"%s对话","","","","",""}

Lang.task.target.str27 = {"目标达成：","","","","",""}


Lang.task.target.str28 = {"把","","","","",""}
Lang.task.target.str29 = {"交给","","","","",""}
Lang.task.target.str30 = {"把指定道具交给","","","","",""}


Lang.task.target.str31 = {"包裹已满，无法装载新的物品！","","","","",""}
Lang.task.target.str32 = {"由<color=yellow>%s<color>的队伍保护","","","","",""}
Lang.task.target.str33 = {"进行中","","","","",""}
Lang.task.target.str34 = {"成功","","","","",""}
Lang.task.target.str35 = {"失败","","","","",""}
Lang.task.target.str36 = {"你要开启的不是本地图的%s请前往%s","","","","",""}
Lang.task.target.str37 = {"%s并获得%s：%d/%d","","","","",""}
Lang.task.target.str38 = {"包裹空间不够！","","","","",""}
Lang.task.target.str39 = {"%s并获得%s%d ","","","","",""}
Lang.task.target.str40 = {" %d个以上","","","","",""}

Lang.task.target.str41 = {"开启 ","","","","",""}
Lang.task.target.str42 = {"暂时不开","","","","",""}
Lang.task.target.str43 = {"打开我里面有意想不到惊喜！","","","","",""}
Lang.task.target.str44 = {"位置不正确！","","","","",""}
Lang.task.target.str45 = {"材料不足！","","","","",""}
Lang.task.target.str46 = {"材料不够","","","","",""}
Lang.task.target.str47 = {"背包空间不足！","","","","",""}
Lang.task.target.str48 = {"护送","","","","",""}
Lang.task.target.str49 = {"您要找的%s不在本地图，请前往%s","","","","",""}


Lang.task.target.str50 = {"已死亡，护送任务失败，请返回起点重新对话开启护送任务。","","","","",""}
Lang.task.target.str51 = {"下一页","","","","",""}
Lang.task.target.str52 = {"结束对话","","","","",""}
Lang.task.target.str53 = {"找到","","","","",""}
Lang.task.target.str54 = {"寻找 %s的地图志，完成：%d / %d 张","","","","",""}
Lang.task.target.str55 = {"%s寻找 %d 张%s的地图","","","","",""}
Lang.task.target.str56 = {"您已经完成了寻找%s地图志的任务！","","","","",""}
Lang.task.target.str57 = {"寻找%s地图志进度：%d / %d","","","","",""}
Lang.task.target.str58 = {"传送无效！","","","","",""}
Lang.task.target.str59 = {"目前可传送次数为","","","","",""}
Lang.task.target.str60 = {"你要找的不是本地图的%s请前往%s","","","","",""}
Lang.task.target.str61 = {"剩余时间：","","","","",""}
Lang.task.target.str62 = {"限时：","","","","",""}
Lang.task.target.str63 = {"%d天%d小时","","","","",""}
Lang.task.target.str64 = {"%d小时%d分","","","","",""}
Lang.task.target.str65 = {"%d分%d秒","","","","",""}
Lang.task.target.str66 = {"  没有使用任务道具！","","","","",""}
Lang.task.target.str67 = {"您所在的位置不对，请先到指定位置。","","","","",""}
Lang.task.target.str68 = {"  添加失败！","","","","",""}

Lang.task.target.str69 = {"右键点击快捷栏，使用其中的物品","","","","",""}
Lang.task.target.str70 = {"","","","","",""}
Lang.task.target.str71 = {"","","","","",""}
Lang.task.target.str72 = {"","","","","",""}
Lang.task.target.str73 = {"","","","","",""}
Lang.task.target.str74 = {"","","","","",""}
Lang.task.target.str75 = {"","","","","",""}



Lang.scene.str1 =  {"确定要离开当前副本吗","","","","",""}
Lang.scene.str2 =  {"确定要离开南天门吗","","","","",""}
Lang.scene.str3 =  {"确定要离开伐魔塔吗","","","","",""}
Lang.scene.str4 =  {"确定要离开当前关卡吗，将离开你的队伍","","","","",""}
Lang.scene.str5 =  {"确定要离开当前多人副本吗，将离开你的队伍","","","","",""}
Lang.scene.str6 =  {"确定要离开当前活动吗","","","","",""}
Lang.scene.str7 =  {"大神饶命","","","","",""}
Lang.scene.str8 =  {"土地公：臭小子！你踩着我了！","","","","",""}
Lang.scene.str9 =  {"","","","","",""}
Lang.scene.str10 = {"","","","","",""}


Lang.reward.str1 = {"包裹里需要有%d个空位，先整理下包裹吧","","","","",""}
Lang.reward.str2 = {"","","","","",""}
Lang.reward.str3 = {"","","","","",""}
Lang.reward.str4 = {"","","","","",""}
Lang.reward.str5 = {"","","","","",""}
Lang.reward.str6 = {"","","","","",""}
Lang.reward.str7 = {"","","","","",""}
Lang.reward.str8 = {"","","","","",""}

Lang.quiz.str1 = {"您今天的答题次数已经用完，请明天再来","","","","",""}
Lang.quiz.str2 = {"您今天的答题次数已经用完，请明天再来","","","","",""}
Lang.quiz.str3 = {"活动还没开始","","","","",""}
Lang.quiz.str4 = {"改变社会风气，提升网友情操！轻松有趣的日常答题活动正在进行中！","","","","",""}
Lang.quiz.str5 = {"超强大脑[%s]在日常答题活动中轻松胜出，荣获[全民学神]的称号！","","","","",""}
Lang.quiz.str6 = {"不在答题时间内","","","","",""}
Lang.quiz.str7 = {"","","","","",""}
Lang.quiz.str8 = {"","","","","",""}



Lang.player.str1 = {"您累计在线时间已满1小时。","","","","",""}
Lang.player.str2 = {"您累计在线时间已满2小时。","","","","",""}
Lang.player.str3 = {"您累计在线时间已满3小时，已进入不健康游戏时间，为了您的健康，请您立即下线休息。您的收益已降为零，直到您的累计下线时间满5小时后，才能恢复正常","","","","",""}
Lang.player.str4 = {"您已进入不健康游戏时间，为了您的健康，请您立即下线休息。您的收益已降为零，直到您的累计下线时间满5小时后，才能恢复正常","","","","",""}



Lang.player.str5 =  {"普通副本","","","","",""}
Lang.player.str6 =  {"关卡","","","","",""}
Lang.player.str7 =  {"副本","","","","",""}
Lang.player.str8 =  {"登天塔","","","","",""}
Lang.player.str9 =  {"竞技场挑战次数","","","","",""}
Lang.player.str10 = {"炼丹炉免费次数","","","","",""}
Lang.player.str11 = {"炼丹炉元宝次数","","","","",""}
Lang.player.str12=  {"每日修仙次数","","","","",""}

Lang.player.str13 = {"每日免费刷修仙云次数","","","","",""}
Lang.player.str14 = {"扫荡伐魔塔","","","","",""}
Lang.player.str15=  {"挑战伐魔塔","","","","",""}
Lang.player.str16 = {"答题免费双倍次数","","","","",""}

Lang.player.str17 = {"第一次答题标志","","","","",""}
Lang.player.str18 = {"第二次答题标志","","","","",""}
Lang.player.str19 = {"关卡","","","","",""}
Lang.player.str20 = {"暂时不用了","","","","",""}
Lang.player.str21 = {"多人副本","","","","",""}
Lang.player.str22 = {"每日参加战宝堂活动次数","","","","",""}
Lang.player.str23 = {"每日任务领奖次数","","","","",""}
Lang.player.str24 = {"每日酒馆翻牌次数","","","","",""}
Lang.player.str25 = {"每日酒馆抽牌次数","","","","",""}
Lang.player.str26 = {"补签次数","","","","",""}
Lang.player.str27 = {"御神副本","","","","",""}
Lang.player.str28 = {"炼兽副本","","","","",""}
Lang.player.str29 = {"至尊副本","","","","",""}
Lang.player.str30 = {"劫驾次数","","","","",""}
Lang.player.str31 = {"护送次数","","","","",""}
Lang.player.str32 = {"救驾次数","","","","",""}
Lang.player.str33 = {"参加战神无双活动次数","","","","",""}
Lang.player.str34 = {"参加神魔战场活动次数","","","","",""}
Lang.player.str35 = {"参加泡澡活动次数","","","","",""}



Lang.player.str36 = {"您获得了%d点经验值","","","","",""}
Lang.player.str37 = {"根据您填写的身份证资料，您已经被纳入防沉迷系统，您的收益将会受到时间限制，根据相关条例规定，凡年满十八周岁的成年人验证通过后将不纳入防沉迷系统","","","","",""}
Lang.player.str38 = {"累计在线时间：%d小时%d分钟%d秒","","","","",""}

Lang.player.str39 = {"累计离线时间：%d小时%d分钟%d秒","","","","",""}
Lang.player.str40 = {"您当前处于不健康游戏时间","","","","",""}
Lang.player.str41 = {"您当前处于健康游戏时间。","","","","",""}

Lang.player.str42 = {"你击杀了玩家 <color=green>","","","","",""}
Lang.player.str43 = {"你被玩家 <color=green>","","","","",""}
Lang.player.str44 = {" <color=235,123,49>击杀","","","","",""}
Lang.player.str45 = {"你被NPC <color=green>","","","","",""}
Lang.player.str46 = {"你身上没有%s，无法立即复活","","","","",""}
Lang.player.str47 = {"您已经做过该问卷了，感谢您的参与。","","","","",""}
Lang.player.str48 = {"亲爱的玩家:\n\t非常感谢您参与%d级玩家调研活动。附件中是您获得的奖励，请及时收取，记得去背包里使用哦！\n\t您的每一个建议我们都将认真听取，不断改善。这个世界有了您的参与，将变得更加丰富有趣！祝您玩得开心！\n\t\t\t\t九天神话研发团队","","","","",""}
Lang.player.str49 = {"问卷调查奖励","","","","",""}
Lang.player.str50 = {"","","","","",""}
Lang.player.str51 = {"","","","","",""}
Lang.player.str52 = {"","","","","",""}



Lang.pet.str1 = {"坚韧","","","","",""}
Lang.pet.str2 = {"凶猛","","","","",""}
Lang.pet.str3 = {"灵巧","","","","",""}
Lang.pet.str4 = {"睿智","","","","",""}
Lang.pet.str5 = {"温柔","","","","",""}

Lang.pet.str6 = {"白品","","","","",""}
Lang.pet.str7 = {"绿品","","","","",""}
Lang.pet.str8 = {"蓝品","","","","",""}
Lang.pet.str9 = {"紫品","","","","",""}
Lang.pet.str10 = {"橙品","","","","",""}
Lang.pet.str11 = {"金品","","","","",""}


Lang.pet.str12 = {"素","","","","",""}
Lang.pet.str13 = {"玄","","","","",""}
Lang.pet.str14 = {"灵","","","","",""}
Lang.pet.str15 = {"仙","","","","",""}
Lang.pet.str16 = {"幻","","","","",""}
Lang.pet.str17 = {"圣","","","","",""}

Lang.pet.str18 = {"饲料的品质过低，请选用相应品质的饲料喂食宠物","","","","",""}
Lang.pet.str19 = {"你的宠物的性格已经为%s，不需要驯化","","","","",""}
Lang.pet.str20 = {"请随身携带%d个宠物驯化道具","","","","",""}
Lang.pet.str21 = {"驯化成功","","","","",""}
Lang.pet.str22 = {"当前没有神仙经验书！","","","","",""}
Lang.pet.str23 = {"神仙等级不能超过角色等级！","","","","",""}
Lang.pet.str24 = {"神仙位已满, 请先解锁神仙位或者流放旧神仙","","","","",""}
Lang.pet.str25 = {"当前宠物最大只能升到%d","","","","",""}



Lang.pet.str26 = {"请随身携带%d个升阶丸","","","","",""}
Lang.pet.str27 = {"背包空间不足，请清空背包后再进行传承！","","","","",""}
Lang.pet.str28 = {"背包空间不足，请清空背包后再进行传承！","","","","",""}
Lang.pet.str29 = {"元宝数量不足，需要%d元宝","","","","",""}
Lang.pet.str30 = {"银两数量不足，需要%d银两","","","","",""}
Lang.pet.str31 = {"元宝数量不足","","","","",""}
Lang.pet.str32 = {"移魂成功","","","","",""}
Lang.pet.str33 = {"你的元宝不足，需要%d元宝","","","","",""}
Lang.pet.str34 = {"神仙技能等级不能超过神仙等级！","","","","",""}
Lang.pet.str35 = {"请随身携带%d个技能书","","","","",""}


Lang.pet.str36 = {"背包空间不足，请先清理背包","","","","",""}
Lang.pet.str37 = {"需要%d个聚灵球","","","","",""}
Lang.pet.str38 = {"已经是100%成功率","","","","",""}
Lang.pet.str39 = {"操作太频繁","","","","",""}
Lang.pet.str40 = {"元宝不足","","","","",""}
Lang.pet.str41 = {"神仙位已满, 请先解锁神仙位或者流放旧神仙","","","","",""}
Lang.pet.str42 = {"元宝不足","","","","",""}
Lang.pet.str43 = {"战斗开始！","","","","",""}
Lang.pet.str44 = {"当前没有召唤出大神","","","","",""}
Lang.pet.str45 = {">在南天门中大发神威，终于降服了蓝品神仙<","","","","",""}
Lang.pet.str46 = {">在南天门中大发神威，终于降服了紫品神仙<","","","","",""}
Lang.pet.str47 = {">在南天门中大发神威，终于降服了橙品神仙<","","","","",""}
Lang.pet.str48 = {">在南天门中大发神威，终于降服了金品神仙<","","","","",""}
Lang.pet.str49 = {"被宠物杀死了！","","","","",""}

Lang.pet.str50 = {"你的神仙栏已经满了，请开锁后再来领取天神令","","","","",""}
Lang.pet.str51 = {"你获得了宠物: ","","","","",""}
Lang.pet.str52 = {"恭喜您开启天神令，获得%s神仙%s！","","","","",""}
Lang.pet.str53 = {"装备了坐骑: ","","","","",""}
Lang.pet.str54 = {"你的神仙栏已经满了，请开锁后再来领取天神令","","","","",""}
Lang.pet.str55 = {"你获得了宠物:","","","","",""}
Lang.pet.str56 = {"恭喜您开启天神令，获得%s神仙%s！","","","","",""}
Lang.pet.str57 = {"装备了坐骑: ","","","","",""}



Lang.pet.str58 = {"背包已满，不能卸下坐骑","","","","",""}
Lang.pet.str59 = {"请随身携带%d个幻化果","","","","",""}
Lang.pet.str60 = {"请随身携带至少%d个%s","","","","",""}
Lang.pet.str61 = {"您的坐骑[%s]成功幻化为[%s]","","","","",""}
Lang.pet.str62 = {"经过%s的悉心照料, 他的坐骑终于幻化成了神骏非凡的<%s>！","","","","",""}
Lang.pet.str63 = {"请随身携带%d个坐骑饲料","","","","",""}
Lang.pet.str64 = {"","","","","",""}


Lang.npc.str1 = {"结束对话","","","","",""}
Lang.npc.str2 = {"%s：%s，你好！","","","","",""}
Lang.npc.str3 = {"你好<pic=1>，找我有什么事吗？","","","","",""}
Lang.npc.str4 = {"<pic=2>希望你不要浪费我的时间！","","","","",""}

Lang.npc.str5 = {"%s：你来得正好，我这里有些活动和任务要你做。","","","","",""}
Lang.npc.str6 = {"我不想参加活动和任务","","","","",""}
Lang.npc.str7 = {"%s：你来得正好，我这里有些活动要你做。","","","","",""}
Lang.npc.str8 = {"我不想参加活动","","","","",""}
Lang.npc.str9 = {"%s：你来得正好，我这里有些任务要你做。","","","","",""}
Lang.npc.str10 = {"我不想做任务","","","","",""}


Lang.npc.str11 = {"你不属于这活动阵营","","","","",""}




Lang.npc.str12 = {"进入一号战场","","","","",""}
Lang.npc.str13 = {"进入二号战场","","","","",""}
Lang.npc.str14 = {"进入三号战场","","","","",""}
Lang.npc.str15 = {"进入四号战场","","","","",""}
Lang.npc.str16 = {"我还需要准备一下","","","","",""}
Lang.npc.str17 = {"战斗已经结束了，等下一场再来吧","","","","",""}
Lang.npc.str18 = {"你好，请选择想要加入的战场？","","","","",""}
Lang.npc.str19 = {"确定加入","","","","",""}
Lang.npc.str20 = {"我还要再考虑一下","","","","",""}
Lang.npc.str21 = {"   战斗仍处于准备阶段                ","","","","",""}
Lang.npc.str22 = {"   战斗已经开始了                   ","","","","",""}
Lang.npc.str23 = {"战神堂报名人数：%s人                 武魂居报名人数：%s人","","","","",""}
Lang.npc.str24 = {"本场武魂居参战人数已满，侠士请加入战神堂或选择其他场次进行战斗","","","","",""}
Lang.npc.str25 = {"战斗已经开始，请加入其他场次进行战斗！","","","","",""}

Lang.npc.str26 = {"本场战神堂参战人数已满，侠士请加入武魂居或选择其他场次进行战斗","","","","",""}



Lang.npc.str27 = {"我要去英雄岛","","","","",""}
Lang.npc.str28 = {"我再考虑一下","","","","",""}
Lang.npc.str29 = {"路途凶险，侠士还是等到10级再来吧！","","","","",""}
Lang.npc.str30 = {"请问你想要传送到英雄岛吗？","","","","",""}

Lang.npc.str31 = {"我要离开英雄岛","","","","",""}
Lang.npc.str32 = {"取消","","","","",""}
Lang.npc.str33 = {"请问你有什么事情？","","","","",""}



Lang.npc.str34 = {"我想要参加活动","","","","",""}
Lang.npc.str35 = {"你好，现在无法参加活动，请稍后再来！","","","","",""}
Lang.npc.str36 = {"活动步骤尚未开放，请稍后再试！","","","","",""}
Lang.npc.str37 = {"你好，请问你有什么事？","","","","",""}
Lang.npc.str38 = {"战宝堂报名活动已结束，请下次活动再来!","","","","",""}


Lang.npc.str39 = {"新手村","","","","",""}
Lang.npc.str40 = {"无上峰","","","","",""}
Lang.npc.str41 = {"沐剑山庄","","","","",""}
Lang.npc.str42 = {"幽冥列岛","","","","",""}
Lang.npc.str43 = {"百花谷","","","","",""}


Lang.npc.str44 = {"繁烟柳地","","","","",""}
Lang.npc.str45 = {"天外村","","","","",""}
Lang.npc.str46 = {"无极天域","","","","",""}
Lang.npc.str47 = {"岩湾镇","","","","",""}
Lang.npc.str48 = {"寂岭荒村","","","","",""}


Lang.npc.str49 = {"深山谷底","","","","",""}

Lang.npc.str50 = {"城镇","","","","",""}
Lang.npc.str51 = {"野外","","","","",""}
Lang.npc.str52 = {"取消","","","","",""}
Lang.npc.str53 = {"路途凶险，侠士还是等到10级再来吧！","","","","",""}
Lang.npc.str54 = {"请问你想要传送到哪？","","","","",""}
Lang.npc.str55 = {"请选择需要传送的地区","","","","",""}


Lang.npc.str56 = {"创建家族","","","","",""}
Lang.npc.str57 = {"我只是路过","","","","",""}
Lang.npc.str58 = {"你好，请问你有什么事？","","","","",""}
Lang.npc.str59 = {"你的等级不够%d级","","","","",""}
Lang.npc.str60 = {"你已经有家族了","","","","",""}


Lang.npc.str61 = {"家族名字","","","","",""}

Lang.npc.str62 = {"等等，我再想想","","","","",""}
Lang.npc.str63 = {"我受不鸟了，我要出去","","","","",""}
Lang.npc.str64 = {"你想做啥？","","","","",""}
Lang.npc.str65 = {"","","","","",""}



Lang.npc.str66 = {"我想要参加活动","","","","",""}
Lang.npc.str67 = {"容我三思","","","","",""}
Lang.npc.str68 = {"你好，现在无法参加活动，请稍后再来！","","","","",""}
Lang.npc.str69 = {"活动步骤尚未开放，请稍后再试！","","","","",""}
Lang.npc.str70 = {"你好，请问你有什么事？","","","","",""}



Lang.npc.str71 = {"没事，我就打个招呼","","","","",""}
Lang.npc.str72 = {"我要须弥幻境录","","","","",""}
Lang.npc.str73 = {"你是谁呀，我有个好东西要给你。","","","","",""}


Lang.npc.str74 = {"你已经有一本须弥幻境录了，不要贪心喔","","","","",""}
Lang.npc.str75 = {"你的背包空间不足，清理一下背包再来领取吧","","","","",""}
Lang.npc.str76 = {"领取成功","","","","",""}
Lang.npc.str77 = {"我是捕头葛英人，大盗追风在里面的空地上，麻烦诸位先进去对其实施抓捕，我安排好人对这形成包围之后马上就来支援！","","","","",""}




Lang.npc.str78 = {"少侠饶命啊！我们只劫富济贫，从未害人性命啊，逢年过节还给山下农户送些酒肉，少侠你就发发慈悲，饶我门一条命吧，我上有八十老母......","","","","",""}
Lang.npc.str79 = {"确定要离开当前活动吗","","","","",""}

Lang.npc.str80 = {"测试","","","","",""}
Lang.npc.str81 = {"小伙伴们以后一起来这里愉快的玩耍吧!","","","","",""}

Lang.npc.str82 = {"测试","","","","",""}


Lang.npc.str83 = {"我要离开pk场","","","","",""}
Lang.npc.str84 = {"取消","","","","",""}
Lang.npc.str85 = {"你想要做什么","","","","",""}
Lang.npc.str86 = {"","","","","",""}
Lang.npc.str87 = {"","","","","",""}


Lang.npc.str88 = {"我要进入战魂之滨","","","","",""}
Lang.npc.str89 = {"取消","","","","",""}
Lang.npc.str90 = {"你想要做什么","","","","",""}
Lang.npc.str91 = {"加入战神堂","","","","",""}
Lang.npc.str92 = {"加入武魂居","","","","",""}
Lang.npc.str93 = {"我想进去观战","","","","",""}
Lang.npc.str94 = {"战魂之滨异常凶险，稍有不慎可能有生命之虞，少侠还是再去历练一番再来吧","","","","",""}
Lang.npc.str95 = {"请选择要加入的阵营","","","","",""}
Lang.npc.str96 = {"战魂之滨乃是凶险之所，岂容儿戏？","","","","",""}
Lang.npc.str97 = {"传送失败，请检查传送点是否正确！","","","","",""}


Lang.npc.str98 =  {"领取充值大礼包","","","","",""}
Lang.npc.str99 =  {"领取每日福利","","","","",""}
Lang.npc.str100 = {"领取新手装备","","","","",""}
Lang.npc.str101 = {"领取冲级奖励","","","","",""}
Lang.npc.str102 = {"游龙知道","","","","",""}
Lang.npc.str103 = {"我只是路过","","","","",""}
Lang.npc.str104 = {"你好，请问你有什么事？","","","","",""}
Lang.npc.str105 = {"你以为真有么？太年轻了啊！","","","","",""}
Lang.npc.str106 = {"今天的福利已经领取过了，明天再来吧","","","","",""}
Lang.npc.str107 = {"已经领取过新手奖励，不要太贪心","","","","",""}
Lang.npc.str108 = {"背包空间不够，请先清理背包","","","","",""}
Lang.npc.str109 = {"该奖励需要满级角色才能领取","","","","",""}
Lang.npc.str110 = {"已经领取过冲级奖励，不要太贪心","","","","",""}
Lang.npc.str111 = {"我想快速升级","","","","",""}
Lang.npc.str112 = {"我想提升能力","","","","",""}
Lang.npc.str113 = {"我想改变外观","","","","",""}
Lang.npc.str114 = {"我想快速赚钱","","","","",""}
Lang.npc.str115 = {"我想购买稀有物品","","","","",""}
Lang.npc.str116 = {"结束对话","","","","",""}
Lang.npc.str117 = {"请选择你感兴趣的事情（现在都无效）","","","","",""}

--Lang.mission.str1[Lang.Idx]

Lang.mission.str1 = {"系统","","","","",""}
Lang.mission.str2 = {"你今天已参加过神魔战场，请明天再来","","","","",""}
Lang.mission.str3 = {"所要加入的地图非蛮荒之地!","","","","",""}
Lang.mission.str4 = {"当前地图人数已满，请选择其他地图!","","","","",""}
Lang.mission.str5 = {"你今天已经参加过战神无双，请明天再来","","","","",""}
Lang.mission.str6 = {"背包已满，获取篝火令失败","","","","",""}
Lang.mission.str7 = {"族长<%s>领取了篝火令，赶紧找个地方烧烤吧","","","","",""}
Lang.mission.str8 = {"请族长先使用篝火令","","","","",""}
Lang.mission.str9 = {"战斗地图不能传送","","","","",""}
Lang.mission.str10 = {"你已经在篝火范围内","","","","",""}


Lang.mission.strr11 = {"所加入的步骤未开启，请开启后再加入","","","","",""}
Lang.mission.strr12 = {"你需要到达%s级才能参加活动[%s]","","","","",""}
Lang.mission.strr13 = {"不在活动时间内，无法进入","","","","",""}
Lang.mission.strr14 = {"本次活动报名时间已结束，下次活动请尽早参加!","","","","",""}
Lang.mission.strr15 = {"你需要到达%d级才能参加活动[%s]","","","","",""}
Lang.mission.strr16 = {"","","","","",""}
Lang.mission.strr17 = {"","","","","",""}
Lang.mission.strr18 = {"","","","","",""}
Lang.mission.strr19 = {"","","","","",""}
Lang.mission.strr20 = {"","","","","",""}


Lang.mission.str11 = {"\\r<color=white>所在阵营: <color=red>神族 \\r<color=white>个人排名: <color=red>无   <color=white>个人积分: <color=red>0\\r\\r<color=white>神族积分: <color=red>0   <color=white>魔族积分: <color=red>0","","","","",""}
Lang.mission.str12 = {"\\r<color=white>所在阵营: <color=red>魔族 \\r<color=white>个人排名: <color=red>无   <color=white>个人积分: <color=red>0\\r\\r<color=white>神族积分: <color=red>0   <color=white>魔族积分: <color=red>0","","","","",""}
Lang.mission.str13 = {"<%s>功力不俗,在神魔战场中连斩数达到%d次","","","","",""}
Lang.mission.str14 = {"<%s>仙法精深，在神魔战场中连斩数达到%d次","","","","",""}
Lang.mission.str15 = {"<%s>已经完全停不下来了，在神魔战场中连斩数达到%d次","","","","",""}
Lang.mission.str16 = {"<%s>已经完全停不下来了，在神魔战场中连斩数达到%d次,就没人敢前去阻止他吗！","","","","",""}
Lang.mission.str17 = {"\\r<color=white>所在阵营: <color=red>%s \\r<color=white>个人排名: <color=red>%d   <color=white>个人积分: <color=red>%d\\r\\r<color=white>神族积分: <color=red>%d   <color=white>魔族积分: <color=red>%d","","","","",""}
Lang.mission.str18 = {"神族","","","","",""}
Lang.mission.str19 = {"魔族","","","","",""}
Lang.mission.str20 = {"本族基地正遭受敌人猛烈炮火攻击中，请火速救援！","","","","",""}



Lang.mission.str21 = {"此次神魔战场共获得积分","","","","",""}
Lang.mission.str22 = {", 排名第","","","","",""}
Lang.mission.str23 = {"兄弟齐心，其利断金！%s的玩家获得本次神魔战场的胜利！","","","","",""}
Lang.mission.str24 = {"<%s>在神魔战场中大杀特杀，手上人头无数，<盖世魔神>的称号当之无愧！","","","","",""}
Lang.mission.str25 = {"篝火活动开始了，请族长领取篝火令","","","","",""}
Lang.mission.str26 = {"篝火活动已经结束","","","","",""}
Lang.mission.str27 = {"你还未有家族，不能参加家族战","","","","",""}
Lang.mission.str28 = {"只有2级或以上的家族才能参加活动","","","","",""}
Lang.mission.str29 = {"<%s>家族捍卫了家族的荣耀，在神族争霸活动中获得了<帝天神族>称号！","","","","",""}
Lang.mission.str30 = {"<%s>家族捍卫了家族的荣耀，族长<%s>获得<帝天神皇>称号！","","","","",""}


Lang.mission.str31 = {"<%s>家族在族长的率领下，同舟共济共创辉煌，获得了本次神族争霸的胜利！","","","","",""}
Lang.mission.str32 = {"你的家族获得了本次神族争霸的胜利！","","","","",""}
Lang.mission.str33 = {"你的家族获得了本次神族争霸的胜利！","","","","",""}
Lang.mission.str34 = {"本次神族争霸最终没赢得胜利！再接再厉！","","","","",""}
Lang.mission.str35 = {"<%s>家族的族长<%s>已经扛起了大旗，被誉为大神夺金手！","","","","",""}
Lang.mission.str36 = {"恭喜你获得了一份蟠桃奖励!","","","","",""}
Lang.mission.str37 = {"蟠桃采集中断!","","","","",""}
Lang.mission.str38 = {"\r个人伤害: <color=red>%d\r<color=white>获奖概率: <color=red>%.2f","","","","",""}
Lang.mission.str39 = {"\r个人伤害: <color=red>%d\r<color=white>获奖概率: <color=red>%.2f","","","","",""}
Lang.mission.str40 = {"<%s>的小队充分理解了打家劫舍的精髓，将世界BOSS<%s>洗劫一空！","","","","",""}

Lang.mission.str41 = {"圆月弯刀","","","","",""}
Lang.mission.str42 = {"鲁大深","","","","",""}
Lang.mission.str43 = {"魔僧","","","","",""}
Lang.mission.str44 = {"武痴","","","","",""}
Lang.mission.str45 = {"无名Boss","","","","",""}

Lang.mission.str46 = {"携带丰厚奖励的野外BOSS【狂暴者】已经蛮荒之地现身，大神们速速拉帮结派前往抢夺吧！","","","","",""}
Lang.mission.str47 = {"携带丰厚奖励的野外BOSS【狂野恶霸】已经蛮荒之地现身，大神们速速拉帮结派前往抢夺吧！","","","","",""}
Lang.mission.str48 = {"携带丰厚奖励的野外BOSS【傀儡土豪】已经蛮荒之地现身，大神们速速拉帮结派前往抢夺吧！","","","","",""}
Lang.mission.str49 = {"携带丰厚奖励的野外BOSS【剧毒蟾蜍】已经蛮荒之地现身，大神们速速拉帮结派前往抢夺吧！","","","","",""}
Lang.mission.str50 = {"携带丰厚奖励的野外BOSS【威震头领】已经蛮荒之地现身，大神们速速拉帮结派前往抢夺吧！","","","","",""}

Lang.mission.str51 = {"携带丰厚奖励的野外BOSS【霸天鳄龟】已经蛮荒之地现身，大神们速速拉帮结派前往抢夺吧！","","","","",""}
Lang.mission.str52 = {"携带丰厚奖励的野外BOSS【瘟癀魔将】已经蛮荒之地现身，大神们速速拉帮结派前往抢夺吧！","","","","",""}
Lang.mission.str53 = {"[name]的小队充分理解了打家劫舍的精髓，将蛮荒之地的野外BOSS[狂暴者]洗劫一空","","","","",""}
Lang.mission.str54 = {"[name]的小队充分理解了打家劫舍的精髓，将蛮荒之地的野外BOSS[狂野恶霸]洗劫一空","","","","",""}
Lang.mission.str55 = {"[name]的小队充分理解了打家劫舍的精髓，将蛮荒之地的野外BOSS[傀儡土豪]洗劫一空","","","","",""}
Lang.mission.str56 = {"[name]的小队充分理解了打家劫舍的精髓，将蛮荒之地的野外BOSS[剧毒蟾蜍]洗劫一空","","","","",""}
Lang.mission.str57 = {"[name]的小队充分理解了打家劫舍的精髓，将蛮荒之地的野外BOSS[威震头领]洗劫一空","","","","",""}
Lang.mission.str58 = {"[name]的小队充分理解了打家劫舍的精髓，将蛮荒之地的野外BOSS[霸天鳄龟]洗劫一空","","","","",""}
Lang.mission.str59 = {"[name]的小队充分理解了打家劫舍的精髓，将蛮荒之地的野外BOSS[瘟癀魔将]洗劫一空","","","","",""}
Lang.mission.str60 = {"<color=green>和平模式","","","","",""}

Lang.mission.str61 = {"<color=green>家族模式","","","","",""}
Lang.mission.str62 = {"<color=red>屠杀模式","","","","",""}
Lang.mission.str63 = {"<color=red>pk模式","","","","",""}
Lang.mission.str64 = {"\\r<color=yellow>模  式: %s \\r<color=yellow>恶名值: <color=red>%d \\r<color=yellow>攻击力: <color=red>减少%d","","","","",""}
Lang.mission.str65 = {"当前地图不可切换战斗模式!","","","","",""}
Lang.mission.str66 = {"切换战斗模式冷却时间(3分钟)未过,请稍后再切换!","","","","",""}
Lang.mission.str67 = {"您没加入任何家族,不可使用家族模式!","","","","",""}
Lang.mission.str68 = {"<%s>和<%s>两人情不自禁，惺惺相惜，携手进入战神无双总决赛！”","","","","",""}
Lang.mission.str69 = {"在战神无双活动中斩获<无双战神>称号的<%s>大叫一声：“还有谁？”","","","","",""}
Lang.mission.str70 = {"本次战神无双获得冠军","","","","",""}

Lang.mission.str71 = {"本次战神无双获得亚军","","","","",""}
Lang.mission.str72 = {"本次战神无双进入4强","","","","",""}
Lang.mission.str73 = {"本次战神无双进入8强","","","","",""}
Lang.mission.str74 = {"本次战神无双进入16强","","","","",""}
Lang.mission.str75 = {"本次战神无双未进入16强","","","","",""}
Lang.mission.str76 = {"[战神无双]试图重复加入预选赛！","","","","",""}
Lang.mission.str77 = {"玩家加入预选赛","","","","",""}
Lang.mission.str78 = {"\\r<color=red>积分: %d   当前排名: %d","","","","",""}
Lang.mission.str79 = {"\\r<color=red>积分: 0   当前排名: 0","","","","",""}

Lang.mission.str80 = {"战神无双冠军旗子","","","","",""}
Lang.mission.str81 = {"只有战神无双[冠军]才能开此旗帜!","","","","",""}
Lang.mission.str82 = {"旗子采集过程中断!","","","","",""}
Lang.mission.str83 = {"蟠桃采集","","","","",""}
Lang.mission.str84 = {"此蟠桃已有人在采集","","","","",""}
Lang.mission.str85 = {"你不是族长，不能抢旗子","","","","",""}
Lang.mission.str86 = {"%s 正在抢夺金牌，打败他以后才能抢夺","","","","",""}
Lang.mission.str87 = {"正在抢夺金牌...","","","","",""}
Lang.mission.str88 = {"神魔战场","","","","",""}
Lang.mission.str89 = {"弑神屠魔，谁缨其锋！神魔战场燃血开启，无正无邪只求一战！","","","","",""}

Lang.mission.str90 = {"<color=green>离活动开始时间:<color=red>%s","","","","",""}
Lang.mission.str91 = {"<color=green>离活动开始时间:<color=red>%s","","","","",""}
Lang.mission.str92 = {"<color=yellow>\\b神魔战场规则\\b#","","","","",""}
Lang.mission.str93 = {"<color=yellow>\\b神魔战场规则\\b#","","","","",""}
Lang.mission.str94 = {"<color=green>准备场倒计时:<color=red>%s","","","","",""}
Lang.mission.str95 = {"<color=green>准备场倒计时:<color=red>%s","","","","",""}
Lang.mission.str96 = {"<color=green>神魔战场即将开始，各位勇士请耐心等候！\\r\\r<color=yellow>\\b神魔战场规则\\b#","","","","",""}
Lang.mission.str97 = {"<color=green>神魔战场即将开始，各位勇士请耐心等候！\\r\\r<color=yellow>\\b神魔战场规则\\b#","","","","",""}
Lang.mission.str98 = {"神魔战场马上要开战了！各位勇士准备好了！","","","","",""}
Lang.mission.str99 = {"<color=green>战斗倒计时:<color=red>%s","","","","",""}

Lang.mission.str100 = {"<color=green>神魔战场即将开始！\\r\\r<color=yellow>\\b神魔战场规则\\b# \\r\\r<color=yellow>\\b神魔战场战报\\b#","","","","",""}
Lang.mission.str101 = {"<color=green>神魔战场即将开始！\\r\\r<color=yellow>\\b神魔战场规则\\b# \\r\\r<color=yellow>\\b神魔战场战报\\b#","","","","",""}
Lang.mission.str102 = {"神魔战场已经开战！同志们冲吧！","","","","",""}
Lang.mission.str103 = {"<color=green>战场剩余时间:<color=red>%s","","","","",""}
Lang.mission.str104 = {"<color=green>1.摧毁敌方基地可提前胜利\\r2.中途退出将取消本次活动奖励\\r\\r<color=yellow>\\b神魔战场规则\\b# \\r\\r<color=yellow>\\b神魔战场战报\\b#","","","","",""}
Lang.mission.str105 = {"<color=green>1.摧毁敌方基地可提前胜利\\r2.中途退出将取消本次活动奖励\\r\\r<color=yellow>\\b神魔战场规则\\b# \\r\\r<color=yellow>\\b神魔战场战报\\b#","","","","",""}
Lang.mission.str106 = {"<color=green>离战场结束时间:<color=red>%s","","","","",""}
Lang.mission.str107 = {"家族篝火活动","","","","",""}
Lang.mission.str108 = {"世界boss","","","","",""}
Lang.mission.str109 = {"携带丰厚奖励的世界BOSS已经纷纷现身等待砍翻，大神们速速拉帮结派前往打劫吧！","","","","",""}

Lang.mission.str110 = {"<color=yellow>[世界boss准备中]\\r<color=red>准备场内可以自由组队\\r\\r<color=yellow>1、BOSS刷出：<color=green>四个门分别随机刷出一个BOSS\\r\\r<color=yellow>2、BOSS归属：<color=green>输出越高，获得奖励概率越高\\r\\r<color=yellow>3、奖励规则：<color=green>组队情况下，队员按输出排名均可获得不同奖励，否则只给个人\\r\\r<color=yellow>4、注意：<color=green>如果离开boss场景、掉线、主动退出，玩家的输出累计会清零","","","","",""}
Lang.mission.str111 = {"<color=yellow>[世界boss准备中]\\r<color=red>准备场内可以自由组队\\r\\r<color=yellow>1、BOSS刷出：<color=green>四个门分别随机刷出一个BOSS\\r\\r<color=yellow>2、BOSS归属：<color=green>输出越高，获得奖励概率越高\\r\\r<color=yellow>3、奖励规则：<color=green>如果没组队，则boss奖励归属玩家个人，否则队员都有奖励\\r\\r<color=yellow>4、注意：<color=green>如果离开boss场景、掉线、主动退出，玩家的输出累计会清零","","","","",""}
Lang.mission.str112 = {"<color=green>准备时间：<color=red>%s","","","","",""}
Lang.mission.str113 = {"<color=yellow>[世界boss进行中]\\r\\r1、<color=yellow>BOSS刷出：<color=green>四个门分别随机刷出一个BOSS\\r\\r<color=yellow>2、BOSS归属：<color=green>输出越高，获得奖励概率越高\\r\\r<color=yellow>3、奖励规则：<color=green>如果没组队，则boss奖励归属玩家个人，否则队伍共享\\r\\r<color=yellow>4、注意：<color=green>如果离开boss场景、掉线、主动退出，玩家的伤害会清零","","","","",""}
Lang.mission.str114 = {"<color=yellow>[世界boss进行中]\\r\\r1、<color=yellow>BOSS刷出：<color=green>四个门分别随机刷出一个BOSS\\r\\r<color=yellow>2、BOSS归属：<color=green>输出越高，获得奖励概率越高\\r\\r<color=yellow>3、奖励规则：<color=green>组队情况下，队员按输出排名均可获得不同奖励，否则只给个人\\r\\r<color=yellow>4、注意：<color=green>如果离开boss场景、掉线、主动退出，玩家的伤害会清零","","","","",""}
Lang.mission.str115 = {"<color=green>剩余时间：<color=red>%s","","","","",""}
Lang.mission.str116 = {"本次世界boss圆满结束，下次再来吧！","","","","",""}
Lang.mission.str117 = {"活动即将关闭，各位大神辛苦了！","","","","",""}
Lang.mission.str118 = {"<color=yellow>[世界boss准备中]\\r<color=red>准备场内可以自由组队\\r\\r<color=yellow>\\b世界BOSS规则\\b#","","","","",""}
Lang.mission.str119 = {"<color=yellow>[世界boss准备中]\\r<color=red>准备场内可以自由组队\\r\\r<color=yellow>\\b世界BOSS规则\\b#","","","","",""}

Lang.mission.str120 = {"<color=green>准备时间：<color=red>%s","","","","",""}
Lang.mission.str121 = {"[高级BOSS鲁大深]带领[圆月狂刀]、[魔僧]和[武痴]已经纷纷现身，大神们速速拉帮结派前往打劫吧！","","","","",""}
Lang.mission.str122 = {"<color=yellow>[圆月狂刀BOSS]\\r\\r<color=yellow>\\b世界BOSS规则\\b#","","","","",""}
Lang.mission.str123 = {"世界boss圆月狂刀已被击杀","","","","",""}
Lang.mission.str124 = {"世界boss[圆月狂刀]已被击杀!","","","","",""}
Lang.mission.str125 = {"<color=yellow>[鲁大深BOSS]\\r\\r<color=yellow>\\b世界BOSS规则\\b#","","","","",""}
Lang.mission.str126 = {"鲁大深已被击杀","","","","",""}
Lang.mission.str127 = {"高级世界boss[鲁大深]已被击杀!","","","","",""}
Lang.mission.str128 = {"本次世界boss圆满结束，下次再来吧!","","","","",""}
Lang.mission.str129 = {"<color=yellow>[魔僧BOSS]\\r\\r<color=yellow>\\b世界BOSS规则\\b#","","","","",""}

Lang.mission.str130 = {"魔僧已被击杀","","","","",""}
Lang.mission.str131 = {"世界boss[魔僧]已被击杀!","","","","",""}
Lang.mission.str132 = {"<color=yellow>[武痴BOSS]\\r\\r<color=yellow>\\b世界BOSS规则\\b#","","","","",""}
Lang.mission.str133 = {"武痴已被击杀","","","","",""}
Lang.mission.str134 = {"世界boss[武痴]已被击杀!","","","","",""}

Lang.mission.str135 = {"级蛮荒之地","","","","",""}
Lang.mission.str136 = {"<color=yellow>[%d级蛮荒之地]\\r<color=green>1.可在角色头像下切换战斗模式\\r2.每天23:50分会关闭蛮荒之地\\r\\r<color=yellow>\\b蛮荒之地规则\\b#","","","","",""}
Lang.mission.str137 = {"战神无双","","","","",""}
Lang.mission.str138 = {"以战封神，万古无双！战神无双大赛已经火爆开启，兄弟们，来战吧!","","","","",""}
Lang.mission.str139 = {"<color=green>离活动开始时间：<color=red>%s","","","","",""}

Lang.mission.str140 = {"<color=green>目前是战神无双报名阶段。\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str141 = {"战神无双自由竞技开启，各位勇士们加油！","","","","",""}
Lang.mission.str142 = {"<color=green>自由搏杀混合赛：<color=red>%s","","","","",""}
Lang.mission.str143 = {"<color=green>战神无双混合赛,击杀数越多，排名越高！\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str144 = {"休息30秒将进行16强淘汰赛！","","","","",""}
Lang.mission.str145 = {"<color=green>休息时间：<color=red>%s","","","","",""}
Lang.mission.str146 = {"<color=green>战神无双16强淘汰赛即将开始！\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str147 = {"16进8比武开始!!！","","","","",""}
Lang.mission.str148 = {"<color=green>16强备战时间：<color=red>%s","","","","",""}
Lang.mission.str149 = {"<color=green>[战神无双16强淘汰赛]\\r胜出一方能够晋级！\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}

Lang.mission.str150 = {"16强比武开始！","","","","",""}
Lang.mission.str151 = {"<color=green>比武时间：<color=red>%s","","","","",""}
Lang.mission.str152 = {"16进8比武结束，8进4比武即将开始，请做好准备！","","","","",""}
Lang.mission.str153 = {"16进8比武开始!!！","","","","",""}
Lang.mission.str154 = {"<color=green>16强准备时间：<color=red>%s","","","","",""}
Lang.mission.str155 = {"<color=green>[战神无双16强淘汰赛]\\r胜出一方能够晋级！\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str156 = {"16强比武开始！","","","","",""}
Lang.mission.str157 = {"16进8比武结束，8进4比武即将开始，请做好准备！","","","","",""}
Lang.mission.str158 = {"8进4比武开始!!！","","","","",""}
Lang.mission.str159 = {"<color=green>8强准备时间：<color=red>%s","","","","",""}

Lang.mission.str160 = {"<color=green>[战神无双8强淘汰赛]\\r胜出一方能够晋级！\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str161 = {"8强比武开始！","","","","",""}
Lang.mission.str162 = {"8进4比武结束，4进2比武即将开始，请做好准备！","","","","",""}
Lang.mission.str163 = {"4进2比武开始!!！","","","","",""}
Lang.mission.str164 = {"<color=green>4强准备时间：<color=red>%s","","","","",""}
Lang.mission.str165 = {"<color=green>[战神无双4强淘汰赛]\\r胜出一方能够晋级！\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str166 = {"<color=green>[战神无双淘汰赛]\\r胜出一方能够晋级！\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str167 = {"4强比武开始！","","","","",""}
Lang.mission.str168 = {"4进2比武结束，决赛即将开始，请做好准备！","","","","",""}
Lang.mission.str169 = {"决赛比武开始!","","","","",""}

Lang.mission.str170 = {"战神无双决赛激烈进行中，决赛之后会有冠军开旗子送豪礼环节，敬请期待！","","","","",""}
Lang.mission.str171 = {"<color=green>决赛准备时间：<color=red>%s","","","","",""}
Lang.mission.str172 = {"<color=green>[战神无双决赛]\\r胜出一方得冠军！\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str173 = {"本次战神无双的16强名单已分出，有请本届冠军去开旗子送豪礼吧！","","","","",""}
Lang.mission.str174 = {"<color=green>淘汰赛剩余时间：<color=red>%s","","","","",""}
Lang.mission.str175 = {"<color=yellow>[战神无双16进8阶段]\\r<color=green>1.场外会定时刷出大量战魂包\\r2.决赛后有请冠军开旗帜送宝箱\\r\\r<color=yellow>\\b战神无双16强\\b#\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str176 = {"<color=yellow>[战神无双8进4阶段]\\r<color=green>1.场外会定时刷出大量战魂包\\r2.决赛后有请冠军开旗帜送宝箱\\r\\r<color=yellow>\\b战神无双16强\\b#\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str177 = {"<color=yellow>[战神无双4进2阶段]\\r<color=green>1.场外会定时刷出大量战魂包\\r2.决赛后有请冠军开旗帜送宝箱\\r\\r<color=yellow>\\b战神无双16强\\b#\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str178 = {"<color=yellow>[战神无双决赛阶段]\\r<color=green>1.场外会定时刷出大量战魂包\\r2.决赛后有请冠军开旗帜送宝箱\\r\\r<color=yellow>\\b战神无双16强\\b#\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str179 = {"战神无双16强淘汰赛进行中，场外会定时多次刷出大量战魂包，兄弟们去寻宝吧！","","","","",""}

Lang.mission.str180 = {"<color=green>活动剩余时间：<color=red>%s","","","","",""}
Lang.mission.str181 = {"<color=green>有请本届冠军去开旗子送豪礼吧！\\r\\r<color=yellow>\\b战神无双16强\\b#\\r\\r<color=yellow>\\b战神无双规则\\b#","","","","",""}
Lang.mission.str182 = {"蟠桃盛宴","","","","",""}
Lang.mission.str183 = {"普天同庆，家族活动[蟠桃盛宴]隆重开始，家族成员们速度抢桃子吧！","","","","",""}
Lang.mission.str184 = {"<color=green>[蟠桃盛宴已开始]\\r\\r<color=red>每个蟠桃存活时间为30秒，大家及时抢~","","","","",""}
Lang.mission.str185 = {"<color=green>活动剩余时间:<color=red>%s","","","","",""}
Lang.mission.str186 = {"<color=green>[蟠桃盛宴已结束]\\r\\r<color=red>欢迎下次再来~","","","","",""}
Lang.mission.str187 = {"<color=green>结束倒计时:%s","","","","",""}

Lang.mission.str188 = {"神族争霸战","","","","",""}
Lang.mission.str189 = {"是时候彰显家族的强大了，神族争霸强势开启，为了家族的荣耀，兄弟们并肩子上啊！","","","","",""}

Lang.mission.str190 = {"<color=green>离活动开始时间:<color=red>%s","","","","",""}
Lang.mission.str191 = {"<color=yellow>1.抢金牌规则：<color=green>只有族长可以抢金牌<color=red>（族长退场不影响令牌归属）\\r\\r<color=yellow>2.胜负判定：<color=green>占领令牌持续<color=red>20分钟（没易主）<color=green>的家族直接胜出；或活动结束时，占领令牌的家族为胜方\\r\\r<color=yellow>3.注意：<color=green>活动内任何形式退场，均视为放弃本次活动\\r\\r<color=yellow>\\b神族争霸规则\\b#","","","","",""}
Lang.mission.str192 = {"<color=green>剩余时间:<color=red>%s","","","","",""}
Lang.mission.str193 = {"神族争霸强势开启，来战吧！！！","","","","",""}
Lang.mission.str194 = {"本次神族争霸圆满结束！","","","","",""}

Lang.mission.str195 = {"战宝堂","","","","",""}
Lang.mission.str196 = {"战宝堂门庭大开，大神们速速组队前往，杀怪夺宝吧！","","","","",""}
Lang.mission.str197 = {"<color=yellow>[战宝堂报名阶段]\\r\\r<color=yellow>1.战宝堂结构：<color=green>战宝堂分为三层，第一层四个区，第二层两个区，第三层一个区，打完一层后，会开放通往下一层每个区的入口\\r\\r<color=yellow>2.BOSS刷出：<color=green>战宝堂每一层的堂主（BOSS）分别在活动剩余25分钟、20分钟、15分钟时刷出\\r\\r<color=yellow>3.BOSS归属：<color=green>给BOSS造成最后一击的个人、小队、家族可获得奖励\\r\\r<color=yellow>4.奖励规则：<color=green>奖励优先归属队伍，如无队伍，则归属家族，无队伍无家族时归属个人\\r\\r<color=yellow>5.注意：<color=green>活动内死亡，掉线、主动离开将退出本次战宝堂","","","","",""}
Lang.mission.str198 = {"<color=green>报名时间：<color=red>%s","","","","",""}
Lang.mission.str199 = {"<color=yellow>[战宝堂一层]\\r\\r<color=red>BOSS将在<color=yellow>活动剩余25分钟<color=red>时刷出\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}

Lang.mission.str200 = {"<color=yellow>[战宝堂一层]\\r\\r<color=red>一层堂主[鞭妖]已经出现！\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str201 = {"战宝堂一层[C区]堂主[鞭妖]已现身!","","","","",""}
Lang.mission.str202 = {"战宝堂一层[C区]堂主鞭妖已被击杀，第二层的门已经开通了！","","","","",""}
Lang.mission.str203 = {"<color=yellow>[战宝堂一层]\\r\\r<color=red>战宝堂二层入口已经刷出\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str204 = {"战宝堂一层[D区]堂主[鞭妖]已现身!","","","","",""}
Lang.mission.str205 = {"战宝堂一层[D区]堂主鞭妖已被击杀，第二层的门已经开通了！","","","","",""}
Lang.mission.str206 = {"<color=yellow>[战宝堂二层]\\r\\r<color=red>BOSS将在<color=yellow>活动剩余20分钟<color=red>时刷出\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str207 = {"<color=yellow>[战宝堂二层]\\r\\r<color=red>战宝堂二层堂主[傀儡]已经出现！\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str208 = {"战宝堂二层[A区]堂主[傀儡]已现身!","","","","",""}
Lang.mission.str209 = {"战宝堂二层[A区]堂主[傀儡]已被击杀，第三层的门已经开通了！","","","",""}

Lang.mission.str210 = {"<color=yellow>[战宝堂二层]\\r\\r<color=red>战宝堂三层入口已刷出\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str211 = {"<color=yellow>[战宝堂二层]\\r\\r<color=red>战宝堂二层堂主[傀儡]已经出现！\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str212 = {"战宝堂二层[B区]堂主[傀儡]已现身!","","","","",""}
Lang.mission.str213 = {"战宝堂二层[B区]堂主[傀儡]已被击杀，第三层的门已经开通了！","","","","",""}
Lang.mission.str214 = {"<color=yellow>[战宝堂三层]\\r\\r<color=red>BOSS将在<color=yellow>活动剩余15分钟<color=red>时刷出\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str215 = {"<color=yellow>[战宝堂三层]\\r\\r<color=red>战宝堂三层堂主[影魔]已经刷出！\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str216 = {"战宝堂三层堂主[影魔]已现身!","","","","",""}
Lang.mission.str217 = {"<color=yellow>[战宝堂三层]\\r\\r<color=red>战宝堂的boss们已被剿灭！下次再见！\\r\\r<color=yellow>\\b战宝堂规则\\b#","","","","",""}
Lang.mission.str218 = {"战宝堂已开始，一层堂主即将在战宝堂一层现身，大神们冲啊！","","","","",""}
Lang.mission.str219 = {"<color=yellow>[战宝堂已开始]\\r\\r<color=yellow>1.战宝堂结构：<color=green>战宝堂分为三层，第一层四个区，第二层两个区，第三层一个区，打完一层后，会开放通往下一层每个区的入口\\r\\r<color=yellow>2.BOSS刷出：<color=green>战宝堂每一层的堂主（BOSS）分别在活动剩余25分钟、20分钟、15分钟时刷出\\r\\r<color=yellow>3.BOSS归属：<color=green>给BOSS造成最后一击的个人、小队、家族可获得奖励\\r\\r<color=yellow>4.奖励规则：<color=green>奖励优先归属队伍，如无队伍，则归属家族，无队伍无家族时归属个人\\r\\r<color=yellow>5.注意：<color=green>活动内死亡，掉线、主动离开将退出本次战宝堂","","","","",""}

Lang.mission.str220 = {"战宝堂一层[A区]堂主[鞭妖]已现身!","","","","",""}
Lang.mission.str221 = {"战宝堂一层[A区]堂主鞭妖已被击杀，第二层的门已经开通了！","","","","",""}
Lang.mission.str222 = {"战宝堂一层[B区]堂主[鞭妖]已现身!","","","","",""}
Lang.mission.str223 = {"战宝堂一层[B区]堂主鞭妖已被击杀，第二层的门已经开通了！","","","","",""}
Lang.mission.str224 = {"<%s>小队经历一番血战，将%s的堂主斩落于马下！","","","","",""}
Lang.mission.str225 = {"[一层堂主]鞭妖","","","","",""}
Lang.mission.str226 = {"[二层堂主]傀儡","","","","",""}
Lang.mission.str227 = {"[三层堂主]影魔","","","","",""}
Lang.mission.str228 = {"无名Boss","","","","",""}
Lang.mission.str229 = {"<color=green>副本剩余时间：%s","","","","",""}

Lang.mission.str230 = {"消灭所有偷桃鸟","","","","",""}
Lang.mission.str231 = {"守卫啊~！快逃啊~！","","","","",""}
Lang.mission.str232 = {"副本剧情中","","","","",""}
Lang.mission.str233 = {"变身","","","","",""}
Lang.mission.str234 = {"我不发飙你当我有禽流感啊！？","","","","",""}
Lang.mission.str235 = {"消灭所有偷桃鸟人","","","","",""}
Lang.mission.str236 = {"副本完成","","","","",""}
Lang.mission.str237 = {"副本剧情中...","","","","",""}
Lang.mission.str238 = {"猴哥~~谢谢你带路！","","","","",""}
Lang.mission.str239 = {"不用谢！","","","","",""}

Lang.mission.str240= {"打败所有猕猴","","","","",""}
Lang.mission.str241= {"我们不客气咯~！","","","","",""}
Lang.mission.str242= {"打掉桃子","","","","",""}
Lang.mission.str243= {"呐~~~呐呢~！","","","","",""}
Lang.mission.str244= {"打败所有猕猴","","","","",""}
Lang.mission.str245= {"你最好别让我离你太近！","","","","",""}
Lang.mission.str246= {"烧死你这个入侵者！","","","","",""}
Lang.mission.str247= {"兄弟们！用眼睛盯死他！","","","","",""}
Lang.mission.str248= {"不知死活的家伙！烧死他！","","","","",""}
Lang.mission.str249= {"gogogo!快快做好出发的准备！","","","","",""}

Lang.mission.str250= {"消灭所有巨人奴隶","","","","",""}
Lang.mission.str251= {"巨人族你都敢惹！你活腻了是吧？","","","","",""}
Lang.mission.str252= {"看我这身造型就知道我是高手了！","","","","",""}
Lang.mission.str253= {"我看是你头硬还是我的锤硬！","","","","",""}
Lang.mission.str254= {"打败巨人侏儒","","","","",""}
Lang.mission.str255= {"用石头撞倒4个途经的巨人","","","","",""}
Lang.mission.str256= {"用石头撞倒4个巨人","","","","",""}
Lang.mission.str257= {"不是吧！又来一个巨人！","","","","",""}
Lang.mission.str258= {"我们小人国不是好欺负的！","","","","",""}
Lang.mission.str259= {"消灭所有牛兵","","","","",""}

Lang.mission.str260= {"消灭所有邪恶牛兵","","","","",""}
Lang.mission.str261= {"杀啊！","","","","",""}
Lang.mission.str262= {"大王疯啦！我们一定要阻止大王！","","","","",""}
Lang.mission.str263= {"走！干掉那群没用的东西！","","","","",""}
Lang.mission.str264= {"大王，你醒醒吧！","","","","",""}
Lang.mission.str265= {"快变回以前的你吧！","","","","",""}
Lang.mission.str266= {"哼，世人皆醉，老牛独醒，你们懂个球！","","","","",""}
Lang.mission.str267= {"打败邪恶牛兵","","","","",""}
Lang.mission.str268= {"没想到我牛大王又回来了吧！","","","","",""}
Lang.mission.str269= {"打败邪化牛魔王","","","","",""}

Lang.mission.str270= {"我不能被发现，跟着我的分身走吧！","","","","",""}
Lang.mission.str271= {"竟有人发现这秘道！","","","","",""}
Lang.mission.str272= {"带着火焰圈使劲冲吧！","","","","",""}
Lang.mission.str273= {"消灭所有鱼怪","","","","",""}
Lang.mission.str274= {"遭了！他们怀疑我了！救我！","","","","",""}
Lang.mission.str275= {"带着寒冰圈把他们冰住吧！","","","","",""}
Lang.mission.str276= {"啊~~~~妈呀！","","","","",""}
Lang.mission.str277= {"不是吧！还来啊！","","","","",""}
Lang.mission.str278= {"怕怕啊！再帮你一把！你自己去吧！","","","","",""}
Lang.mission.str279= { "带着火焰圈使劲冲吧！","","","","",""}

Lang.mission.str280= {"这里的东西是你想拿走就拿走的吗？","","","","",""}
Lang.mission.str281= {"给我往死里揍~","","","","",""}
Lang.mission.str282= {"消灭4个鱼怪恶霸","","","","",""}
Lang.mission.str283= {"拿走宝物","","","","",""}
Lang.mission.str284= {"走~","","","","",""}
Lang.mission.str285= {"快~！快阻止那个魔兵！","","","","",""}
Lang.mission.str286= {"你是来送死的吧！","","","","",""}
Lang.mission.str287= {"消灭烦人的魔兵","","","","",""}
Lang.mission.str288= {"亲！别激动！放开那个石头吧！","","","","",""}
Lang.mission.str289= {"你们死期到了！","","","","",""}

Lang.mission.str290= {"啊~~","","","","",""}
Lang.mission.str291= {"终于，我终于又重见天日啦！","","","","",""}
Lang.mission.str292= {"击败邪恶魔人","","","","",""}
Lang.mission.str293= {"哈哈！鱼钓不到！上门两只狗！爽啊~","","","","",""}
Lang.mission.str294= {"你谁啊？你知道什么叫先到先得吗？","","","","",""}
Lang.mission.str295= {"拦住他！","","","","",""}
Lang.mission.str296= {"打败前来阻拦的钓鱼翁","","","","",""}
Lang.mission.str297= {"看来我要亲自出手了！","","","","",""}
Lang.mission.str298= {"打败超猛钓鱼翁","","","","",""}
Lang.mission.str299= {"趁现在！快跑！","","","","",""}

Lang.mission.str300= {"打败所有天香羚","","","","",""}
Lang.mission.str301= {"有采花贼啊！撞翻他！","","","","",""}
Lang.mission.str302= {"采集天香草","","","","",""}
Lang.mission.str303= {"哼！竟然那么快找到我的藏身之处！","","","","",""}
Lang.mission.str304= {"18老人！！！出来灭口！","","","","",""}
Lang.mission.str305= {"击败百年老妖","","","","",""}
Lang.mission.str306= {"打败所有百年老妖","","","","",""}
Lang.mission.str307= {"打开宝塔","","","","",""}
Lang.mission.str308= {"收服30只妖怪","","","","",""}
Lang.mission.str309= {"哼！还用这招！没那么容易！","","","","",""}

Lang.mission.str310= {"纳命来！","","","","",""}
Lang.mission.str311= {"先把千年老妖打败","","","","",""}
Lang.mission.str312= {"打败千年老妖","","","","",""}
Lang.mission.str313= {"剧情动画中","","","","",""}
Lang.mission.str314= {"救命啊~！后面很多牛鬼蛇神啊~！","","","","",""}
Lang.mission.str315= {"哇哈哈~高手出场都是带特效的！","","","","",""}
Lang.mission.str316= {"72变变啥都可以！不信来找我啊","","","","",""}
Lang.mission.str317= {"今天树妖联谊！你人类来这干嘛？","","","","",""}
Lang.mission.str318= {"打败所有老树精","","","","",""}
Lang.mission.str319= {"你把妞都打跑了！还联什么谊？","","","","",""}

Lang.mission.str320= {"打败老树妖","","","","",""}
Lang.mission.str321= {"我是一只羊！一只很可爱的羊！","","","","",""}
Lang.mission.str322= {"找到孙悟空","","","","",""}
Lang.mission.str323= {"哎哟！不错哦！是有两下子！","","","","",""}
Lang.mission.str324= {"接下来就没那么容易罗！","","","","",""}
Lang.mission.str325= {"上次是你走运！有种再来找我！","","","","",""}
Lang.mission.str326= {"兄弟们！有人类来抢我们的日光浴！","","","","",""}
Lang.mission.str327= {"打败骚扰的蟹精","","","","",""}
Lang.mission.str328= {"我的壳好重啊！能帮我背背吗？","","","","",""}
Lang.mission.str329= {"打败骚扰的大蟹精","","","","",""}

Lang.mission.str330= {"使用宝物","","","","",""}
Lang.mission.str331= {"使用XX网","","","","",""}
Lang.mission.str332= {"啊~~~疼死我了！","","","","",""}
Lang.mission.str333= {"捕获怪鱼","","","","",""}
Lang.mission.str334= {"岂有此理！我不服！再来！","","","","",""}

Lang.mission.str335= {"哼！这次变一个你永远猜不到的东西","","","","",""}
Lang.mission.str336= {"人类来这干嘛！快走快走！","","","","",""}
Lang.mission.str337= {"打败所有狐狸","","","","",""}
Lang.mission.str338= {"岂有此理！敢伤我同胞！","","","","",""}
Lang.mission.str339= {"我要为同胞报仇","","","","",""}

Lang.mission.str340= {"打败狐狸精","","","","",""}
Lang.mission.str341= {"点燃小庙","","","","",""}
Lang.mission.str342= {"哎哟~妈呀！烧死我了！","","","","",""}
Lang.mission.str343= {"你想烧死我啊？再斗下去迟早没命啊","","","","",""}
Lang.mission.str344= {"好吧！我承认你的却有两下子！","","","","",""}

Lang.mission.str345= {"你先帮我赶走那些顽皮的鼓灵吧！","","","","",""}
Lang.mission.str346= {"引出鼓灵","","","","",""}
Lang.mission.str347= {"打败顽皮的鼓灵","","","","",""}
Lang.mission.str348= {"来来来！打雷啰！","","","","",""}
Lang.mission.str349= {"开工啰！开工啰！","","","","",""}

Lang.mission.str350= {"打完就收工噜！","","","","",""}
Lang.mission.str351= {"一道破墙都要费那么大劲吗？","","","","",""}
Lang.mission.str352= {"打败邪恶牛兵团长","","","","",""}
Lang.mission.str353= {"打败所有巨型天香羚","","","","",""}

Lang.mission.str354= {"那些讨厌的大螃蟹总骚扰我捡贝壳！","","","","",""}
Lang.mission.str355= {"小妞！陪我们玩会吧！","","","","",""}
Lang.mission.str356= {"打败骚扰的蟹精","","","","",""}
Lang.mission.str357= {"有胆就进大海来捉我啊！","","","","",""}
Lang.mission.str358= {"就算淹死我也要揍你一顿！","","","","",""}
Lang.mission.str359= {"人家打架关你什么事呢！","","","","",""}

Lang.mission.str360= {"打败骚扰的大蟹精","","","","",""}
Lang.mission.str361= {"我要好好的教训它们！","","","","",""}
Lang.mission.str362= {"打败骚扰的仙草灵","","","","",""}
Lang.mission.str363= {"打败大仙草灵","","","","",""}
Lang.mission.str364= {"滚开！这是我的！","","","","",""}
Lang.mission.str365= {"你来的刚好！我肚子饿了！","","","","",""}
Lang.mission.str366= {"打败全部僵尸兵","","","","",""}
Lang.mission.str367= {"我会告诉你我右手为啥特别壮吗？","","","","",""}
Lang.mission.str368= {"打败精英僵尸兵","","","","",""}
Lang.mission.str369= {"夺回仙灵草","","","","",""}

Lang.mission.str370= {"那个人又来了！砍他！","","","","",""}
Lang.mission.str371= {"打败全部僵尸兵","","","","",""}
Lang.mission.str372= {"现在的人那么浪！抢东西还敢回来啊","","","","",""}
Lang.mission.str373= {"打败魔王分身","","","","",""}
Lang.mission.str374= {"我就是要污染这些仙泉水！怎么着！？","","","","",""}
Lang.mission.str375= {"变形！！","","","","",""}
Lang.mission.str376= {"我能变出我所看到过的东西！","","","","",""}
Lang.mission.str377= {"击败变形后的水妖","","","","",""}
Lang.mission.str378= {"哼！我再变！","","","","",""}
Lang.mission.str379= {"变个猴！你吓坏了吧！","","","","",""}

Lang.mission.str380= {"击败变形后的水妖","","","","",""}
Lang.mission.str381= {"开启法宝吸出水妖","","","","",""}
Lang.mission.str382= {"大神！饶命啊！饶命啊！","","","","",""}
Lang.mission.str383= {"我再也不来搞事啦！放条生路吧！","","","","",""}
Lang.mission.str384= {"哼！骗你的！","","","","",""}
Lang.mission.str385= {"打败水妖变成的怨灵","","","","",""}
Lang.mission.str386= {"多管闲事都得死！","","","","",""}
Lang.mission.str387= {"打败水妖变成的鬼王","","","","",""}
Lang.mission.str388= {"有事好商量嘛！都是诗文人啊！","","","","",""}
Lang.mission.str389= {"打败水妖变成的阿婆","","","","",""}

Lang.mission.str390= {"哈哈哈！你竟然傻乎乎的跟我到这！","","","","",""}
Lang.mission.str391= {"打败所有熔岩魔兵","","","","",""}
Lang.mission.str392= {"先带徐福去万魔城！这里我来摆平！","","","","",""}
Lang.mission.str393= {"想过这里先问问我的刀愿不愿意！","","","","",""}
Lang.mission.str394= {"打败熔岩刀将","","","","",""}
Lang.mission.str395= {"我了个去！追上来了！跑啊~","","","","",""}
Lang.mission.str396= {"快跑啊！","","","","",""}
Lang.mission.str397= {"追上逃跑的徐福","","","","",""}
Lang.mission.str398= {"果然好身手！但你阻止不了我的！","","","","",""}
Lang.mission.str399= {"你们两个摆平他！","","","","",""}

Lang.mission.str400= {"死吧死吧！","","","","",""}
Lang.mission.str401= {"打败熔岩将军和魔兵","","","","",""}
Lang.mission.str402= {"这里的酒香得一塌糊涂！","","","","",""}
Lang.mission.str403= {"打败所有虫子","","","","",""}
Lang.mission.str404= {"好想在这里泡一辈子啊！","","","","",""}
Lang.mission.str405= {"有人偷袭！干掉他！","","","","",""}
Lang.mission.str406= {"打败所有魔化盗贼","","","","",""}
Lang.mission.str407= {"杀啊！","","","","",""}
Lang.mission.str408= {"大胆！","","","","",""}
Lang.mission.str409= {"打败所有机关兽","","","","",""}

Lang.mission.str410= {"又是你啊！今天我要把你灭掉！","","","","",""}
Lang.mission.str411= {"让你尝尝我的厉害吧！","","","","",""}
Lang.mission.str412= {"你来迟了！大将军准备要苏醒了！","","","","",""}
Lang.mission.str413= {"打败大魔将","","","","",""}
Lang.mission.str414= {"打败所有魔兵刀将","","","","",""}
Lang.mission.str415= {"魔力……把你们的魔力给我……","","","","",""}
Lang.mission.str416= {"将军的意思……难道！？","","","","",""}
Lang.mission.str417= {"呐呢~~~","","","","",""}
Lang.mission.str418= {"哈哈哈…………","","","","",""}
Lang.mission.str419= {"快跑！","","","","",""}

Lang.mission.str420= {"这感觉！！倍儿爽！","","","","",""}
Lang.mission.str421= {"我的剑好久没喝过新鲜的血啦。。","","","","",""}
Lang.mission.str422= {"击败复活的大将军","","","","",""}
Lang.mission.str423= {"陪我们玩会吧！","","","","",""}
Lang.mission.str424= {"纳命来！！","","","","",""}
Lang.mission.str425= {"果然好身手！但你阻止不了我见魔王","","","","",""}
Lang.mission.str426= {"你们两个摆平他！","","","","",""}
Lang.mission.str427= {"快看!来了个肥头大耳的妖怪！","","","","",""}
Lang.mission.str428= {"有种你别跑！","","","","",""}
Lang.mission.str429= {"有人来了！上~","","","","",""}

Lang.mission.str430= {"消灭所有河妖","","","","",""}
Lang.mission.str431= {"哪来的战斗鸡啊！！","","","","",""}
Lang.mission.str432= {"看我动感光波，比卜~比卜~","","","","",""}
Lang.mission.str433= {"消灭所有河妖","","","","",""}
Lang.mission.str434= {"消灭所有河怪","","","","",""}
Lang.mission.str435= {"让你尝尝痛苦的滋味！","","","","",""}
Lang.mission.str436= {"翔弟们~~合体！","","","","",""}
Lang.mission.str437= {"人类~死在我翔星人手里吧！","","","","",""}
Lang.mission.str438= {"消灭大河怪","","","","",""}
Lang.mission.str439= {"来来来！过来给大爷抱抱！","","","","",""}

Lang.mission.str440= {"消灭所有强盗","","","","",""}
Lang.mission.str441= {"一支穿云箭！千军万马来相见！","","","","",""}
Lang.mission.str442= {"哇哈哈！你等着！兄弟们就要来了！","","","","",""}
Lang.mission.str443= {"兄弟们~！就是这人坏了我们好事~！","","","","",""}
Lang.mission.str444= {"就是你伤我兄弟？","","","","",""}
Lang.mission.str445= {"赶时间！让我先上……","","","","",""}
Lang.mission.str446= {"捉住他！","","","","",""}
Lang.mission.str447= {"消灭山贼首领们","","","","",""}
Lang.mission.str448= {"兄弟你快上，我们给你垫后！","","","","",""}
Lang.mission.str449= {"滚！","","","","",""}

Lang.mission.str450= {"哈哈，又有人来和我玩了！","","","","",""}
Lang.mission.str451= {"我可爱的分身出来吧！","","","","",""}
Lang.mission.str452= {"亲他！","","","","",""}
Lang.mission.str453= {"打败年兽分身","","","","",""}
Lang.mission.str454= {"我要更多更多的分身！","","","","",""}
Lang.mission.str455= {"给我尽情的打！哈哈~","","","","",""}
Lang.mission.str456= {"哈哈~！我变态吧！","","","","",""}
Lang.mission.str457= {"看来你挺厉害的样子啊，我再来！","","","","",""}
Lang.mission.str458= {"走起！","","","","",""}
Lang.mission.str459= {"根本停不下来！","","","","",""}

Lang.mission.str460= {"谁输了！以后就不准调皮！","","","","",""}
Lang.mission.str461= {"打败年兽主体","","","","",""}
Lang.mission.str462= {"打败熊精","","","","",""}
Lang.mission.str463= {"这是什么！好漂亮的赶脚！","","","","",""}
Lang.mission.str464= {"我想摸一下！","","","","",""}
Lang.mission.str465= {"啊~突然好愤怒！","","","","",""}
Lang.mission.str466= {"打败狂暴熊精","","","","",""}
Lang.mission.str467= {"采集药草","","","","",""}
Lang.mission.str468= {"打败毒物","","","","",""}
Lang.mission.str469= {"你谁啊！敢跟我抢饭吃！","","","","",""}

Lang.mission.str470= {"后果很严重哦！","","","","",""}
Lang.mission.str471= {"神马在我面前晃来晃去！？","","","","",""}
Lang.mission.str472= {"好饿啊！这位朋友！你能给我舔一下吗？","","","","",""}
Lang.mission.str473= {"打败蟾蜍精","","","","",""}
Lang.mission.str474= {"你的头会比我们的石头硬吗？哈哈~","","","","",""}
Lang.mission.str475= {"警告你别走靠前了！","","","","",""}
Lang.mission.str476= {"打败狂暴熊精","","","","",""}
Lang.mission.str477= {"躲开巨石","","","","",""}
Lang.mission.str478= {"再往前你会后悔的！","","","","",""}
Lang.mission.str479= {"把他推到桥下去！","","","","",""}

Lang.mission.str480= {"还让不让人家睡午觉！？","","","","",""}
Lang.mission.str481= {"我现在***想揍人了！","","","","",""}
Lang.mission.str482= {"朋友！石头砸到我腿了！快赔偿！","","","","",""}
Lang.mission.str483= {"打败西域飞龙","","","","",""}
Lang.mission.str484= {"啊~那大家伙又来啦！快跑啊~","","","","",""}
Lang.mission.str485= {"打败牛头守卫","","","","",""}
Lang.mission.str486= {"打败牛头守卫和队长","","","","",""}
Lang.mission.str487= {"大王！如果失败了会怎样！","","","","",""}
Lang.mission.str488= {"我的计策那是万无一失的！","","","","",""}
Lang.mission.str489= {"怎么闯进来个人？守卫都去哪了？","","","","",""}

Lang.mission.str490= {"快干掉他！不然事情就败露了！","","","","",""}
Lang.mission.str491= {"打败牛头团长","","","","",""}
Lang.mission.str492= {"哼~没有人能阻止得了我！","","","","",""}
Lang.mission.str493= {"你这么拽！你家里人知道吗？","","","","",""}
Lang.mission.str494= {"打败牛魔王","","","","",""}
Lang.mission.str495= {"打败江湖人士","","","","",""}
Lang.mission.str496= {"天残，天残，实力最强！","","","","",""}
Lang.mission.str497= {"肾虚公子我爱你！就像老鼠爱大米！","","","","",""}
Lang.mission.str498= {"艾玛！！踩到人啦！","","","","",""}
Lang.mission.str499= {"你有厉害点的招式吗？","","","","",""}

Lang.mission.str500= {"暂停！我好像闻到高手的味道！","","","","",""}
Lang.mission.str501= {"去吧去吧！反正我不赶时间！","","","","",""}
Lang.mission.str502= {"就喜欢把高手踩到脚下！哈哈哈~","","","","",""}
Lang.mission.str503= {"打败天残脚","","","","",""}
Lang.mission.str504= {"你们在这等我！1分钟保证完事！","","","","",""}
Lang.mission.str505= {"记得发工资啊~","","","","",""}
Lang.mission.str506= {"打败肾虚公子","","","","",""}
Lang.mission.str507= {"唤醒战斗种子","","","","",""}
Lang.mission.str508= {"烧光所有绿色植物~","","","","",""}
Lang.mission.str509= {"打败熔岩怪","","","","",""}

Lang.mission.str510= {"唤醒战斗种子","","","","",""}
Lang.mission.str511= {"最讨厌植物的了！","","","","",""}
Lang.mission.str512= {"前进！前进！前进进！","","","","",""}
Lang.mission.str513= {"不要放过任何一个妹子！不~是种子！","","","","",""}
Lang.mission.str514= {"下一波怪即将到来","","","","",""}
Lang.mission.str515= {"岂有此理！你以为在植物大战僵尸啊！？","","","","",""}
Lang.mission.str516= {"我要为我爹报仇！纳命来！","","","","",""}
Lang.mission.str517= {"打败红孩儿和熔岩兵","","","","",""}
Lang.mission.str518= {"击败所有岩浆怪","","","","",""}
Lang.mission.str519= {"来！证明一下你的实力吧！","","","","",""}

Lang.mission.str520= {"打败巨灵神和天兵","","","","",""}
Lang.mission.str521= {"你体内上涌的力量是怎么回事！？","","","","",""}
Lang.mission.str522= {"打败哪咤和天兵","","","","",""}
Lang.mission.str523= {"竟然在你体内散发着超越神的力量！","","","","",""}
Lang.mission.str524= {"快把真本事拿出来！让我战个痛快！","","","","",""}
Lang.mission.str525= {"打败二郎神和天兵","","","","",""}
Lang.mission.str526= {"打败二郎神","","","","",""}
Lang.mission.str527= {"你不觉得你有点自不量力么？","","","","",""}
Lang.mission.str528= {"我不会手下留情的！","","","","",""}
Lang.mission.str529= {"打败巨灵神","","","","",""}

Lang.mission.str530= {"打败哪咤","","","","",""}
Lang.mission.str531= {"我战力是你1万倍！！腿软了吧？","","","","",""}
Lang.mission.str532= {"我又怎会输给战力只有5的渣渣呢！","","","","",""}
Lang.mission.str533= {"打败二郎神","","","","",""}
Lang.mission.str534= {"哪咤来也！","","","","",""}
Lang.mission.str535= {"他们的支援来！小心！","","","","",""}
Lang.mission.str536= {"击败魔兵","","","","",""}
Lang.mission.str537= {"看！流星啊~","","","","",""}
Lang.mission.str538= {"我的大刀早已饥渴难耐啦！","","","","",""}
Lang.mission.str539= {"击败恶魔将军","","","","",""}

Lang.mission.str540= {"击败守卫","","","","",""}
Lang.mission.str541= {"有人来捣乱啦！","","","","",""}
Lang.mission.str542= {"哎玛！","","","","",""}
Lang.mission.str543= {"小心他的群招！","","","","",""}
Lang.mission.str544= {"击败鱼怪","","","","",""}
Lang.mission.str545= {"敢跑到这里捣乱！别让他跑了！","","","","",""}
Lang.mission.str546= {"快放下武器吧！你已被包围了！","","","","",""}
Lang.mission.str547= {"哼！你以为就这样？","","","","",""}
Lang.mission.str548= {"全给我上！","","","","",""}
Lang.mission.str549= {"揍他脸！","","","","",""}

Lang.mission.str550= {"唷~！还带了个小妞！","","","","",""}
Lang.mission.str551= {"好像很猛的样子！","","","","",""}
Lang.mission.str552= {"大王！顶不住啦！","","","","",""}
Lang.mission.str553= {"击败三太子","","","","",""}
Lang.mission.str554= {"你未免太小看我了吧！","","","","",""}
Lang.mission.str555= {"看我的！","","","","",""}
Lang.mission.str556= {"哈哈哈！懵了吧~！","","","","",""}
Lang.mission.str557= {"击败龙妖","","","","",""}
Lang.mission.str558= {"采集中...","","","","",""}
Lang.mission.str559= {"您正在副本大厅排队中，进入此副本将会使您退出队伍","","","","",""}

Lang.mission.str560= {"您已经在扫荡副本中，不能重复进入副本","","","","",""}
Lang.mission.str561= {"您的进入副本次数为0了，今天不能再进入副本","","","","",""}
Lang.mission.str562= {"扫荡正在加速中","","","","",""}
Lang.mission.str563= {"今天购买次数已到上限，明天再来吧~","","","","",""}
Lang.mission.str564= {"购买单人副本次数需要%s元宝，您的元宝不足","","","","",""}
Lang.mission.str565= {"<color=green>距离怪的到来还有%s","","","","",""}
Lang.mission.str566= {"<playername>:我的视线渐渐模糊，我想我已经支撑不下去了。","","","","",""}
Lang.mission.str567= {"任务失败","","","","",""}
Lang.mission.str568= {"<color=green>第三层剩余时间%s","","","","",""}
Lang.mission.str569= {"第一批怪来袭","","","","",""}

Lang.mission.str570= {"第二批怪来袭","","","","",""}
Lang.mission.str571= {"第三批怪来袭","","","","",""}
Lang.mission.str572= {"第四批怪来袭","","","","",""}
Lang.mission.str573= {"第五批怪来袭","","","","",""}
Lang.mission.str574= {"第六批怪来袭","","","","",""}
Lang.mission.str575= {"第七批怪来袭","","","","",""}
Lang.mission.str576= {"第八批怪来袭","","","","",""}
Lang.mission.str577= {"第九批怪来袭","","","","",""}
Lang.mission.str578= {"李晓进入战斗","","","","",""}
Lang.mission.str579= {"可以进入下一层登天塔","","","","",""}

Lang.mission.str580= {"<playername>:来了，击败来敌","","","","",""}
Lang.mission.str581= {"木宽参与战斗","","","","",""}
Lang.mission.str582= {"<playername>:三下五除二，果断解决","","","","",""}
Lang.mission.str583= {"白怀远参与战斗","","","","",""}
Lang.mission.str584= {"赖新参与战斗","","","","",""}
Lang.mission.str585= {"冀燕北参与战斗","","","","",""}
Lang.mission.str586= {"兵卫统领参与战斗","","","","",""}
Lang.mission.str587= {"巨齿参与战斗","","","","",""}
Lang.mission.str588= {"怨魂参与战斗","","","","",""}
Lang.mission.str589= {"迷蝶参与战斗","","","","",""}

Lang.mission.str590= {"吞食蜂参与战斗","","","","",""}
Lang.mission.str591= {"地缚凶尸参与战斗","","","","",""}
Lang.mission.str592= {"骨灵参与战斗","","","","",""}
Lang.mission.str593= {"卓不群进入战斗","","","","",""}
Lang.mission.str594= {"雪妖参与战斗","","","","",""}
Lang.mission.str595= {"长脚翁参与战斗","","","","",""}
Lang.mission.str596= {"熔灵参与战斗","","","","",""}
Lang.mission.str597= {"匡萝参与战斗","","","","",""}
Lang.mission.str598= {"鬼王参与战斗","","","","",""}
Lang.mission.str599= {"明纪参与战斗","","","","",""}

Lang.mission.str600= {"<color=green>离本关开启还有%s","","","","",""}
Lang.mission.str601= {"<color=green>本关剩余时间%s","","","","",""}
Lang.mission.str602= {"任务完成","","","","",""}
Lang.mission.str603= {"任务失败","","","","",""}
Lang.mission.str604= {"<playername>:怎么突然看不清前方的道路了，这里是什么地方？<end><playername>: 好厉害的阵法，看来只能强行破阵而出了<end>","","","","",""}
Lang.mission.str605= {"<playername>: 看来布阵的高人对我们没有什么恶意，还是稍等他来给我们解阵吧<end>","","","","",""}
Lang.mission.str606= {"打破阵眼，破阵而出","","","","",""}
Lang.mission.str607= {"<playername>: 真是个厉害的阵法，布阵之人必是当世奇人<end>","","","","",""}
Lang.mission.str608= {"乾卦显现，击杀乾兵","","","","",""}
Lang.mission.str609= {"坤卦显现，击杀坤兵","","","","",""}

Lang.mission.str610= {"坎卦显现，击杀冰魄","","","","",""}
Lang.mission.str611= {"离卦显现，击杀火魂","","","","",""}
Lang.mission.str612= {"震卦显现，击杀雷鬼","","","","",""}
Lang.mission.str613= {"艮卦显现，击杀石人","","","","",""}
Lang.mission.str614= {"巽卦显现，击杀风狼","","","","",""}
Lang.mission.str615= {"兑卦破损露出阵石，破坏这些阵石","","","","",""}
Lang.mission.str616= {"<color=green>%s后进入下一关","","","","",""}
Lang.mission.str617= {"打破阵眼，破阵而出","","","","",""}
Lang.mission.str618= {"<playername>: 怎么出现一片枯林，感觉甚是诡异。<end><npc=8010>: 不知道所谓又狂妄自大的人类，你们如果现在退去我可以不介意你们的冒犯！<end>","","","","",""}
Lang.mission.str619= {"杀掉突然出现的毒虫","","","","",""}

Lang.mission.str620= {"<npc=8010>: 竟然如此屠戮我的子民，过来领死！<end>","","","","",""}
Lang.mission.str621= {"击杀虫王","","","","",""}
Lang.mission.str622= {"<playername>: 此地竟然还有这样的怪物，真是不可思议<end>","","","","",""}
Lang.mission.str623= {"<color=green>还有%s进入下一关","","","","",""}
Lang.mission.str624= {"<playername>: 今日春光明媚天朗气清，真是个郊游的好天气。<end><npc=8049>: 吓跑了我的鱼儿，留下来过几招吧！<end>","","","","",""}
Lang.mission.str625= {"<npc=8049>: 子非鱼，安知鱼之乐<end>","","","","",""}
Lang.mission.str626= {"击败钓鱼翁","","","","",""}
Lang.mission.str627= {"<npc=8049>: 几个小鬼，竟..竟然..如此厉害。<end>","","","","",""}
Lang.mission.str628= {"<playername>: 哈，原来是个市集，好热闹啊<end><npc=8004>: 小妞，别卖菜了，陪哥哥去转转。<end>","","","","",""}
Lang.mission.str629= {"<playername>: 我竟然连几个小流氓都打不过，我以后还能当大侠吗？<end>","","","","",""}

Lang.mission.str630= {"出手教训一下这几个流氓","","","","",""}
Lang.mission.str631= {"<npc=8004>: 有种的你们不要走<end>","","","","",""}
Lang.mission.str632= {"打退地痞，先休息一会","","","","",""}
Lang.mission.str633= {"<npc=8005>: 打了我的人还在这闲逛，简直不知死活！<end>","","","","",""}
Lang.mission.str634= {"手下见真章","","","","",""}
Lang.mission.str635= {"<playername>: 不过几个小流氓而已，作为未来大侠的我伸伸手就打发了。<end>","","","","",""}
Lang.mission.str636= {"<playername>: 这僵王刚从镇压中脱离怎的就如此强大，赶紧走！<end>","","","","",""}
Lang.mission.str637= {"<playername>: 这里似乎镇压着一个强大的幽冥生物啊！<end><playername>: 大家开工吧，今天的目标就是这个了<end>","","","","",""}
Lang.mission.str638= {"解除三座镇压之井的守卫","","","","",""}
Lang.mission.str639= {"<color=green>距离结束还有%s","","","","",""}

Lang.mission.str640= {"击杀解封的僵王","","","","",""}
Lang.mission.str641= {"<playername>: 我们办到了<end>","","","","",""}
Lang.mission.str642= {"<npc=8067>: 这感觉~~仿佛重生一样！作为回报，我会将你装入我的肚子。<end>","","","","",""}
Lang.mission.str643= {"把僵王暴露在强光下可以极大地削弱它","","","","",""}
Lang.mission.str644= {"<npc=8025>: 这地方，闷也闷死了，我就不陪你们了！<end>","","","","",""}
Lang.mission.str645= {"<playername>: 我们掉到了什么地方？黑黑的怎么什么都看不见<end>","","","","",""}
Lang.mission.str646= {"点燃阶梯下的火把","","","","",""}
Lang.mission.str647= {"<npc=8025>: 嘿嘿，我可以送你们出去，但是我刚刚触动了机关，被锁在这了，你们去那个房间打倒铁尸，把钥匙抢过来帮我开锁<end>","","","","",""}
Lang.mission.str648= {"打倒铁尸","","","","",""}
Lang.mission.str649= {"<npc=8025>: 终于把这身锁铐解开了，我先活动活动手脚，你们先去前面开路<end>","","","","",""}

Lang.mission.str650= {"打通出古墓的道路","","","","",""}
Lang.mission.str651= {"<color=green>%s后进入下一关卡","","","","",""}
Lang.mission.str652= {"<playername>: 这里好黑，谁赶紧点把火<end><playername>: 虽然不知道这里是哪里，但是看起来很厉害的样子<end>","","","","",""}
Lang.mission.str653= {"<npcname=未知的声音>： 嘤嘤嘤~~~求求你~~~救救我~~~~<end>","","","","",""}
Lang.mission.str654= {"杀死所有的鬼魂","","","","",""}
Lang.mission.str655= {"<playername>: 当年这里一定发生了什么可怕的事情<end>","","","","",""}
Lang.mission.str656= {"<playername>: 只是数滴血液吗？就让我们被困于此<end>","","","","",""}
Lang.mission.str657= {"<playername>: 据说曾经有一队前辈在这里斩杀过一只绝世大凶的手<end><playername>: 这是当时那只手所滴落的血液，时间消磨了血珠的凶性，但是它依然充满攻击性<end>","","","","",""}
Lang.mission.str658= {"<color=green>距离结束还有%s","","","","",""}
Lang.mission.str659= {"杀掉突然出现的怪物","","","","",""}

Lang.mission.str660= {"怪物继续出现了","","","","",""}
Lang.mission.str661= {"地面的颜色渐渐恢复，看来是最后一批怪物了","","","","",""}
Lang.mission.str662= {"<playername>: 这么长岁月的流逝，仅仅是残肢的几滴血还依旧有这样的威能，它的主人究竟到了什么地步<end>","","","","",""}
Lang.mission.str663= {"<playername>: 这家伙是在太厉害了<end>","","","","",""}
Lang.mission.str664= {"<playername>: 再往前走点应该就可以探索玩整个遗迹了<end><playername>: 好像出现了一下了不得的东西<end>","","","","",""}
Lang.mission.str665= {"杀掉前方出现的怪物","","","","",""}
Lang.mission.str666= {"<playername>: 空气中好像带着莫名的激动<end><npc=8016>: 多久了？我多久没有感受到这份嗜血的冲动了！<end>","","","","",""}
Lang.mission.str667= {"<npc=8016>: 不！！我不能让这份冲动蒙蔽住我的心。<end>","","","","",""}
Lang.mission.str668= {"击败金不欢","","","","",""}
Lang.mission.str669= {"<playername>: 这家伙什么来路，真是疯狂<end>","","","","",""}

Lang.mission.str670= {"<playername>: 这里空气清新，林幽蝉静，置身于此心情格外舒畅<end>","","","","",""}
Lang.mission.str671= {"<playername>: 看来此物对我们敌意颇深，我们还是退去吧<end>","","","","",""}
Lang.mission.str672= {"驱赶受惊的灵精","","","","",""}
Lang.mission.str673= {"<playername>: 山中的精灵们对外人还是有深深的敌意，让她离开吧<end>","","","","",""}
Lang.mission.str674= {"<playername>: 这地方太安静了，安静得我心里有些不安<end><playername>: 这是狼嚎，是狼群，快，挡住它们！<end>","","","","",""}
Lang.mission.str675= {"<playername>: 我的视线渐渐模糊，我想我已经支撑不下去了。<end>","","","","",""}
Lang.mission.str676= {"抵挡住狼群的进攻","","","","",""}
Lang.mission.str677= {"<color=green>本关剩余时间：%s","","","","",""}
Lang.mission.str678= {"杀死狼王","","","","",""}
Lang.mission.str679= {"<playername>: 没想到这狼群还有王者的存在<end>","","","","",""}

Lang.mission.str680= {"<playername>: 这地方让我很不安。<end><npc=8046>: 来着何人！现在就离去我可以不介意你的冒犯<end>","","","","",""}
Lang.mission.str681= {"<npc=8046>: 一群不自量力的蠢货！<end>","","","","",""}
Lang.mission.str682= {"击败罗虎","","","","",""}
Lang.mission.str683= {"<npc=8046>: 你们...<end>","","","","",""}
Lang.mission.str684= {"<playername>: 如此猛烈的药味，这是何人的居所<end><npc=8043>: 欢迎，欢迎。作为一名伟大的医者，让我来诊治一下你们身上的病痛吧！<end>","","","","",""}
Lang.mission.str685= {"<npc=8043>: 那边貌似还有病人等我救治，我去那看看。<end>","","","","",""}
Lang.mission.str686= {"击败木否愚","","","","",""}
Lang.mission.str687= {"<npc=8043>: 医者……终究不能自医……<end>","","","","",""}
Lang.mission.str688= {"站在葫芦的散落的药渣中可以获得增益效果","","","","",""}
Lang.mission.str689= {"打破药桶可以清除所有绿烟的负面状态，不过会有些副作用。","","","","",""}

Lang.mission.str690= {"<playername>: 似乎走进了一个养鸡场，前面有位大妈，前去打个招呼<end><npcname=养鸡场负责人>:天高酒楼在我这定了30只鸡，要杀好清洗赶紧给送过去，不过我这没这么多人手了，麻烦各位帮忙杀一下鸡吧。记住只要杀母鸡就行了，公鸡是配种或者村民自己留着报晓的。<end>","","","","",""}
Lang.mission.str691= {"<npcname=养鸡场负责人>: 你们还是走吧，以后没这金刚钻，别揽瓷器活<end>","","","","",""}
Lang.mission.str692= {"杀死30只母鸡，注意不要杀死公鸡","","","","",""}
Lang.mission.str693= {"<playername>: 随便动动手指就解决了，真是轻而易举。<end>","","","","",""}
Lang.mission.str694= {"<npc=8002>: 你们竟敢杀死我们用来报晓的公鸡，是不是隔壁村派来的！<end>","","","","",""}
Lang.mission.str695= {"击退前来质问的村民","","","","",""}
Lang.mission.str696= {"<playername>: 虽然暂时把他们击退，不过我们还是赶紧离开吧<end>","","","","",""}
Lang.mission.str697= {"<playername>: 到处都是些木头人，我们是不是走到什么奇怪的地方了？<end><npcname=神秘的声音>: 呦，新来的小朋友们，有没有兴趣陪我的新玩具们打一场？<end>","","","","",""}
Lang.mission.str698= {"<npcname=神秘的声音>: 哈哈，这几个我徒孙的练手之作解决不了，我劝你们还是别往前走了。<end>","","","","",""}
Lang.mission.str699= {"击败所有木人","","","","",""}

Lang.mission.str700= {"<npcname=神秘的声音>: 哈哈，不错不错，你们几个看起来有点意思<end>","","","","",""}
Lang.mission.str701= {"<playername>: 这里是什么地方，感觉脚下的地面都快融化了<end><playername>: 这奇怪的地方还有个箱子，上去看看。<end>","","","","",""}
Lang.mission.str702= {"<playername>: 地面已经开始化开，得赶紧离去<end>","","","","",""}
Lang.mission.str703= {"查看一下奇怪的箱子","","","","",""}
Lang.mission.str704= {"啊，四周的熔浆里冒出一些怪物！","","","","",""}
Lang.mission.str705= {"消灭突然出现的熔浆怪","","","","",""}
Lang.mission.str706= {"熔浆里又出现了新的怪物","","","","",""}
Lang.mission.str707= {"消灭第二批出现的熔浆怪","","","","",""}
Lang.mission.str708= {"消灭第三批出现的熔浆怪","","","","",""}
Lang.mission.str709= {"消灭第四批出现的熔浆怪","","","","",""}

Lang.mission.str710= {"消灭第五批出现的熔浆怪","","","","",""}
Lang.mission.str711= {"<playername>:没有什么能阻拦我们了，赶紧离开这个地方<end>","","","","",""}
Lang.mission.str712= {"<playername>: 这里道路崎岖狭隘，甚是凶险，大家小心行事<end><npc=9067>: 此路是我开，此树是我栽；要想打此过，留下买路财；敢嘣半个不，管杀不管埋！<end>","","","","",""}
Lang.mission.str713= {"<npc=9067>: 兄弟们，一起并肩子上了<end><playername>: 你们竟然以多欺少，你赖皮，啊~~别打脸！<end>","","","","",""}
Lang.mission.str714= {"<npc=9082>: 少侠饶命啊！我们只劫富济贫，从未害人性命啊，逢年过节还给山下农户送些酒肉，少侠你就发发慈悲，饶我们一条命吧，我上有八十老母......<end><playername>:既是如此，你们走吧，以后切不可再占山为王，做这无本买卖。<end>","","","","",""}
Lang.mission.str715= {"打退山贼","","","","",""}
Lang.mission.str716= {"<playername>: 这些长得大嘴的花到底是怎么回事，啊~~~~<end>","","","","",""}
Lang.mission.str717= {"<playername>: 这地方真热，空气中还有股浓郁的腥味<end><playername>: 地上有动静，好像有什么东西长出来了！<end>","","","","",""}
Lang.mission.str718= {"清理掉这些喷射液体的花","","","","",""}
Lang.mission.str719= {"杀死前方拦路的怪物","","","","",""}

Lang.mission.str720= {"<playername>: 终于摆脱这些奇怪的东西了，我们先休整一下，然后继续上路吧。<end>","","","","",""}
Lang.mission.str721= {"<npc=8014>: 嗷！！渺小...嗷！！！嗷嗷！！！<end><playername>: 快看！那是个人还是个野兽！<end>","","","","",""}
Lang.mission.str722= {"<playername>: 好可怕的力量，快撤！！！<end>","","","","",""}
Lang.mission.str723= {"击败兽嚎","","","","",""}
Lang.mission.str724= {"<playername>: 他到底是不是人类啊，刚才好像听到他说话了<end>","","","","",""}
Lang.mission.str725= {"兽嚎在吸收邪神力量之后攻击会增加一倍，但是移动速度会略微降低","","","","",""}
Lang.mission.str726= {"<npc=8015>: 你们从哪里来？既然来了，就听我歌一曲再走吧。<end>","","","","",""}
Lang.mission.str727= {"<playername>: 看来我们暂时奈何不了她，还是另寻他路吧<end>","","","","",""}
Lang.mission.str728= {"击败水莫研","","","","",""}
Lang.mission.str729= {"<playername>: 好厉害的露雾天女，终于击退了她<end>","","","","",""}

Lang.mission.str730= {"<playername>: 仰望天空，我看不见光明<end>","","","","",""}
Lang.mission.str731= {"<playername>: 我彷佛嗅见了痛苦的滋味<end><playername>: 前面好像有人，去查看一下<end>","","","","",""}
Lang.mission.str732= {"发现魔兵，击杀它们","","","","",""}
Lang.mission.str733= {"<npc=8073>: 几个不知所谓的凡人，前来接受你们死亡的必然命运<end>","","","","",""}
Lang.mission.str734= {"与瘟癀魔将战斗","","","","",""}
Lang.mission.str735= {"<playername>: 真是一场恶战，不知是魔界瘟癀大尊的个人行为还是魔界又要大举入侵了。<end>","","","","",""}
Lang.mission.str736= {"<playername>: 这烤人的炙热中带着混乱，翻卷的火焰中带着不祥<end>","","","","",""}
Lang.mission.str737= {"<playername>: 此处不宜久留，我们还是先退出去吧<end>","","","","",""}
Lang.mission.str738= {"打倒那个巨大的怪物","","","","",""}
Lang.mission.str739= {"<playername>: 真是诡异的地方<end>","","","","",""}

Lang.mission.str740= {"焰兽融入熔岩之地，引起熔岩的暴动","","","","",""}
Lang.mission.str741= {"焰兽低吼：无知的血肉生命，让无边的火焰焚尽你的身躯，灼烧你的灵魂，净化这污秽的世界！","","","","",""}
Lang.mission.str742= {"焰兽吼道：我的奴仆们，扫清我眼前的这堆烂肉","","","","",""}
Lang.mission.str743= {"暗红色光圈处即将喷发","","","","",""}
Lang.mission.str744= {"焰兽融入熔岩之地，引起熔岩的暴动","","","","",""}
Lang.mission.str745= {"焰兽低吼：无知的血肉生命，让无边的火焰焚尽你的身躯，灼烧你的灵魂，净化这污秽的世界！","","","","",""}
Lang.mission.str746= {"焰兽吼道：我的奴仆们，扫清我眼前的这堆烂肉","","","","",""}
Lang.mission.str747= {"焰兽融入熔岩之地，引起熔岩的暴动","","","","",""}
Lang.mission.str748= {"焰兽低吼：无知的血肉生命，让无边的火焰焚尽你的身躯，灼烧你的灵魂，净化这污秽的世界！","","","","",""}
Lang.mission.str749= {"焰兽吼道：我的奴仆们，扫清我眼前的这堆烂肉","","","","",""}

Lang.mission.str750= {"焰兽吸取了大量火焰，变得更加强大和暴怒","","","","",""}
Lang.mission.str751= {"焰兽驱动熔浆使得持续爆发","","","","",""}
Lang.mission.str752= {"<npc=8028> 嘎嘎~~~有活人！<end><npc=8028>: 吃掉他们！<end>","","","","",""}
Lang.mission.str753= {"<playername>: 四周好多小鬼，这些小鬼实在太难缠了，快跑！<end>","","","","",""}
Lang.mission.str754= {"杀死四周的小鬼","","","","",""}
Lang.mission.str755= {"去点亮广场口的引魂灯。","","","","",""}
Lang.mission.str756= {"点亮广场口的引魂灯","","","","",""}
Lang.mission.str757= {"鬼统领出现，快前去击败它","","","","",""}
Lang.mission.str758= {"打死小鬼统领","","","","",""}
Lang.mission.str759= {"<playername>: 呼呼~~~~<end>","","","","",""}

Lang.mission.str760= {"<playername>: 据说千年以前这里曾有两位绝世大能在这里交战<end>","","","","",""}
Lang.mission.str761= {"<playername>: 仅仅是一只手我们就无法对抗吗<end>？","","","","",""}
Lang.mission.str762= {"<color=green>距离结束还有%s<color>","","","","",""}
Lang.mission.str763= {"与突然出现的巨手交战","","","","",""}
Lang.mission.str764= {"<playername>: 这应该是当年的某位大能被斩落的手，看来此处比较危险还是早点离开<end>","","","","",""}
Lang.mission.str765= {"<npcname=未知声音> 格格..格格格...<end><playername>: 看！这些木头都活过来了！<end>","","","","",""}
Lang.mission.str766= {"<playername>: 顶不住了，快退","","","","",""}
Lang.mission.str767= {"杀掉所有傀儡","","","","",""}
Lang.mission.str768= {"杀掉熊洋","","","","",""}
Lang.mission.str769= {"<playername>: 真是太吓人了<end>","","","","",""}

Lang.mission.str770= {"精致机关人临死发动自毁程序的爆炸同样也会对熊洋造成重创。","","","","",""}
Lang.mission.str771= {"<playername>: 此处真是幽静！前方有一个女子，问问她此处是哪里吧<end><npc=8013>: 咯咯咯...几位小哥，来陪奴家聊会天吧<end>","","","","",""}
Lang.mission.str772= {"<npc=8013>: 几位小哥，下次记得再来陪奴家聊天啊<end>","","","","",""}
Lang.mission.str773= {"利用幽梦葫芦和望乡井可以将小队在梦境和现实中转换，但是这两个道具最后各职能使用三次","","","","",""}
Lang.mission.str774= {"在梦境和现实中各击败曾雅","","","","",""}
Lang.mission.str775= {"梦境中的曾雅偶尔会对你和你附近所有单位一并造成伤害","","","","",""}
Lang.mission.str776= {"幽梦葫芦和望乡井已经损坏，只能击败曾雅真身来再次进入梦境","","","","",""}
Lang.mission.str777= {"<playername>: 呼，原来是一位狐族高手，真是一次美妙的体验<end>","","","","",""}
Lang.mission.str778= {"<playername>: 这雕龙如此厉害，只一会让我们难以招架<end>","","","","",""}
Lang.mission.str779= {"<playername>: 这是什么地方，怎么到这里来了<end><playername>: 咦，这不三十年前无上以全派之力用青玄晶石雕成并注入龙的一魂二魄造就的镇派雕龙吗？怎么出现在这里？五年前我机缘巧合之下有幸见过雕龙半面，当时雕龙的威压让我双腿不自主地打颤。不好，它好像对我们不怀好意。<end>","","","","",""}

Lang.mission.str780= {"只好战了","","","","",""}
Lang.mission.str781= {"<playername> 难以置信，我们竟然能击退这条雕龙，这一切肯定都是幻觉！","","","","",""}
Lang.mission.str782= {"<playername>: 啊，原来是一片农田<end><playername>: 这里的田鼠竟然如此猖獗，我们分头消灭一些老鼠吧！<end>","","","","",""}
Lang.mission.str783= {"<playername>: 好多的田鼠，真的是忙不过来了<end>","","","","",""}
Lang.mission.str784= {"抓住30只田鼠","","","","",""}
Lang.mission.str785= {"<npc=9071>: 是谁干的？我放养的老鼠是谁杀的？<end><playername>: 啊。难道是你弄出来这么多老鼠，我美丽村庄就是被你搞得如此破落<end><npc=9071>: 原来是你在捕捉我的小可爱们，让我赏你一死！<end>","","","","",""}
Lang.mission.str786= {"到村子中间空地杀死放养老鼠的恶人","","","","",""}
Lang.mission.str787= {"<playername>: 此地鼠害如此严重，还是要抓紧治理啊<end>","","","","",""}
Lang.mission.str788= {"<playername>: 这不是葛捕头嘛，那大盗追风已经抓到了么？<end><npc=8019>: 他就在里边，你们进去抓人，我安排好人堵住路口就来<end>","","","","",""}
Lang.mission.str789= {"<playername>: 这小子真是贼精，这么一个小疏忽就跑不见了<end>","","","","",""}

Lang.mission.str790= {"缉拿追风","","","","",""}
Lang.mission.str791= {"<npc=8019>: 哈哈，看你还往哪跑，各位，咱们先在此别过，我先将这贼人押送回去，改日在下请各位吃酒<end>","","","","",""}
Lang.mission.str792= {"%d后传送到下一关","","","","",""}
Lang.mission.str793= {"任务失败，%d秒后离开","","","","",""}
Lang.mission.str794= {"您与<color=yellow>%s<color>好友亲密度增加了%d点。","","","","",""}
Lang.mission.str795= {"任务完成","","","","",""}
Lang.mission.str796= {"队伍篝火已经点燃，队伍成员可在篝火周围分享经验！","","","","",""}
Lang.mission.str797= {"请耐心在此等候，你将在下个关卡开启时与其他队友汇合！","","","","",""}
Lang.mission.str798= {"<color=green>离本关结束时间还剩:%s<color>","","","","",""}
Lang.mission.str799= {"请耐心等待本关结束","","","","",""}

Lang.mission.str800= {"敌方击败我方成员数：%d\n我方击败敌方成员数：%d","","","","",""}
Lang.mission.str801= {"你的队长被问到如下问题：\n  ","","","","",""}
Lang.mission.str802= {"你答对了%d道题，用时%d，干得不错，不过还得等时间到才能分出胜负哦","","","","",""}
Lang.mission.str803= {"你只答对了%d道题，看来你对这个江湖还不够熟悉啊","","","","",""}
Lang.mission.str804= {"\n选项","","","","",""}
Lang.mission.str805= {"我放弃","","","","",""}
Lang.mission.str806= {"你的第%d道问题如下：\n  ","","","","",""}
Lang.mission.str807= {"太危险了！你擅自闯入逍遥谷内，将在5秒后回到城内！","","","","",""}
Lang.mission.str808= {"%M分%S秒","","","","",""}
Lang.mission.str809= {"恭喜您打通了登天塔，用时:%s。","","","","",""}

Lang.mission.str810= {"挑战登天塔失败，用时:%s","","","","",""}
Lang.mission.str811= {"号房间被占用 ","","","","",""}
Lang.mission.str812= {"普通","","","","",""}
Lang.mission.str813= {"难度","","","","",""}
Lang.mission.str814= {"困难","","","","",""}
Lang.mission.str815= {"传说","","","","",""}
Lang.mission.str816= {"恭喜你通关，用时:%s","","","","",""}
Lang.mission.str817= {"登天塔是单人活动，请先退出队伍吧","","","","",""}
Lang.mission.str818= {"此功能尚未开启，敬请期待。","","","","",""}
Lang.mission.str819= {"你需要达到50级才能领取逍遥谷药品。","","","","",""}

Lang.mission.str820= {"你今天已经领过逍遥谷药品啦，明天再来吧。","","","","",""}
Lang.mission.str821= {"背包空间不足，请空出1格之后再来领取。","","","","",""}
Lang.mission.str822= {"回血丹·箱","","","","",""}
Lang.mission.str823= {"回内丹·箱","","","","",""}
Lang.mission.str824= {"乾坤造化丸·箱","","","","",""}
Lang.mission.str825= {"我只是来看看","","","","",""}
Lang.mission.str826= {"你要领取那种药品？","","","","",""}
Lang.mission.str827= {"%s 获得逍遥药品 %s","","","","",""}
Lang.mission.str828= {"最近想去逍遥谷的人可真多啊，你也是其中一员吗？","","","","",""}
Lang.mission.str829= {"请送我去逍遥谷入口1","","","","",""}

Lang.mission.str830= {"请送我去逍遥谷入口2","","","","",""}
Lang.mission.str831= {"我只是路过","","","","",""}
Lang.mission.str832= {"黄翡","","","","",""}
Lang.mission.str833= {"<color=orange>[%s难度]<color>    通关纪录第%d名:<color=orange>%s<color>   <color=yellow>%s<color>的队伍创造于%s<color>","","","","",""}
Lang.mission.str834= {"%Y年%m月%d日","","","","",""}
Lang.mission.str835= {"您可以查看以下难度的通关纪录","","","","",""}
Lang.mission.str836= {"当前难度下没有任何纪录","","","","",""}
Lang.mission.str837= {"您正在查看<color=orange>%s难度<color>下的通关纪录:\n\n","","","","",""}
Lang.mission.str838= {"第%d名:\n","","","","",""}
Lang.mission.str839= {"日期:%Y年%m月%d日\n","","","","",""}

Lang.mission.str840= {"你功力尚浅，逍遥谷对你来说太危险了，先把等级提升到%d级再来闯谷吧。","","","","",""}
Lang.mission.str841= {"你无门无派，闯谷等于是去送死，还是先入了门派再来找老夫吧。","","","","",""}
Lang.mission.str842= {"该难度还未开放，敬请期待。","","","","",""}
Lang.mission.str843= {"你们队好像还有人不在这里哦，还是等人到齐了再一起入谷吧。","","","","",""}
Lang.mission.str844= {"诶！你们队怎么还有菜鸟混进来了？先把等级提升到%d级再来吧。","","","","",""}
Lang.mission.str845= {"诶！怎么还有菜鸟混进来了？无门无派，闯谷等于是去送死，还是先入了门派再来吧","","","","",""}
Lang.mission.str846= {"喂!喂!那个<color=red>%s<color>，你今天已经不能再进谷了，还想进去？明天再来吧！","","","","",""}
Lang.mission.str847= {"你今天已经给了我<color=red>%d<color>个宝贝了，我需要整理一下这些宝贝，请明天送过来吧！","","","","",""}
Lang.mission.str848= {"你给我的宝贝已经够多了，我已经不需要了！","","","","",""}
Lang.mission.str849= {"嘿嘿嘿！别想拿这些破东西来糊弄我！","","","","",""}

Lang.mission.str850= {"不错不错！这正是我要的东西！","","","","",""}
Lang.mission.str851= {"每天最多可以交%d个物品\n今天已交了<color=green>%d<color>个","","","","",""}
Lang.mission.str852= {"你这个月还没领须弥幻境录啊。","","","","",""}
Lang.mission.str853= {"你已经有一本须弥幻境录了","","","","",""}
Lang.mission.str854= {"背包空间不足,清空一格再来领取须弥幻境录吧！","","","","",""}
Lang.mission.str855= {"你身上没有须弥幻境录，不能使用卡片。快到何九九那儿领一本吧。","","","","",""}
Lang.mission.str856= {"你本月已经收集过这张卡片了。","","","","",""}
Lang.mission.str857= {"副本完成","","","","",""}
Lang.mission.str858= {"<color=green>退出倒计时：%s","","","","",""}
Lang.mission.str859= {"<color=yellow>           百毒邪教\\r\\r副本剩余时间：<color=white>%s","","","","",""}

Lang.mission.str860= {"消灭所有百毒教毒物和百毒教教主","","","","",""}
Lang.mission.str861= {"<color=yellow>目标：<color=white>消灭所有毒物和教主","","","","",""}
Lang.mission.str862= {"<color=yellow>           百鬼夜行\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str863= {"消灭所有夜行鬼和尸鬼王","","","","",""}
Lang.mission.str864= {"<color=yellow>目标：<color=white>消灭所有夜行鬼和尸鬼王","","","","",""}
Lang.mission.str865= {"<color=yellow>           进击的妖兽\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str866= {"打败狂暴岛上的变异魔物","","","","",""}
Lang.mission.str867= {"<color=yellow>副本内容：消灭<color=white>\\r所有变异魔物\\r\\r<color=yellow>目标：消灭所有变异魔物","","","","",""}
Lang.mission.str868= {"<color=yellow>           进击的胖子\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str869= {"消灭所有攻进小人国的胖子","","","","",""}

Lang.mission.str870= {"<color=yellow>副本内容：<color=white>\\r第一波：小胖和一胖\\r\\r<color=yellow>目标：消灭第一波胖子","","","","",""}
Lang.mission.str871= {"<color=yellow>副本内容：<color=white>\\r第二波：小胖和二胖\\r\\r<color=yellow>目标：消灭第二波胖子","","","","",""}
Lang.mission.str872= {"<color=yellow>副本内容：<color=white>\\r第三波：小胖和三胖\\r\\r<color=yellow>目标：消灭第三波胖子","","","","",""}
Lang.mission.str873= {"<color=yellow>副本内容：<color=white>\\r第四波：小胖和四胖\\r\\r<color=yellow>目标：消灭第四波胖子","","","","",""}
Lang.mission.str874= {"<color=yellow>副本内容：<color=white>\\r第五波：愤怒的巨胖\\r\\r<color=yellow>目标：消灭巨胖","","","","",""}
Lang.mission.str875= {"<color=yellow>           进击的妖兽\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str876= {"<color=yellow>副本内容：<color=white>\\r第一波：鱼妖和大鱼妖\\r\\r<color=yellow>目标：消灭第一波妖兽","","","","",""}
Lang.mission.str877= {"<color=yellow>副本内容：<color=white>\\r第二波：猴妖和大猴妖\\r\\r<color=yellow>目标：消灭第二波妖兽","","","","",""}
Lang.mission.str878= {"<color=yellow>副本内容：<color=white>\\r第三波：树妖和巨树妖\\r\\r<color=yellow>目标：消灭第三波妖兽","","","","",""}
Lang.mission.str879= {"<color=yellow>副本内容：<color=white>\\r第四波：鸟妖和巨鸟妖\\r\\r<color=yellow>目标：消灭第四波妖兽","","","","",""}

Lang.mission.str880= {"<color=yellow>副本内容：<color=white>\\r第五波：愤怒的飞龙\\r\\r<color=yellow>目标：消灭第五波妖兽","","","","",""}
Lang.mission.str881= {"打败狂暴岛上的狂暴魔物","","","","",""}
Lang.mission.str882= {"<color=yellow>副本内容：消灭<color=white>\\r所有狂暴魔物\\r\\r<color=yellow>目标：消灭所有狂暴魔物","","","","",""}
Lang.mission.str883= {"<color=yellow>副本内容：<color=white>\\r所有天残派人员\\r\\r<color=yellow>目标：消灭邪恶天残和他的弟子","","","","",""}
Lang.mission.str884= {"打败邪恶天残和他的弟子","","","","",""}
Lang.mission.str885= {"<color=yellow>副本内容：<color=white>\\r所有空虚派人员\\r\\r<color=yellow>目标：消灭邪恶天残和他的弟子","","","","",""}
Lang.mission.str886= {"<color=green>第一波怪物正在袭来！\\r副本准备时间：%s","","","","",""}
Lang.mission.str887= {"注意！怪物5秒后到达此地！","","","","",""}
Lang.mission.str888= {"<color=yellow>           群魔来袭\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str889= {"第一波怪，狂暴黑熊来袭！","","","","",""}

Lang.mission.str890= {"<color=yellow>副本玩法：<color=white>\\r击中路过猴子有几率得增益BUFF\\<color=green>r1.加攻击\\r2.全体定身\\r3.全体伤害<color=white>\\r\\r保护好<color=green>神仙姐姐<color=white>\\r\\r击败<color=green>五波怪<color=white>即可胜利\\r\\r<color=yellow>目标：第一波怪","","","","",""}
Lang.mission.str891= {"第二波怪，牛兵守卫和牛魔王来袭！","","","","",""}
Lang.mission.str892= {"<color=yellow>副本玩法：<color=white>\\r击中路过猴子有几率得增益BUFF\\<color=green>r1.加攻击\\r2.全体定身\\r3.全体伤害<color=white>\\r\\r保护好<color=green>神仙姐姐<color=white>\\r\\r击败<color=green>五波怪<color=white>即可胜利\\r\\r<color=yellow>目标：第二波怪","","","","",""}
Lang.mission.str893= {"第三波怪，凶残鸟人和大头领来袭！","","","","",""}
Lang.mission.str894= {"<color=yellow>副本玩法：<color=white>\\r击中路过猴子有几率得增益BUFF\\<color=green>r1.加攻击\\r2.全体定身\\r3.全体伤害<color=white>\\r\\r保护好<color=green>神仙姐姐<color=white>\\r\\r击败<color=green>五波怪<color=white>即可胜利\\r\\r<color=yellow>目标：第三波怪","","","","",""}
Lang.mission.str895= {"第四波怪，变种鳄龟和封印将军来袭！","","","","",""}
Lang.mission.str896= {"<color=yellow>副本玩法：<color=white>\\r击中路过猴子有几率得增益BUFF\\<color=green>r1.加攻击\\r2.全体定身\\r3.全体伤害<color=white>\\r\\r保护好<color=green>神仙姐姐<color=white>\\r\\r击败<color=green>五波怪<color=white>即可胜利\\r\\r<color=yellow>目标：第四波怪","","","","",""}
Lang.mission.str897= {"第五波怪，大boss大教主来袭！！！","","","","",""}
Lang.mission.str898= {"<color=yellow>副本玩法：<color=white>\\r击中路过猴子有几率得增益BUFF\\<color=green>r1.加攻击\\r2.全体定身\\r3.全体伤害<color=white>\\r\\r保护好<color=green>神仙姐姐<color=white>\\r\\r击败<color=green>五波怪<color=white>即可胜利\\r\\r<color=yellow>目标：第五波怪","","","","",""}
Lang.mission.str899= {"神仙姐姐遭受到攻击！","","","","",""}

Lang.mission.str900= {"神仙姐姐只剩下半条命了！","","","","",""}
Lang.mission.str901= {"神仙姐姐准备要死了！","","","","",""}
Lang.mission.str902= {"<color=yellow>           斗破三界\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str903= {"<color=yellow>副本玩法：<color=white>\\r消灭所有魔物即可胜利\\r\\r<color=yellow>目标：打败所有入侵的怪物","","","","",""}
Lang.mission.str904= {"前面好像有动静！上前查个究竟！","","","","",""}
Lang.mission.str905= {"<color=yellow>副本玩法：<color=white>\\r消灭所有魔物即可胜利\\r\\r<color=yellow>目标：打败所有入侵的怪物","","","","",""}
Lang.mission.str906= {"赶快消灭这些魔物！","","","","",""}
Lang.mission.str907= {"噪音越来越大了！","","","","",""}
Lang.mission.str908= {"赶快消灭这些烦人的魔物！","","","","",""}
Lang.mission.str909= {"快！快！快给我滚进去！","","","","",""}

Lang.mission.str910= {"哈哈！有胆就跟着去吧！","","","","",""}
Lang.mission.str911= {"大量魔物已进入人界！快跟上并阻止它们！","","","","",""}
Lang.mission.str912= {"<color=yellow>副本玩法：<color=white>\\r消灭所有魔物即可胜利\\r\\r<color=yellow>目标：打败所有入侵的怪物","","","","",""}
Lang.mission.str913= {"大量魔物已进入神界！快跟上并阻止它们！","","","","",""}
Lang.mission.str914= {"<color=yellow>副本玩法：<color=white>\\r消灭所有魔物即可胜利\\r\\r<color=yellow>目标：打败所有入侵的怪物","","","","",""}
Lang.mission.str915= {"人界和神界魔物已清理！回到魔界修理鞭妖！","","","","",""}
Lang.mission.str916= {"<color=yellow>副本玩法：<color=white>\\r消灭所有魔物即可胜利\\r\\r<color=yellow>目标：打败鞭妖","","","","",""}
Lang.mission.str917= {"<color=yellow>           惊险陡坡\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str918= {"<color=yellow>副本玩法：<color=white>\\r一：消灭<color=green>30只<color=white>石龟\\r\\r二：消灭<color=green>冰火巨龟<color=white>\\r\\r三：击败<color=green>巨石怪<color=white>即可胜利\\r\\r<color=yellow>目标：消灭30只石龟","","","","",""}
Lang.mission.str919= {"请合力消灭30只石龟","","","","",""}

Lang.mission.str920= {"<color=yellow>副本玩法：<color=white>\\r一：消灭<color=green>30只<color=white>石龟\\r\\r二：消灭<color=green>冰火巨龟<color=white>\\r\\r三：击败<color=green>巨石怪<color=white>即可胜利\\r\\r<color=yellow>目标：消灭冰火巨龟","","","","",""}
Lang.mission.str921= {"注意！冰火龟一旦受到攻击就会反击","","","","",""}
Lang.mission.str922= {"BOSS传送门已开启","","","","",""}
Lang.mission.str923= {"竟敢跑到这里来！那就把命留下吧！","","","","",""}
Lang.mission.str924= {"关卡剧情中","","","","",""}
Lang.mission.str925= {"<color=yellow>副本玩法：<color=white>\\r一：消灭<color=green>30只<color=white>石龟\\r\\r二：消灭<color=green>冰火巨龟<color=white>\\r\\r三：击败<color=green>巨石怪<color=white>即可胜利\\r\\r<color=yellow>目标：消灭巨石怪","","","","",""}
Lang.mission.str926= {"小心形态多变的巨石怪","","","","",""}
Lang.mission.str927= {"除掉石柱能阻止巨石怪加血","","","","",""}
Lang.mission.str928= {"巨石怪进入暴走状态","","","","",""}
Lang.mission.str929= {"<color=green>进入下关倒计时：%s","","","","",""}

Lang.mission.str930= {"<color=green>         苏醒的将军\\r\\r开始倒计时：%s","","","","",""}
Lang.mission.str931= {"<color=green>         苏醒的将军\\r\\r本关剩余时间：%s","","","","",""}
Lang.mission.str932= {"到底有什么在前方等着！","","","","",""}
Lang.mission.str933= {"<color=green>本关BOSS：<color=yellow>大将军\\r\\r<color=green>帮助：大将军会使用多种范围技能，注意躲避就可以了！本关还会不断提供回血魔法\\r\\r<color=white>目标:消灭大将军","","","","",""}
Lang.mission.str934= {"四周突然雷鸣电闪！","","","","",""}
Lang.mission.str935= {"沉睡千年的大将军苏醒了！请小心！","","","","",""}
Lang.mission.str936= {"<color=green>本关BOSS：<color=yellow>大将军\\r\\r<color=green>帮助：大将军会使用多种范围技能，注意躲避就可以了！本关还会不断提供回血魔法\\r\\r<color=white>目标:消灭大将军","","","","",""}
Lang.mission.str937= {"好久没让我的剑喝新鲜的血啦！","","","","",""}
Lang.mission.str938= {"<color=green>离开副本倒计时：%s","","","","",""}
Lang.mission.str939= {"<color=yellow>           冲出敌阵\\r\\r副本剩余时间：<color=white>%s","","","","",""}

Lang.mission.str940= {"<color=yellow>副本玩法：<color=white>\\r保护好<color=green>镖车<color=white>不被拆毁\\r\\r打垮<color=green>帐篷,箭塔<color=white>让镖车继续前进\\r\\r击败终点的<color=green>劫匪头领<color=white>即可胜利\\r\\r<color=yellow>目标：带着马车前进","","","","",""}
Lang.mission.str941= {"马车被困住了！拆掉帐篷即可继续前进！","","","","",""}
Lang.mission.str942= {"继续保护镖车前进","","","","",""}
Lang.mission.str943= {"马车被困住了！拆掉箭塔即可继续前进！","","","","",""}
Lang.mission.str944= {"门口就在前方！保护好镖车！","","","","",""}
Lang.mission.str945= {"头领来了！保护好镖车","","","","",""}
Lang.mission.str946= {"<color=yellow>副本玩法：<color=white>\\r保护好<color=green>镖车<color=white>不被拆毁\\r\\r打垮<color=green>帐篷,箭塔<color=white>让镖车继续前进\\r\\r击败<color=green>劫匪头领<color=white>即可胜利\\r\\r<color=yellow>目标：击败劫匪首领","","","","",""}
Lang.mission.str947= {"成功夺回被抢镖车","","","","",""}
Lang.mission.str948= {"请保护好马车！","","","","",""}
Lang.mission.str949= {"马车被困住了！拆掉箭塔即可继续前进！","","","","",""}

Lang.mission.str950= {"马车被困住了！拆掉帐篷即可继续前进！","","","","",""}
Lang.mission.str951= {"带着镖车冲出敌阵！","","","","",""}
Lang.mission.str952= {"<color=yellow>            机关地牢\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str953= {"快找出三个藏着火种的机关人！","","","","",""}
Lang.mission.str954= {"<color=yellow>副本玩法：<color=white>\\r所有机关物中仅<color=green>三个<color=white>带着火种\\r\\r<color=green>火炬<color=white>完全开启会召唤出最后BOSS\\r\\r<color=yellow>目标：找出真正的机关人","","","","",""}
Lang.mission.str955= {"队员找到了1个火种","","","","",""}
Lang.mission.str956= {"成功找出全部火种！马上点燃中央火炬","","","","",""}
Lang.mission.str957= {"机关兽出来了！赶快找出三个藏着火种的机关兽","","","","",""}
Lang.mission.str958= {"<color=yellow>副本玩法：<color=white>\\r所有机关物中仅<color=green>三个<color=white>带着火种\\r\\r<color=green>火炬<color=white>完全开启会召唤出最后BOSS\\r\\r<color=yellow>目标：找出真正的机关兽","","","","",""}
Lang.mission.str959= {"队员找到了1个火种","","","","",""}

Lang.mission.str960= {"成功找出全部火种！马上点燃中央火炬","","","","",""}
Lang.mission.str961= {"机关邪童出来了！赶快找出三个藏着火种的机关邪童！","","","","",""}
Lang.mission.str962= {"注意！机关傀儡已启动！","","","","",""}
Lang.mission.str963= {"成功击败机关傀儡","","","","",""}
Lang.mission.str964= {"<color=yellow>           四兽宝塔\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str965= {"进入水晶门开启真正的宝箱，并进入下一层","","","","",""}
Lang.mission.str966= {"<color=yellow>副本玩法：<color=white>\\r点击<color=green>传送石<color=white>进入密室\\r\\r开启<color=green>真宝箱<color=white>方可通往下一层\\r\\r<color=yellow>目标：进入第四层消灭四兽塔塔主","","","","",""}
Lang.mission.str967= {"玩家开启了真宝箱！宝物猴20秒后消失！","","","","",""}
Lang.mission.str968= {"下一层水晶已开启","","","","",""}
Lang.mission.str969= {"玩家开启了真宝箱！宝物猴25秒后消失！","","","","",""}

Lang.mission.str970= {"玩家开启了真宝箱！宝物猴30秒后消失！","","","","",""}
Lang.mission.str971= {"四兽塔塔主已出现","","","","",""}
Lang.mission.str972= {"<color=yellow>           偷袭恶人寨\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str973= {"尽量不被敌人发现并且解救人质","","","","",""}
Lang.mission.str974= {"<color=yellow>副本玩法：<color=white>\\r把所有<color=green>人质<color=white>救出即可完成副本\\r\\r被<color=green>守卫<color=white>发现只会延长完成时间\\r\\r<color=yellow>目标：救出所有被困人质","","","","",""}
Lang.mission.str975= {"注意！队员被敌人发现了！","","","","",""}
Lang.mission.str976= {"不好！这是陷阱!寨主来了！！","","","","",""}
Lang.mission.str977= {"成功解救所有人质！","","","","",""}
Lang.mission.str978= {"本次多人副本失败了","","","","",""}
Lang.mission.str979= {"<%s>和他的队伍经过不懈努力，完美通关%s级普通多人副本！","","","","",""}

Lang.mission.str980= {"今天购买次数已到上限，明天再来吧~","","","","",""}
Lang.mission.str981= {"购买闯副本次数需要%s元宝，您的元宝不足","","","","",""}
Lang.mission.str982= {"是否花费%d元宝购买一次闯副本次数","","","","",""}
Lang.mission.str983= {"还没过更换炮塔10秒的CD时间，等下再来点吧","","","","",""}
Lang.mission.str984= {"泡澡活动还没开放，请开放后再来!","","","","",""}
Lang.mission.str985= {"你当前的等级不足，请%d级以后再来!","","","","",""}
Lang.mission.str986= {"当前已在泡澡中!","","","","",""}
Lang.mission.str987= {"你今天的泡澡已经完成，请明天再来","","","","",""}
Lang.mission.str988= {"一大波准备泡澡的妹子正在接近，大神们丢下你们的肥皂速速前往吧!","","","","",""}
Lang.mission.str989= {"<color=green>准备时间：%s","","","","",""}

Lang.mission.str990= {"<color=green>本层剩余时间：%s","","","","",""}
Lang.mission.str991= {"本层完成","","","","",""}
Lang.mission.str992= {"<color=green>进入下层倒计时：%s","","","","",""}
Lang.mission.str993= {"<color=yellow>[第1层]\\r目标：击败魔兵","","","","",""}
Lang.mission.str994= {"<color=yellow>[第2层]\\r目标：击败白脸鬼","","","","",""}
Lang.mission.str995= {"<color=yellow>[第3层]\\r目标：击败黑脸鬼","","","","",""}
Lang.mission.str996= {"<color=yellow>[第4层]\\r目标：击败鱼怪","","","","",""}
Lang.mission.str997= {"<color=yellow>[第5层]\\r目标：击败精英怪小李","","","","",""}
Lang.mission.str998= {"<color=yellow>[第6层]\\r目标：击败河妖","","","","",""}
Lang.mission.str999= {"<color=yellow>[第7层]\\r目标：击败恶霸","","","","",""}

Lang.mission.str1000= {"<color=yellow>[第8层]\\r目标：击败狂暴者","","","","",""}
Lang.mission.str1001= {"<color=yellow>[第9层]\\r目标：击败强盗","","","","",""}
Lang.mission.str1002= {"<color=yellow>[第10层]\\r目标：击败邪恶大土豪","","","","",""}
Lang.mission.str1003= {"<color=yellow>[第11层]\\r目标：击败毒虫","","","","",""}
Lang.mission.str1004= {"<color=yellow>[第12层]\\r目标：击败熊精","","","","",""}
Lang.mission.str1005= {"<color=yellow>[第13层]\\r目标：击败年兽","","","","",""}
Lang.mission.str1006= {"<color=yellow>[第14层]\\r目标：击败毒蜘蛛","","","","",""}
Lang.mission.str1007= {"<color=yellow>[第15层]\\r目标：击败牛魔王","","","","",""}
Lang.mission.str1008= {"<color=yellow>[第16层]\\r目标：击败毒蛤蟆","","","","",""}
Lang.mission.str1009= {"<color=yellow>[第17层]\\r目标：击败怪盗","","","","",""}

Lang.mission.str1010= {"<color=yellow>[第18层]\\r目标：击败牛兵","","","","",""}
Lang.mission.str1011= {"<color=yellow>[第19层]\\r目标：击败哮天犬","","","","",""}
Lang.mission.str1012= {"<color=yellow>[第20层]\\r目标：击败西域邪龙","","","","",""}
Lang.mission.str1013= {"<color=yellow>[第21层]\\r目标：击败黑老鸦","","","","",""}
Lang.mission.str1014= {"<color=yellow>[第22层]\\r目标：击败鸟人","","","","",""}
Lang.mission.str1015= {"<color=yellow>[第23层]\\r目标：击败猕猴","","","","",""}
Lang.mission.str1016= {"<color=yellow>[第24层]\\r目标：击败江湖人士","","","","",""}
Lang.mission.str1017= {"<color=yellow>[第25层]\\r目标：击败大巨人","","","","",""}
Lang.mission.str1018= {"<color=yellow>[第26层]\\r目标：击败毒箭兵","","","","",""}
Lang.mission.str1019= {"<color=yellow>[第27层]\\r目标：击败熔岩怪","","","","",""}


Lang.mission.str1020= {"<color=yellow>[第28层]\\r目标：击败鬼魂","","","","",""}
Lang.mission.str1021= {"<color=yellow>[第29层]\\r目标：击败食人花","","","","",""}
Lang.mission.str1022= {"<color=yellow>[第30层]\\r目标：击败右封印将军","","","","",""}
Lang.mission.str1023= {"<color=yellow>[第31层]\\r目标：击败木人","","","","",""}
Lang.mission.str1024= {"<color=yellow>[第32层]\\r目标：击败公鸡","","","","",""}
Lang.mission.str1025= {"<color=yellow>[第33层]\\r目标：击败狼","","","","",""}
Lang.mission.str1026= {"<color=yellow>[第34层]\\r目标：击败野狐狸","","","","",""}
Lang.mission.str1027= {"<color=yellow>[第35层]\\r目标：[精英]曾雅","","","","",""}
Lang.mission.str1028= {"<color=yellow>[第36层]\\r目标：野狼","","","","",""}
Lang.mission.str1029= {"<color=yellow>[第37层]\\r目标：击败树妖","","","","",""}


Lang.mission.str1030= {"<color=yellow>[第38层]\\r目标：击败天香羚","","","","",""}
Lang.mission.str1031= {"<color=yellow>[第39层]\\r目标：击败遗迹魔塔","","","","",""}
Lang.mission.str1032= {"<color=yellow>[第40层]\\r目标：击败[BOSS]钓鱼翁","","","","",""}
Lang.mission.str1033= {"<color=yellow>[第41层]\\r目标：击败百年老妖","","","","",""}
Lang.mission.str1034= {"<color=yellow>[第42层]\\r目标：击败鼓灵童","","","","",""}
Lang.mission.str1035= {"<color=yellow>[第43层]\\r目标：击败螃蟹精","","","","",""}
Lang.mission.str1036= {"<color=yellow>[第44层]\\r目标：击败僵尸兵","","","","",""}
Lang.mission.str1037= {"<color=yellow>[第45层]\\r目标：击败[精英]瘟癀魔将","","","","",""}
Lang.mission.str1038= {"<color=yellow>[第46层]\\r目标：击败大眼猴","","","","",""}
Lang.mission.str1039= {"<color=yellow>[第47层]\\r目标：击败怨灵","","","","",""}


Lang.mission.str1040= {"<color=yellow>[第48层]\\r目标：击败变种鳄龟","","","","",""}
Lang.mission.str1041= {"<color=yellow>[第49层]\\r目标：击败激素熊精","","","","",""}
Lang.mission.str1042= {"<color=yellow>[第50层]\\r目标：击败[BOSS]大教主","","","","",""}
Lang.mission.str1043= {"<color=yellow>[第51层]\\r目标：击败蟾蜍","","","","",""}
Lang.mission.str1044= {"<color=yellow>[第52层]\\r目标：击败狂暴鱼人","","","","",""}
Lang.mission.str1045= {"<color=yellow>[第53层]\\r目标：击败毒虫","","","","",""}
Lang.mission.str1046= {"<color=yellow>[第54层]\\r目标：击败牛兵","","","","",""}
Lang.mission.str1047= {"<color=yellow>[第55层]\\r目标：[精英]鞭妖","","","","",""}
Lang.mission.str1048= {"<color=yellow>[第56层]\\r目标：击败空虚公子","","","","",""}
Lang.mission.str1049= {"<color=yellow>[第57层]\\r目标：击败天残脚","","","","",""}


Lang.mission.str1050= {"<color=yellow>[第58层]\\r目标：击败冰玉米","","","","",""}
Lang.mission.str1051= {"<color=yellow>[第59层]\\r目标：击败火玉米","","","","",""}
Lang.mission.str1052= {"<color=yellow>[第60层]\\r目标：击败[BOSS]傀儡","","","","",""}
Lang.mission.str1053= {"<%s>无惧艰险，在伐魔塔内成功突破了第10层！","","","","",""}
Lang.mission.str1054= {"<%s>无惧艰险，在伐魔塔内成功突破了第20层！","","","","",""}
Lang.mission.str1055= {"<%s>勇往直前，在伐魔塔内成功突破了第30层！","","","","",""}
Lang.mission.str1056= {"<%s>勇往直前，在伐魔塔内成功突破了第40层！","","","","",""}
Lang.mission.str1057= {"<%s>神勇无比，在伐魔塔内成功突破了第50层！","","","","",""}
Lang.mission.str1058= {"<%s>神勇无比，在伐魔塔内成功突破了第60层！","","","","",""}
Lang.mission.str1059= {"累积奖励：\\r%d银两 %d经验","","","","",""}


Lang.mission.str1060= {"你使用了加速功能，扫荡时间减半！","","","","",""}
Lang.mission.str1061= {"加速需要%s元宝，您的元宝不足","","","","",""}
Lang.mission.str1062= {"直接完成需要%s元宝，您的元宝不足","","","","",""}
Lang.mission.str1063= {"是否花费%d元宝直接完成扫荡","","","","",""}
Lang.mission.str1064= {"直接完成需要%s元宝，您的元宝不足","","","","",""}
Lang.mission.str1065= {"购买扫荡次数需要%s元宝，您的元宝不足","","","","",""}
Lang.mission.str1066= {"是否花费%d元宝购买一次扫荡次数","","","","",""}
Lang.mission.str1067= {"本关完成","","","","",""}
Lang.mission.str1068= {"<color=green>进入下关倒计时：%s","","","","",""}
Lang.mission.str1069= {"背包空间不足","","","","",""}


Lang.mission.str1070= {"挑战评价必须达到5星才能扫荡","","","","",""}
Lang.mission.str1071= {"直接完成需要%s元宝，您的元宝不足","","","","",""}
Lang.mission.str1072= {"是否花费%d元宝直接完成扫荡","","","","",""}
Lang.mission.str1073= {"没有在扫荡，无需使用直接完成功能","","","","",""}
Lang.mission.str1074= {"购买挑战次数需要%s元宝，您的元宝不足","","","","",""}
Lang.mission.str1075= {"是否花费%d元宝购买一次挑战次数","","","","",""}
Lang.mission.str1076= {"你使用了加速功能，扫荡时间减半！","","","","",""}
Lang.mission.str1077= {"<%s>的队伍成功通关<20级普通>多人关卡并获得五星评价！","","","","",""}
Lang.mission.str1078= {"<%s>的队伍成功通关<20级困难>多人关卡并获得五星评价！","","","","",""}
Lang.mission.str1079= {"<%s>的队伍凭借惊人的实力，成功通关<20级噩梦>多人关卡！","","","","",""}

Lang.mission.str1080= {"<%s>的队伍轻松通关<20级噩梦>多人关卡，并获得五星评价！","","","","",""}
Lang.mission.str1081= {"<%s>的队伍浴血奋战之后，成功通关<20级地狱>多人关卡！","","","","",""}
Lang.mission.str1082= {"<%s>的队伍完美通关<20级地狱>多人关卡，并获得五星评价！","","","","",""}

Lang.mission.str1083= {"<color=green>         惊险陡坡\\r\\r开始倒计时：%s","","","","",""}
Lang.mission.str1084= {"<color=green>         惊险陡坡\\r\\r剩余时间：%s","","","","",""}
Lang.mission.str1085= {"<color=green>第一节点：<color=yellow>“囧””冏“难分\\r\\r<color=green>帮助：请看清楚两个字的区别\\r\\r<color=white>目标:打掉全部“冏”字","","","","",""}
Lang.mission.str1086= {"请合力打掉全部“冏“字！","","","","",""}
Lang.mission.str1087= {"队员攻击了错误目标！全体定身！","","","","",""}
Lang.mission.str1088= {"<color=green>第二节点：<color=yellow>红龟勿扰\\r\\r<color=green>帮助：红龟会造成高伤害，千万别攻击或靠近！\\r\\r<color=white>目标:消灭所有普通石龟","","","","",""}
Lang.mission.str1089= {"小心！别骚扰红色的龟","","","","",""}

Lang.mission.str1090= {"打开屏障","","","","",""}
Lang.mission.str1091= {"<color=green>第三节点：<color=yellow>巨石来啦\\r\\r<color=green>帮助：清掉路上的怪，就会阻止石头前进。\\r\\r<color=white>目标:打掉所有石龟","","","","",""}
Lang.mission.str1092= {"巨石来了！快跑啊！","","","","",""}
Lang.mission.str1093= {"<color=green>第三节点：<color=yellow>巨石来啦\\r\\r<color=green>帮助：快快打掉路上的真保护罩。\\r\\r<color=white>目标:打掉所有保护罩","","","","",""}
Lang.mission.str1094= {"BOSS传送门已开启","","","","",""}
Lang.mission.str1095= {"竟敢跑到这里来！那就把命留下吧！","","","","",""}
Lang.mission.str1096= {"关卡剧情中","","","","",""}
Lang.mission.str1097= {"<color=green>本关BOSS：<color=yellow>巨石怪\\r\\r<color=green>帮助：巨石怪会变换形态，要小心！\\r\\r<color=white>目标:消灭巨石怪","","","","",""}
Lang.mission.str1098= {"小心形态多变的巨石怪","","","","",""}
Lang.mission.str1099= {"快闪开！巨石怪要撞人啦","","","","",""}
Lang.mission.str1100= {"快阻止巨石怪加血","","","","",""}
Lang.mission.str1101= {"巨石怪进入暴走状态","","","","",""}


Lang.mission.str1102= {"<color=green>         密室逃脱\\r\\r开始倒计时：%s","","","","",""}
Lang.mission.str1103= {"<color=green>         密室逃脱\\r\\r剩余时间：%s","","","","",""}
Lang.mission.str1104= {"请选择一种能力果实","","","","",""}
Lang.mission.str1105= {"<color=yellow>选择一种属性果实\\r\\r<color=green>帮助：\\r攻击属性：攻击+30%\\r\\r速度属性：增加移动速度\\r\\r恢复属性：恢复队友血量","","","","",""}
Lang.mission.str1106= {"传送水晶已开启","","","","",""}
Lang.mission.str1107= {"消灭前方所有敌人","","","","",""}
Lang.mission.str1108= {"<color=green>第一节点：<color=yellow>斩尽魔兵\\r\\r<color=green>帮助：快快清掉路上的所有魔兵吧！\\r\\r<color=white>目标:消灭所有魔兵","","","","",""}
Lang.mission.str1109= {"传送到第二个房间","","","","",""}

Lang.mission.str1110= {"利用圣光更快打倒怨灵","","","","",""}
Lang.mission.str1111= {"<color=green>第二节点：<color=yellow>圣光灭魔\\r\\r<color=green>帮助：房间四角会随机刷出圣光圈，移动到圣光圈内触发圣光降低怨灵防御\\r\\r<color=white>目标:消灭怨灵","","","","",""}
Lang.mission.str1112= {"传送到第三个房间","","","","",""}
Lang.mission.str1113= {"小心！开关旁边有很多鬼在游荡！","","","","",""}
Lang.mission.str1114= {"<color=green>第三节点：<color=yellow>炼鬼炉\\r\\r<color=green>帮助：破坏左方的炼鬼炉，鬼魂消失并且不会复活了！\\r\\r<color=white>目标:破坏两个炼鬼炉","","","","",""}
Lang.mission.str1115= {"进入BOSS房间","","","","",""}
Lang.mission.str1116= {"BOSS水晶已开启","","","","",""}
Lang.mission.str1117= {"妖王出现了！请小心！","","","","",""}
Lang.mission.str1118= {"逃吧！使劲的逃吧！","","","","",""}
Lang.mission.str1119= {"<color=green>本关BOSS：<color=yellow>妖王\\r\\r<color=green>帮助：妖王会召唤高伤害鬼魂和回血鬼魂！赶快打掉对你有好处哦！\\r\\r<color=white>目标:消灭妖王","","","","",""}

Lang.mission.str1120= {"妖王已被击败！准备进入下一层","","","","",""}
Lang.mission.str1121= {"妖王召唤出小鬼了！赶快清掉！","","","","",""}
Lang.mission.str1122= {"妖王召唤出小鬼了！赶快清掉！","","","","",""}
Lang.mission.str1123= {"妖王暴走了！干掉那些帮妖王加血的鬼魂","","","","",""}
Lang.mission.str1124= {"<color=green>         苏醒的将军\\r\\r开始倒计时：%s","","","","",""}
Lang.mission.str1125= {"<color=green>         苏醒的将军\\r\\r本关剩余时间：%s","","","","",""}
Lang.mission.str1126= {"到底有什么在前方等着！","","","","",""}
Lang.mission.str1127= {"<color=green>本关BOSS：<color=yellow>大将军\\r\\r<color=green>帮助：大将军会使用多种范围技能，注意躲避就可以了！本关还会不断提供回血魔法\\r\\r<color=white>目标:消灭大将军","","","","",""}
Lang.mission.str1128= {"沉睡千年的大将军苏醒了！请小心！","","","","",""}
Lang.mission.str1129= {"大将军召唤出分身了！赶紧清理掉！","","","","",""}

Lang.mission.str1130= {"台风来啦！快跑啊！","","","","",""}
Lang.mission.str1131= {"普通关卡通关完成！","","","","",""}
Lang.mission.str1132= {"<color=green>离开关卡倒计时：%s","","","","",""}
Lang.mission.str1133= {"四周突然雷鸣电闪！","","","","",""}
Lang.mission.str1134= {"20级蛮荒之地","","","","",""}
Lang.mission.str1135= {"40级蛮荒之地","","","","",""}
Lang.mission.str1136= {"60级蛮荒之地","","","","",""}
Lang.mission.str1137= {"80级蛮荒之地","","","","",""}
Lang.mission.str1138= {"副本关闭","","","","",""}
---[[

Lang.mission.str1140= {"<color=yellow>           密室逃脱\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str1141= {"消灭前面挡路的魔兵","","","","",""}
Lang.mission.str1142= {"<color=yellow>副本玩法：<color=white>\\r一：消灭路上所有<color=green>魔兵<color=white>\\r\\r二：利用<color=green>圣光<color=white>削弱怨灵\\r\\r三：击败<color=green>妖王<color=white>即可胜利\\r\\r<color=yellow>目标：消灭所有魔兵","","","","",""}
Lang.mission.str1143= {"传送水晶已开启","","","","",""}
Lang.mission.str1144= {"传送到第二个房间","","","","",""}
Lang.mission.str1145= {"利用圣光更快打倒怨灵","","","","",""}
Lang.mission.str1146= {"<color=yellow>副本玩法：<color=white>\\r一：消灭路上所有<color=green>魔兵<color=white>\\r\\r二：利用<color=green>圣光<color=white>削弱怨灵\\r\\r三：击败<color=green>妖王<color=white>即可胜利\\r\\r<color=yellow>目标：消灭怨灵","","","","",""}
Lang.mission.str1147= {"进入BOSS房间","","","","",""}
Lang.mission.str1148= {"BOSS水晶已开启","","","","",""}
Lang.mission.str1149= {"妖王出现了！请小心！","","","","",""}
Lang.mission.str1150= {"逃吧！使劲的逃吧！","","","","",""}
Lang.mission.str1151= {"<color=yellow>副本玩法：<color=white>\\r一：消灭路上所有<color=green>魔兵<color=white>\\r\\r二：利用<color=green>圣光<color=white>削弱怨灵\\r\\r三：击败<color=green>妖王<color=white>即可胜利\\r\\r<color=yellow>目标：消灭妖王","","","","",""}
Lang.mission.str1152= {"<color=green>副本结束倒计时：%s","","","","",""}
Lang.mission.str1153= {"副本开启","","","","",""}
Lang.mission.str1154= {"<color=yellow>           密室逃脱\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str1155= {"消灭前面挡路的魔兵","","","","",""}
Lang.mission.str1156= {"<color=yellow>副本玩法：<color=white>\\r一：消灭路上所有<color=green>魔兵<color=white>\\r\\r二：利用<color=green>圣光<color=white>削弱怨灵\\r\\r三：击败<color=green>妖王<color=white>即可胜利\\r\\r<color=yellow>目标：消灭所有魔兵","","","","",""}
Lang.mission.str1157= {"<color=yellow>副本玩法：<color=white>\\r一：消灭路上所有<color=green>魔兵<color=white>\\r\\r二：利用<color=green>圣光<color=white>削弱怨灵\\r\\r三：击败<color=green>妖王<color=white>即可胜利\\r\\r<color=yellow>目标：消灭怨灵","","","","",""}
Lang.mission.str1158= {"<color=yellow>副本玩法：<color=white>\\r一：消灭路上所有<color=green>魔兵<color=white>\\r\\r二：利用<color=green>圣光<color=white>削弱怨灵\\r\\r三：击败<color=green>妖王<color=white>即可胜利\\r\\r<color=yellow>目标：消灭妖王","","","","",""}
Lang.mission.str1159= {"妖王已被击败","","","","",""}
Lang.mission.str1160= {"<color=green>副本结束倒计时：%s","","","","",""}
Lang.mission.str1161= {"注意！队员被敌人发现了！","","","","",""}
Lang.mission.str1162= {"<color=yellow>            白骨精\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str1163= {"警告！警告！前面就是邪恶的白骨精","","","","",""}
Lang.mission.str1164= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>白骨精<color=white>打败\\r\\r<color=yellow>目标：打败白骨精","","","","",""}
Lang.mission.str1165= {"白骨！白骨！白骨！","","","","",""}
Lang.mission.str1166= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>白骨精<color=white>打败\\r\\r<color=yellow>目标：打败白骨精","","","","",""}
Lang.mission.str1167= {"<color=yellow>            冰火炼狱\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str1168= {"警告！警告！前面就是邪恶的冰炼和火狱","","","","",""}
Lang.mission.str1169= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>冰炼<color=white>和<color=green>火狱<color=white>打败\\r\\r打败其中一个BOSS另外一个BOSS能力会加强\\r\\r<color=yellow>目标：打败冰炼和火狱","","","","",""}
Lang.mission.str1170= {"加点冰！","","","","",""}
Lang.mission.str1171= {"加点火！","","","","",""}
Lang.mission.str1172= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>冰炼<color=white>和<color=green>火狱<color=white>打败\\r\\r打败其中一个BOSS另外一个BOSS能力会加强\\r\\r<color=yellow>目标：打败冰炼和火狱","","","","",""}
Lang.mission.str1173= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>冰炼<color=white>和<color=green>火狱<color=white>打败\\r\\r打败其中一个BOSS另外一个BOSS能力会加强\\r\\r<color=yellow>目标：打败冰炼和火狱","","","","",""}
Lang.mission.str1174= {"警告！BOSS进入愤怒状态","","","","",""}
Lang.mission.str1175= {"你竟敢杀我兄弟！！","","","","",""}
Lang.mission.str1176= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>冰炼<color=white>和<color=green>火狱<color=white>打败\\r\\r打败其中一个BOSS另外一个BOSS能力会加强\\r\\r<color=yellow>目标：打败冰炼和火狱","","","","",""}
Lang.mission.str1177= {"兄弟！我会为你报仇的！","","","","",""}
Lang.mission.str1178= {"成功通关冰火炼狱","","","","",""}
Lang.mission.str1179= {"<color=yellow>            冰火炼狱\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str1180= {"告！警告！前面就是邪恶的冰炼和火狱","","","","",""}
Lang.mission.str1181= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>冰炼<color=white>和<color=green>火狱<color=white>打败\\r\\r打败其中一个BOSS另外一个BOSS能力会加强\\r\\r<color=yellow>目标：打败冰炼和火狱","","","","",""}
Lang.mission.str1182= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>冰炼<color=white>和<color=green>火狱<color=white>打败\\r\\r打败其中一个BOSS另外一个BOSS能力会加强\\r\\r<color=yellow>目标：打败冰炼和火狱","","","","",""}
Lang.mission.str1179= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>冰炼<color=white>和<color=green>火狱<color=white>打败\\r\\r打败其中一个BOSS另外一个BOSS能力会加强\\r\\r<color=yellow>目标：打败冰炼和火狱","","","","",""}
Lang.mission.str1180= {"警告！BOSS进入愤怒状态","","","","",""}
Lang.mission.str1181= {"Lang.mission.str1181","","","","",""}
Lang.mission.str1182= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>冰炼<color=white>和<color=green>火狱<color=white>打败\\r\\r打败其中一个BOSS另外一个BOSS能力会加强\\r\\r<color=yellow>目标：打败冰炼和火狱","","","","",""}
Lang.mission.str1183= {"<color=yellow>            魔掌\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str1184= {"前面就是强壮的魔掌！据说是右手！","","","","",""}
Lang.mission.str1185= {"<color=yellow>副本玩法：<color=white>\\r离<color=green>魔掌<color=white>太远魔掌会自己回血哦！\\r\\r<color=yellow>目标：打败魔掌","","","","",""}
Lang.mission.str1186= {"<color=yellow>副本玩法：<color=white>\\r离<color=green>魔掌<color=white>太远魔掌会自己回血哦！\\r\\r<color=yellow>目标：打败魔掌","","","","",""}
Lang.mission.str1187= {"<color=yellow>            魔掌\\r\\r副本剩余时间：<color=white>%s","","","","",""}
Lang.mission.str1188= {"警告！警告！前面就是邪恶的魔掌","","","","",""}
Lang.mission.str1189= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>魔掌<color=white>打败\\r\\r<color=yellow>目标：打败魔掌","","","","",""}
Lang.mission.str1190= {"<color=yellow>副本玩法：<color=white>\\r将<color=green>魔掌<color=white>打败\\r\\r<color=yellow>目标：打败魔掌","","","","",""}
Lang.mission.str1191= {"台风来啦！快跑啊！","","","","",""}


Lang.mission.str1192= {"你今天已参加过神魔战场，请明天再来","","","","",""}
Lang.mission.str1193= {"所要加入的地图非蛮荒之地!","","","","",""}
Lang.mission.str1194= {"当前地图人数已满，请选择其他地图!","","","","",""}
Lang.mission.str1195= {"你今天已经参加过战神无双，请明天再来","","","","",""}
Lang.mission.str1196= {"背包已满，获取篝火令失败","","","","",""}
Lang.mission.str1197= {"族长%s领取了篝火令，赶紧找个地方烧烤吧","","","","",""}
Lang.mission.str1198= {"请族长先使用篝火令","","","","",""}
Lang.mission.str1199= {"战斗地图不能传送","","","","",""}
Lang.mission.str1200= {"你已经在篝火范围内","","","","",""}
Lang.mission.str1201= {"所加入的步骤未开启，请开启后再加入","","","","",""}
Lang.mission.str1202= {"你需要到达%d级才能参加活动[%s]","","","","",""}
Lang.mission.str1203= {"不在活动时间内，无法进入","","","","",""}
Lang.mission.str1204= {"本次活动报名时间已结束，下次活动请尽早参加!","","","","",""}
Lang.mission.str1205= {"使用","","","","",""}
Lang.mission.str1206= {"人类全都给我消失！","","","","",""}
Lang.mission.str1207= {"喝！","","","","",""}
Lang.mission.str1208= {"小弟们！都给我出来！","","","","",""}
Lang.mission.str1209= {"都给我过来！","","","","",""}
Lang.mission.str1210= {"洗衣机攻击！","","","","",""}
Lang.mission.str1211= {"我的身~身体~！啊~~~~","","","","",""}
Lang.mission.str1212= {"洗衣机攻击！","","","","",""}
Lang.mission.str1213= {"风暴来袭！","","","","",""}
Lang.mission.str1214= {"来！让我吸一口血吧！","","","","",""}
Lang.mission.str1215= {"再次风暴来袭！","","","","",""}
Lang.mission.str1216= {"神马飞腾驱浮云，圣法无边天下知！尊敬的帝天神皇【%s】上线啦！","","","","",""}
Lang.mission.str1217= {"副本开启","","","","",""}
Lang.mission.str1218= {"妖王已被击败","","","","",""}
Lang.mission.str1219= {"是否花费%d元宝清空冷却时间","","","","",""}
Lang.mission.str1220= {"开启该道具需要花费%d%s,确定要开启吗?","","","","",""}
Lang.mission.str1221= {"合成成功","","","","",""}
Lang.mission.str1222= {"合成失败","","","","",""}
Lang.mission.str1223= {"<%s>感到了神仙卡片上的仙气不同寻常，打开一看竟然是<%s>的<%s>！","","","","",""}
Lang.mission.str1224= {"根据拼凑起来的上古锻造书，<%s>终于炼成了<%s>的<%s>！","","","","",""}
Lang.mission.str1225= {"副本关闭","","","","",""}
Lang.mission.str1226= {"副本关闭","","","","",""}
Lang.mission.str1227= {"副本关闭","","","","",""}
Lang.mission.str1228= {"副本关闭","","","","",""}
Lang.mission.str1229= {"副本关闭","","","","",""}
Lang.mission.str1230= {"副本关闭","","","","",""}
Lang.mission.str1231= {"<%s>神勇无比，在伐魔塔内成功突破了第70层！","","","","",""}
Lang.mission.str1232= {"<%s>神勇无比，在伐魔塔内成功突破了第80层！","","","","",""}
Lang.mission.str1233= {"<%s>神勇无比，在伐魔塔内成功突破了第90层！","","","","",""}
Lang.mission.str1234= {"<%s>神勇无比，在伐魔塔内成功突破了第100层！","","","","",""}
Lang.mission.str1235= {"<%s>神勇无比，在伐魔塔内成功突破了第110层！","","","","",""}
Lang.mission.str1236= {"<%s>神勇无比，在伐魔塔内成功突破了第120层！","","","","",""}
Lang.mission.str1237= {"<color=yellow>[第61层]\\r目标：击败地府冥卒","","","","",""}
Lang.mission.str1238= {"<color=yellow>[第62层]\\r目标：击败鬼兵","","","","",""}
Lang.mission.str1239= {"<color=yellow>[第63层]\\r目标：击败鬼卒","","","","",""}
Lang.mission.str1240= {"<color=yellow>[第64层]\\r目标：击败鱼精","","","","",""}
Lang.mission.str1241= {"<color=yellow>[第65层]\\r目标：击败独行侠","","","","",""}
Lang.mission.str1242= {"<color=yellow>[第66层]\\r目标：击败河妖","","","","",""}
Lang.mission.str1243= {"<color=yellow>[第67层]\\r目标：击败恶霸","","","","",""}

Lang.mission.str1244= {"<color=yellow>[第68层]\\r目标：击败飞贼","","","","",""}
Lang.mission.str1245= {"<color=yellow>[第69层]\\r目标：击败盗匪","","","","",""}
Lang.mission.str1246= {"<color=yellow>[第70层]\\r目标：击败二当家","","","","",""}
Lang.mission.str1247= {"<color=yellow>[第71层]\\r目标：击败大毒虫","","","","",""}
Lang.mission.str1248= {"<color=yellow>[第72层]\\r目标：击败嗜血黑熊","","","","",""}
Lang.mission.str1249= {"<color=yellow>[第73层]\\r目标：击败年兽","","","","",""}
Lang.mission.str1250= {"<color=yellow>[第74层]\\r目标：击败毒蜘蛛","","","","",""}
Lang.mission.str1251= {"<color=yellow>[第75层]\\r目标：击败牛魔王","","","","",""}
Lang.mission.str1252= {"<color=yellow>[第76层]\\r目标：击败蟾蜍","","","","",""}
Lang.mission.str1253= {"<color=yellow>[第77层]\\r目标：击败怪盗","","","","",""}

Lang.mission.str1254= {"<color=yellow>[第78层]\\r目标：击败牛头怪","","","","",""}
Lang.mission.str1255= {"<color=yellow>[第79层]\\r目标：击败哮天犬","","","","",""}
Lang.mission.str1256= {"<color=yellow>[第80层]\\r目标：击败西域邪龙","","","","",""}
Lang.mission.str1257= {"<color=yellow>[第81层]\\r目标：击败黑老鸦","","","","",""}
Lang.mission.str1258= {"<color=yellow>[第82层]\\r目标：击败鸟人","","","","",""}
Lang.mission.str1259= {"<color=yellow>[第83层]\\r目标：击败猕猴","","","","",""}
Lang.mission.str1260= {"<color=yellow>[第84层]\\r目标：击败江湖人士","","","","",""}
Lang.mission.str1261= {"<color=yellow>[第85层]\\r目标：击败大巨人","","","","",""}
Lang.mission.str1262= {"<color=yellow>[第86层]\\r目标：击败毒箭兵","","","","",""}
Lang.mission.str1263= {"<color=yellow>[第87层]\\r目标：击败熔岩怪","","","","",""}


Lang.mission.str1264= {"<color=yellow>[第88层]\\r目标：击败鬼魂","","","","",""}
Lang.mission.str1265= {"<color=yellow>[第89层]\\r目标：击败食人花","","","","",""}
Lang.mission.str1266= {"<color=yellow>[第90层]\\r目标：击败左将军","","","","",""}
Lang.mission.str1267= {"<color=yellow>[第91层]\\r目标：击败木人","","","","",""}
Lang.mission.str1268= {"<color=yellow>[第92层]\\r目标：击败公鸡","","","","",""}
Lang.mission.str1269= {"<color=yellow>[第93层]\\r目标：击败狼","","","","",""}
Lang.mission.str1270= {"<color=yellow>[第94层]\\r目标：击败野狐狸","","","","",""}
Lang.mission.str1271= {"<color=yellow>[第95层]\\r目标：击败曾雅","","","","",""}
Lang.mission.str1272= {"<color=yellow>[第96层]\\r目标：野狼","","","","",""}
Lang.mission.str1273= {"<color=yellow>[第97层]\\r目标：击败树妖","","","","",""}


Lang.mission.str1274= {"<color=yellow>[第98层]\\r目标：击败天香羚","","","","",""}
Lang.mission.str1275= {"<color=yellow>[第99层]\\r目标：击败遗迹魔塔","","","","",""}
Lang.mission.str1276= {"<color=yellow>[第100层]\\r目标：击败垂钓老者","","","","",""}
Lang.mission.str1277= {"<color=yellow>[第101层]\\r目标：击败百年老妖","","","","",""}
Lang.mission.str1278= {"<color=yellow>[第102层]\\r目标：击败鼓灵童","","","","",""}
Lang.mission.str1279= {"<color=yellow>[第103层]\\r目标：击败螃蟹精","","","","",""}
Lang.mission.str1280= {"<color=yellow>[第104层]\\r目标：击败僵尸兵","","","","",""}
Lang.mission.str1281= {"<color=yellow>[第105层]\\r目标：击败冥将","","","","",""}
Lang.mission.str1282= {"<color=yellow>[第106层]\\r目标：击败大眼猴","","","","",""}
Lang.mission.str1283= {"<color=yellow>[第107层]\\r目标：击败怨灵","","","","",""}


Lang.mission.str1284= {"<color=yellow>[第108层]\\r目标：击败变种鳄龟","","","","",""}
Lang.mission.str1285= {"<color=yellow>[第109层]\\r目标：击败激素熊精","","","","",""}
Lang.mission.str1286= {"<color=yellow>[第110层]\\r目标：击败丰臣秀吉","","","","",""}
Lang.mission.str1287= {"<color=yellow>[第111层]\\r目标：击败蟾蜍","","","","",""}
Lang.mission.str1288= {"<color=yellow>[第112层]\\r目标：击败狂暴鱼人","","","","",""}
Lang.mission.str1289= {"<color=yellow>[第113层]\\r目标：击败毒虫","","","","",""}
Lang.mission.str1290= {"<color=yellow>[第114层]\\r目标：击败牛兵","","","","",""}
Lang.mission.str1291= {"<color=yellow>[第115层]\\r目标：击败鞭妖","","","","",""}
Lang.mission.str1292= {"<color=yellow>[第116层]\\r目标：击败空虚公子","","","","",""}
Lang.mission.str1293= {"<color=yellow>[第117层]\\r目标：击败天残脚","","","","",""}


Lang.mission.str1294= {"<color=yellow>[第118层]\\r目标：击败冰玉米","","","","",""}
Lang.mission.str1295= {"<color=yellow>[第119层]\\r目标：击败火玉米","","","","",""}
Lang.mission.str1296= {"<color=yellow>[第120层]\\r目标：击败[BOSS]傀儡王","","","","",""}
Lang.mission.str1297= {"是否花费%d元宝一键完成","","","","",""}
Lang.mission.str1298= {"你确定使用一张任务刷新符来重置所有任务吗？（已接受和提交的任务不会被重置）","","","","",""}
Lang.mission.str1299= {"你的任务刷新符不足,无法重置任务！是否花费%d元宝直接重置任务？","","","","",""}
Lang.mission.str1300= {"获得新的任务：","","","","",""}
Lang.mission.str1301= {"重复任务-","","","","",""}
Lang.mission.str1302= {"你的神仙栏已经满了，请开锁后再来领取天神令","","","","",""}
Lang.mission.str1303= {"你获得了宠物: ","","","","",""}
Lang.mission.str1304= {"恭喜您开启天神令，获得%s神仙%s！","","","","",""}
Lang.mission.str1305= {"装备了坐骑: ","","","","",""}
Lang.mission.str1306= {"你的神仙栏已经满了，请开锁后再来领取天神令","","","","",""}
Lang.mission.str1307= {"你获得了宠物: ","","","","",""}
Lang.mission.str1308= {"恭喜您开启天神令，获得%s神仙%s！","","","","",""}
Lang.mission.str1309= {"装备了坐骑: ","","","","",""}
Lang.mission.str1310= {"?????","","","","",""}
--[[
--全局变量保护，从此不允许出现新的全局变量
local tbMetaTable	= {
	__newindex	= function (tb, key, value)
		if (key == "it" or key == "him" or key == "me") then
			rawset(_G, key, value);
		else
			error("Attempt create global value :"..tostring(key), 2);
		end;
	end,
};
setmetatable(_G, tbMetaTable);

local tbLunaMT =  {
	__index = function(tb, key)
		return rawget(tb)
	end
}--]]

--== 太常用的需要前置的文件，放在这里一次性Require ==--

-- 全部通用
--Include("script/lib/language.lua")
Include("script/lib/timer.lua");
Include("script/lib/lib.lua");
Include("script/lib/debug/dbg.lua");
Include("script/lib/calc.lua");
Include("script/config/env.lua");
Include("script/config/event.lua");
Include("script/lib/callcenter.lua");
Include("script/item/item.lua")


