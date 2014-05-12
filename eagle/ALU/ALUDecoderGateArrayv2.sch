<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="6" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="yes" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="c035u">
<packages>
<package name="3PIN">
<pad name="P$1" x="-2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$2" x="2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$3" x="0" y="-2.54" drill="0.8" shape="square"/>
</package>
<package name="5PIN">
<pad name="P$1" x="0" y="0" drill="0.8" shape="square"/>
<pad name="P$2" x="2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$3" x="2.54" y="-2.54" drill="0.8" shape="square"/>
<pad name="P$4" x="0" y="-2.54" drill="0.8" shape="square"/>
<pad name="P$5" x="1.27" y="-1.27" drill="0.8" shape="square"/>
</package>
</packages>
<symbols>
<symbol name="INV">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="I" x="-10.16" y="0" visible="off" length="middle" direction="in"/>
<pin name="O" x="10.16" y="0" visible="off" length="middle" direction="oc" function="dot" rot="R180"/>
</symbol>
<symbol name="NOR2">
<wire x1="-1.27" y1="5.08" x2="-7.62" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-6.096" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-2.54" x2="-6.096" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.2446" y1="-5.0678" x2="7.5439" y2="0.0507" width="0.4064" layer="94" curve="60.147106" cap="flat"/>
<wire x1="-1.2446" y1="5.0678" x2="7.5442" y2="-0.0505" width="0.4064" layer="94" curve="-60.148802" cap="flat"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94" curve="-90"/>
<text x="-7.62" y="5.715" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="O" x="12.7" y="0" visible="off" length="middle" direction="out" function="dot" rot="R180"/>
<pin name="I0" x="-12.7" y="2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-12.7" y="-2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
</symbol>
<symbol name="NOR3">
<wire x1="-1.27" y1="5.08" x2="-7.62" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-6.096" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-2.54" x2="-6.096" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.2446" y1="-5.0678" x2="7.5439" y2="0.0507" width="0.4064" layer="94" curve="60.147106" cap="flat"/>
<wire x1="-1.2446" y1="5.0678" x2="7.5442" y2="-0.0505" width="0.4064" layer="94" curve="-60.148802" cap="flat"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94" curve="-90"/>
<text x="-7.62" y="5.715" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="O" x="12.7" y="0" visible="off" length="middle" direction="out" function="dot" rot="R180"/>
<pin name="I0" x="-12.7" y="2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-12.7" y="-2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I2" x="-12.7" y="0" visible="off" length="middle" direction="in" swaplevel="1"/>
<wire x1="-7.62" y1="0" x2="-5.588" y2="0" width="0.1524" layer="94"/>
</symbol>
<symbol name="NAND2">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94" curve="-180"/>
<text x="2.54" y="3.175" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="A" x="-15.24" y="2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-15.24" y="-2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="O" x="7.62" y="0" visible="off" length="middle" direction="out" function="dot" rot="R180"/>
<wire x1="-2.54" y1="5.08" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
</symbol>
<symbol name="AND2">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94" curve="-180"/>
<text x="2.54" y="3.175" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="A" x="-15.24" y="2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-15.24" y="-2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="O" x="7.62" y="0" visible="off" length="middle" direction="out" rot="R180"/>
<wire x1="-2.54" y1="5.08" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="INV" prefix="INV_">
<gates>
<gate name="G$1" symbol="INV" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3PIN">
<connects>
<connect gate="G$1" pin="I" pad="P$1"/>
<connect gate="G$1" pin="O" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NOR2" prefix="NOR2_">
<gates>
<gate name="G$1" symbol="NOR2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3PIN">
<connects>
<connect gate="G$1" pin="I0" pad="P$1"/>
<connect gate="G$1" pin="I1" pad="P$2"/>
<connect gate="G$1" pin="O" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NOR3" prefix="NOR3_">
<gates>
<gate name="G$1" symbol="NOR3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="5PIN">
<connects>
<connect gate="G$1" pin="I0" pad="P$1"/>
<connect gate="G$1" pin="I1" pad="P$2"/>
<connect gate="G$1" pin="I2" pad="P$3"/>
<connect gate="G$1" pin="O" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NAND2" prefix="NAND2_">
<gates>
<gate name="G$1" symbol="NAND2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3PIN">
<connects>
<connect gate="G$1" pin="A" pad="P$1"/>
<connect gate="G$1" pin="I1" pad="P$2"/>
<connect gate="G$1" pin="O" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="AND2" prefix="AND2_">
<gates>
<gate name="G$1" symbol="AND2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3PIN">
<connects>
<connect gate="G$1" pin="A" pad="P$1"/>
<connect gate="G$1" pin="I1" pad="P$2"/>
<connect gate="G$1" pin="O" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="INV_1" library="c035u" deviceset="INV" device=""/>
<part name="INV_2" library="c035u" deviceset="INV" device=""/>
<part name="INV_3" library="c035u" deviceset="INV" device=""/>
<part name="INV_4" library="c035u" deviceset="INV" device=""/>
<part name="NOR2_1" library="c035u" deviceset="NOR2" device=""/>
<part name="NOR2_2" library="c035u" deviceset="NOR2" device=""/>
<part name="NOR3_1" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_2" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_3" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_4" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_5" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_6" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_7" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_8" library="c035u" deviceset="NOR3" device=""/>
<part name="NAND2_1" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_2" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_3" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_4" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_5" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_6" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_7" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_8" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_9" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_10" library="c035u" deviceset="NAND2" device=""/>
<part name="AND2_1" library="c035u" deviceset="AND2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="43.18" y="106.68" size="1.27" layer="91" rot="MR0">OpCode[4]</text>
<text x="43.18" y="91.44" size="1.27" layer="91" rot="MR0">OpCode[3]</text>
<text x="43.18" y="76.2" size="1.27" layer="91" rot="MR0">OpCode[2]</text>
<text x="43.18" y="60.96" size="1.27" layer="91" rot="MR0">OpCode[1]</text>
<text x="43.18" y="45.72" size="1.27" layer="91" rot="MR0">OpCode[0]</text>
<text x="78.74" y="-17.78" size="1.27" layer="91" rot="MR180">ZeroA</text>
<text x="66.04" y="-15.24" size="1.27" layer="91" rot="MR180">ShSign</text>
<text x="93.98" y="-17.78" size="1.27" layer="91" rot="MR180">AND</text>
<text x="106.68" y="-17.78" size="1.27" layer="91" rot="MR180">OR</text>
<text x="119.38" y="-17.78" size="1.27" layer="91" rot="MR180">NOT</text>
<text x="132.08" y="-17.78" size="1.27" layer="91" rot="MR180">XOR</text>
<text x="170.18" y="-17.78" size="1.27" layer="91" rot="MR180">NAND</text>
<text x="182.88" y="-17.78" size="1.27" layer="91" rot="MR180">NOR</text>
<text x="157.48" y="-17.78" size="1.27" layer="91" rot="MR180">LLI</text>
<text x="144.78" y="-17.78" size="1.27" layer="91" rot="MR180">ShB</text>
<text x="48.26" y="10.16" size="1.27" layer="91" rot="MR0">ASign</text>
<text x="50.8" y="-17.78" size="1.27" layer="91" rot="MR180">ShInBit</text>
</plain>
<instances>
<instance part="INV_1" gate="G$1" x="55.88" y="99.06"/>
<instance part="INV_2" gate="G$1" x="55.88" y="83.82"/>
<instance part="INV_3" gate="G$1" x="55.88" y="68.58"/>
<instance part="INV_4" gate="G$1" x="55.88" y="53.34"/>
<instance part="NOR2_1" gate="G$1" x="71.12" y="30.48" rot="R270"/>
<instance part="NOR2_2" gate="G$1" x="83.82" y="30.48" rot="R270"/>
<instance part="NOR3_1" gate="G$1" x="96.52" y="30.48" rot="R270"/>
<instance part="NOR3_2" gate="G$1" x="109.22" y="30.48" rot="R270"/>
<instance part="NOR3_3" gate="G$1" x="121.92" y="30.48" rot="R270"/>
<instance part="NOR3_4" gate="G$1" x="134.62" y="30.48" rot="R270"/>
<instance part="NOR3_5" gate="G$1" x="147.32" y="30.48" rot="R270"/>
<instance part="NOR3_6" gate="G$1" x="160.02" y="30.48" rot="R270"/>
<instance part="NOR3_7" gate="G$1" x="172.72" y="30.48" rot="R270"/>
<instance part="NOR3_8" gate="G$1" x="185.42" y="30.48" rot="R270"/>
<instance part="NAND2_1" gate="G$1" x="66.04" y="-7.62" rot="R270"/>
<instance part="NAND2_2" gate="G$1" x="78.74" y="-7.62" rot="R270"/>
<instance part="NAND2_3" gate="G$1" x="93.98" y="-7.62" rot="R270"/>
<instance part="NAND2_4" gate="G$1" x="106.68" y="-7.62" rot="R270"/>
<instance part="NAND2_5" gate="G$1" x="119.38" y="-7.62" rot="R270"/>
<instance part="NAND2_6" gate="G$1" x="132.08" y="-7.62" rot="R270"/>
<instance part="NAND2_7" gate="G$1" x="144.78" y="-7.62" rot="R270"/>
<instance part="NAND2_8" gate="G$1" x="157.48" y="-7.62" rot="R270"/>
<instance part="NAND2_9" gate="G$1" x="170.18" y="-7.62" rot="R270"/>
<instance part="NAND2_10" gate="G$1" x="182.88" y="-7.62" rot="R270"/>
<instance part="AND2_1" gate="G$1" x="50.8" y="-7.62" rot="R270"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="43.18" y1="106.68" x2="68.58" y2="106.68" width="0.1524" layer="91"/>
<wire x1="68.58" y1="106.68" x2="81.28" y2="106.68" width="0.1524" layer="91"/>
<wire x1="68.58" y1="43.18" x2="68.58" y2="106.68" width="0.1524" layer="91"/>
<wire x1="81.28" y1="43.18" x2="81.28" y2="106.68" width="0.1524" layer="91"/>
<pinref part="NOR2_1" gate="G$1" pin="I1"/>
<pinref part="NOR2_2" gate="G$1" pin="I1"/>
<junction x="68.58" y="106.68"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="66.04" y1="99.06" x2="73.66" y2="99.06" width="0.1524" layer="91"/>
<wire x1="73.66" y1="43.18" x2="73.66" y2="99.06" width="0.1524" layer="91"/>
<pinref part="INV_1" gate="G$1" pin="O"/>
<pinref part="NOR2_1" gate="G$1" pin="I0"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="45.72" y1="91.44" x2="86.36" y2="91.44" width="0.1524" layer="91"/>
<wire x1="45.72" y1="91.44" x2="45.72" y2="99.06" width="0.1524" layer="91"/>
<wire x1="86.36" y1="43.18" x2="86.36" y2="91.44" width="0.1524" layer="91"/>
<wire x1="45.72" y1="91.44" x2="43.18" y2="91.44" width="0.1524" layer="91"/>
<pinref part="NOR2_2" gate="G$1" pin="I0"/>
<junction x="45.72" y="91.44"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="43.18" y1="76.2" x2="45.72" y2="76.2" width="0.1524" layer="91"/>
<wire x1="45.72" y1="76.2" x2="144.78" y2="76.2" width="0.1524" layer="91"/>
<wire x1="144.78" y1="76.2" x2="157.48" y2="76.2" width="0.1524" layer="91"/>
<wire x1="157.48" y1="76.2" x2="170.18" y2="76.2" width="0.1524" layer="91"/>
<wire x1="170.18" y1="76.2" x2="182.88" y2="76.2" width="0.1524" layer="91"/>
<wire x1="144.78" y1="43.18" x2="144.78" y2="76.2" width="0.1524" layer="91"/>
<wire x1="157.48" y1="43.18" x2="157.48" y2="76.2" width="0.1524" layer="91"/>
<wire x1="170.18" y1="43.18" x2="170.18" y2="76.2" width="0.1524" layer="91"/>
<wire x1="182.88" y1="43.18" x2="182.88" y2="76.2" width="0.1524" layer="91"/>
<pinref part="INV_2" gate="G$1" pin="I"/>
<wire x1="45.72" y1="83.82" x2="45.72" y2="76.2" width="0.1524" layer="91"/>
<pinref part="NOR3_5" gate="G$1" pin="I1"/>
<pinref part="NOR3_6" gate="G$1" pin="I1"/>
<pinref part="NOR3_7" gate="G$1" pin="I1"/>
<pinref part="NOR3_8" gate="G$1" pin="I1"/>
<junction x="45.72" y="76.2"/>
<junction x="170.18" y="76.2"/>
<junction x="157.48" y="76.2"/>
<junction x="144.78" y="76.2"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="93.98" y1="83.82" x2="106.68" y2="83.82" width="0.1524" layer="91"/>
<wire x1="106.68" y1="83.82" x2="119.38" y2="83.82" width="0.1524" layer="91"/>
<wire x1="119.38" y1="83.82" x2="132.08" y2="83.82" width="0.1524" layer="91"/>
<wire x1="93.98" y1="43.18" x2="93.98" y2="83.82" width="0.1524" layer="91"/>
<wire x1="106.68" y1="43.18" x2="106.68" y2="83.82" width="0.1524" layer="91"/>
<wire x1="119.38" y1="43.18" x2="119.38" y2="83.82" width="0.1524" layer="91"/>
<wire x1="132.08" y1="43.18" x2="132.08" y2="83.82" width="0.1524" layer="91"/>
<pinref part="INV_2" gate="G$1" pin="O"/>
<wire x1="93.98" y1="83.82" x2="66.04" y2="83.82" width="0.1524" layer="91"/>
<pinref part="NOR3_1" gate="G$1" pin="I1"/>
<pinref part="NOR3_2" gate="G$1" pin="I1"/>
<pinref part="NOR3_3" gate="G$1" pin="I1"/>
<pinref part="NOR3_4" gate="G$1" pin="I1"/>
<junction x="93.98" y="83.82"/>
<junction x="106.68" y="83.82"/>
<junction x="119.38" y="83.82"/>
<junction x="132.08" y="83.82"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="96.52" y1="68.58" x2="109.22" y2="68.58" width="0.1524" layer="91"/>
<wire x1="109.22" y1="68.58" x2="147.32" y2="68.58" width="0.1524" layer="91"/>
<wire x1="147.32" y1="68.58" x2="160.02" y2="68.58" width="0.1524" layer="91"/>
<wire x1="96.52" y1="43.18" x2="96.52" y2="68.58" width="0.1524" layer="91"/>
<wire x1="109.22" y1="43.18" x2="109.22" y2="68.58" width="0.1524" layer="91"/>
<wire x1="147.32" y1="43.18" x2="147.32" y2="68.58" width="0.1524" layer="91"/>
<wire x1="160.02" y1="43.18" x2="160.02" y2="68.58" width="0.1524" layer="91"/>
<pinref part="INV_3" gate="G$1" pin="O"/>
<wire x1="66.04" y1="68.58" x2="96.52" y2="68.58" width="0.1524" layer="91"/>
<pinref part="NOR3_1" gate="G$1" pin="I2"/>
<pinref part="NOR3_2" gate="G$1" pin="I2"/>
<pinref part="NOR3_5" gate="G$1" pin="I2"/>
<pinref part="NOR3_6" gate="G$1" pin="I2"/>
<junction x="96.52" y="68.58"/>
<junction x="109.22" y="68.58"/>
<junction x="147.32" y="68.58"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="99.06" y1="53.34" x2="124.46" y2="53.34" width="0.1524" layer="91"/>
<wire x1="124.46" y1="53.34" x2="149.86" y2="53.34" width="0.1524" layer="91"/>
<wire x1="149.86" y1="53.34" x2="175.26" y2="53.34" width="0.1524" layer="91"/>
<wire x1="99.06" y1="43.18" x2="99.06" y2="53.34" width="0.1524" layer="91"/>
<wire x1="124.46" y1="43.18" x2="124.46" y2="53.34" width="0.1524" layer="91"/>
<wire x1="149.86" y1="43.18" x2="149.86" y2="53.34" width="0.1524" layer="91"/>
<wire x1="175.26" y1="43.18" x2="175.26" y2="53.34" width="0.1524" layer="91"/>
<pinref part="INV_4" gate="G$1" pin="O"/>
<wire x1="99.06" y1="53.34" x2="66.04" y2="53.34" width="0.1524" layer="91"/>
<pinref part="NOR3_1" gate="G$1" pin="I0"/>
<pinref part="NOR3_3" gate="G$1" pin="I0"/>
<pinref part="NOR3_5" gate="G$1" pin="I0"/>
<pinref part="NOR3_7" gate="G$1" pin="I0"/>
<junction x="99.06" y="53.34"/>
<junction x="124.46" y="53.34"/>
<junction x="149.86" y="53.34"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="43.18" y1="45.72" x2="45.72" y2="45.72" width="0.1524" layer="91"/>
<wire x1="45.72" y1="45.72" x2="111.76" y2="45.72" width="0.1524" layer="91"/>
<wire x1="111.76" y1="45.72" x2="137.16" y2="45.72" width="0.1524" layer="91"/>
<wire x1="137.16" y1="45.72" x2="162.56" y2="45.72" width="0.1524" layer="91"/>
<wire x1="162.56" y1="45.72" x2="187.96" y2="45.72" width="0.1524" layer="91"/>
<wire x1="111.76" y1="43.18" x2="111.76" y2="45.72" width="0.1524" layer="91"/>
<wire x1="137.16" y1="43.18" x2="137.16" y2="45.72" width="0.1524" layer="91"/>
<wire x1="162.56" y1="43.18" x2="162.56" y2="45.72" width="0.1524" layer="91"/>
<wire x1="187.96" y1="43.18" x2="187.96" y2="45.72" width="0.1524" layer="91"/>
<pinref part="INV_4" gate="G$1" pin="I"/>
<wire x1="45.72" y1="53.34" x2="45.72" y2="45.72" width="0.1524" layer="91"/>
<pinref part="NOR3_2" gate="G$1" pin="I0"/>
<pinref part="NOR3_4" gate="G$1" pin="I0"/>
<pinref part="NOR3_6" gate="G$1" pin="I0"/>
<pinref part="NOR3_8" gate="G$1" pin="I0"/>
<junction x="45.72" y="45.72"/>
<junction x="111.76" y="45.72"/>
<junction x="137.16" y="45.72"/>
<junction x="162.56" y="45.72"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="185.42" y1="43.18" x2="185.42" y2="60.96" width="0.1524" layer="91"/>
<wire x1="43.18" y1="60.96" x2="45.72" y2="60.96" width="0.1524" layer="91"/>
<wire x1="45.72" y1="60.96" x2="121.92" y2="60.96" width="0.1524" layer="91"/>
<wire x1="121.92" y1="60.96" x2="134.62" y2="60.96" width="0.1524" layer="91"/>
<wire x1="134.62" y1="60.96" x2="172.72" y2="60.96" width="0.1524" layer="91"/>
<wire x1="172.72" y1="60.96" x2="185.42" y2="60.96" width="0.1524" layer="91"/>
<wire x1="121.92" y1="43.18" x2="121.92" y2="60.96" width="0.1524" layer="91"/>
<wire x1="134.62" y1="43.18" x2="134.62" y2="60.96" width="0.1524" layer="91"/>
<wire x1="172.72" y1="43.18" x2="172.72" y2="60.96" width="0.1524" layer="91"/>
<pinref part="INV_3" gate="G$1" pin="I"/>
<wire x1="45.72" y1="68.58" x2="45.72" y2="60.96" width="0.1524" layer="91"/>
<pinref part="NOR3_3" gate="G$1" pin="I2"/>
<pinref part="NOR3_4" gate="G$1" pin="I2"/>
<pinref part="NOR3_7" gate="G$1" pin="I2"/>
<pinref part="NOR3_8" gate="G$1" pin="I2"/>
<junction x="45.72" y="60.96"/>
<junction x="121.92" y="60.96"/>
<junction x="134.62" y="60.96"/>
<junction x="172.72" y="60.96"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="71.12" y1="17.78" x2="71.12" y2="15.24" width="0.1524" layer="91"/>
<wire x1="71.12" y1="15.24" x2="91.44" y2="15.24" width="0.1524" layer="91"/>
<wire x1="91.44" y1="15.24" x2="91.44" y2="7.62" width="0.1524" layer="91"/>
<wire x1="91.44" y1="15.24" x2="104.14" y2="15.24" width="0.1524" layer="91"/>
<wire x1="104.14" y1="15.24" x2="104.14" y2="7.62" width="0.1524" layer="91"/>
<wire x1="104.14" y1="15.24" x2="116.84" y2="15.24" width="0.1524" layer="91"/>
<wire x1="116.84" y1="15.24" x2="116.84" y2="7.62" width="0.1524" layer="91"/>
<wire x1="116.84" y1="15.24" x2="129.54" y2="15.24" width="0.1524" layer="91"/>
<wire x1="129.54" y1="15.24" x2="129.54" y2="7.62" width="0.1524" layer="91"/>
<wire x1="129.54" y1="15.24" x2="142.24" y2="15.24" width="0.1524" layer="91"/>
<wire x1="142.24" y1="15.24" x2="142.24" y2="7.62" width="0.1524" layer="91"/>
<wire x1="142.24" y1="15.24" x2="154.94" y2="15.24" width="0.1524" layer="91"/>
<wire x1="154.94" y1="15.24" x2="154.94" y2="7.62" width="0.1524" layer="91"/>
<wire x1="154.94" y1="15.24" x2="167.64" y2="15.24" width="0.1524" layer="91"/>
<wire x1="167.64" y1="15.24" x2="167.64" y2="7.62" width="0.1524" layer="91"/>
<wire x1="167.64" y1="15.24" x2="180.34" y2="15.24" width="0.1524" layer="91"/>
<wire x1="180.34" y1="15.24" x2="180.34" y2="7.62" width="0.1524" layer="91"/>
<pinref part="NAND2_3" gate="G$1" pin="I1"/>
<pinref part="NAND2_4" gate="G$1" pin="I1"/>
<pinref part="NAND2_5" gate="G$1" pin="I1"/>
<pinref part="NAND2_6" gate="G$1" pin="I1"/>
<pinref part="NAND2_7" gate="G$1" pin="I1"/>
<pinref part="NAND2_8" gate="G$1" pin="I1"/>
<pinref part="NAND2_9" gate="G$1" pin="I1"/>
<pinref part="NAND2_10" gate="G$1" pin="I1"/>
<pinref part="NOR2_1" gate="G$1" pin="O"/>
<junction x="167.64" y="15.24"/>
<junction x="154.94" y="15.24"/>
<junction x="142.24" y="15.24"/>
<junction x="129.54" y="15.24"/>
<junction x="116.84" y="15.24"/>
<junction x="104.14" y="15.24"/>
<junction x="91.44" y="15.24"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="81.28" y1="12.7" x2="121.92" y2="12.7" width="0.1524" layer="91"/>
<wire x1="121.92" y1="12.7" x2="121.92" y2="17.78" width="0.1524" layer="91"/>
<wire x1="121.92" y1="12.7" x2="121.92" y2="7.62" width="0.1524" layer="91"/>
<wire x1="81.28" y1="12.7" x2="81.28" y2="7.62" width="0.1524" layer="91"/>
<pinref part="NAND2_2" gate="G$1" pin="A"/>
<pinref part="NAND2_5" gate="G$1" pin="A"/>
<junction x="121.92" y="12.7"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="147.32" y1="17.78" x2="147.32" y2="10.16" width="0.1524" layer="91"/>
<wire x1="147.32" y1="10.16" x2="68.58" y2="10.16" width="0.1524" layer="91"/>
<wire x1="68.58" y1="10.16" x2="68.58" y2="7.62" width="0.1524" layer="91"/>
<wire x1="147.32" y1="10.16" x2="147.32" y2="7.62" width="0.1524" layer="91"/>
<pinref part="NAND2_1" gate="G$1" pin="A"/>
<pinref part="NAND2_7" gate="G$1" pin="A"/>
<junction x="147.32" y="10.16"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="185.42" y1="7.62" x2="185.42" y2="17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_10" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="96.52" y1="17.78" x2="96.52" y2="7.62" width="0.1524" layer="91"/>
<pinref part="NAND2_3" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="109.22" y1="17.78" x2="109.22" y2="7.62" width="0.1524" layer="91"/>
<pinref part="NAND2_4" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="134.62" y1="7.62" x2="134.62" y2="17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_6" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="160.02" y1="7.62" x2="160.02" y2="17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_8" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="172.72" y1="17.78" x2="172.72" y2="7.62" width="0.1524" layer="91"/>
<pinref part="NAND2_9" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="78.74" y1="-15.24" x2="78.74" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_2" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="58.42" y1="10.16" x2="53.34" y2="10.16" width="0.1524" layer="91"/>
<wire x1="53.34" y1="10.16" x2="53.34" y2="7.62" width="0.1524" layer="91"/>
<wire x1="58.42" y1="10.16" x2="58.42" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="58.42" y1="-15.24" x2="66.04" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="AND2_1" gate="G$1" pin="A"/>
<pinref part="NAND2_1" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="93.98" y1="-15.24" x2="93.98" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_3" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<wire x1="106.68" y1="-15.24" x2="106.68" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_4" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<wire x1="119.38" y1="-15.24" x2="119.38" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_5" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<wire x1="132.08" y1="-15.24" x2="132.08" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_6" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="144.78" y1="-15.24" x2="144.78" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_7" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<wire x1="157.48" y1="-15.24" x2="157.48" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_8" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<wire x1="170.18" y1="-15.24" x2="170.18" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_9" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<wire x1="182.88" y1="-15.24" x2="182.88" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="NAND2_10" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="48.26" y1="10.16" x2="48.26" y2="8.128" width="0.1524" layer="91"/>
<pinref part="AND2_1" gate="G$1" pin="I1"/>
<wire x1="48.26" y1="7.62" x2="48.26" y2="8.128" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<wire x1="78.74" y1="17.78" x2="83.82" y2="17.78" width="0.1524" layer="91" style="longdash"/>
<wire x1="78.74" y1="17.78" x2="76.2" y2="17.78" width="0.1524" layer="91"/>
<wire x1="63.5" y1="12.7" x2="76.2" y2="12.7" width="0.1524" layer="91"/>
<wire x1="76.2" y1="12.7" x2="76.2" y2="7.62" width="0.1524" layer="91"/>
<wire x1="63.5" y1="7.62" x2="63.5" y2="12.7" width="0.1524" layer="91"/>
<wire x1="76.2" y1="17.78" x2="76.2" y2="12.7" width="0.1524" layer="91"/>
<pinref part="NAND2_1" gate="G$1" pin="I1"/>
<pinref part="NAND2_2" gate="G$1" pin="I1"/>
<junction x="76.2" y="12.7"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="50.8" y1="-17.78" x2="50.8" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="AND2_1" gate="G$1" pin="O"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
