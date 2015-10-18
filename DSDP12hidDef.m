function [y1] = DSDP12hidDef(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 18-Oct-2015 23:00:19.
% 
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 12xQ matrix, input #1
% and returns:
%   y = 75xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

  % ===== NEURAL NETWORK CONSTANTS =====
  
  % Input 1
  x1_step1_xoffset = [1;1;1;-12;-8;-6;-6;0;0;0;0;0];
  x1_step1_gain = [0.333333333333333;0.5;0.0666666666666667;0.0740740740740741;0.0666666666666667;0.0588235294117647;0.0606060606060606;0.2;0.2;0.2;0.2;0.25];
  x1_step1_ymin = -1;
  
  % Layer 1
  b1 = [-2.6455473062488725766;-1.8933438963894630991;-0.86673273869989830853;-0.71187524646694799735;-0.28907917740656430272;0.73856332536764490726;0.26533197316127876686;0.79629300917797074533;-0.84401404970835558483;-1.2688909471874814106;1.1688628436378332154;1.3821466452668986769];
  IW1_1 = [1.7602312277300669052 0.24844772026547520816 -0.36823567723490818748 0.53870767091841909036 1.1896491611404436117 0.50102509829975439004 -0.85900706262758586007 0.12480550636911330598 -0.20280989616926967112 0.32263512484255219004 0.28044410642037831405 0.065690986100361795086;0.22515241323152554442 0.33058624513248441312 0.007318930489663602601 0.39566424092871677054 0.48862969026256874994 0.26793682893525455624 0.17839574424020185339 -0.028612112123171912215 -0.79260026613655765182 -0.65811912111861625707 0.6090183257521601945 0.39087571004250981632;0.16392466399007818434 0.78025520858549057834 -0.00023560542396766637196 -0.039792858855072138491 0.79524476162740254104 0.85876417792684134334 -0.36448331262935795838 -0.18807738684537245177 0.13295988517541681984 0.35373524432134872963 -0.42330649041354451168 -0.74034811326152505373;1.0681310862483717194 -0.16205740148455702321 -0.20524408582066039353 0.012578663659631103555 -0.57774107929275841933 -0.27999445953777585272 0.86864213705948967181 0.45417545369261946853 0.50119595260298877015 -0.5195154908946140182 -0.4860306031567377949 -0.15337254699407107394;-0.54499683107922125558 0.28945439183269205952 -0.29579435599400777379 0.050886486654768109394 0.66452334908851451445 -0.49119751301740166571 0.23299873857205866123 0.34993152052683296205 -0.26283491225314881135 -0.24294456737546252234 -0.12144204650885981334 0.37218962546001393976;0.34508865271610256187 -0.85610648706155656473 -0.5671148853065455242 0.065026865274534273453 0.25765252803079574662 -1.2238315480673420677 -0.8694131140352121534 -0.30760073747657834531 -0.15719851132482515199 -0.54294261834958279511 0.58162883007495758125 0.33777600472096680484;0.99321119477346675453 0.12871014188201984618 -1.0508718748025500656 0.051462837043671841308 -0.20008821731660389465 0.73382107221615788806 -0.19784386974453932462 0.55928569263337490902 0.16467277465028090644 0.15562961225686083866 0.17324624478857289511 -0.046448051537034851233;0.70959308295132283995 -0.16325605788131064555 0.1846202027664356482 -0.75039651349470615216 -0.16458050515142594317 0.7150043804762841182 0.73714150344926832048 -0.10605808385448550757 0.22000995141415008449 -0.5176113296963874566 -0.48336530462947024933 0.1315457449905342302;-0.71604687584895054808 0.72390770727443976007 -0.2297825990266118279 0.052435272169603378001 1.14530921236222194 -0.94400860041636736053 0.56815381537352271923 -0.23961121891504999493 -0.10406693870936013779 0.36419833649619520743 -0.14827126013704269858 -0.36698202572277782707;-0.74598557663552622632 0.049135271734543323197 0.073398122320994990675 -0.22537412582018059859 0.6836282570215437282 -0.73839327179686198299 0.65513378851925108126 -0.59401641291440299142 0.11404229977730881429 -0.26038156043677751494 -0.21741387400867084878 0.13556963652046122304;0.932089067273165095 0.080760519246312306718 0.34565402887677865174 -0.15640271807957345507 -0.85504521269134181605 0.97179539373280676706 -0.32897603287911603154 -0.21323440473750976398 0.14095371997968100808 0.053954231727145862685 0.20070515738121055827 -0.33136383122932339118;0.43410226797885442807 0.50792643492928424287 -0.27968321473897661544 -0.16518383620345003515 0.11804429852552728031 0.50128054870566152168 -0.31239454446439984814 0.49594161915770607063 -0.12811082311632721042 -0.073317146627897830657 -0.082037275846286797365 0.029602005199675589242];
  
  % Layer 2
  b2 = [-0.25220669996335320917;-1.599411414472137638;-0.40064411323757809225;-1.3831227875123801585;-0.35473363547036373955;-1.1574593460581206195;0.094777825336798057765;-2.2224465007153888507;-1.1549543536607185246;-1.1690111465828130211;-0.66785832473966810774;-0.77672545133690229502;-0.24633499712237685864;-0.34359232577552228927;0.56340998403805042649;1.0762004289038418214;-0.4992537978650691266;-0.63189762943426563968;-0.35777231738284293039;-1.0529257206979953931;-0.69619285051852575208;-0.19533964582821672362;-0.32736404405886099234;-1.4983682840495533561;0.69742395893518571715;0.44505295398629712844;0.25091626484544027331;-0.47964493844828826052;-2.2645129973825310898;-1.739735361459871843;0.29732417296837926335;-0.46711809476003873787;0.10745722911261820776;0.23414562961780815975;0.54641924179763456948;-0.36265281782813707512;-0.29113948956578428184;-0.57771733794034618725;-0.71350902083223899375;-1.1832880395496885306;-1.0175758000644952173;-0.011175947382529916041;0.10517848083194533682;-1.0431228819682147879;0.97401251038250846737;-1.1594091113652347236;0.42669394139494537521;-0.14345229131061820738;-0.12546276256649552261;-0.98889235707401945685;-1.4433613675894771955;-0.85927387212374140013;-0.12280179153967454853;-0.48090335383021520776;0.71245202410670749327;0.731530463859747071;-1.0564828026631118973;-0.12244458698786683803;-0.98752621598888967736;-0.59014860130015145412;0.17199506759644739295;-1.0630966186948600516;-0.83823842905609247111;-1.0411683438939174362;-0.4277095372324535294;0.32790479345385387111;-0.68342987787048603554;-1.6331380197733684767;0.47361176497369206206;-0.27920279302685196976;-0.071433380202558294236;-0.59538139969321690614;-0.11852280030866352289;-1.2486049416713180804;-0.47513367354568997181];
  LW2_1 = [0.12779631882055764169 0.37561265583896691345 0.32337246937218638854 -0.17586911983471839593 -0.046842863150111303805 0.0086062803862423098433 -0.14301580108552408577 0.13921951085515996138 -0.36678823542728922202 0.011941462352254433865 -0.22336773455099159791 -0.1783257270761713642;-0.3924119908566335857 -0.037367622779849521408 0.032058911073689827509 -0.46656212716975564714 0.28077858359871987748 -0.40239597022848866414 0.036848375775178854319 0.28338054218190628086 -0.31708655492289672395 -0.23211984142800168307 0.39560130579039631815 0.17116303856781106552;0.41737864176867917054 -0.1595234985460986521 0.14478870755257550185 0.07679274672188524109 0.38745946930792007912 0.30661294545533535061 -0.051478989798107874232 0.36379734070480218566 0.70009551357721100384 -0.69096277155556029559 0.51687262946500212024 -0.88729257475495981744;-0.60628411548443417178 0.048409184601251237234 -0.0081298335957815659469 -0.19744151637954732159 0.12966723063471125021 -0.46726188062801876644 -0.074862245503532820479 0.41920559437978588413 -0.045144308533632888925 -0.42683860822090552434 -0.15881613278283140955 0.15685952471347308634;1.0135521420385689151 -0.099904589357116893589 0.34052556201405226322 -0.23758591312424579001 0.033417125755786473984 0.18704267448349332081 -0.058878529354690470332 -0.02605915038774780923 0.02455499897527053943 -0.084003765982536351964 0.3383836100817365633 0.15463299783261441611;-0.24408764577635835846 0.097947765824140747837 0.16070751083133638648 -0.19583844672899708428 -0.17578806927778417579 -0.047058955327987705974 -0.11223667102474564616 0.220197542918420891 0.20083302195338942342 -0.23193536434097031251 0.3542584574250525753 -0.1154026110050360987;0.20639769277750619203 0.07398047233811409773 0.51600181011969536993 0.12986025273025997295 0.25902983885045632872 0.11190252016443590077 -0.070173737715051767716 -0.11896790370159440742 -0.26009193819847375995 -0.14133907930066247349 -0.11983926844757886165 -0.37104951515666034778;-0.98885144050183915176 -0.050850255480504535921 0.17556764411305447737 -0.068612797153670496142 0.38347345482216343981 0.11272647611799777034 -0.14107985940652922885 0.15495993485838838177 0.14963584854900829901 -0.088319785802744146808 0.86417624664515713118 0.037733788982305865867;-0.27671067405928911898 0.18419558162819360536 -0.024942050545216896268 -0.079966966632478750365 0.02118366781546415778 -0.063003340005890071107 0.15505169907839613797 -0.23367415546793612879 0.094710458307138603584 0.023094765087103057144 0.59006982665863372262 0.31753988695640933404;-0.60021342005614308768 -0.1851421677993677628 0.21764513133870697081 0.0048565007373117946576 0.3133893335197676655 -0.24260884230573670495 -0.043401941460754794866 0.37011126999559185169 -0.1393279973784679604 -0.90917076591196532842 -0.81637339584077706078 -0.21481433554913148543;0.089873376291251388936 -0.090808930522685793463 0.13090678744236225461 -0.19592573106343114109 0.09358804095698947112 -0.25969239611494671083 0.084470097628561779945 0.085504925080127705539 -0.19871685496493537992 0.035782676053110432091 0.27927332611409716456 -0.13853029705660518944;0.49932357513275604788 -0.35700095267694587076 -0.048775154003545706516 0.062381140223843917214 0.0049159708290258154195 -0.14439129809429265827 -0.15224634163822184374 0.78953267192607934355 0.43678650252624595662 0.17966820059427235368 -0.17211941520834417307 0.27081193958680044309;0.10040768225501792155 0.48175713943608300394 -0.0040932543819233724314 -0.16495063557144945543 -0.12355107774591904402 0.036806475863581031294 0.14489634812898063987 0.63504821289052015842 0.32202365844478741952 -0.37593171628042310051 -0.59945923870876371975 -0.23993408242023367416;0.7948020532810916583 -0.050096713466283609995 -0.20563099242748322792 0.17464208421342683475 -0.081205582094068681775 0.052336012576458215695 -0.14903863651640331112 0.41207039945612067289 0.52172311761255463214 0.023887608735584431319 -0.25005314561025110409 0.37404224763610993687;0.26063923191513582722 0.11270313520926443507 0.63462779596771579094 0.22827162463513733792 -0.371880347061446348 0.4086951174539850129 0.031641548080283882216 -0.52213963735994461945 -0.32402813634129834508 0.38599405074360987333 -0.63578554369019724124 0.047266448839081751099;1.1614536068126068979 0.3230004465422725568 0.078725872057130927284 -0.015880698530801679036 -0.15178324685376554104 0.27517345064544601607 -0.047383487559848565251 1.0069231988814688616 0.62116406416389136069 -0.82116908359307927423 -1.2467001175970471305 -0.6446226714033191918;0.12831265248847908977 0.29505196523209964443 0.088677863423113123531 -0.037643332441973827163 -0.36289806219794118469 0.25020937156849176741 0.015851122153232616308 0.24660894819532105937 0.37110214351123504972 -0.11021936502022128268 -0.59667308835491739138 0.20543529796334297766;-0.14612295532817420884 0.26287690868878527128 0.048019925444920869007 -0.066283271135335330992 -0.19751976696137962808 -0.012746456455349313569 0.0089101927732969168905 0.25439608265470992077 0.081874207715815855435 -0.2660994886715045693 -0.50216636089890565042 -0.051783049756871646352;-0.50426598845284242856 0.1330368417966231176 0.093446126908900473129 0.3116752432599371736 -0.34961625803313473027 -0.10008686669227243038 -0.25808781347352516278 0.15589286811993982584 0.53821612045209665798 -0.47374373355351140358 -0.79750587111527104778 -0.22882228004309379532;-0.41736654174511800264 0.30244021761142869664 0.19853114438777866302 0.0090845259234813846572 0.67424188326044065533 0.21711728551014736199 -0.24763789797306157148 0.22820525481416203961 0.22572531794827871421 -0.99811481436468552086 0.10788780580220175276 -0.37986767708103180707;1.311046277066003185 -0.43911552443232138021 0.050745118957988472053 -0.13126183182821543616 -0.20613618880060266547 0.065236798417469168965 -0.11912367126091141789 0.58357719207387126481 0.013242533546502538444 0.3156466953685550525 -0.19194061012502919294 0.98850794294256794092;-0.1751647430298334529 0.045082337661956163599 0.26521795209747822675 0.060020546141961360342 -0.041615857669888955961 -0.19890457161015104304 -0.21141439471306844311 0.092327692054789231579 -0.039564593889996224618 -0.38635416055465476859 -0.42772105879410299289 -0.37008984825658813866;-0.71856923595754829126 0.72016242243099748421 0.17283596150135782654 0.60208154829897431171 0.37739357788068461641 0.1491850493482793083 -0.42141686496086494529 -0.48422860574696724445 0.24511278771293412704 -0.3460934622559689311 0.67457591105636161011 -0.49345890229735378529;-0.77677917263201157194 -0.32685546436683038385 0.1243393414182386858 0.11791504176523898151 0.5762773272549195358 -0.32286587703335595245 0.018822826517868374019 -0.1157543399881539592 -0.086131724691692126972 0.13107816639216890442 0.82117641026543619631 -0.082666285214037515949;1.6562034963232981077 0.33758408127898065221 0.22232491975219170754 0.19033330200648240771 -0.53001418471541095201 0.28179225872084789906 -0.27779714522528303755 -0.11267909830432415452 -0.018408114272101205877 1.0515658352611736426 0.2694116365975776084 1.0702848207221669075;0.4754221837461030109 0.30365425702561144039 0.39034994197126371418 0.03056769793491848769 -0.37497148523779749718 0.0023735763373255794328 0.095349542474374396339 0.021258920243102663594 -0.39662666610353969343 0.49925621777735823548 -0.77422246319137855153 0.2525031841379444808;-0.19241758369959283126 0.11173357404183244246 0.18539210956737159353 0.063368143723239289677 0.08505415537237803747 -0.10588150837569701435 0.30261317855431091317 0.80091542897523748668 0.045245238813437449465 -0.36917218640797322404 -1.1241685515936528095 -0.65732961437932835302;0.10309459118507938169 0.30310637169485576958 -0.021178267204756528325 -0.022574430937552028564 0.020204350497753143651 -0.034259337899689303042 -0.11687857355733524689 0.48470293479245635249 0.090297619960840583286 -0.18398044258543777563 -0.38778353944530163933 0.02404780667052862364;-1.3043945680347461824 0.33121880243439194569 0.11010020864734162971 -0.39868967675640881732 0.18979904628505656072 -0.15365804077510852865 0.011011561884487958141 0.11058259657504733442 -0.03279842779878892195 -0.5529302703893536064 0.36390745436494403853 0.3610570035522098209;-0.67639426882137465569 -0.36482470245911152729 0.31210792204872439548 0.14691720668891833368 0.72644467323046724161 -0.044845363864374473972 -0.12050077120099901562 0.10844564804197759367 -0.00022041964921299186941 -0.37676428345033896594 0.52581647015423671476 -0.23311804827924159644;0.18774252225536849914 0.41123305953237349053 0.29868210724207938656 0.0027061501188778702698 -0.45268892805260668721 -0.17856918808970248524 -0.04936801467306498048 -0.24230817993359965445 -0.16645207366639716562 0.10315272477440870502 -0.48789243637742152337 0.12932300468450944053;0.37754092588659737828 -0.56692917328093350715 0.64475081371499087801 -0.15295702580003994742 0.3264353359376090391 0.00077801436286304911927 0.042666160849640602515 0.1090076764972911505 -0.44331538100753553611 0.14943849596945843472 0.16108488083464911345 -0.25283536505019327256;0.083705617823899611252 0.7759628320210717467 0.019610454198477907106 0.51211288244589614482 -0.31030968784880530453 0.17812026720699555837 -0.47871670055804915744 -1.0648196311632875943 0.082552365710297226364 0.43069415638530628154 0.34929162340145614163 0.85419163554163224372;0.76378806920132591429 0.025482674779858584257 0.089419741209844041951 -0.2222778976955752106 -0.16498996865089091135 -0.11144851990252413465 -0.02252947895000145806 0.59675782609887906283 0.25717998178678513899 -0.48934669578647732591 -0.4414976360389838983 -0.60188975243707709684;0.54662785163592975124 0.49600646593642389037 -0.030892495676209281996 0.33148206292118631566 0.27922487675811435981 -0.13661508784015341522 -0.071374229228365171362 -0.38961430798830992694 -0.46190085572413530635 0.94247254581205130997 0.83196017306910452493 0.02888869432254505959;0.90229124645144687111 -0.26702413333190366806 -0.11204930281038361084 -0.06323360652770144974 -0.33148901593891899608 -0.25398345150265028147 -0.017601975463318778048 0.33030279383921157255 0.11735401979808617046 0.38267739773003661696 -0.11709506323330692856 0.52004736477190083299;-0.071772121419710774304 0.39082021804307787161 0.51579389811989351244 -0.035437651308647316606 -0.014033309205407740183 0.018859607585980098232 -0.15029378587976022219 -0.01634776977471544962 -0.64526227401072222545 0.29783495866944459385 -0.23113180473631173006 0.24756347473748269161;0.50569324304279461568 -0.4258100225841237596 -0.013777000241577901096 -0.06986383387277876611 0.26245689814833600417 -0.52436030566934466179 -0.18149819497240471389 0.53941321862738667026 -0.19968751311597957021 -0.30072970488739303452 -0.43620961075901343307 0.16279211636718304845;-0.017928777214298918796 -0.23963558187485506368 0.22290610523514570174 0.56570782089907534207 0.67513782791371124148 -0.047680299729780252493 -0.085476407955016958651 -0.376083566801304503 -0.29652850477146558417 0.79760577831282197803 0.90753058314933809925 0.43390925114881834235;0.44831451315483977771 0.25228598465447293897 -0.12539193223329714311 -0.05261135965540573306 0.087055584670838917494 -0.045937894125509054488 -0.36445715827410019028 -0.26976047268950226199 0.08816210242576230649 0.023465384629002196404 0.62588133300034232143 1.1802193575325730102;0.21923436811812596625 0.026839303252497892505 0.16075532901509867467 -0.32865685477704970063 0.16580304607365109471 0.14943263012434809811 -0.036265788310747296141 0.51964060634744613232 0.023623605554318374833 -0.31304892700067588063 0.43534887864315346961 -0.2292007124480721636;0.65465907301936199225 0.08544543764999656954 0.071049887628577002019 0.19324264464189255808 0.013163545931578299331 -0.032663316101892658772 -0.14488112064450836547 -0.17194459899751540766 0.086976770453291954444 0.30124011512718246175 0.38459518632944139638 0.22023153706625081538;0.15812350717024539759 0.41034485419934990658 -0.15857461954657747771 -0.11843466330994942282 -0.75544851381065547535 -0.42560296465455804693 -0.15335512405466233954 1.0361686773533838046 0.5477562118906551536 -0.66874380310139414085 -1.6337023465477831241 0.096651763303068044531;-0.71750881067838923055 0.5897129211644047686 0.18001238060329735613 -0.045399588337629685764 0.042268011355082332758 -0.26478388856132784035 -0.015523971665858626173 -0.15666914793114833371 -0.33221379095202141496 0.4456533319802097326 0.26448759126298587718 0.78088814618211010998;0.2566627780783953261 0.3542774508325581273 0.34046797108157178524 0.25364646865740980708 -0.10857390175288790524 -0.13505503330309226451 -0.041920933876380864214 0.68020812578110967372 -0.087697391298001706184 -0.18253901155274013246 -1.6104539181912429502 -0.12603723563407120967;-0.46919247792719975809 0.018162314975090361469 0.00053335120133296901046 -0.34733359916005224211 -0.42688536822426742523 -0.024434275821540597795 0.22879583644960943545 0.48124802024486545982 0.10237096612701747367 0.29869715747249481197 -0.40300301825943812828 0.38438222501797530972;0.41933480056613653408 0.14493399590164410262 0.41459324053606011473 -0.18012576206140973323 -0.21133034784839038744 -0.16100930646329691953 -0.099008215506410202078 0.89074217315624593105 -0.089362447998623431578 -0.79655858951152858083 -1.6355181280998716264 -0.31953479517969862744;0.26872193965049745445 0.44048174636293924156 0.080958446049513077547 0.29267655682065024658 0.1763640490551335871 0.010853347917853847782 -0.17666975346827773485 -0.42507738683638662813 0.053314770662332047757 0.39910646169005614681 0.80966768541624734024 0.25278675934588684671;-0.72234413948932740812 0.47599699771428349848 0.39929925303643432066 0.20548400402530078712 -0.084317977394310045236 0.24498001709511149637 0.21465630824754269868 -0.24617097153421735323 0.038063691948844180502 0.46758926519091581486 0.24980283945728715134 -0.60949971793289869915;0.075695068102962087542 0.049202278527324373736 -0.058072308768020525216 -0.13789147240100044223 0.16121881243105343207 -0.046482110486532370042 0.015705069249663611286 0.09549785184070855304 0.028003298315137599428 -0.013622785205714894874 0.30766039390785004937 0.26023332048768521574;-0.37200199701427311139 0.30689027746535746388 -0.091447883261718432291 0.051971958552981409318 0.05819117434828690455 -0.16097270593918477921 -0.014589000877015784186 -0.14427884987064315547 -0.24471316470654189135 0.60835297189147885533 0.81123138581653508883 0.69219455617774483525;0.55300833466883392298 -0.17028189082186223624 0.35557182663932213051 -0.21646337418644590045 0.062624636978146422384 -0.020235531764787262343 -0.25329958684354536569 0.15318485812310647654 -0.36719986242124397213 0.18200827392103999247 -0.094983066005564387169 0.67635092904663762781;0.11913024969708413403 0.079927664342068521774 0.25266534316353289613 0.18775330675183984908 -0.31040452683411479118 0.04016742719531204292 0.01985894406399188114 -0.23506423230701389837 -0.017496333489659163241 0.36652725322874757374 0.21723232382136914431 -0.072196694309494394148;0.13136964803350453801 -0.14575532666827473172 0.1668457144303748807 -0.03838866305270813295 0.47225951058201121047 -0.16753915573742206302 -0.080424416662487979712 0.2332074637789304794 -0.27355785653066422292 -0.1399406555860549517 -0.055552380486511399038 -0.26336888700915511707;0.1207425464809663701 0.8862887967069670303 0.14634416053727067331 0.20121475678812619781 -0.28138067463370569632 0.0862792292206024658 -0.10584095319909926636 -0.070962725372735346863 0.028283069651398040634 0.34601067346005537351 -0.62194294686801443461 0.24617700428344910235;-0.43642440427236817158 0.7514031589340910422 0.20382550665628021425 0.030053714463947611701 -0.33910581104375192574 -0.14134558141393674391 0.1931628215240644153 -0.4513723542703479974 -0.38173050330598201629 0.40622838450324771919 -0.92703138873175805479 0.17069581646862516666;-0.3044978408579563367 -0.2182788560624755736 0.047666153927706275684 -0.10472243414308551879 0.028418313103673528697 -0.32448688149735849251 0.17661897244465099566 -0.11456460051524700039 -0.25222265954340317151 0.33142256687754001465 0.21293777991622125922 0.088572232997766453533;-0.29537871337934340499 0.21843266212916273572 0.18465415765166781625 0.45676372330239389807 -0.078866763380572108 -0.010980274418795926694 -0.040229734607557576798 -1.0162247082661497455 0.074106831358965952194 0.98784428355109399345 0.8958237333533060065 0.43938617591780670946;-0.75792805549144592892 0.29831421235238753109 0.20420222343616037386 0.11932991216900418197 -0.069320419412913072965 -0.1062821831028108871 0.10464089756750818982 -0.22430578357874733642 0.047258411491007915051 0.57283711695792294272 0.91179356525395349742 -0.25580245738456325322;-0.073361715979751718208 0.23095037833329945531 0.33308080076303880901 0.27428277519244781413 0.26809805829603022831 0.27213026039630616726 -0.11952150484482512716 -0.18483720337327635974 -0.21364853346406856294 0.42772746513135312396 0.57618371543629709475 0.00035109520717441222715;0.19792158051839214838 -0.099397476903119647007 0.50669402393059037593 0.037615476482693324667 0.47695309798858132044 -0.068110586667195091581 0.10607322190487594726 0.41377953190066985023 -0.53061116540733410663 -0.39289543245582719821 -0.81649271535673095812 -0.43761052189401350443;0.10609354535057979874 0.34770986868702641326 0.14977104097032686858 -0.30694161809479425518 -0.41653695124350548218 0.17167411478184554929 -0.00044758696595325470069 0.64257005562147517796 0.28490972497144140263 -0.16359078173773070053 -0.26197559092450484197 0.39295455115762784049;-0.16728539238858819438 0.20770635892523753308 -0.047925317391895101704 -0.17583782272564035809 0.16748274619531661189 -0.02967500496350500977 0.10652488210272975655 0.13448854836315540795 0.18809736272988358818 -0.29743762786472593973 0.017210332368175196988 0.18191589660499371539;-0.91552362171085122089 0.42376311375247976976 0.22656419068372618542 -0.30663163459802894595 0.26792768733394417557 -0.17588857107163075044 0.22981181389044003094 0.028282223194035671643 -0.16762525172991518674 -0.14173377959601068943 0.53440899245488149294 -0.53865881895041023419;0.036243692194984161725 0.45748196092407972246 0.063853865782495022874 -0.21149256774057756392 -0.10065630201648964603 0.0088201203989178508791 0.071907299689607351301 0.47913628208673597619 0.093018732105461951476 0.026350385739584980538 -0.079835172942657420259 -0.23983280616742369551;0.52858139930671532714 -0.2637968424408942969 0.45825669346807856863 -0.12665266995676432993 -0.34613005782436706559 -0.020814402451161305441 0.082593758974776484982 0.038949742298614524472 -0.12225033748829924884 0.12042321116363352562 -0.18473486180962350733 -0.64621316366454850666;0.24475464613900194122 -0.23246592043312191977 0.63924686080432824298 -0.33378582414555457714 0.23375923272766555017 0.073795238523602812997 0.0028242043923983259357 0.69343027882070595869 -0.30298255900411980024 -0.97849877600544132861 -1.1877709309666830695 -0.081966397538560761826;-0.17653766768888534688 0.094159954794016550994 -0.18586024065529316296 -0.17564801320070394519 -0.26958492965330965729 -0.26902182992229106695 -0.13123913193240593911 0.10460431049790336333 0.12260821078538744477 0.12020396037910832665 0.17305313361476540313 1.0236133381988459234;1.3909272576796669618 0.0018585439351992832924 -0.039469256522348512839 0.0073558560684293177942 -0.13163105997652638224 -0.010573949865774145973 -0.12453019317145325173 0.41242161503091262498 0.15190232501932846021 -0.14897637487335851914 -0.47355078895082441948 -0.13431916507577751352;0.18495034670215948491 -0.020752878347913519819 0.38952992042241746384 -0.086105082552575831767 -0.066711621803569945421 0.037820123036344799328 -0.037919119643855615787 0.24856562880708560348 -0.031506728286284826912 -0.46077220233692883777 -0.48915121017256363301 -0.32155986176103917851;0.072715166549014026431 0.52401440498588203187 0.030999025832667437969 -0.055558674117975923035 -0.32185839934015381125 0.019172130457983799223 -0.016425640938232847349 0.49750294235150993583 0.53356582697325127818 -0.20670821245936316091 -0.15211285029078150388 -0.22026099811728108713;0.52694527201341201383 0.0048433674336380849734 0.62802944228161727835 -0.58519208757371088403 -0.69459685445590690911 -0.05696381755125383417 0.024131937311915978295 0.48095888161024519247 -0.59775905744378021733 -0.26378625688440759944 -1.2448580910761728457 0.71681445275112576354;1.2562712653315137867 -0.16850486562777902688 -0.34588573812530670759 -0.2227778353660492261 -0.14916043777918852609 -0.16683696213083737403 0.0069830000696953081762 1.0873991150549731088 0.67226409792083363648 -0.44034825093425727927 -0.33566408329519015208 -0.15225159034869073515;-0.43895982555432255801 0.51020317946675108889 0.36981639908578228804 -0.36763068498550466323 0.0024118921934758730252 -0.12729283969138838195 -0.18755155947282833862 -0.0015950702623491880283 -0.26336385932938621846 -0.50320057776678428496 -0.090381627821821783342 0.57137605381576228591;-0.42345946379067678222 0.7533677962466290845 -0.026973172753460492035 0.059926616061016700632 -0.23481419588215651784 0.05482213519284605957 -0.049906045255405061256 0.06626480439787471588 0.54317017581245596869 -0.10085786520571428382 0.11925544267152578259 -0.062524056189144930351];
  
  % Output 1
  y1_step1_ymin = -1;
  y1_step1_gain = [0.125;0.166666666666667;0.153846153846154;0.105263157894737;0.125;0.166666666666667;0.2;0.0645161290322581;0.153846153846154;0.117647058823529;0.0952380952380952;0.166666666666667;0.0689655172413793;0.0833333333333333;0.166666666666667;0.0869565217391304;0.153846153846154;0.133333333333333;0.133333333333333;0.181818181818182;0.133333333333333;0.133333333333333;0.08;0.117647058823529;0.08;0.0769230769230769;0.133333333333333;0.0869565217391304;0.0869565217391304;0.08;0.133333333333333;0.25;0.0666666666666667;0.222222222222222;0.125;0.105263157894737;0.0909090909090909;0.181818181818182;0.166666666666667;0.133333333333333;0.133333333333333;0.117647058823529;0.125;0.25;0.166666666666667;0.181818181818182;0.117647058823529;0.153846153846154;0.0952380952380952;0.153846153846154;0.125;0.181818181818182;0.142857142857143;0.111111111111111;0.142857142857143;0.111111111111111;0.125;0.125;0.153846153846154;0.125;0.117647058823529;0.0869565217391304;0.2;0.0952380952380952;0.08;0.25;0.181818181818182;0.0666666666666667;0.0909090909090909;0.0869565217391304;0.133333333333333;0.181818181818182;0.125;0.181818181818182;0.222222222222222];
  y1_step1_xoffset = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
  
  % ===== SIMULATION ========
  
  % Dimensions
  Q = size(x1,2); % samples
  
  % Input 1
  xp1 = mapminmax_apply(x1,x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
  
  % Layer 1
  a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);
  
  % Layer 2
  a2 = repmat(b2,1,Q) + LW2_1*a1;
  
  % Output 1
  y1 = mapminmax_reverse(a2,y1_step1_gain,y1_step1_xoffset,y1_step1_ymin);
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
  y = bsxfun(@minus,x,settings_xoffset);
  y = bsxfun(@times,y,settings_gain);
  y = bsxfun(@plus,y,settings_ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings_gain,settings_xoffset,settings_ymin)
  x = bsxfun(@minus,y,settings_ymin);
  x = bsxfun(@rdivide,x,settings_gain);
  x = bsxfun(@plus,x,settings_xoffset);
end
