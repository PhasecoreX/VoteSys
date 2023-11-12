class VS_UI_ServerSettingsPage extends VS_UI_SettingsPage;

var VS_ServerSettings Settings;
var bool bSettingsLoaded;

var UWindowLabelControl Lbl_SettingsState;
var localized string Text_SettingsState_New;
var localized string Text_SettingsState_Complete;
var localized string Text_SettingsState_NotAdmin;

var VS_UI_EditControl Edt_MidGameVoteThreshold;
var localized string Text_MidGameVoteThreshold;

var VS_UI_EditControl Edt_MidGameVoteTimeLimit;
var localized string Text_MidGameVoteTimeLimit;

var VS_UI_EditControl Edt_GameEndedVoteDelay;
var localized string Text_GameEndedVoteDelay;

var VS_UI_EditControl Edt_VoteTimeLimit;
var localized string Text_VoteTimeLimit;

var VS_UI_ComboControl Cmb_VoteEndCondition;
var localized string Text_VoteEndCondition;
var localized string Text_VoteEndCondition_TimerOnly;
var localized string Text_VoteEndCondition_TimerOrAllVotesIn;
var localized string Text_VoteEndCondition_TimerOrResultDetermined;

var UWindowCheckbox Chk_RetainCandidates;
var localized string Text_RetainCandidates;

var VS_UI_EditControl Edt_KickVoteThreshold;
var localized string Text_KickVoteThreshold;

var VS_UI_EditControl Edt_DefaultPreset;
var localized string Text_DefaultPreset;

var VS_UI_EditControl Edt_DefaultMap;
var localized string Text_DefaultMap;

var VS_UI_EditControl Edt_ServerAddress;
var localized string Text_ServerAddress;

var VS_UI_EditControl Edt_DataPort;
var localized string Text_DataPort;

var VS_UI_EditControl Edt_ClientDataPort;
var localized string Text_ClientDataPort;

function LoadSettings(VS_PlayerChannel C) {
	super.LoadSettings(C);

	Settings = C.GetServerSettings();
	LoadServerSettings();
	Log("ServerSettingsPage LoadSettings", 'VoteSys');

	Edt_MidGameVoteThreshold.EditBox.SetEditable(bSettingsLoaded);
	Edt_MidGameVoteTimeLimit.EditBox.SetEditable(bSettingsLoaded);
	Edt_GameEndedVoteDelay.EditBox.SetEditable(bSettingsLoaded);
	Edt_VoteTimeLimit.EditBox.SetEditable(bSettingsLoaded);
	Cmb_VoteEndCondition.SetEnabled(bSettingsLoaded);
	Chk_RetainCandidates.bDisabled = !bSettingsLoaded;
	Edt_KickVoteThreshold.EditBox.SetEditable(bSettingsLoaded);
	Edt_DefaultPreset.EditBox.SetEditable(bSettingsLoaded);
	Edt_DefaultMap.EditBox.SetEditable(bSettingsLoaded);
	Edt_ServerAddress.EditBox.SetEditable(bSettingsLoaded);
	Edt_DataPort.EditBox.SetEditable(bSettingsLoaded);
	Edt_ClientDataPort.EditBox.SetEditable(bSettingsLoaded);
}

function LoadServerSettings() {
	bSettingsLoaded = false;

	if (Settings.SState != S_COMPLETE)
		return;

	Edt_MidGameVoteThreshold.SetValue(string(Settings.MidGameVoteThreshold));
	Edt_MidGameVoteTimeLimit.SetValue(string(Settings.MidGameVoteTimeLimit));
	Edt_GameEndedVoteDelay.SetValue(string(Settings.GameEndedVoteDelay));
	Edt_VoteTimeLimit.SetValue(string(Settings.VoteTimeLimit));
	Cmb_VoteEndCondition.SetSelectedIndex(int(Settings.VoteEndCondition));
	Chk_RetainCandidates.bChecked = Settings.bRetainCandidates;
	Edt_KickVoteThreshold.SetValue(string(Settings.KickVoteThreshold));
	Edt_DefaultPreset.SetValue(Settings.DefaultPreset);
	Edt_DefaultMap.SetValue(Settings.DefaultMap);
	Edt_ServerAddress.SetValue(Settings.ServerAddress);
	Edt_DataPort.SetValue(string(Settings.DataPort));
	Edt_ClientDataPort.SetValue(string(Settings.ClientDataPort));

	bSettingsLoaded = true;
}

function SaveSettings() {
	if (bSettingsLoaded == false)
		return;

	Settings.MidGameVoteThreshold = float(Edt_MidGameVoteThreshold.GetValue());
	Settings.MidGameVoteTimeLimit = int(Edt_MidGameVoteTimeLimit.GetValue());
	Settings.GameEndedVoteDelay = int(Edt_GameEndedVoteDelay.GetValue());
	Settings.VoteTimeLimit = int(Edt_VoteTimeLimit.GetValue());
	Settings.VoteEndCondition = Settings.IntToVoteEndCond(Cmb_VoteEndCondition.GetSelectedIndex());
	Settings.bRetainCandidates = Chk_RetainCandidates.bChecked;
	Settings.KickVoteThreshold = float(Edt_KickVoteThreshold.GetValue());
	Settings.DefaultPreset = Edt_DefaultPreset.GetValue();
	Settings.DefaultMap = Edt_DefaultMap.GetValue();
	Settings.ServerAddress = Edt_ServerAddress.GetValue();
	Settings.DataPort = int(Edt_DataPort.GetValue());
	Settings.ClientDataPort = int(Edt_ClientDataPort.GetValue());

	Channel.SaveServerSettings();
}

function Created() {
	super.Created();

	Lbl_SettingsState = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 8, 334, 282, 16));
	Lbl_SettingsState.Align = TA_Right;

	Edt_MidGameVoteThreshold = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 8, 188, 16));
	Edt_MidGameVoteThreshold.SetText(Text_MidGameVoteThreshold);
	Edt_MidGameVoteThreshold.EditBoxWidth = 60;
	Edt_MidGameVoteThreshold.SetNumericOnly(true);
	Edt_MidGameVoteThreshold.SetNumericFloat(true);

	Edt_MidGameVoteTimeLimit = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 28, 188, 16));
	Edt_MidGameVoteTimeLimit.SetText(Text_MidGameVoteTimeLimit);
	Edt_MidGameVoteTimeLimit.EditBoxWidth = 60;
	Edt_MidGameVoteTimeLimit.SetNumericOnly(true);

	Edt_GameEndedVoteDelay = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 48, 188, 16));
	Edt_GameEndedVoteDelay.SetText(Text_GameEndedVoteDelay);
	Edt_GameEndedVoteDelay.EditBoxWidth = 60;
	Edt_GameEndedVoteDelay.SetNumericOnly(true);

	Edt_VoteTimeLimit = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 68, 188, 16));
	Edt_VoteTimeLimit.SetText(Text_VoteTimeLimit);
	Edt_VoteTimeLimit.EditBoxWidth = 60;
	Edt_VoteTimeLimit.SetNumericOnly(true);

	Cmb_VoteEndCondition = VS_UI_ComboControl(CreateControl(class'VS_UI_ComboControl', 8, 88, 188, 16));
	Cmb_VoteEndCondition.SetText(Text_VoteEndCondition);
	Cmb_VoteEndCondition.AddItem(Text_VoteEndCondition_TimerOnly);
	Cmb_VoteEndCondition.AddItem(Text_VoteEndCondition_TimerOrAllVotesIn);
	Cmb_VoteEndCondition.AddItem(Text_VoteEndCondition_TimerOrResultDetermined);
	Cmb_VoteEndCondition.SetEditable(false);

	Chk_RetainCandidates = UWindowCheckbox(CreateControl(class'UWindowCheckbox', 8, 108, 188, 16));
	Chk_RetainCandidates.SetText(Text_RetainCandidates);

	Edt_KickVoteThreshold = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 128, 188, 16));
	Edt_KickVoteThreshold.SetText(Text_KickVoteThreshold);
	Edt_KickVoteThreshold.EditBoxWidth = 60;
	Edt_KickVoteThreshold.SetNumericOnly(true);
	Edt_KickVoteThreshold.SetNumericFloat(true);

	Edt_DefaultPreset = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 148, 188, 16));
	Edt_DefaultPreset.SetText(Text_DefaultPreset);
	Edt_DefaultPreset.EditBoxWidth = 100;

	Edt_DefaultMap = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 168, 188, 16));
	Edt_DefaultMap.SetText(Text_DefaultMap);
	Edt_DefaultMap.EditBoxWidth = 100;

	Edt_ServerAddress = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 188, 188, 16));
	Edt_ServerAddress.SetText(Text_ServerAddress);
	Edt_ServerAddress.EditBoxWidth = 100;

	Edt_DataPort = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 208, 188, 16));
	Edt_DataPort.SetText(Text_DataPort);
	Edt_DataPort.EditBoxWidth = 60;
	Edt_DataPort.SetNumericOnly(true);

	Edt_ClientDataPort = VS_UI_EditControl(CreateControl(class'VS_UI_EditControl', 8, 208, 188, 16));
	Edt_ClientDataPort.SetText(Text_ClientDataPort);
	Edt_ClientDataPort.EditBoxWidth = 60;
	Edt_ClientDataPort.SetNumericOnly(true);
}

function BeforePaint(Canvas C, float MouseX, float MouseY) {
	super.BeforePaint(C, MouseX, MouseY);

	switch(Settings.SState) {
		case S_NEW:
			Lbl_SettingsState.SetText(Text_SettingsState_New);
			break;
		case S_COMPLETE:
			Lbl_SettingsState.SetText(Text_SettingsState_Complete);
			break;
		case S_NOTADMIN:
			Lbl_SettingsState.SetText(Text_SettingsState_NotAdmin);
			break;
	}

	if (bSettingsLoaded == false) {
		LoadServerSettings();
		if (bSettingsLoaded) {
			Edt_MidGameVoteThreshold.EditBox.SetEditable(bSettingsLoaded);
			Edt_MidGameVoteTimeLimit.EditBox.SetEditable(bSettingsLoaded);
			Edt_GameEndedVoteDelay.EditBox.SetEditable(bSettingsLoaded);
			Edt_VoteTimeLimit.EditBox.SetEditable(bSettingsLoaded);
			Cmb_VoteEndCondition.SetEnabled(bSettingsLoaded);
			Chk_RetainCandidates.bDisabled = !bSettingsLoaded;
			Edt_KickVoteThreshold.EditBox.SetEditable(bSettingsLoaded);
			Edt_DefaultPreset.EditBox.SetEditable(bSettingsLoaded);
			Edt_DefaultMap.EditBox.SetEditable(bSettingsLoaded);
			Edt_ServerAddress.EditBox.SetEditable(bSettingsLoaded);
			Edt_DataPort.EditBox.SetEditable(bSettingsLoaded);
			Edt_ClientDataPort.EditBox.SetEditable(bSettingsLoaded);
		}
	}
}

function ApplyTheme() {
	Edt_MidGameVoteThreshold.Theme = Theme;
	Edt_MidGameVoteTimeLimit.Theme = Theme;
	Edt_GameEndedVoteDelay.Theme = Theme;
	Edt_VoteTimeLimit.Theme = Theme;
	Cmb_VoteEndCondition.Theme = Theme;
	//Chk_RetainCandidates // not themed
	Edt_KickVoteThreshold.Theme = Theme;
	Edt_DefaultPreset.Theme = Theme;
	Edt_DefaultMap.Theme = Theme;
	Edt_ServerAddress.Theme = Theme;
	Edt_DataPort.Theme = Theme;
	Edt_ClientDataPort.Theme = Theme;
}

defaultproperties {
	Text_SettingsState_New="Loading"
	Text_SettingsState_Complete="Loaded"
	Text_SettingsState_NotAdmin="Unauthorized"

	Text_MidGameVoteThreshold="Mid-Game Vote Threshold"
	Text_MidGameVoteTimeLimit="Mid-Game Vote Time Limit"
	Text_GameEndedVoteDelay="Game Ended Vote Delay"
	Text_VoteTimeLimit="Vote Time Limit"
	Text_VoteEndCondition="Vote End Rules"
	Text_VoteEndCondition_TimerOnly="Timer Only"
	Text_VoteEndCondition_TimerOrAllVotesIn="Everyone Voted"
	Text_VoteEndCondition_TimerOrResultDetermined="Result Certain"
	Text_RetainCandidates="Retain Candidates"
	Text_KickVoteThreshold="Kick Vote Threshold"
	Text_DefaultPreset="Default Preset"
	Text_DefaultMap="Default Map"
	Text_ServerAddress="Server Address"
	Text_DataPort="Data Port"
	Text_ClientDataPort="Client Data Port"
}
