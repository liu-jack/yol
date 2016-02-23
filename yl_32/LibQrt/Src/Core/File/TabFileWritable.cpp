
#include "CorePrivate.h"
#include "TabFileWritable.h"
#include "QStrBase.h"
#include "QLog.h"


QTabFileWritable::QTabFileWritable()
{
    m_bErrorLogEnable = true;
}

QTabFileWritable::~QTabFileWritable()
{
	Clear();
}

//构造一个空的KTabFile对象
QTabFileWritable* QTabFileWritable::New()
{
    QTabFileWritable* pTab = new QTabFileWritable();
    if (pTab)
    {
        pTab->SetErrorLog(true);
    }
	return pTab;
}

// 功能: 加载一个Tab文件
int	QTabFileWritable::LoadData(IFile* pFile)
{
	assert(pFile);
	Clear();
	
	char*			pBuffer = NULL;
	unsigned int	dwSize = pFile->Size();
	unsigned int	nCurPos = 0;
	int				nResult	= false;

	if (dwSize == 0)
		return true;

	pBuffer = (char*)malloc(dwSize);
	if (pBuffer == NULL || pFile->Read(pBuffer, dwSize) != dwSize)
		goto ERROR_EXIT;
	
	while(nCurPos < dwSize)
	{
		long i = 0;
		char szLine[10000];
		//拷贝某一行的数据流
		while(nCurPos <= dwSize)
		{
			if (pBuffer[nCurPos] == 0x0d)
				break;
			szLine[i++] = pBuffer[nCurPos ++];
		}
		
		szLine[i]		= '\0';
		nCurPos		= nCurPos + 2;
		i++;
		
		TTabLineNode  * pLineNode = new TTabLineNode;
		QList * pList = new QList;
		pLineNode->pList = pList;
		m_RowList.AddTail(pLineNode);
		
		long j = 0;
		//
		char *szData = szLine;
		while (1)
		{
			char *szFind = strstr(szData,"\t");
			if (szFind == NULL) 
			{
				
				char * newStr = new char[strlen(szData) + 1];
				QStrCpyLen(newStr,  szData , strlen(szData) + 1);
				if (newStr[strlen(newStr) - 1] == 0x0d)
					newStr[strlen(newStr) - 1] = '\0';
				
				TTabColNode  * pNode = new TTabColNode;
				pNode->m_Str = newStr;
				pLineNode->pList->AddTail(pNode);	
				break;
			}
			char * newStr = new char[szFind - szData + 1];
			QStrCpyLen(newStr,  szData , szFind - szData + 1);
				
			TTabColNode  * pNode = new TTabColNode;
			pNode->m_Str = newStr;
			pLineNode->pList->AddTail(pNode);
			szData = szFind + 1;
		}
	}

	nResult = true;
ERROR_EXIT:
		SAFE_FREE(pBuffer);
	return nResult;
}

//获得第一行的宽度
int	QTabFileWritable::GetWidth()
{
	TTabLineNode * pLineNode = (TTabLineNode*)m_RowList.GetHead();
	if (!pLineNode)
		return 0;
	return pLineNode->pList->GetNodeCount();
}

//获得总长度
int	QTabFileWritable::GetHeight()
{
	return m_RowList.GetNodeCount();
}

int	QTabFileWritable::Save(const char* FileName)//保存文件,返回布尔值
{
	IFile*	pFile = g_CreateFile(FileName);
	if (pFile == NULL)
		return false;

	// write tab file
	char szCol[1000];
	TTabLineNode 	* pLineNode = (TTabLineNode*)m_RowList.GetHead();
	while(pLineNode)
	{
		TTabColNode * pNode = (TTabColNode*)pLineNode->pList->GetHead();
		while (pNode)
		{
			TTabColNode * pNextNode = (TTabColNode*)pNode->GetNext();
			if (pNextNode)
				sprintf(szCol, "%s\t", pNode->m_Str);
			else 
				sprintf(szCol,"%s",pNode->m_Str);
			pFile->Write(szCol, strlen(szCol));
			pNode = (TTabColNode*)pNode->GetNext();
			
		}
		pFile->Write((void *)"\15", 1);//0x0D0A
		pFile->Write((void *)"\n", 1) ;
		
		pLineNode  = (TTabLineNode * )pLineNode->GetNext();
	}

	pFile->Close();
	pFile->Release();
	pFile = NULL;
	return true;
}

//获得某行的名
const char*	QTabFileWritable::GetRowName(int nRow)
{	
	TTabLineNode * pLineNode = (TTabLineNode*) m_RowList.GetHead();

	for (int i = 0 ; i < nRow - 1 ;  i ++)
	{
		if (!pLineNode)
			return NULL;
		pLineNode = (TTabLineNode*) pLineNode->GetNext();
	}
	if (!pLineNode)
		return NULL;
	return ((TTabColNode *)(pLineNode->pList->GetHead()))->m_Str;
}

//获得某列的名
const char*	QTabFileWritable::GetColName(int nCol)
{
	TTabLineNode * pLineNode  = (TTabLineNode *) m_RowList .GetHead();
	if (!pLineNode)
		return NULL;
	TTabColNode  * pColNode	= (TTabColNode*)pLineNode->pList->GetHead();
	for (int i = 0 ; i < nCol - 1; i ++)
	{
		if (!pColNode)
			return NULL;
		pColNode = (TTabColNode*) pColNode->GetNext();
	}
	if (!pColNode)
		return NULL;
	return pColNode->m_Str;
}

//返回以1为起点的值
int	QTabFileWritable::FindRow(const char* szRow)
{
	TTabLineNode * pLineNode = (TTabLineNode *) m_RowList.GetHead();
	int  nRow = 1;
	while (pLineNode)
	{
		QList  * pList = pLineNode->pList;
		TTabColNode * pCol = (TTabColNode*)pList->GetHead();
		if (!pCol)
			return -1;
		if (!strcmp(pCol->m_Str, szRow))
		{
			return nRow;
		}
		pLineNode = (TTabLineNode *)pLineNode->GetNext();
		nRow ++;
	}
	return -1;
}

//返回以1为起点的值
int	QTabFileWritable::FindColumn(const char* szColumn)
{
	TTabLineNode * pLine = (TTabLineNode*)m_RowList.GetHead();
	if (!pLine)
		return -1;

	TTabColNode* pColNode =(TTabColNode * )pLine->pList->GetHead();
		
	int nCol = 1;
	while (pColNode)
	{
		if (!strcmp(pColNode->m_Str, szColumn))
		{
			return nCol;
		}
		pColNode = (TTabColNode *)pColNode->GetNext();
		nCol ++;
	}
	return -1;
}

// 以0,0为起点
int	QTabFileWritable::GetValue(int nRow, int nColumn, char*& lpRString, unsigned int dwSize)
{
	if ( nRow < 0 || nColumn < 0)
		return 0;
	TTabLineNode * pLineNode = (TTabLineNode*)m_RowList.GetHead();
	for (int i = 0; i < nRow; i ++) 
	{
		if (!pLineNode)
			return 0;
		pLineNode = (TTabLineNode * )pLineNode->GetNext();
	}
	if (!pLineNode)
		return 0;
	TTabColNode * pColNode = (TTabColNode*)pLineNode->pList->GetHead();
	for (int j = 0; j < nColumn; j ++)
	{
		if (!pColNode)
			return 0;
		pColNode = (TTabColNode*) pColNode->GetNext();
	}
	if (!pColNode)
		return 0;
	lpRString = pColNode->m_Str;
	_ASSERT(lpRString);
	if (pColNode->m_Str && strlen(pColNode->m_Str) == 0)
		return -1;
	return 1;
}

int	QTabFileWritable::SetValue(int nRow, int nColumn, const char* lpRString, unsigned int dwSize, int bCanCreateNew)
{
	if ( nRow < 0 || nColumn < 0)
		return false;
	TTabLineNode * pLineNode = (TTabLineNode*)m_RowList.GetHead();
	TTabLineNode * pTempNode = pLineNode;
	for (int i = 0; i < nRow + 1; i ++) 
	{
		//如果没有该行结点则自动生成
		pLineNode = pTempNode;	
		if (!pLineNode)
		{
			if (!bCanCreateNew)
				return false;
			for(int j = 0; j < nRow + 1 - i; j ++)
			{
				TTabLineNode * pLine = new TTabLineNode;
				QList * pList = new QList;
				pLine->pList = pList;
				m_RowList.AddTail(pLine);
			}
			pLineNode = (TTabLineNode*) m_RowList.GetTail();
			break;
		}
		
		pTempNode = (TTabLineNode * )pLineNode->GetNext();
	}
	
	QList * pColList =  pLineNode->pList;
	TTabColNode * pColNode = (TTabColNode*)pColList->GetHead();
	TTabColNode * pTempColNode = pColNode;

	for (int j = 0; j < nColumn + 1; j ++)
	{
		pColNode = pTempColNode;
		if (!pColNode) 
		{
			if (!bCanCreateNew) return false;
			for (int k = 0; k < nColumn +1 - j -1; k ++)
			{
				TTabColNode * pNode = new TTabColNode;
				char * newStr = new char[2];
				strcpy(newStr, "");
				pNode->m_Str = newStr;
				pColList->AddTail(pNode);
			}
			
			TTabColNode * pNode = new TTabColNode;
			char * newStr = new char[dwSize + 1];
			QStrCpyLen(newStr, lpRString, dwSize + 1);
			pNode->m_Str = newStr;
			pColList->AddTail(pNode);
			return true;
		}
		pTempColNode = (TTabColNode*) pColNode->GetNext();
	}
	 
	delete pColNode->m_Str;
	char * pNewStr = new char[dwSize + 1];
	QStrCpyLen(pNewStr, lpRString, dwSize + 1);
	pColNode->m_Str = pNewStr;
	return true;
}

int	QTabFileWritable::GetString(int nRow, int nColumn, const char* lpDefault,
						char* lpRString, unsigned int dwSize)
{
    int nResult = GetStringRaw(nRow, nColumn, lpDefault, lpRString, dwSize);	

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetString(%d, %d) failed !\n", nRow, nColumn);
    }

    return nResult;
}

int	QTabFileWritable::GetString(int nRow, const char* szColumn, const char* lpDefault,
						char* lpRString, unsigned int dwSize, int bColumnLab)
{
    int nResult = 0;

	if (!bColumnLab) //该段以exl文件的a1,b1,c1字符串为
		nResult = GetStringRaw(nRow, Str2Col(szColumn), lpDefault, lpRString, dwSize);	
	else
		nResult = GetStringRaw(nRow, FindColumn(szColumn), lpDefault, lpRString, dwSize);	

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetString(%d, %s) failed !\n", nRow, szColumn);
    }
    
    return nResult;
}

int	QTabFileWritable::GetString(const char* szRow, const char* szColumn, const char* lpDefault,
						char* lpRString, unsigned int dwSize)
{
	int nResult = GetStringRaw(FindRow(szRow), FindColumn(szColumn), lpDefault, lpRString, dwSize);

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetString(%s, %s) failed !\n", szRow, szColumn);
    }
    
    return nResult;
}

int	QTabFileWritable::GetInteger(int nRow, int nColumn, int nDefault, int *pnValue)
{
    int nResult = GetIntegerRaw(nRow, nColumn, nDefault, pnValue);

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetInteger(%d, %d) failed !\n", nRow, nColumn);
    }

    return nResult;
}

int	QTabFileWritable::GetInteger(int nRow, const char* szColumn, int nDefault, int *pnValue, int bColumnLab)
{
    int nResult = 0;

	if (!bColumnLab)
		nResult = GetIntegerRaw(nRow, Str2Col(szColumn),	nDefault, pnValue);
	else
		nResult = GetIntegerRaw(nRow, FindColumn(szColumn),	nDefault, pnValue);

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetInteger(%d, %s) failed !\n", nRow, szColumn);
    }

    return nResult;
}
	
int	QTabFileWritable::GetInteger(const char* szRow, const char* szColumn, int nDefault, int *pnValue)
{
	int nResult = GetIntegerRaw(FindRow(szRow), FindColumn(szColumn), nDefault, pnValue);

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetInteger(%s, %s) failed !\n", szRow, szColumn);
    }
    
    return nResult;
}

int	QTabFileWritable::GetFloat(int nRow, int nColumn, float fDefault, float *pfValue)
{
    int nResult = GetFloatRaw(nRow, nColumn, fDefault, pfValue);

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetFloat(%d, %d) failed !\n", nRow, nColumn);
    }

    return nResult;
}

int	QTabFileWritable::GetFloat(int nRow, const char* szColumn, float fDefault,
						float *pfValue, int bColumnLab)
{
    int nResult = 0;

	if (!bColumnLab)
		nResult = GetFloatRaw(nRow, Str2Col(szColumn),	fDefault, pfValue);
	else
		nResult = GetFloatRaw(nRow, FindColumn(szColumn),	fDefault, pfValue);

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetFloat(%d, %s) failed !\n", nRow, szColumn);
    }

    return nResult;
}
	
int	QTabFileWritable::GetFloat(const char* szRow, const char* szColumn, float fDefault, float *pfValue)
{
	int nResult = GetFloatRaw(FindRow(szRow), FindColumn(szColumn), fDefault, pfValue);

    if (nResult == 0  && m_bErrorLogEnable)
    {
        QLogPrintf(LOG_ERR, "GetFloat(%s, %s) failed !\n", szRow, szColumn);
    }

    return nResult;
}

void QTabFileWritable::Clear()
{
	while(m_RowList.GetTail())
	{
		TTabLineNode * pLineNode = (TTabLineNode *)m_RowList.GetTail();
		pLineNode->Remove();
		delete pLineNode;
	}
	
}

int	QTabFileWritable::WriteString(int nRow, int nColumn, const char* lpString, unsigned int dwSize)
{
	if (dwSize <= 0)
		dwSize = strlen(lpString);
	return SetValue(nRow -1 ,nColumn -1, lpString, dwSize);
}

int	QTabFileWritable::WriteString(int nRow, const char* szColumn, const char* lpString,  int bColumnLab)
{	
	if (!bColumnLab) //该段以exl文件的a1,b1,c1字符串为
		return WriteString(nRow, Str2Col(szColumn), lpString);	
	else
		return WriteString(nRow, FindColumn(szColumn), lpString);	
}
	
int	QTabFileWritable::WriteString(const char* szRow, const char* szColumn, const char* lpRString)
{
	return WriteString(FindRow(szRow), FindColumn(szColumn), lpRString);
}

int	QTabFileWritable::WriteInteger(int nRow, int nColumn, int nValue)
{
	char IntNum[1000];
	sprintf(IntNum, "%d", nValue);
	return SetValue(nRow -1, nColumn -1, IntNum, strlen(IntNum));
}

int	QTabFileWritable::WriteInteger(int nRow, const char* szColumn, int nValue, int bColumnLab)
{
	if (!bColumnLab)
		return WriteInteger( nRow, Str2Col(szColumn),	 nValue);
	else
		return WriteInteger( nRow, FindColumn(szColumn), nValue);
}
	
int	QTabFileWritable::WriteInteger(const char* szRow, const char* szColumn, int nValue)
{
	return WriteInteger(FindRow(szRow), FindColumn(szColumn), nValue);
}

int	QTabFileWritable::WriteFloat(int nRow, int nColumn,float fValue)
{
	char FloatNum[100];
	sprintf(FloatNum,"%f",fValue);
	return SetValue(nRow - 1, nColumn - 1, FloatNum, strlen(FloatNum));
}

int	QTabFileWritable::WriteFloat(int nRow, const char* szColumn, float fValue, int bColumnLab)
{
	if (!bColumnLab)
		return WriteFloat( nRow, Str2Col(szColumn),	fValue);
	else
		return WriteFloat( nRow, FindColumn(szColumn), fValue);
}

int	QTabFileWritable::WriteFloat(const char* szRow, const char* szColumn, float fValue)
{
	return WriteFloat( FindRow(szRow), FindColumn(szColumn),	fValue);
}

int QTabFileWritable::Str2Col(const char* szColumn)
{
	int	nStrLen = strlen(szColumn);
	char	szTemp[4];
	strncpy(szTemp, szColumn, 3);
	szTemp[2] = 0;
	QStrLower(szTemp);
	if (nStrLen == 1)
	{
		return (szTemp[0] - 'a');
	}
	return ((szTemp[0] - 'a' + 1) * 26 + szTemp[1] - 'a');
}

int	QTabFileWritable::GetStringRaw(int nRow, int nColumn, const char* lpDefault, char* lpRString, unsigned int dwSize)
{
	char * pData = NULL;
	int nRet = 0;

	nRet = GetValue(nRow - 1, nColumn - 1, pData, dwSize);
	if (1 != nRet)
	{
		strcpy(lpRString, lpDefault);
	}
	else
	{
		QStrCpyLen(lpRString, pData, dwSize);
	}
	return nRet;
}

int	QTabFileWritable::GetIntegerRaw(int nRow, int nColumn, int nDefault, int *pnValue)
{
	char * pData = NULL;
	int nRet = 0;

	nRet = GetValue(nRow - 1, nColumn - 1, pData, 100);
	if (1 != nRet)
	{
		*pnValue = nDefault;
	}
	else
		*pnValue = atoi(pData);
	return nRet;
}

int	QTabFileWritable::GetFloatRaw(int nRow, int nColumn, float fDefault, float *pfValue)
{
	char * pData = NULL;
	int nRet = 0;
	nRet = GetValue(nRow -1 , nColumn -1, pData, 100);
	if (1 != nRet)
	{
		*pfValue = fDefault;
	}
	else
	{
		*pfValue = (float)atof(pData);
	}
	return nRet;
}

int QTabFileWritable::Remove(int nRow)
{
	TTabLineNode * pNode = (TTabLineNode*)m_RowList.GetHead();
		
	if (!pNode) return false;
	
	for(int i  = 0; i < nRow  - 1; i ++)
	{
		if (!pNode) return false;
		pNode = (TTabLineNode*) pNode->GetNext();
	}
	
	TTabLineNode *pDelNode = pNode;
	if (!pNode) return false;
	pNode->Remove();
	delete pDelNode;
	return true;
}

int	QTabFileWritable::Remove(const char* szRow, int bColumnLab)
{
	if (!bColumnLab)
		return Remove(Str2Col(szRow));
	else 
		return Remove(FindRow(szRow));
}

int QTabFileWritable::InsertAfter(int nRow)
{
	TTabLineNode * pNode = (TTabLineNode*)m_RowList.GetHead();
	if (!pNode) return false;
	
	for(int i  = 0; i < nRow  - 1; i ++)
	{
		if (!pNode) return false;
		pNode = (TTabLineNode*) pNode->GetNext();
	}
	if (!pNode) return false;
	
	TTabLineNode * pNewNode = new TTabLineNode;
	QList * pList = new QList;
	pNewNode->pList = pList;
	pNode->InsertAfter(pNewNode);
	return true;
}

int	QTabFileWritable::InsertAfter(const char* szRow, int bColumnLab)
{
	if (!bColumnLab)
		return InsertAfter(Str2Col(szRow));
	else
		return InsertAfter(FindRow(szRow));
}

int QTabFileWritable::InsertBefore(int nRow)
{
	TTabLineNode * pNode = (TTabLineNode*)m_RowList.GetHead();
	if (!pNode) return false;
	
	for(int i  = 0; i < nRow  - 1; i ++)
	{
		if (!pNode) return false;
		pNode = (TTabLineNode*) pNode->GetNext();
	}
	if (!pNode) return false;
	
	TTabLineNode * pNewNode = new TTabLineNode;
	QList * pList = new QList;
	pNewNode->pList = pList;
	pNode->InsertBefore(pNewNode);
	return true;
}

int	QTabFileWritable::InsertBefore(const char* szRow, int bColumnLab)
{
	if (!bColumnLab)
		return InsertBefore(Str2Col(szRow));
	else
		return InsertBefore(FindRow(szRow));
}

//返回新生成Col的Col编号，错误则返回-1
int	QTabFileWritable::InsertNewCol(const char* strNewCol)
{
	if (!strNewCol || !strNewCol[0])
		return -1;

	int nResult = -1;
	
	//如果已有就不用再加了
	if ((nResult = FindColumn(strNewCol)) > 0) 	return nResult;
	
	nResult = GetWidth() + 1;

	WriteString(1, nResult, strNewCol);
	return nResult;
}

void QTabFileWritable::Release()
{
	Clear();
	delete this;
}

void QTabFileWritable::SetErrorLog(BOOL bEnable)
{
    m_bErrorLogEnable = bEnable;
}
