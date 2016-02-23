
#pragma once

#include <map>
#include <list>
#include "ProtocolBasic.h"
#include "serverbase/KinDef.h"
#include "serverbase/KinDB.h"
#include "KinRepertory.h"
#include "KinHistory.h"

class KRole;

class KTong
{
public:
    KTong();

    BOOL Init();
    void UnInit();

    void Activate();

    BOOL Load(DWORD dwTongID, BYTE* pbyData, size_t uDataLen);
    BOOL Save(size_t* puUseSize, BYTE* pbyBuffer, size_t uBufferSize);

    KTongMember* GetMember(DWORD dwID)
    {
        KROSTER::iterator Iter = m_Roster.find(dwID);
        
        if (Iter == m_Roster.end())
            return NULL;

        return &Iter->second;
    }

	VOID GetMembers(std::vector<DWORD>& vecMemberIds)
	{
		vecMemberIds.clear();

		for(KROSTER::iterator it = m_Roster.begin(); it != m_Roster.end(); ++it)
		{
			vecMemberIds.push_back(it->first);
		}
	}

    BOOL AddNewMember(KRole* pRole, int nGroupID);
    BOOL RemoveMember(KRole* pRole);

	INT GetMemberNum() { return m_Roster.size(); }

    void Disband();

	VOID SyncRecords();

	BOOL SetActivityOpenTime(DWORD dwActivityIndex, DWORD dwActivityOpenTime);

	DWORD GetActivityOpenTime(DWORD dwActivityIndex);

	DWORD GetTotalFightScore();

	DWORD GetTotalSalary();

    // nGroup 能不能做 nOperation 的操作
    BOOL CanBaseOperate(int nGroup, int nOperation);

    // nGroup 能不能对 nTargetGroup 做 nOperation 的操作
    BOOL CanAdvanceOperate(int nGroup, int nTargetGroup, int nOperation);

    // nGroup 是否可以就 [nTargetGroup做nOperation操作] 进行授权
    BOOL CanBaseGrant(int nGroup, int nTargetGroup, int nMaskOffset);

    // nGroup 是否可以就 [nTargetGroupA对nTargetGroupB做nOperation操作] 进行授权
    BOOL CanAdvanceGrant(int nGroup, int nTargetGroupA, int nTargetGroupB, int nMaskOffset);

    BOOL CanSpeak(DWORD dwMemberID);

    //BOOL ChangeCamp(KCAMP eCamp);

    //BOOL CheckCampCompatible(KCAMP eCamp)
    //{
    //    return eCamp == m_eCamp || eCamp == cNeutral;
    //}

    BOOL PaySalary(DWORD dwMemberID, int nTotalSalary);
    BOOL AddFund(DWORD dwPealNum, DWORD dwJadeiteNum, DWORD dwAgateNum, DWORD dwDiamondNum);

    template <class TFunc>
    void TraverseMember(TFunc& Func)
    {
        for (KROSTER::iterator i = m_Roster.begin(); i != m_Roster.end(); ++i)
        {
            Func(&(i->second));
        }
    }

public:
    KTongSchemaData m_Schema;

    DWORD           m_dwID;
    char            m_szName[_NAME_LEN];                        // 帮会名称
    DWORD           m_dwMaster;                                 // 帮主
    int             m_nFund;                                    // 资金(银币)
    int             m_nMaxWageRate;                             // 工资发放比例上限
	BOOL			m_bFreeJoin;								// 是否打开自由招募，0关闭，1打开
	BYTE            m_byCamp;                                   // 家族阵营
	DWORD           m_dwPearlNum;                                // 珍珠数量
	DWORD           m_dwJadeiteNum;                              // 翡翠数量
	DWORD           m_dwAgateNum;                                // 玛瑙数量
	DWORD           m_dwDiamondNum;                              // 钻石数量

    int             m_nLevel;
    int             m_nDevelopmentPoint;                        // 发展点
    INT             m_nMaxMemberCount;                          // 成员上限

    char            m_szAnnouncement[TONG_ANNOUNCEMENT_LEN];    // 公告
    char            m_szOnlineMessage[TONG_ONLINE_MESSAGE_LEN]; // 上线提示
    char            m_szIntroduction[TONG_INTRODUCTION_LEN];    // 介绍
    char            m_szRules[TONG_RULES_LEN];                  // 帮规

	typedef std::map<DWORD, KTongMember, std::less<DWORD> > KROSTER;
    KROSTER         m_Roster;                           // 成员花名册

    typedef std::vector<KTongIncidentRecord> KINCIDENT_TABLE;
    KINCIDENT_TABLE m_Memorabilia;                      // 帮会大事记

    int             m_nUsedDevelopmentPoint;            // 投入发展点
    BYTE            m_byTechTree[MAX_TONG_TECHTREE_NODE_NUM];

	std::vector<DWORD> m_ApplyJoinTongPlayers;
	std::map<DWORD, SyncKinActivityInfo> m_ActivityOpenTimeMap;

    KTongRepertory  m_Repertory;                // 仓库
    KTongHistory    m_History;                  // 历史记录

public:
    BOOL                m_bUpdateFlag;                      // 数据变动标记， 用于定期保存数据库标识
    KTONG_STATE         m_eState;
    time_t              m_nStateTimer;						//记录公会，每日扣钱
    int                 m_nLastUpdateFrameTable[tdtTotal];
    DWORD               m_dwMemorabiliaCount;

private:
    BOOL LoadBaseInfo(BYTE* pbyData, size_t uDataLen);
    BOOL SaveBaseInfo(BYTE* pbyBuffer, size_t uBufferSize, size_t* puUsedSize);

    BOOL LoadSchema(BYTE* pbyData, size_t uDataLen);
    BOOL SaveSchema(BYTE* pbyBuffer, size_t uBufferSize, size_t* puUsedSize);

    BOOL LoadRoster(BYTE* pbyData, size_t uDataLen);

    BOOL SaveRoster(BYTE* pbyBuffer, size_t uBufferSize, size_t* puUsedSize);

    BOOL LoadMemorabilia(BYTE* pbyData, size_t uDataLen);
    BOOL SaveMemorabilia(BYTE* pbyBuffer, size_t uBufferSize, size_t* puUsedSize);

    BOOL LoadDevelopmentInfo(BYTE* pbyData, size_t uDataLen);
    BOOL SaveDevelopmentInfo(BYTE* pbyBuffer, size_t uBufferSize, size_t* puUsedSize);

public:
	BOOL m_bUpdateTongRankFlag;

//private:
//    int LuaSetLevel(Lua_State* L);
//    int LuaAddFund(Lua_State* L);
//    int LuaAddDevelopmentPoint(Lua_State* L);
//    int LuaConsumeDevelopmentPoint(Lua_State* L);
//    int LuaGetTechNodeLevel(Lua_State* L);
//    int LuaSetTechNodeLevel(Lua_State* L);
//    int LuaIsGroupEnabled(Lua_State* L);
//    int LuaEnableGroup(Lua_State* L);
//    int LuaSetMaxMemberCount(Lua_State* L);
//    int LuaSetCamp(Lua_State* L);
//    int LuaSetMaxWageRate(Lua_State* L);
//
//    int LuaGetGroupID(Lua_State* L);
//    int LuaGetMemberCount(Lua_State* L);
//    int LuaCanBaseOperate(Lua_State* L);
//    int LuaCanAdvanceOperate(Lua_State* L);
//
//    int LuaGetGroupWage(Lua_State* L);
//    int LuaActiveRepertoryPage(Lua_State* L);
//    int LuaGetMemberSalaryAmount(Lua_State* L);
//
//    int LuaGetHistoryRange(Lua_State* L);
//    int LuaSyncTongHistoryRecord(Lua_State* L);
//public:
//    DECLARE_LUA_CLASS(KTong);
//    
//    DECLARE_LUA_DWORD(ID);
//    DECLARE_LUA_STRING(Name, sizeof(m_szName));
//    DECLARE_LUA_DWORD(Master);
//    DECLARE_LUA_ENUM(Camp);
//    DECLARE_LUA_INTEGER(Fund);
//    DECLARE_LUA_INTEGER(Level);
//    DECLARE_LUA_INTEGER(DevelopmentPoint);
//    DECLARE_LUA_INTEGER(UsedDevelopmentPoint);
//    DECLARE_LUA_INTEGER(MaxMemberCount);
//    DECLARE_LUA_INTEGER(MaxWageRate);
};

