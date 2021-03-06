INCLUDE "telefang.inc"

SECTION "Pause Menu Phone IME 'sync' functions", ROMX[$6794], BANK[$4]

;Back-copies the name buffer into the centered output buffer, terminating it
;with the MainScript terminator in the process. Sized for player names.
PauseMenu_PhoneIMESyncPlayerName::
    ld hl, W_MainScript_CenteredNameBuffer + M_MainScript_PlayerNameSize - 1
    ld de, W_TitleMenu_NameBuffer + M_MainScript_PlayerNameSize - 1
    ld b, M_MainScript_PlayerNameSize
    
    ld c, 0
    
.copyAndTerminateLoop
    ld a, c
    cp 0
    jr nz, .copyNextChara
    
    ld a, [de]
    cp 0
    jr nz, .setTerminateFlag
    
.terminateString
    ld a, $E0
    ld [hld], a
    jr .loopDecrement
    
.setTerminateFlag
    ld c, 1
    
.copyNextChara
    ld a, [de]
    ld [hld], a
    
.loopDecrement
    dec de
    dec b
    
    jr nz, .copyAndTerminateLoop
    
    ld a, c
    ret

;Back-copies the name buffer into the centered output buffer, terminating it
;with the MainScript terminator in the process. Sized for denjuu nicknames.
PauseMenu_PhoneIMESyncDenjuuNickname::
    ld hl, W_MainScript_CenteredNameBuffer + M_SaveClock_DenjuuNicknameSize - 1
    ld de, W_TitleMenu_NameBuffer + M_SaveClock_DenjuuNicknameSize - 1
    ld b, M_SaveClock_DenjuuNicknameSize
    
    ld c, 0
    
.copyAndTerminateLoop
    ld a, c
    cp 0
    jr nz, .copyNextChara
    
    ld a, [de]
    cp 0
    jr nz, .setTerminateFlag
    
.terminateString
    ld a, $E0
    ld [hld], a
    jr .loopDecrement
    
.setTerminateFlag
    ld c, 1
    
.copyNextChara
    ld a, [de]
    ld [hld], a
    
.loopDecrement
    dec de
    dec b
    
    jr nz, .copyAndTerminateLoop
    
    ld a, c
    ret