#ifndef POKEHEARTGOLD_UNK_0206D494_H
#define POKEHEARTGOLD_UNK_0206D494_H

#include "pokemon_types_def.h"
#include "script.h"
#include "task.h"

BOOL MonIsInGameTradePoke(Pokemon *mon, u8 tradeno);
BOOL sub_0206D8D0(Pokemon *mon, SaveData *saveData);
BUGCONTEST *FieldSys_BugContest_Get(FieldSystem *fsys);
u16 *BugContest_GetSportBallsAddr(BUGCONTEST *contest);
void FieldSys_IncrementBugContestTimer(FieldSystem *fsys, int a1);
void Fsys_InitMystriStageGymmick(FieldSystem *fsys);
void sub_0206DB58(TaskManager *taskman, FieldSystem *fsys);
void sub_0206DB94(TaskManager *man, int a1);

#endif //POKEHEARTGOLD_UNK_0206D494_H
