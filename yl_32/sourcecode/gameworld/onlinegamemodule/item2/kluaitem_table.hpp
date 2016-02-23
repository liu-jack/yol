/* -------------------------------------------------------------------------
//	文件名		：	kluaitem_table.hpp
//	创建者		：	LuaScriptTool
//	功能描述	：	本文件由VisualStudio宏生成，请不要手动修改！！
//	使用方法	：	在相应的CPP文件末端，include此文件
//
// -----------------------------------------------------------------------*/

DEFINE_LUA_CLASS_BEGIN(KLuaItem)
	REGISTER_LUA_STRING_READONLY(Name, "道具名称（包含后缀名）")
	REGISTER_LUA_STRING_READONLY(OrgName, "道具原名（不含后缀名）")
	REGISTER_LUA_STRING_READONLY(Suffix, "道具后缀名")
	REGISTER_LUA_INTEGER_READONLY(Genre, "道具种类 (武器? 药品? 矿石?)")
	REGISTER_LUA_INTEGER_READONLY(Detail, "道具详细类别")
	REGISTER_LUA_INTEGER_READONLY(Particular, "道具具体类别")
	REGISTER_LUA_INTEGER_READONLY(Level, "道具等级")
	REGISTER_LUA_INTEGER_READONLY(ReqLevel, "")
	REGISTER_LUA_INTEGER_READONLY(Quality, "道具品质")
	REGISTER_LUA_INTEGER_READONLY(FightPower, "战斗力")
	REGISTER_LUA_DWORD_READONLY(RandSeed, "道具随机种子")
	REGISTER_LUA_DWORD_READONLY(RandSeedEx, "道具随机种子")
	REGISTER_LUA_INTEGER_READONLY(Count, "道具当前叠加数目")
	REGISTER_LUA_INTEGER_READONLY(MaxCount, "道具最大叠加数目")
	REGISTER_LUA_INTEGER_READONLY(Price, "道具价格")
	REGISTER_LUA_INTEGER_READONLY(BindType, "道具绑定类型")
	REGISTER_LUA_INTEGER(EnhTimes, "道具已强化次数")
	REGISTER_LUA_INTEGER_READONLY(SlotSize, "装备的宝石孔数量")
	REGISTER_LUA_INTEGER_READONLY(Strengthen, "道具改造等级")
	REGISTER_LUA_INTEGER_READONLY(EquipPos, "装备应在身上装备的位置")
	REGISTER_LUA_INTEGER_READONLY(Value, "道具的价值量")
	REGISTER_LUA_INTEGER_READONLY(StarLevel, "道具的价值量星级")
	REGISTER_LUA_INTEGER_READONLY(NameColor, "道具的名字颜色")
	REGISTER_LUA_INTEGER_READONLY(CdType, "道具的CD时间类型")
	REGISTER_LUA_INTEGER_READONLY(CustomType, "道具的自定义字符串类型")
	REGISTER_LUA_INTEGER_READONLY(EquipCategory, "装备类别")
	REGISTER_LUA_DWORD_READONLY(Id, "道具ID")
	REGISTER_LUA_STRING_READONLY(Class, "Class名字")
	REGISTER_LUA_STRING_READONLY(CustomString, "道具自定义字符串")
	REGISTER_LUA_STRING_READONLY(ForbidType, "限制类型")
	REGISTER_LUA_FUNC(GetTempTable, "取得脚本用的临时Table", "", "", "与此类绑定的临时Table")
	REGISTER_LUA_FUNC(IsEquip, "判断该道具是否一件装备", "", "", "1-是装备")
	REGISTER_LUA_FUNC(IsStone, "判断该道具是否宝石", "", "", "1-是宝石")
	REGISTER_LUA_FUNC(IsInvalid, "判断该道具是否处于失效状态", "", "", "1-失效")
	REGISTER_LUA_FUNC(IsDuped, "判断是否复制道具", "", "", "1-是复制道具")
	REGISTER_LUA_FUNC(IsTemp, "判断是否临时道具", "", "", "1-是临时道具")
	REGISTER_LUA_FUNC(GetLockIntervale, "取出解绑周期，为0表示不能自动解绑", "", "", "dwTime，秒数")
	REGISTER_LUA_FUNC(IsLock, "判断是否已锁定", "", "", "1-已锁定")
	REGISTER_LUA_FUNC(IsBind, "判断是否已绑定", "", "", "1-已绑定")
	REGISTER_LUA_FUNC(CanBeShortcut, "是否可以放进快捷栏", "", "", "1可以")
	REGISTER_LUA_FUNC(GetBaseAttrib, "获取物品的基础属性", "", "", "魔法属性表")
	REGISTER_LUA_FUNC(GetReqAttrib, "获取物品的需求属性", "", "", "魔法属性表")
	REGISTER_LUA_FUNC(GetExtParam, "获取物品的扩展参数表", "[d]", "nIndex	返回第nIndex个扩展参数，0表示返回整个扩展参数表;", "指定扩展参数或扩展参数表")
	REGISTER_LUA_FUNC(IsStackable, "是否可叠放物品", "", "", "1可叠放物品")
	REGISTER_LUA_FUNC(IsDestoriable, "可否销毁", "", "", "1可销毁")
	REGISTER_LUA_FUNC(IsForbitThrow, "可否丢弃", "", "", "1不可丢弃")
	REGISTER_LUA_FUNC(IsForbitSell, "可否卖店", "", "", "1不可卖店")
	REGISTER_LUA_FUNC(GetOwner, "获得道具所属的角色对象", "", "", "不属于任何角色则返回nil")
	REGISTER_LUA_FUNC(Remove, "将道具对象从游戏世界删除（道具此时应该不属于任何一个角色）", "", "", "成功返回1")
	REGISTER_LUA_FUNC(SetTimeOut, "设置过期时间", "dd", "过期类型：0绝对时间（秒数），1相对时间（也是秒数）;时间;", "")
	REGISTER_LUA_FUNC(SetCount, "设置物品的个数", "d[d]", "设置的个数;数据埋点类型途径;", "1成功")
	REGISTER_LUA_FUNC(SetGenerateMoneyType, "设置道具操作时选择的金钱类型", "d", "设置金钱类型;", "")
	REGISTER_LUA_FUNC(GetSellMoneyType, "返回卖店可获得的银两类型", "", "", "0:绑定银两; 1:普通银两")
	REGISTER_LUA_FUNC(HasStone, "返回装备孔位置上是否有镶嵌宝石", "d", "宝石孔位置1-3;", "1:有 0:没有")
	REGISTER_LUA_FUNC(GetEquipScore, "", "", "", "装备评分")
	REGISTER_LUA_FUNC(GetResourceId, "", "", "", "")
	REGISTER_LUA_FUNC(GetChangeColorScheme, "", "", "", "")
	REGISTER_LUA_FUNC(GetTimeOut, "获得装备超时时间", "", "", "0:绝对时间（秒数）; 1:相对时间（也是秒数）")
	REGISTER_LUA_FUNC(Bind, "绑定道具", "d", "bForce:强制;", "1成功绑定")
	REGISTER_LUA_FUNC(GetGDPLStr, "得到物品的gdpl字符串", "", "", "1 成功")
	REGISTER_LUA_FUNC(StoneClean, "宝石摘取后整理（把后面的宝石提到前面）", "", "", "1 成功")
	REGISTER_LUA_FUNC(StonePunch, "宝石打孔", "d", "宝石孔位置;", "1 成功")
	REGISTER_LUA_FUNC(GetStoneInfo, "得到一件装备的宝石信息", "", "", "宝石信息 { {nStoneId = ?, nStoneLevel = ?}, 0, -1 } // 0:未打宝石的孔，-1:没有孔")
	REGISTER_LUA_FUNC(GetAppendAttr, "得到一件装备的附加属性信息", "", "", "附加属性信息 { {nAttr = ?, nValue = ?}, ...}")
	REGISTER_LUA_FUNC(GetUpgradeItems, "得到装备升级所需材料信息", "", "", "")
	REGISTER_LUA_FUNC(GetSaveAppendAttr, "得到一件装备的洗炼后的附加属性信息", "", "", "附加属性信息 { {nAttr = ?, nValue = ?}, ...}")
	REGISTER_LUA_FUNC(GetBagPosLimit, "获得背包位置限制", "", "", "1成功绑定")
	REGISTER_LUA_FUNC(GetNextReqLevel, "获得下一等级装备的需求等级", "", "", "")
	REGISTER_LUA_FUNC(GetStoneType, "获得宝石类型", "", "", "")

#ifdef GAME_SERVER
	REGISTER_LUA_INTEGER(BuyPrice, "Ib价值")
	REGISTER_LUA_STRING_READONLY(GUID, "GUID的字符串")
	REGISTER_LUA_DWORD_READONLY(GenTime, "道具生成时间")
	REGISTER_LUA_FUNC(IsIbItem, "是否IB物品", "", "", "1:是,0:否")
	REGISTER_LUA_FUNC(Regenerate, "重新生成一个道具", "ddddd???uu", "nGenre		;nDetailType	;nParticularType;nLevel:道具等级;nEnhTimes:道具已强化次数;若是table类型，则为StoneInfo的Table;若是table类型，则为附加属性信息;若是table类型，则为洗炼时锁住的属性( {0, 0, 1, 1, 0, 0} 表示第3和4条附加属性锁住了 );uRandSeed;uRandSeedEx;", "成功返回1")
	REGISTER_LUA_FUNC(ClearSaveAppendAttr, "清除已保存的洗炼附加属性", "d", "nSaveOri;", "1成功")
	REGISTER_LUA_FUNC(Sync, "同步道具数据到客户端", "", "", "1成功")
	REGISTER_LUA_FUNC(ChangeColorScheme, "设置装备换色方案", "d", "nScheme:新的换色方案;", "1成功")
	REGISTER_LUA_FUNC(SetCustom, "设置道具自定义字符串", "ds", "nCustomType:类型（）;szCustom:自定义字符串;", "1成功")
	REGISTER_LUA_FUNC(SetExtParam, "设置道具ExtParam", "dd", "位置;数据;", "1成功")
	REGISTER_LUA_FUNC(ApplyMagicAttrib, "应用魔法属性（应该移到技能魔法属性里）", "s{dd}[d]", "szAttrib:魔法属性名;nValue1:魔法属性参数1;nValue2:魔法属性参数2;bSync:是否同步客户端;", "")
	REGISTER_LUA_FUNC(RemoveMagicAttrib, "移除NPC的魔法属性", "s{dd}", "szAttrib:魔法属性名;nValue1:魔法属性参数1;nValue2:魔法属性参数2;", "无")
#endif // #ifdef GAME_SERVER

#ifdef GAME_CLIENT
	REGISTER_LUA_STRING_READONLY(Intro, "道具的描述信息")
	REGISTER_LUA_STRING_READONLY(Help, "道具的描述信息")
	REGISTER_LUA_INTEGER_READONLY(Index, "道具的全局索引号")
	REGISTER_LUA_STRING_READONLY(IconImage, "")
	REGISTER_LUA_STRING_READONLY(ViewImage, "")
	REGISTER_LUA_STRING_READONLY(TransparencyIcon, "道具透明图层图标")
	REGISTER_LUA_STRING_READONLY(MaskLayerIcon, "道具掩图层图标")
#endif // #ifdef GAME_CLIENT
DEFINE_LUA_CLASS_END()
