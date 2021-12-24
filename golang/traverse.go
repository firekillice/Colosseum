package main

import (
	"encoding/json"
	"fmt"
	"regexp"
)

func checkIllegalKey(key string, replace bool ) (string, bool) {
	reg, _ := regexp.Compile("^[$_]+|\\.") //system. \ / $
	matched := reg.MatchString(key)
	fmt.Println(key)
	if matched && replace {
		return reg.ReplaceAllString(key, ""), matched
	} else {
		return "", matched
	}
}

func parseMap(md map[string]interface{}) {
	for key, val := range md {
		keyRep, matched := checkIllegalKey(key, true)
		if matched {
			fmt.Println(key)
			delete(md, key)
			md[keyRep] = val
		}
		switch val.(type) {
		case map[string]interface{}:
			parseMap(val.(map[string]interface{}))
		case []interface{}:
			parseArray(val.([]interface{}))
		default:

		}
	}
}

func parseArray(ad []interface{}) {
	for _, val := range ad {
		switch val.(type) {
		case map[string]interface{}:
			parseMap(val.(map[string]interface{}))
		case []interface{}:
			parseArray(val.([]interface{}))
		}
	}
}

func main()  {
	input := "{\"message\":{\"logTime\":1630571632,\"logType\":\"gacha_normal\",\"desc\":\"T_LanguageAdditionalLocalize_log_gacha\",\"logDate\":\"20210902\",\"ticks\":637661972320299600,\"player\":{\"Name\":\"j7\",\"Level\":4,\"Power\":18525,\"GuildId\":0,\"ZoneID\":3,\"Token\":\"ce714a675b01a2c20720e638b3009866\",\"ClubId\":\"UniLions\",\"LoginTime\":1630566805,\"CapId\":\"5cb1daed2e27441ab31e5f84231781d9\",\"Id\":5476377146882523000},\"details\":{\"contents\":{\"Girl\":null,\"ModifyCards\":null,\"ExpCards\":null,\"$type\":\"RewardDto\",\"Content\":{\"Currency\":null,\"Card\":[{\"CardID\":\"ShiZiQian_2021S1\",\"CreateTime\":1630571631,\"Awaken\":0,\"AllotAttrsNotAwaken\":0,\"PlayerCardID\":33,\"Locks\":[],\"Power\":500,\"Career\":{\"Sv\":0,\"Hld\":0,\"AtBats\":0,\"Hrs\":0,\"$type\":\"CardCareerDto\",\"RpCnt\":0,\"Lose\":0,\"Ip\":0,\"Reward\":{},\"LeagueTime\":0,\"Win\":0,\"Sb\":0,\"So\":0,\"Hits\":0,\"SpCnt\":0,\"FdCnt\":0,\"Er\":0},\"Exp\":0,\"KeySkill\":-1,\"Skills\":[-1,-1,-1,-1,-1],\"$type\":\"CardDto\",\"Level\":1,\"Upgrade\":0,\"Equips\":[],\"AllotAttrs\":{}},{\"CardID\":\"LiaoWenYang_2021S1\",\"Exp\":0,\"KeySkill\":-1,\"Skills\":[-1,-1,-1,-1,-1],\"AllotAttrsNotAwaken\":0,\"CreateTime\":1630571631,\"Level\":1,\"PlayerCardID\":34,\"Power\":625,\"Upgrade\":0,\"Equips\":[],\"Locks\":[],\"Awaken\":0,\"AllotAttrs\":{},\"Career\":{\"SpCnt\":0,\"Win\":0,\"Lose\":0,\"AtBats\":0,\"Sb\":0,\"Hld\":0,\"RpCnt\":0,\"Er\":0,\"Hits\":0,\"$type\":\"CardCareerDto\",\"LeagueTime\":0,\"FdCnt\":0,\"So\":0,\"Hrs\":0,\"Sv\":0,\"Ip\":0,\"Reward\":{}},\"$type\":\"CardDto\"},{\"CardID\":\"ZhangYouMing_2021S1\",\"Awaken\":0,\"PlayerCardID\":35,\"AllotAttrs\":{},\"Power\":500,\"Career\":{\"$type\":\"CardCareerDto\",\"RpCnt\":0,\"Lose\":0,\"Ip\":0,\"So\":0,\"Hits\":0,\"Hrs\":0,\"Sb\":0,\"LeagueTime\":0,\"FdCnt\":0,\"SpCnt\":0,\"Win\":0,\"Er\":0,\"AtBats\":0,\"Sv\":0,\"Reward\":{},\"Hld\":0},\"CreateTime\":1630571631,\"Upgrade\":0,\"Equips\":[],\"KeySkill\":-1,\"Skills\":[-1,-1,-1,-1,-1],\"Level\":1,\"Exp\":0,\"Locks\":[],\"AllotAttrsNotAwaken\":0,\"$type\":\"CardDto\"}]}}}}}"
	m := map[string]interface{}{}
	json.Unmarshal([]byte(input), &m)

	parseMap(m)

	b, _ := json.Marshal(m)

	fmt.Println(string(b))
}
