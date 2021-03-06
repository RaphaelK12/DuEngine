// Xlffz2
highp ivec2 SV_DispatchThreadID = ivec2(0,0);
highp int Double_pixelID = 0;
highp vec4 col = vec4(0.,0.,0.,0.);
int i = 0;

//pass !
void A(uvec4 data){
    
    if(Double_pixelID == i++){
        if((SV_DispatchThreadID.x & 0x1) == 0){
        	col.xy = unpackSnorm2x16(data.s);
    		col.zw = unpackSnorm2x16(data.t);
        }
        else{
        	col.xy = unpackSnorm2x16(data.p);
    		col.zw = unpackSnorm2x16(data.q);
        }
    }
}

void mainImage( out vec4 C, in vec2 U)
{
    SV_DispatchThreadID = ivec2(floor(U-0.5));
    if(SV_DispatchThreadID.x >= 32 || SV_DispatchThreadID.y >= 32){
    	C = vec4(1./3.);
        //return;
    }
    if(iFrame > 2){
    	C = texture(iChannel0,U/iResolution.xy);
        //discard;
    }
    //1个像素存一个数据块
    //16 x 32, 16为其中2个像素存2个块数据
    //像素ID编号
    Double_pixelID = (SV_DispatchThreadID.x>>1) + (SV_DispatchThreadID.y<<4); 
    //-----------------------------------------------------------
    A(uvec4(0xCB62BDB8u,0x96DB2431u,0xD30B7BBu,0xC00890D2u));
    A(uvec4(0x582BBBB6u,0xA4CB254Au,0x4CA4B8BCu,0x3B63322Bu));
    A(uvec4(0x3413BCB7u,0x525AC3B0u,0x23E266C6u,0x492492ADu));
    A(uvec4(0xEE4963BBu,0x400F5A24u,0xEFFF609Du,0x3E027627u));
    A(uvec4(0xC0005876u,0x2769B609u,0xC6DA5A7Du,0xF149469u));
    A(uvec4(0x5DEE6C7Eu,0xB58E7C3Eu,0xB9585C74u,0x8E2B2531u));
    A(uvec4(0x949C4D78u,0x87454E0Bu,0x3FB96C78u,0x674D1B30u));
    A(uvec4(0x3503471u,0x402682C9u,0xF9893261u,0x278E4EBCu));
    A(uvec4(0x44023B61u,0x5314E541u,0x26D24065u,0x3E38DA68u));
    A(uvec4(0x4ADA3B69u,0x6043B63Au,0xF52C3053u,0xF00E7EBFu));
    A(uvec4(0xC0122D58u,0x9794EF4Du,0xE12C4D5Eu,0xDFFA7DB6u));
    A(uvec4(0xD41D5563u,0xFC93B9BEu,0x4A1B4E5Fu,0x3BE27D3Eu));
    A(uvec4(0xB5584750u,0xE6D936BBu,0x59504551u,0xA7F925D6u));
    A(uvec4(0x90AD4B58u,0x9F6B7158u,0x4C04505Eu,0xE4EDCF2Du));
    A(uvec4(0xD8024D55u,0x27EF89F1u,0x924952CAu,0xB1549A4u));
    A(uvec4(0x20118BC4u,0x0u,0x93B1C4C8u,0x536C7624u));
    A(uvec4(0x2492BDBAu,0x4A480000u,0xD76DBCB7u,0x6A141D70u));
    A(uvec4(0xB96BBDB8u,0x69241A11u,0x963BCB7u,0x49208295u));
    A(uvec4(0x5729BAB5u,0x8D348302u,0x2913B9B4u,0xA6469A88u));
    A(uvec4(0x2B2BBBB6u,0x6DA6806Eu,0xF5061B7u,0x88u));
    A(uvec4(0xE27F56BBu,0xD58FEBFFu,0xC16D4D67u,0xF983A0FAu));
    A(uvec4(0xE002417Cu,0x3FFBFF0Eu,0x392C4897u,0x17991B96u));
    A(uvec4(0x4DAC3699u,0x918B24F6u,0x7965637Au,0x374ED7ACu));
    A(uvec4(0x20006370u,0xAB989B0Bu,0x23D82A6Fu,0x480A90F1u));
    A(uvec4(0x97B9336Au,0x157B9DCu,0xE84E476Eu,0x61000049u));
    A(uvec4(0x38D0566Eu,0xC7DD6DD6u,0x43585265u,0x2729B4B5u));
    A(uvec4(0x4FFE3074u,0x6D36DBD6u,0xF72E375Du,0xD10274BFu));
    A(uvec4(0x401A3B56u,0x249BB19Au,0xD41B4451u,0x3F1D6669u));
    A(uvec4(0x2BA2404Du,0xE4EAC4B5u,0xE1B6424Cu,0xBB97894Fu));
    A(uvec4(0xB7D84550u,0x7C91EE11u,0xB0DC4554u,0xA6B96349u));
    A(uvec4(0x92494BC5u,0xF9589C4u,0xD268C572u,0x24924924u));
    A(uvec4(0x4912C6C3u,0x84925425u,0x4414C4C8u,0x4A4494C8u));
    A(uvec4(0x286DBCB7u,0x8138D295u,0x239BB6BDu,0xFA5A6BFAu));
    A(uvec4(0x335BBAB5u,0x71A083B6u,0x2010B5B9u,0x51452649u));
    A(uvec4(0x4D24B7BBu,0xD96C718Au,0x2018B3BAu,0x97DD6D72u));
    A(uvec4(0x36E3BBB6u,0xB106D24Au,0x6779B4BBu,0xB3E94E53u));
    A(uvec4(0xEC080B7u,0x40u,0xC24F5BB9u,0xA80F983Fu));
    A(uvec4(0xC3F6456Au,0xCD0F9A3Eu,0xF049405Bu,0x275FF627u));
    A(uvec4(0x18DC3DE1u,0x1397C953u,0xB24970E8u,0x6808C03Eu));
    A(uvec4(0xFE4F63BFu,0xCC0FF4FFu,0x5C155E71u,0x398B5476u));
    A(uvec4(0xD4154F77u,0xE7597D6Au,0x4B184C6Eu,0x3EC3EDDAu));
    A(uvec4(0x37504A5Fu,0xE773E6D6u,0x49184A5Cu,0xFC9B7FDAu));
    A(uvec4(0x50DD4D63u,0xB89F66ACu,0xE9B05162u,0x24EDAE69u));
    A(uvec4(0x23F42D5Eu,0x6D3682ADu,0xFB713454u,0xDA71AFFu));
    A(uvec4(0xF96D364Du,0xD583CD97u,0x30943646u,0x249F9E41u));
    A(uvec4(0xD0D43C49u,0xC490B70Eu,0x924947C1u,0x149849E4u));
    A(uvec4(0x402149C5u,0x0u,0xE57EC2C9u,0xBF594F77u));
    A(uvec4(0x4D22C5C9u,0x9A13A6DBu,0x3AD4C8C3u,0x31DB128Cu));
    A(uvec4(0x498CB8BCu,0x326922C7u,0xA0EBBCB7u,0x31BB5B51u));
    A(uvec4(0xC6DBBCB7u,0x4A44AC09u,0xCDA2B6BAu,0xC4CC4C90u));
    A(uvec4(0x20A3BBB6u,0xADC69D41u,0x1F89B5BCu,0x4A372EF7u));
    A(uvec4(0x4958BAB5u,0x96D36D2Du,0x4913BAB5u,0x12DB64A6u));
    A(uvec4(0x1C79B7BEu,0xED626B7u,0x4364ACC1u,0x41269B72u));
    A(uvec4(0xA3FD5ABDu,0x680D10FEu,0xF2494DF2u,0x140AE9Fu));
    A(uvec4(0x24A174F2u,0x0u,0x33ACCEF5u,0xB58D5AF6u));
    A(uvec4(0x43B6BADDu,0xF103A2FFu,0x3EB61CAu,0x492002ACu));
    A(uvec4(0xE24952C3u,0xA803EA27u,0x6B1B435Bu,0x270DB6D2u));
    A(uvec4(0x5B04454Cu,0x317F126Au,0xC52B424Fu,0xBCFFF4F8u));
    A(uvec4(0x60244053u,0xB74BCE9Bu,0x54804754u,0xC49AEE60u));
    A(uvec4(0x2002454Fu,0x39BCD469u,0x411A4453u,0xDB1269B2u));
    A(uvec4(0x9B694C3Du,0x9D49592u,0x3623B45u,0xDACC92AEu));
    A(uvec4(0xC67E3845u,0xAD0150Du,0xF0FF2CCFu,0xB70FF0Fu));
    A(uvec4(0x2DBCC4CBu,0x3FC3E83Fu,0xA2A1C6C3u,0x24A90A84u));
    A(uvec4(0x1264C6C3u,0x92149129u,0x4124C4C8u,0xA25A609u));
    A(uvec4(0x8949BBB6u,0x69D692ADu,0xDB65BCB7u,0x7586E336u));
    A(uvec4(0xD89DB6BDu,0xDB1DFFB6u,0xD894BAB5u,0x6C40C349u));
    A(uvec4(0x2353BAB5u,0x923AD82Du,0x410DBBB6u,0x72B0DB52u));
    A(uvec4(0xA913BAB5u,0x94CB6BB5u,0xF3AEB6BDu,0x12E5F5D6u));
    A(uvec4(0xF4F1B9C0u,0x8D449C12u,0x3B62C1BCu,0xB24A60A6u));
    A(uvec4(0x9BC9BFF8u,0xAF01F4Fu,0x4BA9EDF8u,0x40069B72u));
    A(uvec4(0x2680F9F4u,0x75A49241u,0x8398DEF7u,0x900D1031u));
    A(uvec4(0xB31BC9E5u,0xD58B23D1u,0xBDB5AFD1u,0xF503E2FEu));
    A(uvec4(0xFA2EB3C2u,0x24924FFBu,0x3EA3EB1u,0x400ACu));
    A(uvec4(0xF24945A8u,0xAD03EB24u,0xFB494151u,0xDF0DCFD7u));
    A(uvec4(0xB50B444Bu,0x9274F610u,0xAB63454Cu,0x9E3958AEu));
    A(uvec4(0x42634550u,0x8C396D27u,0xA74D434Au,0xFFB273FAu));
    A(uvec4(0xA8E23C43u,0xA8DF096u,0xA2683A41u,0x910CDB91u));
    A(uvec4(0xF7493950u,0x136B3674u,0xF4A942DEu,0x49449649u));
    A(uvec4(0x3B03C8C3u,0x6998D58Cu,0x9248C6C7u,0x24900100u));
    A(uvec4(0xED8CC4C8u,0x9B453690u,0x512C9C6u,0x5100900Au));
    A(uvec4(0xD929BCB7u,0x4246E1A4u,0x571BBDB8u,0xDA52u));
    A(uvec4(0x63A6B8BCu,0x3B139626u,0xA6D3BBB6u,0x61B69B75u));
    A(uvec4(0x30A2B4BBu,0x97EBB54Du,0xD6E9BBB6u,0xB5A88271u));
    A(uvec4(0xDDB5B6BDu,0xBBD4FD94u,0x3264BBB6u,0x4DB0D495u));
    A(uvec4(0x642BB6BDu,0x17614993u,0xF4ADBBC2u,0x9B09C0Du));
    A(uvec4(0x9149C2EEu,0x249249C4u,0x3000C1F6u,0xF901F00u));
    A(uvec4(0x2002DEF8u,0x2D269200u,0x4809BF8u,0x3F53EBACu));
    A(uvec4(0xC6D07DD9u,0x3F63FFD6u,0xC40070CBu,0x249BBF49u));
    A(uvec4(0x249275C4u,0xBC949C49u,0x3274ABBBu,0x407B1A36u));
    A(uvec4(0xC27D9DB6u,0x6D091BDAu,0x23AC51BFu,0x1201269u));
    A(uvec4(0x52494AE1u,0x4928DA3Fu,0x92494CD0u,0x8D03F524u));
    A(uvec4(0xF3FE4477u,0xFA0FFF3Fu,0xFEB4148u,0xE6AFD2DBu));
    A(uvec4(0x294C3C46u,0xD62958B6u,0xE3B14047u,0xB2F563BEu));
    A(uvec4(0x9C4942C6u,0x1495C984u,0x8711BECBu,0x6DA8D871u));
    A(uvec4(0x3493C9C4u,0x40409549u,0x4DB1C4C8u,0x4A6509D3u));
    A(uvec4(0xD69CC9C4u,0x41B0144Du,0x492CC8C3u,0xA6476C8Au));
    A(uvec4(0x23A4B8BCu,0x53484CC7u,0x19BFB6BDu,0x922CEEDBu));
    A(uvec4(0x3093BCB7u,0xA30AD01u,0xD764BAB5u,0x31B72515u));
    A(uvec4(0x1DFFB5BCu,0x61B8E7FEu,0x34D8BCB7u,0x6DB6D8A9u));
    A(uvec4(0x29A4B6BAu,0xC020200Au,0xEBB1B9C0u,0x177B66B5u));
    A(uvec4(0xD979BAC1u,0xDB72649u,0x7B6EBFC6u,0x18E9B692u));
    A(uvec4(0x58DBC3BEu,0xA6DB4B8Au,0xF17FB9E2u,0xFFFFFFDFu));
    A(uvec4(0x4D00C6F4u,0x92FB71DAu,0xB3ECACDEu,0x490B1u));
    A(uvec4(0x43F695D8u,0x68091AD6u,0xD27F7FC4u,0x8D0B1BDAu));
    A(uvec4(0x424F73A1u,0x8D0B1BFBu,0x90A976BEu,0xFFEFFF7Cu));
    A(uvec4(0x26DA86C2u,0xB140569u,0x7571B0C5u,0xA452D13u));
    A(uvec4(0xE977C5DBu,0xA64E672u,0x5249D7E1u,0x4034146Eu));
    A(uvec4(0x23A389E4u,0x49u,0xA27E46E3u,0x400D1u));
    A(uvec4(0xE24945DCu,0x400D5A27u,0x924947A5u,0xBA827E24u));
    A(uvec4(0x10C943C8u,0x401F0Bu,0xB6C2CAC5u,0xE54DD6Du));
    A(uvec4(0x1321C7C4u,0x3148A192u,0x2110C8C5u,0x49201412u));
    A(uvec4(0x20D8C9C4u,0x91B72A12u,0x484CC7C4u,0x84C44C52u));
    A(uvec4(0xB763BEB9u,0x41269885u,0x65B4B9BDu,0xDA62493Bu));
    A(uvec4(0x4A4BAB7u,0x40248091u,0x880BAB7u,0x89480048u));
    A(uvec4(0xCB13B5BCu,0xBFB3B535u,0xB923BAB5u,0x31296D96u));
    A(uvec4(0xC364B5BCu,0x12C0A6D1u,0x9531B9C0u,0x68461D8Fu));
    A(uvec4(0x50D0BAC1u,0xF9CA9569u,0xA360C3BEu,0x2D88DA71u));
    A(uvec4(0x5AE1C2BDu,0x216EC42u,0x9A4FBDD2u,0xFF17F7Cu));
    A(uvec4(0x60A7CDE4u,0x3F652E4Au,0x490D2E3u,0x3B100000u));
    A(uvec4(0x35ACFE0u,0xD6EAC0CCu,0xA3A3AFD4u,0xB12D10F5u));
    A(uvec4(0x33F498B9u,0x918B1AD6u,0xC27E8AA7u,0xB18D1AFAu));
    A(uvec4(0xF18983B4u,0xDB5FFFC4u,0x40928CCAu,0xE490A101u));
    A(uvec4(0x20939EDBu,0x9B901209u,0x2002C9DFu,0xF100000u));
    A(uvec4(0x7DFFDFE6u,0xE1DAE3Fu,0xF24FE1E8u,0x402726B6u));
    A(uvec4(0xC24DDDE8u,0x26DBB2u,0xDCBB6DAu,0x920B60B6u));
    A(uvec4(0xA698CBC6u,0xDD49C6Du,0x34E3CAC5u,0x12B08001u));
    A(uvec4(0x5B29C8C3u,0xB6CAEDAAu,0x512C4C8u,0x920D1249u));
    A(uvec4(0x6094C4C8u,0x9601601u,0x4112C9C6u,0xA448408u));
    A(uvec4(0x90EDBDB8u,0x4E56E972u,0x2904B8BCu,0x10D20D0u));
    A(uvec4(0x58EDB9B4u,0x6D161D92u,0x4492B5B9u,0x4949340Au));
    A(uvec4(0x56D9BAB5u,0xB2D92C4Eu,0x9A84BAB5u,0x69C89D32u));
    A(uvec4(0xB480B1BCu,0x3F5D6C6Du,0x5402B3BCu,0x9897776Au));
    A(uvec4(0x4265BBB6u,0xB1B0EC72u,0x6094B8BFu,0xBAE3B152u));
    A(uvec4(0xBB00B9C0u,0xBCEBAEF5u,0x7737B8D8u,0xC974F97u));
    A(uvec4(0xAD099CFu,0xF50398F5u,0x540081A8u,0xDEC27E3Fu));
    A(uvec4(0x909C80BBu,0xDFFDC9BBu,0x740299BAu,0xFF9FF9B7u));
    A(uvec4(0x4B109EB4u,0xE49DF9D6u,0x3A09AA6u,0x364F623Au));
    A(uvec4(0xAF10909Au,0x4806E2D1u,0xB3BD8B98u,0xB10B62DAu));
    A(uvec4(0xADCE7B93u,0xC80390E6u,0x70EE7FA4u,0xBB1BB7DBu));
    A(uvec4(0xF09C80C8u,0xFFE3FE27u,0xE0025DE7u,0xFFE27F72u));
    A(uvec4(0x200060E6u,0xBBF77101u,0x8DA8BDDEu,0xDB1DACDAu));
    A(uvec4(0x4892C4C8u,0xD12D0051u,0x6D14C5C9u,0x5B1DA63Au));
    A(uvec4(0x86DACAC5u,0x2DB8DB91u,0xC4DCCAC5u,0xD56A34Du));
    A(uvec4(0x4531C5C9u,0x8A13A69Bu,0xC44CC9C4u,0x74C54B44u));
    A(uvec4(0x54A5BDB8u,0x4D348569u,0x291AB5BCu,0x2763EBFAu));
    A(uvec4(0xCA4DB8B3u,0x2D4ADBB6u,0x2412B9B6u,0x52450041u));
    A(uvec4(0x369DBAB5u,0x41269292u,0x2494B4B8u,0xC7684CC7u));
    A(uvec4(0x3E2B0B7u,0x958D1AFEu,0xB60B7B2u,0xAC00986Eu));
    A(uvec4(0xF0A4B3BAu,0xF496E741u,0xE56CB5BCu,0xDB1BB6BBu));
    A(uvec4(0x4008AB9u,0x280A0060u,0xD0A46DDAu,0xE4F5360Au));
    A(uvec4(0x48088D9u,0x27900000u,0xFA38FDEu,0x9C949289u));
    A(uvec4(0xC24995C3u,0x8D0B10FAu,0x797199A9u,0x6D86E372u));
    A(uvec4(0xEE79A2A9u,0xAC4CC4D2u,0xCF6A9BA2u,0x8A0AEBCEu));
    A(uvec4(0xCAE2969Du,0x398D9B2Eu,0x23939299u,0xCE4C9BC8u));
    A(uvec4(0x331A8996u,0x4DA09B69u,0xC5398092u,0xD10BE07Bu));
    A(uvec4(0x9CE38B92u,0x945B66F7u,0xF84981CBu,0x17F5BF5Cu));
    A(uvec4(0x96D0CFC0u,0xB69A69A4u,0x43AFC6CDu,0xA83B1BD6u));
    A(uvec4(0xC92C4C8u,0x402490C8u,0x6136C4C8u,0xC8089401u));
    A(uvec4(0x65A4C6CAu,0x331336D3u,0x404C9C6u,0x89049008u));
    A(uvec4(0x6024C4C8u,0x4928940Au,0x2412C5C9u,0x484416C0u));
    A(uvec4(0x986DB9B4u,0xAA10E50Eu,0x8B52B1B8u,0x35226B3Du));
    A(uvec4(0xB949B6B1u,0x1B01291u,0x6292B3B7u,0x3098A132u));
    A(uvec4(0x1201B4B5u,0x4920124u,0x28ACB8B3u,0x40260041u));
    A(uvec4(0x3429B6B1u,0x4944944Eu,0xC31BB5B0u,0x7284A292u));
    A(uvec4(0x5814B0B7u,0xE7E3FED2u,0x60E4AFB7u,0x27E3FE93u));
    A(uvec4(0x2F1278C0u,0xD0235235u,0x98F57195u,0x36BCDE82u));
    A(uvec4(0x5B2D529Eu,0x9CF0F70Au,0x2FF552ADu,0x3A3B10D6u));
    A(uvec4(0xE0034990u,0xB79B6CDFu,0x7012569Fu,0xDB527E97u));
    A(uvec4(0xC40067A4u,0xBB79716Du,0x168398A4u,0xD69A9988u));
    A(uvec4(0x4368979Eu,0xDFE3EEFEu,0x992D9792u,0x96D8AC76u));
    A(uvec4(0x89708F96u,0x3EC9B276u,0x2D08793u,0x8DC898C0u));
    A(uvec4(0x7003878Fu,0x51F72161u,0x2312C87Eu,0x31231231u));
    A(uvec4(0x46C2C5CCu,0xBFD0E372u,0xC66CCCC7u,0x124AC8Du));
    A(uvec4(0xC724C9C4u,0x52512952u,0xC3B2C5C9u,0x326331D8u));
    A(uvec4(0x4414C4C8u,0x52402602u,0x9249C7C8u,0x24024824u));
    A(uvec4(0x44A4C4C8u,0x41241243u,0x2994C5C9u,0x41402452u));
    A(uvec4(0x2A75B5BCu,0xBBF82DF2u,0x5350B2B9u,0xF2EFB73Eu));
    A(uvec4(0x3603B5B0u,0x8A58D360u,0x28B4B1B5u,0x124904Au));
    A(uvec4(0x2923B0B7u,0xCC2F90D5u,0xB8C2B6B1u,0x4DB66C95u));
    A(uvec4(0x48E5B4AFu,0x86D1256Eu,0x456CB3AEu,0x264A5C66u));
    A(uvec4(0x680B5B0u,0x8DAB5A8Du,0xF24FB0C1u,0x1377BFA4u));
    A(uvec4(0xD3A5A8D6u,0x9309C8Du,0xC24D64D1u,0xD50D62FFu));
    A(uvec4(0x2BE04073u,0x26AFDADEu,0x33D83D5Eu,0xB77DAC3Fu));
    A(uvec4(0x9BB9426Eu,0xAE9B9BBu,0x998F5478u,0x2DFEFCu));
    A(uvec4(0x996E59A0u,0x1B52E77u,0x5DA196A3u,0xAD0CC2EDu));
    A(uvec4(0xBB18939Au,0xBAC97D31u,0x79128E95u,0xAC07209Fu));
    A(uvec4(0x2BAC8C93u,0x9B3A78D6u,0x4A48990u,0xBAA9DB91u));
    A(uvec4(0x190F8A92u,0x390B773u,0x97498CD9u,0x74974974u));
    A(uvec4(0xB4E4C1C8u,0x9376A409u,0x4524C6CAu,0xD11DB1DAu));
    A(uvec4(0xC761C8C3u,0x92C0AC4Du,0x2922C8C5u,0x120104Au));
    A(uvec4(0x4924C8C5u,0x51226426u,0x1849C8C5u,0x9215244Au));
    A(uvec4(0xC6C7u,0x4804124u,0x6D14C6CAu,0x24EC49D2u));
    A(uvec4(0xEFBDB6BDu,0x372BFFDEu,0x88DCB1B8u,0xBF5CDB71u));
    A(uvec4(0xCF23B0B7u,0x89381DCDu,0x5414B0B7u,0x96D9774Eu));
    A(uvec4(0xD86DB6B1u,0x72931431u,0x466CB0B7u,0x52D12C56u));
    A(uvec4(0x96E1B7B2u,0xB094C974u,0xC76FB0B7u,0x9391C71u));
    A(uvec4(0x5E76B4BBu,0x576DFEBBu,0x7789B5D1u,0x140A653u));
    A(uvec4(0xC929CDD9u,0x800E02ADu,0x230077DBu,0x8D2D633Au));
    A(uvec4(0xD27E3FA2u,0xAC0F123Eu,0x9DB93C69u,0xA57369Bu));
    A(uvec4(0xF97956ACu,0xEE0EF4Eu,0x4FF996C1u,0x49348392u));
    A(uvec4(0x2D29A3B8u,0xB10D10ACu,0xB3B49CA9u,0x2C0ED2D6u));
    A(uvec4(0xB3BC939Eu,0x9108DAF5u,0xB0829893u,0x4DD8844Du));
    A(uvec4(0xA3B58D94u,0x9508C2D5u,0x4C768A91u,0x81AED0DAu));
    A(uvec4(0x50248291u,0x54D4EE4Au,0x90F98DC2u,0xF90C90Fu));
    A(uvec4(0xB00C6C1u,0x8936DA68u,0x224CC8C3u,0x363B6BB6u));
    A(uvec4(0x45A4C4C8u,0x4920A649u,0xE274C5C9u,0x5249B498u));
    A(uvec4(0x40E2C9C4u,0xB61AC48Au,0x40A6C4C8u,0x40280001u));
    A(uvec4(0x9AE1C9C4u,0x76D6A9ACu,0x501CCAC5u,0x8C08D269u));
    A(uvec4(0xC60B4BBu,0xBA3FA026u,0x5E4FB2B9u,0x3F53433Au));
    A(uvec4(0xBA49B6B1u,0xB106DAADu,0xC963B7B2u,0xB6CA6231u));
    A(uvec4(0x43E3B1B8u,0x8C3CDCF7u,0xDDA9B2B9u,0x536977DAu));
    A(uvec4(0xA01CB8B3u,0x7218ED49u,0x3AE3B8B3u,0xA4C914B2u));
    A(uvec4(0xFBFFB3D6u,0x13F5797Bu,0x6B71CDDAu,0x24936Eu));
    A(uvec4(0x9AE1D7DEu,0x69249541u,0x2363C4E3u,0xCC0A80CDu));
    A(uvec4(0x83A28CC4u,0x49048091u,0x3DCF65C3u,0x6908DA92u));
    A(uvec4(0xE5497EB5u,0xAD0ED13u,0x43B1B8C1u,0x4040DCB6u));
    A(uvec4(0x2274AFBEu,0xF58F983Eu,0x35AA2AEu,0xD18F58D4u));
    A(uvec4(0xA36B99A5u,0xD60BA2F5u,0xA3A3919Bu,0x3A0F10D9u));
    A(uvec4(0x28108F93u,0xC94894C0u,0x4E6D8D94u,0xB1AFE3E7u));
    A(uvec4(0x4E2688Eu,0x46086096u,0x753678CCu,0xB76B6E77u));
    A(uvec4(0x20009CC4u,0xB109D09u,0x4525C2C9u,0xFB9DC97Au));
    A(uvec4(0xD26DC8C3u,0x92A94C36u,0xCB64C9C4u,0x70954D96u));
    A(uvec4(0x372DCAC5u,0x68241A6Eu,0x4000CAC7u,0xA291449u));
    A(uvec4(0x880C4C8u,0x800410C0u,0xB4E4C9C4u,0x70C6EB0Au));
    A(uvec4(0x3BA4B5BCu,0xD2DF023Au,0xBF60AFB6u,0xF58ADACDu));
    A(uvec4(0x331BB2ADu,0x800B2436u,0x152FB1B8u,0xEFB296Au));
    A(uvec4(0xE274B5B9u,0xD3453658u,0x4880B8B5u,0x48241241u));
    A(uvec4(0x63B6B5BCu,0xD26614DAu,0x2418BBB6u,0xB6B31BADu));
    A(uvec4(0x9539B9DDu,0xA90B10Fu,0x5779D9E0u,0x9B51B4Eu));
    A(uvec4(0xB013E1DCu,0x86D9654Du,0x2312C5E5u,0x30231235u));
    A(uvec4(0xD60A9BBu,0x3583583Au,0x4A009DB0u,0x9B924F6u));
    A(uvec4(0x17799FC8u,0xA54EE53u,0xD249C0CBu,0x26D3D2u));
    A(uvec4(0x43F6B4CBu,0x6908D2D6u,0x43CEABC0u,0x910D9A3Fu));
    A(uvec4(0xC3F49DB1u,0xF10F5AFAu,0x327394A0u,0x3523903Au));
    A(uvec4(0x87229590u,0xAC241271u,0x456C948Fu,0x6C250052u));
    A(uvec4(0x26626E98u,0x88290279u,0x54E473A1u,0xF14E66Eu));
    A(uvec4(0xF1368EC1u,0x3F6E4F9Fu,0x20009CC5u,0x2100501u));
    A(uvec4(0xB10C8C3u,0x91285AB1u,0x2D80C5C9u,0x9A488250u));
    A(uvec4(0x498EC5C9u,0x2729B493u,0x9509C8C5u,0x44A84984u));
    A(uvec4(0xC4A4C9C4u,0x49D01D09u,0xB84CC9C4u,0x8E392294u));
    A(uvec4(0xC3E4B5BCu,0xA091239u,0x4124B6B1u,0x6D10D462u));
    A(uvec4(0x34E9AEB5u,0x11B51B52u,0xCB5CB8B3u,0x96450D75u));
    A(uvec4(0xC76DB8B3u,0x31CB14B4u,0x956DB7B2u,0xA4992974u));
    A(uvec4(0xE16EB3BAu,0x3ECBFD87u,0xC4D2B3BAu,0xB4F72E0Du));
    A(uvec4(0x90A9B7DCu,0x9296A94Au,0x3000C1DCu,0x3B627E6Eu));
    A(uvec4(0xB002B8E0u,0x9B94E609u,0x2302C8E4u,0xEC3EC22Cu));
    A(uvec4(0x8268ACBCu,0x27027026u,0x9D71ADB9u,0x109539B6u));
    A(uvec4(0xE0F1B2CCu,0x1D0A60Eu,0xFD79CAD6u,0x1D02692u));
    A(uvec4(0x33B5C7D6u,0x6D0923D6u,0xA3A4B8CCu,0x910B5AD9u));
    A(uvec4(0x33A3A4BFu,0xD58D5AF6u,0x33EE98A6u,0xCD8B60FEu));
    A(uvec4(0x40029B93u,0x9498E96Du,0x3BA38D94u,0x7BA1300Du));
    A(uvec4(0x22D28099u,0x1201288u,0xE7895F9Bu,0x918DFB24u));
    A(uvec4(0x901355A1u,0xE4EA4F53u,0xE0B78AC8u,0x8795BF13u));
    A(uvec4(0x58D4C8C3u,0x4908DC8Du,0x2014C4C8u,0xD1488249u));
    A(uvec4(0xE3B2C5C9u,0x9B4D3138u,0xA962CAC5u,0x4824926Du));
    A(uvec4(0x2DB2C5C9u,0xD34C4C87u,0x2104C4C8u,0x89689451u));
    //-----------------------------------------------------------
	C = col;
    
}
