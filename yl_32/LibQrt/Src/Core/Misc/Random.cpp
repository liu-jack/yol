
#include "CorePrivate.h"
#include "Core/Random.h"

#define IM 139968
#define IA 3877
#define IC 29573

//---------------------------------------------------------------------------
static unsigned int s_nRandomSeed = 42;
//---------------------------------------------------------------------------
// 函数:	RandomnSeed
// 功能:	设置随机数种子
// 参数:	s_nRandomSeed	:	随机数种子
// 返回:	void
//---------------------------------------------------------------------------
void g_RandomSeed(unsigned int nSeed)
{
	s_nRandomSeed = nSeed;
}
//---------------------------------------------------------------------------
// 函数:	Random
// 功能:	返回一个小于nMax的随机整数
// 参数:	nMax	:	最大值
// 返回:	一个小于nMax的随机数
//---------------------------------------------------------------------------
unsigned int g_Random(unsigned int nMax)
{
	if (nMax)
	{
		s_nRandomSeed = s_nRandomSeed * IA + IC;
		return s_nRandomSeed % nMax;
	}
	else
	{
		return 0;
	}
}

//---------------------------------------------------------------------------
// 函数:	GetRandomSeed
// 功能:	取得当时的伪随机种子
// 返回:	返回当前的伪随机种子
//---------------------------------------------------------------------------
unsigned int g_GetRandomSeed()
{
	return s_nRandomSeed;
}

