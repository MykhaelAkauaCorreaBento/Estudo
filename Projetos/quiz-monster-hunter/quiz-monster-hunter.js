import entradaDados from "readline-sync";

//Respostas

const questoes = [
    {id:1,  pergunta:"Em qual geração foi a primeira aparição do Rathalos?", resposta:"1"},
    {id:2,  pergunta:"Em qual geração foi a primeira aparição da Rathian?", resposta:"1"},
    {id:3,  pergunta:"Em qual geração foi a primeira aparição do Yian Kut-Ku?", resposta:"1"},
    {id:4,  pergunta:"Em qual geração foi a primeira aparição do Plesioth?", resposta:"1"},
    {id:5,  pergunta:"Em qual geração foi a primeira aparição do Kirin?", resposta:"1"},
    {id:6,  pergunta:"Em qual geração foi a primeira aparição do Crimson Fatalis?", resposta:"1"},
    {id:7,  pergunta:"Em qual geração foi a primeira aparição do Tigrex?", resposta:"2"},
    {id:8,  pergunta:"Em qual geração foi a primeira aparição do Akantor?", resposta:"2"},
    {id:9,  pergunta:"Em qual geração foi a primeira aparição do Ukanlos?", resposta:"2"},
    {id:10, pergunta:"Em qual geração foi a primeira aparição do Rajang?", resposta:"2"},
    {id:11, pergunta:"Em qual geração foi a primeira aparição do Nargacuga?", resposta:"2"},
    {id:12, pergunta:"Em qual geração foi a primeira aparição do Kushala Daora?", resposta:"2"},
    {id:13, pergunta:"Em qual geração foi a primeira aparição do Teostra?", resposta:"2"},
    {id:14, pergunta:"Em qual geração foi a primeira aparição do Lagiacrus?", resposta:"3"},
    {id:15, pergunta:"Em qual geração foi a primeira aparição do Deviljho?", resposta:"3"},
    {id:16, pergunta:"Em qual geração foi a primeira aparição do Zinogre?", resposta:"3"},
    {id:17, pergunta:"Em qual geração foi a primeira aparição do Brachydios?", resposta:"3"},
    {id:18, pergunta:"Em qual geração foi a primeira aparição do Alatreon?", resposta:"3"},
    {id:19, pergunta:"Em qual geração foi a primeira aparição do Amatsu?", resposta:"3"},
    {id:20, pergunta:"Em qual geração foi a primeira aparição do Gore Magala?", resposta:"4"},
    {id:21, pergunta:"Em qual geração foi a primeira aparição do Shagaru Magala?", resposta:"4"},
    {id:22, pergunta:"Em qual geração foi a primeira aparição do Seregios?", resposta:"4"},
    {id:23, pergunta:"Em qual geração foi a primeira aparição do Glavenus?", resposta:"4"},
    {id:24, pergunta:"Em qual geração foi a primeira aparição do Valstrax?", resposta:"4"},
    {id:25, pergunta:"Em qual geração foi a primeira aparição do Mizutsune?", resposta:"4"},
    {id:26, pergunta:"Em qual geração foi a primeira aparição do Nergigante?", resposta:"5"},
    {id:27, pergunta:"Em qual geração foi a primeira aparição do Vaal Hazak?", resposta:"5"},
    {id:28, pergunta:"Em qual geração foi a primeira aparição do Lunastra?", resposta:"2"},
    {id:29, pergunta:"Em qual geração foi a primeira aparição do Velkhana?", resposta:"5"},
    {id:30, pergunta:"Em qual geração foi a primeira aparição do Magnamalo?", resposta:"5"},
    {id:31, pergunta:"Em qual geração foi a primeira aparição do Ahtal-Ka?", resposta:"4"},
    {id:32, pergunta:"Em qual geração foi a primeira aparição do Malzeno?", resposta:"5"},
    {id:33, pergunta:"Em qual geração foi a primeira aparição do Ceadeus?", resposta:"3"},
    {id:34, pergunta:"Em qual geração foi a primeira aparição do Shogun Ceanataur?", resposta:"2"},
    {id:35, pergunta:"Em qual geração foi a primeira aparição do Lao-Shan Lung?", resposta:"1"},
    {id:36, pergunta:"Em qual geração foi a primeira aparição do Velocidrome?", resposta:"1"},
    {id:37, pergunta:"Em qual geração foi a primeira aparição do Gypceros?", resposta:"1"},
    {id:38, pergunta:"Em qual geração foi a primeira aparição do Cephadrome?", resposta:"1"},
    {id:39, pergunta:"Em qual geração foi a primeira aparição do Basarios?", resposta:"1"},
    {id:40, pergunta:"Em qual geração foi a primeira aparição do Copper Blangonga?", resposta:"2"},
    {id:41, pergunta:"Em qual geração foi a primeira aparição do Emerald Congalala?", resposta:"2"},
    {id:42, pergunta:"Em qual geração foi a primeira aparição do Giadrome?", resposta:"2"},
    {id:43, pergunta:"Em qual geração foi a primeira aparição do Shen Gaoren?", resposta:"2"},
    {id:44, pergunta:"Em qual geração foi a primeira aparição do Great Jaggi?", resposta:"3"},
    {id:45, pergunta:"Em qual geração foi a primeira aparição do Great Wroggi?", resposta:"3"},
    {id:46, pergunta:"Em qual geração foi a primeira aparição do Great Baggi?", resposta:"3"},
    {id:47, pergunta:"Em qual geração foi a primeira aparição do Great Maccao?", resposta:"4"},
    {id:48, pergunta:"Em qual geração foi a primeira aparição do Baleful Gigginox?", resposta:"3"},
    {id:49, pergunta:"Em qual geração foi a primeira aparição do Red Khezu?", resposta:"1"},
    {id:50, pergunta:"Em qual geração foi a primeira aparição do White Monoblos?", resposta:"1"},
    {id:51, pergunta:"Em qual geração foi a primeira aparição do Ajarakan?", resposta:"6"},
    {id:52, pergunta:"Em qual geração foi a primeira aparição do Arkveld?", resposta:"6"},
    {id:53, pergunta:"Em qual geração foi a primeira aparição do Zoh Shia?", resposta:"6"},
    {id:54, pergunta:"Em qual geração foi a primeira aparição do Rompopolo?", resposta:"6"},
    {id:55, pergunta:"Em qual geração foi a primeira aparição do Hirabami?", resposta:"6"},
    {id:56, pergunta:"Em qual geração foi a primeira aparição do Doshaguma?", resposta:"6"},
    {id:57, pergunta:"Em qual geração foi a primeira aparição do Balahara?", resposta:"6"},
    {id:58, pergunta:"Em qual geração foi a primeira aparição do Chatacabra?", resposta:"6"},
    {id:59, pergunta:"Em qual geração foi a primeira aparição da Lala Barina?", resposta:"6"},
    {id:60, pergunta:"Em qual geração foi a primeira aparição do Xu Wu?", resposta:"6"},
    {id:61, pergunta:"Em qual geração foi a primeira aparição do Rey Dau?", resposta:"6"},
    {id:62, pergunta:"Quando foi o lançamento de Monster Hunter?", resposta:"2004"},
    {id:63, pergunta:"Quando foi o lançamento de Monster Hunter G?", resposta:"2005"},
    {id:64, pergunta:"Quando foi o lançamento de Monster Hunter Freedom", resposta:"2005"},
    {id:65, pergunta:"Quando foi o lançamento de Monster Hunter 2(Dos)?", resposta:"2006"},
    {id:66, pergunta:"Quando foi o lançamento de Monster Hunter Freedom 2?", resposta:"2007"},
    {id:67, pergunta:"Quando foi o lançamento de Monster Hunter Freedom Unite?", resposta:"2008"},
    {id:68, pergunta:"Quando foi o lançamento de Monster Hunter Tri(3)?", resposta:"2009"},
    {id:69, pergunta:"Quando foi o lançamento de Monster Hunter Portable 3rd?", resposta:"2010"},
    {id:70, pergunta:"Quando foi o lançamento de Monster Hunter 3 Ultimate?", resposta:"2011"},
    {id:71, pergunta:"Quando foi o lançamento de Monster Hunter 4?", resposta:"2013"},
    {id:72, pergunta:"Quando foi o lançamento de Monster Hunter 4 Ultimate?", resposta:"2014"},
    {id:73, pergunta:"Quando foi o lançamento de Monster Hunter Generations Ultimate(Double Cross)?", resposta:"2017"},
    {id:74, pergunta:"Quando foi o lançamento de Monster Hunter Generations(Cross)?", resposta:"2015"},
    {id:75, pergunta:"Quando foi o lançamento de Monster Hunter World?", resposta:"2018"},
    {id:76, pergunta:"Quando foi o lançamento de Monster Hunter World: Iceborne?", resposta:"2019"},
    {id:77, pergunta:"Quando foi o lançamento de Monster Hunter Rise?", resposta:"2021"},
    {id:78, pergunta:"Quando foi o lançamento de Monster Hunter Rise: Sunbreak ?", resposta:"2022"},
    {id:79, pergunta:"Quando foi o lançamento de Monster Hunter Wilds?", resposta:"2025"},
    {id:80, pergunta:"Quando foi o lançamento de Monster Hunter Stories?", resposta:"2016"},
    {id:81, pergunta:"Quando foi o lançamento de Monster Hunter Stories 2: Wings of Ruin?", resposta:"2021"},
    {id:82, pergunta:"Quando foi o lançamento de Monster Hunter Now?", resposta:"2023"},
    {id:83, pergunta:"Em qual ano a música Wind of Departure, de Monster Hunter, foi tocada na Olimpíada?", resposta:"2020"},
    {id:84, pergunta:"Em qual ano a música Proof of Hero, de Monster Hunter, foi tocada na Olimpíada?", resposta:"2020"},
    {id:85, pergunta:"Em qual geração foi a primeira aparição do Fatalis?", resposta:"1"},
    {id:86,  pergunta:"Em qual geração foi a primeira aparição do Black Gravios?", resposta:"1"},
    {id:87,  pergunta:"Em qual geração foi a primeira aparição do Yian Garuga?", resposta:"1"},
    {id:88,  pergunta:"Em qual geração foi a primeira aparição do Gendrome?", resposta:"1"},
    {id:89,  pergunta:"Em qual geração foi a primeira aparição do Iodrome?", resposta:"1"},
    {id:90,  pergunta:"Em qual geração foi a primeira aparição do Azure Rathalos?", resposta:"1"},
    {id:91,  pergunta:"Em qual geração foi a primeira aparição do Silver Rathalos?", resposta:"1"},
    {id:92,  pergunta:"Em qual geração foi a primeira aparição da Gold Rathian?", resposta:"1"},
    {id:93,  pergunta:"Em qual geração foi a primeira aparição da Pink Rathian?", resposta:"1"},
    {id:94,  pergunta:"Em qual geração foi a primeira aparição do Gravios?", resposta:"1"},
    {id:95,  pergunta:"Em qual geração foi a primeira aparição do Khezu?", resposta:"1"},
    {id:96,  pergunta:"Em qual geração foi a primeira aparição do Green Plesioth?", resposta:"1"},
    {id:97,  pergunta:"Em qual geração foi a primeira aparição do Purple Gypceros?", resposta:"1"},
    {id:98,  pergunta:"Em qual geração foi a primeira aparição do Ashen Lao-Shan Lung?", resposta:"1"},
    {id:99,  pergunta:"Em qual geração foi a primeira aparição do Diablos?", resposta:"1"},
    {id:100,  pergunta:"Em qual geração foi a primeira aparição do BlackDiablos?", resposta:"1"},
    {id:101,  pergunta:"Em qual geração foi a primeira aparição do Camaleus?", resposta:"2"},
    {id:102,  pergunta:"Em qual geração foi a primeira aparição do Yama Tsukami?", resposta:"2"},
    {id:103,  pergunta:"Em qual geração foi a primeira aparição do White Fatalis?", resposta:"2"},
    {id:104,  pergunta:"Em qual geração foi a primeira aparição do Vespoid Queen?", resposta:"2"},
    {id:105,  pergunta:"Em qual geração foi a primeira aparição do Terra Shogun Ceanataur?", resposta:"2"},
    {id:106,  pergunta:"Em qual geração foi a primeira aparição do Rusted Kushala Daora?", resposta:"2"},
    {id:107,  pergunta:"Em qual geração foi a primeira aparição do Furious Rajang?", resposta:"2"},
    {id:108,  pergunta:"Em qual geração foi a primeira aparição do Plum Daimyo Hermitaur?", resposta:"2"},
    {id:109,  pergunta:"Em qual geração foi a primeira aparição do Daimyo Hermitaur?", resposta:"2"},
    {id:110,  pergunta:"Em qual geração foi a primeira aparição do Blangonga?", resposta:"2"},
    {id:111,  pergunta:"Em qual geração foi a primeira aparição do Congalala?", resposta:"2"},
    {id:112,  pergunta:"Em qual geração foi a primeira aparição do Bulldrome?", resposta:"2"},
    {id:113,  pergunta:"Em qual geração foi a primeira aparição do King Shakalaka?", resposta:"2"},
    {id:114,  pergunta:"Em qual geração foi a primeira aparição do Lavasioth?", resposta:"2"},
    {id:115,  pergunta:"Em qual geração foi a primeira aparição do Hypnocatrice?", resposta:"2"},
    {id:116,  pergunta:"Em qual geração foi a primeira aparição do Agnaktor?", resposta:"3"},
    {id:117,  pergunta:"Em qual geração foi a primeira aparição do Glacial Agnaktor?", resposta:"3"},
    {id:118,  pergunta:"Em qual geração foi a primeira aparição do Arzuros?", resposta:"3"},
    {id:119,  pergunta:"Em qual geração foi a primeira aparição do Barioth?", resposta:"3"},
    {id:120,  pergunta:"Em qual geração foi a primeira aparição do Sand Barioth?", resposta:"3"},
    {id:121,  pergunta:"Em qual geração foi a primeira aparição do Barroth?", resposta:"3"},
    {id:122,  pergunta:"Em qual geração foi a primeira aparição do Jade Barroth?", resposta:"3"},
    {id:123,  pergunta:"Em qual geração foi a primeira aparição do Brute Tigrex?", resposta:"3"},
    {id:124,  pergunta:"Em qual geração foi a primeira aparição do Savage Deviljho?", resposta:""},
    {id:125,  pergunta:"Em qual geração foi a primeira aparição do Duramboros?", resposta:"3"},
    {id:126,  pergunta:"Em qual geração foi a primeira aparição do Rust Duramboros?", resposta:"3"},
    {id:127,  pergunta:"Em qual geração foi a primeira aparição do Baleful Gigginox?", resposta:"3"},
    {id:128,  pergunta:"Em qual geração foi a primeira aparição do Gobul?", resposta:"3"},
    {id:129,  pergunta:"Em qual geração foi a primeira aparição do Green Nargacuga?", resposta:"3"},
    {id:130,  pergunta:"Em qual geração foi a primeira aparição do Abyssal Lagiacrus?", resposta:"3"},
    {id:131,  pergunta:"Em qual geração foi a primeira aparição do Ivory Lagiacrus?", resposta:"3"},
    {id:132,  pergunta:"Em qual geração foi a primeira aparição do Lagombi?", resposta:"3"},
    {id:133,  pergunta:"Em qual geração foi a primeira aparição do Lucent Nargacuga?", resposta:"3"},
    {id:134,  pergunta:"Em qual geração foi a primeira aparição do Nibelsnarf?", resposta:"3"},
    {id:135,  pergunta:"Em qual geração foi a primeira aparição do Qurupeco?", resposta:"3"},
    {id:136,  pergunta:"Em qual geração foi a primeira aparição do Crimson Qurupeco?", resposta:"3"},
    {id:137,  pergunta:"Em qual geração foi a primeira aparição do Royal Ludroth?", resposta:"3"},
    {id:138,  pergunta:"Em qual geração foi a primeira aparição do Purple Ludroth?", resposta:"3"},
    {id:139,  pergunta:"Em qual geração foi a primeira aparição do Uragaan?", resposta:"3"},
    {id:140,  pergunta:"Em qual geração foi a primeira aparição do Steel Uragaan?", resposta:"3"},
    {id:141,  pergunta:"Em qual geração foi a primeira aparição do Volvidon?", resposta:"3"},
    {id:142,  pergunta:"Em qual geração foi a primeira aparição do Stygian Zinogre?", resposta:"3"},
    {id:143,  pergunta:"Em qual geração foi a primeira aparição do Goldbeard Ceadeus?", resposta:"3"},
    {id:144,  pergunta:"Em qual geração foi a primeira aparição do Dire Miralis?", resposta:"3"},
    {id:145,  pergunta:"Em qual geração foi a primeira aparição do Jhen Mohran?", resposta:"3"},
    {id:146,  pergunta:"Em qual geração foi a primeira aparição do Hallowed Jhen Mohran?", resposta:"3"},
    {id:147,  pergunta:"Em qual geração foi a primeira aparição do Nakarkos?", resposta:"4"},
    {id:148,  pergunta:"Em qual geração foi a primeira aparição do Oroshi Kirin?", resposta:"4"},
    {id:149,  pergunta:"Em qual geração foi a primeira aparição do Dah'ren Mohran?", resposta:"4"},
    {id:150,  pergunta:"Em qual geração foi a primeira aparição do Gogmazios?", resposta:"4"},
    {id:151,  pergunta:"Em qual geração foi a primeira aparição do Shah Dalamadur?", resposta:"4"},
    {id:152,  pergunta:"Em qual geração foi a primeira aparição do Dalamadur?", resposta:"4"},
    {id:153,  pergunta:"Em qual geração foi a primeira aparição do Tigerstripe Zamtrios?", resposta:"4"},
    {id:154,  pergunta:"Em qual geração foi a primeira aparição do Zamtrios?", resposta:"4"},
    {id:155,  pergunta:"Em qual geração foi a primeira aparição do Thunderlord Zinogre?", resposta:"4"},
    {id:156,  pergunta:"Em qual geração foi a primeira aparição do Silverwind Nargacuga?", resposta:"4"},
    {id:157,  pergunta:"Em qual geração foi a primeira aparição do Snowbaron Lagombi?", resposta:"4"},
    {id:158,  pergunta:"Em qual geração foi a primeira aparição do Stonefist Hermitaur?", resposta:"4"},
    {id:159,  pergunta:"Em qual geração foi a primeira aparição do Tetsucabra?", resposta:"4"},
    {id:160,  pergunta:"Em qual geração foi a primeira aparição do Berserk Tetsucabra?", resposta:"4"},
    {id:161,  pergunta:"Em qual geração foi a primeira aparição do Drilltusk Tetsucabra?", resposta:"4"},
    {id:162,  pergunta:"Em qual geração foi a primeira aparição do Redhelm Arzuros?", resposta:"4"},
    {id:163,  pergunta:"Em qual geração foi a primeira aparição do Ruby Basarios?", resposta:"4"},
    {id:164,  pergunta:"Em qual geração foi a primeira aparição do Rustrazor Ceanataur?", resposta:"4"},
    {id:165,  pergunta:"Em qual geração foi a primeira aparição do Seltas?", resposta:"4"},
    {id:166,  pergunta:"Em qual geração foi a primeira aparição do Desert Seltas?", resposta:"4"},
    {id:167,  pergunta:"Em qual geração foi a primeira aparição do Seltas Queen?", resposta:"4"},
    {id:168,  pergunta:"Em qual geração foi a primeira aparição do Desert Seltas Queen?", resposta:"4"},
    {id:169,  pergunta:"Em qual geração foi a primeira aparição do Soulseer Mizutsune?", resposta:"4"},
    {id:170,  pergunta:"Em qual geração foi a primeira aparição do Najarala?", resposta:"4"},
    {id:171,  pergunta:"Em qual geração foi a primeira aparição do Tidal Najarala?", resposta:"4"},
    {id:172,  pergunta:"Em qual geração foi a primeira aparição do Nerscylla?", resposta:"4"},
    {id:173,  pergunta:"Em qual geração foi a primeira aparição do Shrouded Nerscylla?", resposta:"4"},
    {id:174,  pergunta:"Em qual geração foi a primeira aparição do Raging Brachydios?", resposta:"4"},
    {id:175,  pergunta:"Em qual geração foi a primeira aparição do Nightcloak Malfestio?", resposta:"4"},
    {id:176,  pergunta:"Em qual geração foi a primeira aparição do Malfestio?", resposta:"4"},
    {id:177,  pergunta:"Em qual geração foi a primeira aparição do Ash Kecha Wacha?", resposta:"4"},
    {id:178,  pergunta:"Em qual geração foi a primeira aparição do Kecha Wacha?", resposta:"4"},
    {id:179,  pergunta:"Em qual geração foi a primeira aparição do Chaotic Gore Magala?", resposta:"4"},
    {id:180,  pergunta:"Em qual geração foi a primeira aparição do Dreadqueen Rathian?", resposta:"4"},
    {id:181,  pergunta:"Em qual geração foi a primeira aparição do Gammoth?", resposta:"4"},
    {id:182,  pergunta:"Em qual geração foi a primeira aparição do Elderfrost Gammoth?", resposta:"4"},
    {id:183,  pergunta:"Em qual geração foi a primeira aparição do Hellblade Glavenus?", resposta:"4"},
    {id:184,  pergunta:"Em qual geração foi a primeira aparição do Grimclaw Tigrex?", resposta:"4"},
    {id:185,  pergunta:"Em qual geração foi a primeira aparição do Molten Tigrex?", resposta:"4"},
    {id:186,  pergunta:"Em qual geração foi a primeira aparição do Dreadking Rathalos?", resposta:"4"},
    {id:187,  pergunta:"Em qual geração foi a primeira aparição do Deadeye Yian Garuga?", resposta:"4"},
    {id:188,  pergunta:"Em qual geração foi a primeira aparição do Crystalbeard Uragaan?", resposta:"4"},
    {id:189,  pergunta:"Em qual geração foi a primeira aparição do Bloodbath Diablos?", resposta:"4"},
    {id:190,  pergunta:"Em qual geração foi a primeira aparição do Boltreaver Astalos?", resposta:"4"},
    {id:191,  pergunta:"Em qual geração foi a primeira aparição do Astalos?", resposta:"4"},
    {id:192,  pergunta:"Em qual geração foi a primeira aparição do Ahtal Ka?", resposta:"4"},
    {id:193,  pergunta:"Em qual geração foi a primeira aparição do Zorah Magdaros?", resposta:"5"},
    {id:194,  pergunta:"Em qual geração foi a primeira aparição do Safi'jiiva?", resposta:"5"},
    {id:195,  pergunta:"Em qual geração foi a primeira aparição do Xeno'jiiva?", resposta:"5"},
    {id:196,  pergunta:"Em qual geração foi a primeira aparição do Blackveil Vaal Hazak?", resposta:"5"},
    {id:197,  pergunta:"Em qual geração foi a primeira aparição do Shara Ishvalda?", resposta:"5"},
    {id:198,  pergunta:"Em qual geração foi a primeira aparição do Ruiner Nergigante?", resposta:"5"},
    {id:199,  pergunta:"Em qual geração foi a primeira aparição do Tobi-Kadachi?", resposta:"5"},
    {id:200,  pergunta:"Em qual geração foi a primeira aparição do Viper Tobi-Kadachi?", resposta:"5"},
    {id:201,  pergunta:"Em qual geração foi a primeira aparição do Tzitzi-Ya-Ku?", resposta:"5"},
    {id:202,  pergunta:"Em qual geração foi a primeira aparição do Kulve Taroth?", resposta:"5"},
    {id:203,  pergunta:"Em qual geração foi a primeira aparição do Namielle?", resposta:"5"},
    {id:204,  pergunta:"Em qual geração foi a primeira aparição do Radobaan?", resposta:"5"},
    {id:205,  pergunta:"Em qual geração foi a primeira aparição do Coral Pukei-Pukei?", resposta:"5"},
    {id:206,  pergunta:"Em qual geração foi a primeira aparição do Pukei-Pukei?", resposta:"5"},
    {id:207,  pergunta:"Em qual geração foi a primeira aparição do Nightshade Paolumu?", resposta:"5"},
    {id:208,  pergunta:"Em qual geração foi a primeira aparição do Paolumu?", resposta:"5"},
    {id:209,  pergunta:"Em qual geração foi a primeira aparição do Ebony Odogaron?", resposta:"5"},
    {id:210,  pergunta:"Em qual geração foi a primeira aparição do Odogaron?", resposta:"5"},
    {id:211,  pergunta:"Em qual geração foi a primeira aparição do Acidic Glavenus?", resposta:"5"},
    {id:212,  pergunta:"Em qual geração foi a primeira aparição do Great Girros?", resposta:"5"},
    {id:213,  pergunta:"Em qual geração foi a primeira aparição do Great Jagras?", resposta:"5"},
    {id:214,  pergunta:"Em qual geração foi a primeira aparição do Jyuratodus?", resposta:"5"},
    {id:215,  pergunta:"Em qual geração foi a primeira aparição do Kulu-Ya-Ku?", resposta:"5"},
    {id:216,  pergunta:"Em qual geração foi a primeira aparição do Legiana?", resposta:"5"},
    {id:217,  pergunta:"Em qual geração foi a primeira aparição do Shrieking Legiana?", resposta:"5"},
    {id:218,  pergunta:"Em qual geração foi a primeira aparição do Anjanath?", resposta:"5"},
    {id:219,  pergunta:"Em qual geração foi a primeira aparição do Fulgur Anjanath?", resposta:"5"},
    {id:220,  pergunta:"Em qual geração foi a primeira aparição do Banbaro?", resposta:"5"},
    {id:221,  pergunta:"Em qual geração foi a primeira aparição do Bazelgeuse?", resposta:"5"},
    {id:222,  pergunta:"Em qual geração foi a primeira aparição do Seething Bazelgeuse?", resposta:"5"},
    {id:223,  pergunta:"Em qual geração foi a primeira aparição do Beotodus?", resposta:"5"},
    {id:224,  pergunta:"Em qual geração foi a primeira aparição do Dodogama?", resposta:"5"},
    {id:225,  pergunta:"Em qual geração foi a primeira aparição do Frostfang Barioth?", resposta:"5"},
    {id:226,  pergunta:"Em qual geração foi a primeira aparição do Aknosom?", resposta:"5"},
    {id:227,  pergunta:"Em qual geração foi a primeira aparição do Almudron?", resposta:"5"},
    {id:228,  pergunta:"Em qual geração foi a primeira aparição do Magma Almudron?", resposta:"5"},
    {id:229,  pergunta:"Em qual geração foi a primeira aparição do Violet Mizutsune?", resposta:"5"},
    {id:230,  pergunta:"Em qual geração foi a primeira aparição do Bishaten?", resposta:"5"},
    {id:231,  pergunta:"Em qual geração foi a primeira aparição do Blood Orange Bishaten?", resposta:"5"},
    {id:232,  pergunta:"Em qual geração foi a primeira aparição do Flaming Espinas?", resposta:"5"},
    {id:233,  pergunta:"Em qual geração foi a primeira aparição do Espinas?", resposta:"5"},
    {id:234,  pergunta:"Em qual geração foi a primeira aparição do Garangolm?", resposta:"5"},
    {id:235,  pergunta:"Em qual geração foi a primeira aparição do Goss Harag?", resposta:"5"},
    {id:236,  pergunta:"Em qual geração foi a primeira aparição do Great Izuchi?", resposta:"5"},
    {id:237,  pergunta:"Em qual geração foi a primeira aparição do Lunagaron?", resposta:"5"},
    {id:238,  pergunta:"Em qual geração foi a primeira aparição do Scorned Magnamalo?", resposta:"5"},
    {id:239,  pergunta:"Em qual geração foi a primeira aparição do Rakna-Kadaki?", resposta:"5"},
    {id:240,  pergunta:"Em qual geração foi a primeira aparição do Pyre Rakna-Kadaki?", resposta:"5"},
    {id:241,  pergunta:"Em qual geração foi a primeira aparição do Somnacanth?", resposta:"5"},
    {id:242,  pergunta:"Em qual geração foi a primeira aparição do Aurora Somnacanth?", resposta:"5"},
    {id:243,  pergunta:"Em qual geração foi a primeira aparição do Tetranadon?", resposta:"5"},
    {id:244,  pergunta:"Em qual geração foi a primeira aparição do Crimson Glow Valstrax?", resposta:"5"},
    {id:245,  pergunta:"Em qual geração foi a primeira aparição do Risen Crimson Glow Valstrax?", resposta:"5"},
    {id:246,  pergunta:"Em qual geração foi a primeira aparição do Gaismagorm?", resposta:"5"},
    {id:247,  pergunta:"Em qual geração foi a primeira aparição do Primordial Malzeno?", resposta:"5"},
    {id:248,  pergunta:"Em qual geração foi a primeira aparição do Risen Chameleos?", resposta:"5"},
    {id:249,  pergunta:"Em qual geração foi a primeira aparição do Risen Kushala Daora?", resposta:"5"},
    {id:250,  pergunta:"Em qual geração foi a primeira aparição do Risen Shagaru Magala?", resposta:"5"},
    {id:251,  pergunta:"Em qual geração foi a primeira aparição do Risen Teostra?", resposta:"5"},
    {id:252,  pergunta:"Em qual geração foi a primeira aparição do Thunder Serpent Narwa?", resposta:"5"},
    {id:253,  pergunta:"Em qual geração foi a primeira aparição do Narwa the Allmother?", resposta:"5"},
    {id:254,  pergunta:"Em qual geração foi a primeira aparição do Wind Serpent Ibushi?", resposta:"5"},
    {id:255,  pergunta:"Em qual geração foi a primeira aparição do Jin Dahaad?", resposta:"6"},
    {id:256,  pergunta:"Em qual geração foi a primeira aparição do Quematrice?", resposta:"6"},
    {id:257,  pergunta:"Em qual geração foi a primeira aparição do Nu Udra?", resposta:"6"},
    {id:258,  pergunta:"Em qual geração foi a primeira aparição do Uth Duna?", resposta:"6"},
    {id:259,  pergunta:"Em qual geração foi a primeira aparição do Guardian Arkveld?", resposta:"6"},
    {id:260,  pergunta:"Em qual geração foi a primeira aparição do Guardian Arkveld?", resposta:"6"},
    {id:261,  pergunta:"Em qual geração foi a primeira aparição do Guardian Ebony Odogaron?", resposta:"6"},
    {id:262,  pergunta:"Em qual geração foi a primeira aparição do Guardian Fulgur Anjanath?", resposta:"6"},
    {id:263,  pergunta:"Em qual geração foi a primeira aparição do Guardian Rathalos?", resposta:"6"},
 

    
];

//Função para selecionar Questões Aleatórias
function selecionarQuestoesAleatorias(questoes, quantidadeQuestoes){//Função que retorna 10 perguntas aleatórias.
    const questoesAleatorias = questoes.sort(() => Math.random() - 0.5);// Embaralha as perguntas do array questoes.
    return questoesAleatorias.slice(0, quantidadeQuestoes);//Retorna um novo array com 10 perguntar aleatórias selecionadas.   
}


//Função para exibir pergunta e retorna a  resposta do usuário.

function exibirPergunta(pergunta, index){
    console.log(`\n${index + 1}: ${pergunta.pergunta}`);
    const respostaUsuario = entradaDados.question("Digite a resposta (Gen ou ano): ");
    return respostaUsuario;
}

//Função validar resposta do usuário
function validarRepostaDoUsuario(respostaDoUsuario, pergunta){
    return respostaDoUsuario === pergunta.resposta;
}

//Função exibir resultado
function exibirResultado(pontuacaoFinal, nomeJogador){
    let mensagem ="";

    if(pontuacaoFinal <= 3){
        mensagem = "Bah guri(a), depois tu não quer que as pessoas fiquem se arriando com a tua cara kk, tente mais uma vez.";
    }else if(pontuacaoFinal <=6){
        mensagem = "Tchê, não imaginei que seria uma bucha, para de mosquear e responda direito.";
    }else if( pontuacaoFinal <=9){
        mensagem = "Tri, tu acertou a maioria xiru."
    }else{
        mensagem = "Barbaridade, tu acertou todas, parabéns!"
    }
    
    console.log(`\nJogador(a): ${nomeJogador}`);
    console.log(`Pontuação final: ${pontuacaoFinal} acertos.`);
    console.log(mensagem);
}

//Interface de aplicação


function iniciarQuiz(){
    console.log("----- Quiz de Monster Hunter ----- \n");
    console.log("Seja- Bem-vindo jogador(a)!")
   
    const nomeJogador = entradaDados.question("Digite o seu nome: ");
    const quantidadeQuestoes = 10;

    const questoesSelecionadas = selecionarQuestoesAleatorias(questoes, quantidadeQuestoes); //Armazena as 10 perguntas aleatórias.

    let pontuacaoFinal = 0

    questoesSelecionadas.forEach((pergunta, index) =>{
        const respostaUsuario = exibirPergunta(pergunta, index);
        const resultadoValidacao = validarRepostaDoUsuario(respostaUsuario, pergunta);
        if(resultadoValidacao){
            console.log("Resposta correta!");
            pontuacaoFinal++;
        }else{
            console.log("Resposta errada!");
        }
    });

    exibirResultado(pontuacaoFinal, nomeJogador);


}

iniciarQuiz(); //Iniciar o Quiz










//quiz-monster-hunter.js