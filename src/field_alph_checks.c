#include "constants/maps.h"
#include "field_alph_checks.h"
#include "save_local_field_data.h"

BOOL CheckUseEscapeRopeInAlphChamber(FieldSystem* fsys) {
    Location* position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fsys->savedata));

    if (position->mapId != MAP_D24R0202) {
        return FALSE;
    }

    if (position->x != 6 || position->y != 3 || position->direction != DIR_NORTH) {
        return FALSE;
    }

    return TRUE;
}

BOOL CheckUseFlashInAlphChamber(FieldSystem* fsys) {
    Location* position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fsys->savedata));

    if (position->mapId != MAP_D24R0204) {
        return FALSE;
    }

    if (position->x != 6 || position->y != 3 || position->direction != DIR_NORTH) {
        return FALSE;
    }

    return TRUE;
}

BOOL CheckUseWaterStoneInAlphChamber(FieldSystem* fsys) {
    Location* position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fsys->savedata));

    if (position->mapId != MAP_D24R0206) {
        return FALSE;
    }

    if (position->x != 6 || position->y != 3 || position->direction != DIR_NORTH) {
        return FALSE;
    }

    return TRUE;
}
