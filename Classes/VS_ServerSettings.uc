class VS_ServerSettings extends Object
	perobjectconfig;

enum EVoteEndCond {
	VEC_TimerOnly,
	VEC_TimerOrAllVotesIn,
	VEC_TimerOrResultDetermined
};

enum EGameNameMode {
	GNM_DoNotModify,
	GNM_PresetName,
	GNM_CategoryAndPresetName
};

var config float MidGameVoteThreshold;
var config int MidGameVoteTimeLimit;
var config int GameEndedVoteDelay;
var config int VoteTimeLimit;
var config EVoteEndCond VoteEndCondition;
var config bool bRetainCandidates;

var config float KickVoteThreshold;

var config string DefaultPreset;
var config string DefaultMap;

var config string ServerAddress;
var config int DataPort;
var config int ClientDataPort;

var config bool bManageServerPackages;
var config bool bUseServerPackagesCompatibilityMode;
var config bool bUseServerActorsCompatibilityMode;
var config array<string> DefaultPackages;
var config array<string> DefaultActors;

var config string DefaultTimeMessageClass;
var config int IdleTimeout;
var config int MinimumMapRepeatDistance;
var config int PresetProbeDepth;
var config EGameNameMode GameNameMode;
var config bool bAlwaysUseDefaultPreset;
var config bool bAlwaysUseDefaultMap;

enum ESettingsState {
	S_NEW,
	S_COMPLETE,
	S_NOTADMIN
};

var ESettingsState SState;

function EVoteEndCond IntToVoteEndCond(int v) {
	switch(v) {
		case 0: return VEC_TimerOnly;
		case 1: return VEC_TimerOrAllVotesIn;
		case 2: return VEC_TimerOrResultDetermined;
	}
	return VEC_TimerOnly;
}

function EGameNameMode IntToGameNameMode(int v) {
	switch(v) {
		case 0: return GNM_DoNotModify;
		case 1: return GNM_PresetName;
		case 2: return GNM_CategoryAndPresetName;
	}
	return GNM_DoNotModify;
}

defaultproperties {
	MidGameVoteThreshold=0.5
	MidGameVoteTimeLimit=0
	GameEndedVoteDelay=5
	VoteTimeLimit=30
	VoteEndCondition=VEC_TimerOnly
	bRetainCandidates=False

	KickVoteThreshold=0.6

	DefaultPreset=
	DefaultMap=

	ServerAddress=
	DataPort=0
	ClientDataPort=0

	bManageServerPackages=False
	bUseServerPackagesCompatibilityMode=False
	bUseServerActorsCompatibilityMode=False

	DefaultTimeMessageClass="Botpack.TimeMessage"
	IdleTimeout=0
	MinimumMapRepeatDistance=0
	PresetProbeDepth=1
	GameNameMode=GNM_DoNotModify
	bAlwaysUseDefaultPreset=True
	bAlwaysUseDefaultMap=False
}
