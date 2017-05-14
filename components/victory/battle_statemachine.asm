SECTION "Victory On Battle Screen State Machine", ROMX[$4243], BANK[$1D]
Victory_BattleScreenStateMachine::
    ld a, [W_Battle_4thOrderSubState]
    ld hl, .stateTable
    call System_IndexWordList
    jp [hl]
    
.stateTable
    dw $4291,$42C4,$42F6,$47D7,$4827,$4957,$4F3D,$4F80
    dw $4FC2,$4FD4,$4FE8,$449F,$4B86,$497D,$4942,$4BDC
    dw $4C2B,$47E6,$4813,$4D96,$4E64,$4E89,$4F27,$4C3A

;すばやさ - $427D
Victory_BattleScreenPrivateStrings_speed::
    db $44, $96, $5A, $42
    
;こうげき - $4281
Victory_BattleScreenPrivateStrings_attack::
    db $41, $3A, $8A, $3E
    
;ぼうぎょ - $4285
Victory_BattleScreenPrivateStrings_defense::
    db $99, $3A, $88, $6C
    
;でんこう - $4289
Victory_BattleScreenPrivateStrings_denmaAtk::
    db $94, $63, $41, $3A
    
;でんぼう - $428D
Victory_BattleScreenPrivateStrings_denmaDef::
    db $94, $63, $99, $3A