INCLUDE "telefang.inc"

SECTION "Pause Menu Contacts", ROMX[$4A49], BANK[$4]
PauseMenu_ContactSubstate::
    call $56E7 ;TODO: What do you do?
    ld a, [W_SystemSubSubState]
    ld hl, PauseMenu_ContactSubstateMachine
    call System_IndexWordList
    jp [hl]

PauseMenu_ContactSubstateMachine:
;TODO: Symbolize once we figure out what each subsubstate does
    dw sub_10A86,sub_10A9C,$4AD6,$4AFC
    dw $4B92,$4BBD,$4BC0,$4BCE
    dw $4BF3,$4C47,$7F47,$7F4E
    dw PhoneConversation_SubStateCallOutDrawScreen
    dw PhoneConversation_SubStateCallOutFadeScreenIn
    dw PhoneConversation_SubStateCallOutConvoScriptProcessing
    dw PhoneConversation_SubStateCallOutSwitchScriptProcessing
    dw $4D30,$4D86,$4DD3,$4DEC
    dw $4E37,$4E45,$4E59,$4E5A

sub_10A86:
    call $636B
    ld bc, $12
    ld a, [W_GameboyType]
    cp $11
    jr z, .useColorGraphic
    ld bc, $57
    
.useColorGraphic
    call Banked_LoadMaliasGraphics
    jp System_ScheduleNextSubSubState

sub_10A9C:
    ld a, [W_PauseMenu_CurrentContact]
    ld b, a
    ld a, [$CB72]
    dec a
    cp b
    jr nc, .skipdecCD24
    ld a, [W_PauseMenu_CurrentContact]
    dec a
    ld [W_PauseMenu_CurrentContact], a
    
.skipdecCD24
    ld a, [W_PauseMenu_CurrentContact]
    call PauseMenu_IndexedContactArrayLoad
    ld c, 0
    ld de, $9400
    call Banked_Battle_LoadDenjuuPortrait
    ld a, [W_PauseMenu_CurrentContact]
    call PauseMenu_IndexedContactArrayLoad
    call Battle_LoadDenjuuPaletteOpponent
    ld a, 1
    ld [W_CGBPaletteStagedBGP], a
    ld a, [W_PauseMenu_CurrentContact]
    call PauseMenu_IndexedContactArrayLoad
    call PauseMenu_ContactPrepName
    jp System_ScheduleNextSubSubState