ADD_TRANS_TRIGGER BINNKEEP 2
~!Global("CbDeliverIce","GLOBAL",0)~ DO 0

EXTEND_TOP BINNKEEP 0 #3
  IF ~GlobalGT("CbDeliverIce","GLOBAL",0)
PartyHasItem("CBICEBLK")~ THEN REPLY @5 GOTO CB_25
END

EXTEND_TOP BINNKEEP 2 #0
  IF ~Global("CbDeliverIce","GLOBAL",0)~ THEN REPLY @12 GOTO CB_22
END

APPEND BINNKEEP
IF ~~ THEN BEGIN CB_22
  SAY @33
  IF ~~ THEN REPLY @34 GOTO CB_23
  IF ~~ THEN REPLY @35 GOTO CB_23
END

IF ~~ THEN BEGIN CB_23
  SAY @36
  IF ~~ THEN REPLY @37 GOTO CB_24
END

IF ~~ THEN BEGIN CB_24
  SAY @38
  IF ~Global("Cb_PartyBoughtCabin","LOCALS",0)~ THEN REPLY @40 DO ~SetGlobal("CbDeliverIce","GLOBAL",1)~  GOTO CB_26
  IF ~Global("Cb_PartyBoughtCabin","LOCALS",1)~ THEN REPLY @41 DO ~SetGlobal("CbDeliverIce","GLOBAL",1)~  GOTO CB_26
  IF ~~ THEN REPLY @42 DO ~SetGlobal("CbDeliverIce","GLOBAL",1)~  GOTO CB_26
END

IF ~~ THEN BEGIN CB_25
  SAY @39
  IF ~~ THEN DO ~SetGlobal("CbDeliverIce","GLOBAL",3)
TakePartyItem("CBICEBLK")
GiveGoldForce(1000)
DestroyItem("CBICEBLK")
AddexperienceParty(1000)
ReputationInc(1)~ EXIT
END

IF ~~ THEN BEGIN CB_26
  SAY @43
  IF ~~ THEN  EXIT
END

END
