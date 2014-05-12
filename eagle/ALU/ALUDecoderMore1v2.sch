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
<symbol name="NAND3">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94" curve="-180"/>
<text x="2.54" y="3.175" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="A" x="-15.24" y="2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-15.24" y="-2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="O" x="7.62" y="0" visible="off" length="middle" direction="out" function="dot" rot="R180"/>
<wire x1="-2.54" y1="5.08" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
<pin name="I2" x="-15.24" y="0" visible="off" length="middle" direction="in" swaplevel="1"/>
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
<symbol name="NAND4">
<wire x1="0" y1="7.62" x2="0" y2="-7.62" width="0.254" layer="94" curve="-180"/>
<text x="5.08" y="5.715" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="A" x="-12.7" y="5.08" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-12.7" y="-2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="O" x="12.7" y="0" visible="off" length="middle" direction="out" function="dot" rot="R180"/>
<wire x1="0" y1="7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="0" y2="-7.62" width="0.254" layer="94"/>
<pin name="A1" x="-12.7" y="2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I2" x="-12.7" y="-5.08" visible="off" length="middle" direction="in" swaplevel="1"/>
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
<symbol name="XOR2">
<wire x1="-1.27" y1="5.08" x2="-7.62" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-1.2446" y1="-5.0678" x2="7.5439" y2="0.0507" width="0.4064" layer="94" curve="60.147106" cap="flat"/>
<wire x1="-1.2446" y1="5.0678" x2="7.5442" y2="-0.0505" width="0.4064" layer="94" curve="-60.148802" cap="flat"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94" curve="-90"/>
<text x="-7.62" y="5.715" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="O" x="12.7" y="0" visible="off" length="middle" direction="out" rot="R180"/>
<pin name="I0" x="-12.7" y="2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-12.7" y="-2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<wire x1="-9.398" y1="5.08" x2="-9.398" y2="-5.08" width="0.4064" layer="94" curve="-90"/>
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
<deviceset name="NAND3" prefix="NAND3_">
<gates>
<gate name="G$1" symbol="NAND3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="5PIN">
<connects>
<connect gate="G$1" pin="A" pad="P$1"/>
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
<deviceset name="NAND4" prefix="NAND4_">
<gates>
<gate name="G$1" symbol="NAND4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="5PIN">
<connects>
<connect gate="G$1" pin="A" pad="P$1"/>
<connect gate="G$1" pin="A1" pad="P$2"/>
<connect gate="G$1" pin="I1" pad="P$3"/>
<connect gate="G$1" pin="I2" pad="P$4"/>
<connect gate="G$1" pin="O" pad="P$5"/>
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
<deviceset name="XOR2" prefix="XOR2_">
<gates>
<gate name="G$1" symbol="XOR2" x="0" y="0"/>
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
<part name="INV_5" library="c035u" deviceset="INV" device=""/>
<part name="NOR3_1" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_2" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR3_3" library="c035u" deviceset="NOR3" device=""/>
<part name="NAND3_1" library="c035u" deviceset="NAND3" device=""/>
<part name="NAND3_3" library="c035u" deviceset="NAND3" device=""/>
<part name="NAND3_2" library="c035u" deviceset="NAND3" device=""/>
<part name="NAND3_4" library="c035u" deviceset="NAND3" device=""/>
<part name="NAND2_1" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND4_1" library="c035u" deviceset="NAND4" device=""/>
<part name="NAND4_2" library="c035u" deviceset="NAND4" device=""/>
<part name="NAND4_3" library="c035u" deviceset="NAND4" device=""/>
<part name="NAND4_4" library="c035u" deviceset="NAND4" device=""/>
<part name="NAND4_5" library="c035u" deviceset="NAND4" device=""/>
<part name="NAND2_2" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_3" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND3_5" library="c035u" deviceset="NAND3" device=""/>
<part name="NAND2_4" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_5" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_6" library="c035u" deviceset="NAND2" device=""/>
<part name="NOR3_4" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR2_1" library="c035u" deviceset="NOR2" device=""/>
<part name="NAND3_6" library="c035u" deviceset="NAND3" device=""/>
<part name="NAND2_7" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_8" library="c035u" deviceset="NAND2" device=""/>
<part name="AND2_1" library="c035u" deviceset="AND2" device=""/>
<part name="AND2_2" library="c035u" deviceset="AND2" device=""/>
<part name="AND2_3" library="c035u" deviceset="AND2" device=""/>
<part name="NAND2_9" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND3_7" library="c035u" deviceset="NAND3" device=""/>
<part name="NOR3_5" library="c035u" deviceset="NOR3" device=""/>
<part name="AND2_4" library="c035u" deviceset="AND2" device=""/>
<part name="XOR2_1" library="c035u" deviceset="XOR2" device=""/>
<part name="INV_6" library="c035u" deviceset="INV" device=""/>
<part name="XOR2_2" library="c035u" deviceset="XOR2" device=""/>
<part name="XOR2_3" library="c035u" deviceset="XOR2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="78.74" y1="74.676" x2="78.74" y2="73.66" width="0.1524" layer="94"/>
<text x="81.28" y="0" size="1.27" layer="95" rot="R180">FAOut</text>
<text x="55.88" y="152.4" size="1.27" layer="95">OpCode[0]</text>
<text x="43.18" y="152.4" size="1.27" layer="95">OpCode[1]</text>
<text x="30.48" y="152.4" size="1.27" layer="95">OpCode[2]</text>
<text x="17.78" y="152.4" size="1.27" layer="95">OpCode[3]</text>
<text x="5.08" y="152.4" size="1.27" layer="95">OpCode[4]</text>
<text x="58.42" y="139.7" size="1.27" layer="95">A</text>
<text x="58.42" y="142.24" size="1.27" layer="95">B</text>
<text x="58.42" y="144.78" size="1.27" layer="95">C</text>
<text x="58.42" y="147.32" size="1.27" layer="95">D</text>
<text x="58.42" y="149.86" size="1.27" layer="95">E</text>
<text x="58.42" y="114.3" size="1.27" layer="95">!A</text>
<text x="58.42" y="111.76" size="1.27" layer="95">!B</text>
<text x="58.42" y="109.22" size="1.27" layer="95">!C</text>
<text x="58.42" y="106.68" size="1.27" layer="95">!D</text>
<text x="58.42" y="104.14" size="1.27" layer="95">!E</text>
<wire x1="96.52" y1="74.676" x2="96.52" y2="73.66" width="0.1524" layer="94"/>
<text x="124.46" y="0" size="1.27" layer="95" rot="R180">SUB</text>
<text x="152.4" y="0" size="1.27" layer="95" rot="R180">ShL</text>
<text x="205.74" y="0" size="1.27" layer="95" rot="R180">Sh8</text>
<text x="220.98" y="0" size="1.27" layer="95" rot="R180">Sh4</text>
<text x="236.22" y="0" size="1.27" layer="95" rot="R180">Sh2</text>
<text x="251.46" y="0" size="1.27" layer="95" rot="R180">Sh1</text>
<text x="256.54" y="152.4" size="1.27" layer="95">imm4[0]</text>
<text x="251.46" y="154.94" size="1.27" layer="95">imm4[1]</text>
<text x="246.38" y="152.4" size="1.27" layer="95">imm4[2]</text>
<text x="241.3" y="154.94" size="1.27" layer="95">imm4[3]</text>
<text x="281.94" y="0" size="1.27" layer="95" rot="R180">ShOut</text>
<text x="66.04" y="60.96" size="1.27" layer="95">UseC</text>
<text x="177.8" y="0" size="1.27" layer="95" rot="R180">ShR</text>
<text x="27.94" y="60.96" size="1.27" layer="95">V</text>
<text x="35.56" y="60.96" size="1.27" layer="95">C</text>
<text x="38.1" y="60.96" size="1.27" layer="95">N</text>
<text x="45.72" y="60.96" size="1.27" layer="95">Z</text>
<text x="60.96" y="60.96" size="1.27" layer="95">CIn</text>
<text x="60.96" y="0" size="1.27" layer="95" rot="R180">CIn_Slice</text>
<text x="45.72" y="0" size="1.27" layer="95" rot="R180">nZ</text>
<text x="38.1" y="0" size="1.27" layer="95" rot="R180">N</text>
<text x="33.02" y="0" size="1.27" layer="95" rot="R180">COut</text>
<text x="22.86" y="0" size="1.27" layer="95" rot="R180">LastCIn</text>
<text x="17.78" y="2.54" size="1.27" layer="95" rot="R180">SUB</text>
<wire x1="12.7" y1="-2.54" x2="71.12" y2="-2.54" width="0.1524" layer="98" style="longdash"/>
<wire x1="71.12" y1="-2.54" x2="71.12" y2="66.04" width="0.1524" layer="98" style="longdash"/>
<wire x1="71.12" y1="66.04" x2="12.7" y2="66.04" width="0.1524" layer="98" style="longdash"/>
<wire x1="12.7" y1="66.04" x2="12.7" y2="-2.54" width="0.1524" layer="98" style="longdash"/>
<text x="13.462" y="66.802" size="1.27" layer="98">Flags Overhead</text>
</plain>
<instances>
<instance part="INV_1" gate="G$1" x="5.08" y="127" rot="R270"/>
<instance part="INV_2" gate="G$1" x="17.78" y="127" rot="R270"/>
<instance part="INV_3" gate="G$1" x="30.48" y="127" rot="R270"/>
<instance part="INV_4" gate="G$1" x="43.18" y="127" rot="R270"/>
<instance part="INV_5" gate="G$1" x="55.88" y="127" rot="R270"/>
<instance part="NOR3_1" gate="G$1" x="66.04" y="88.9" rot="R270"/>
<instance part="NOR3_2" gate="G$1" x="144.78" y="88.9" rot="R270"/>
<instance part="NOR3_3" gate="G$1" x="157.48" y="88.9" rot="R270"/>
<instance part="NAND3_1" gate="G$1" x="78.74" y="86.36" rot="R270"/>
<instance part="NAND3_3" gate="G$1" x="129.54" y="86.36" rot="R270"/>
<instance part="NAND3_2" gate="G$1" x="116.84" y="86.36" rot="R270"/>
<instance part="NAND3_4" gate="G$1" x="281.94" y="86.36" rot="R270"/>
<instance part="NAND2_1" gate="G$1" x="96.52" y="86.36" rot="R270"/>
<instance part="NAND4_1" gate="G$1" x="177.8" y="88.9" rot="R270"/>
<instance part="NAND4_2" gate="G$1" x="213.36" y="88.9" rot="R270"/>
<instance part="NAND4_3" gate="G$1" x="231.14" y="88.9" rot="R270"/>
<instance part="NAND4_4" gate="G$1" x="266.7" y="88.9" rot="R270"/>
<instance part="NAND4_5" gate="G$1" x="297.18" y="88.9" rot="R270"/>
<instance part="NAND2_2" gate="G$1" x="81.28" y="63.5" rot="R270"/>
<instance part="NAND2_3" gate="G$1" x="99.06" y="63.5" rot="R270"/>
<instance part="NAND3_5" gate="G$1" x="101.6" y="40.64" rot="R270"/>
<instance part="NAND2_4" gate="G$1" x="124.46" y="17.78" rot="R270"/>
<instance part="NAND2_5" gate="G$1" x="127" y="40.64" rot="R270"/>
<instance part="NAND2_6" gate="G$1" x="124.46" y="63.5" rot="R270"/>
<instance part="NOR3_4" gate="G$1" x="152.4" y="38.1" rot="R270"/>
<instance part="NOR2_1" gate="G$1" x="149.86" y="63.5" rot="R270"/>
<instance part="NAND3_6" gate="G$1" x="281.94" y="60.96" rot="R270"/>
<instance part="NAND2_7" gate="G$1" x="205.74" y="7.62" rot="R270"/>
<instance part="NAND2_8" gate="G$1" x="215.9" y="60.96" rot="R270"/>
<instance part="AND2_1" gate="G$1" x="251.46" y="30.48" rot="R270"/>
<instance part="AND2_2" gate="G$1" x="236.22" y="30.48" rot="R270"/>
<instance part="AND2_3" gate="G$1" x="220.98" y="30.48" rot="R270"/>
<instance part="NAND2_9" gate="G$1" x="208.28" y="30.48" rot="R270"/>
<instance part="NAND3_7" gate="G$1" x="195.58" y="60.96" rot="R270"/>
<instance part="NOR3_5" gate="G$1" x="193.04" y="88.9" rot="R270"/>
<instance part="AND2_4" gate="G$1" x="63.5" y="43.18" rot="R270"/>
<instance part="XOR2_1" gate="G$1" x="60.96" y="22.86" rot="R270"/>
<instance part="INV_6" gate="G$1" x="45.72" y="30.48" rot="R90"/>
<instance part="XOR2_2" gate="G$1" x="27.94" y="45.72" rot="R90"/>
<instance part="XOR2_3" gate="G$1" x="30.48" y="20.32" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$7" class="0">
<segment>
<pinref part="NAND2_2" gate="G$1" pin="O"/>
<wire x1="81.28" y1="55.88" x2="81.28" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="152.4" y1="25.4" x2="152.4" y2="0" width="0.1524" layer="91"/>
<pinref part="NOR3_4" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="210.82" y1="45.72" x2="210.82" y2="50.8" width="0.1524" layer="91"/>
<wire x1="233.68" y1="55.88" x2="241.3" y2="55.88" width="0.1524" layer="91"/>
<wire x1="241.3" y1="55.88" x2="241.3" y2="154.94" width="0.1524" layer="91"/>
<pinref part="NAND2_9" gate="G$1" pin="A"/>
<wire x1="220.98" y1="53.34" x2="220.98" y2="50.8" width="0.1524" layer="91"/>
<wire x1="220.98" y1="50.8" x2="210.82" y2="50.8" width="0.1524" layer="91"/>
<wire x1="220.98" y1="53.34" x2="233.68" y2="53.34" width="0.1524" layer="91"/>
<wire x1="233.68" y1="53.34" x2="233.68" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="236.22" y1="50.8" x2="236.22" y2="53.34" width="0.1524" layer="91"/>
<wire x1="236.22" y1="53.34" x2="246.38" y2="53.34" width="0.1524" layer="91"/>
<wire x1="246.38" y1="53.34" x2="246.38" y2="152.4" width="0.1524" layer="91"/>
<wire x1="236.22" y1="50.8" x2="223.52" y2="50.8" width="0.1524" layer="91"/>
<wire x1="223.52" y1="50.8" x2="223.52" y2="45.72" width="0.1524" layer="91"/>
<pinref part="AND2_3" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<wire x1="238.76" y1="45.72" x2="238.76" y2="50.8" width="0.1524" layer="91"/>
<wire x1="238.76" y1="50.8" x2="251.46" y2="50.8" width="0.1524" layer="91"/>
<wire x1="251.46" y1="50.8" x2="251.46" y2="154.94" width="0.1524" layer="91"/>
<pinref part="AND2_2" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<wire x1="256.54" y1="48.26" x2="256.54" y2="152.4" width="0.1524" layer="91"/>
<wire x1="256.54" y1="48.26" x2="254" y2="48.26" width="0.1524" layer="91"/>
<wire x1="254" y1="48.26" x2="254" y2="45.72" width="0.1524" layer="91"/>
<pinref part="AND2_1" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="AND2_3" gate="G$1" pin="O"/>
<wire x1="220.98" y1="22.86" x2="220.98" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="AND2_2" gate="G$1" pin="O"/>
<wire x1="236.22" y1="22.86" x2="236.22" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="AND2_1" gate="G$1" pin="O"/>
<wire x1="251.46" y1="22.86" x2="251.46" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<wire x1="281.94" y1="0" x2="281.94" y2="53.34" width="0.1524" layer="91"/>
<pinref part="NAND3_6" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="121.92" y1="78.74" x2="116.84" y2="78.74" width="0.1524" layer="91"/>
<pinref part="NAND3_2" gate="G$1" pin="O"/>
<pinref part="NAND2_6" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="129.54" y1="78.74" x2="127" y2="78.74" width="0.1524" layer="91"/>
<pinref part="NAND3_3" gate="G$1" pin="O"/>
<pinref part="NAND2_6" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="157.48" y1="76.2" x2="152.4" y2="76.2" width="0.1524" layer="91"/>
<pinref part="NOR3_3" gate="G$1" pin="O"/>
<pinref part="NOR2_1" gate="G$1" pin="I0"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="144.78" y1="76.2" x2="147.32" y2="76.2" width="0.1524" layer="91"/>
<pinref part="NOR3_2" gate="G$1" pin="O"/>
<pinref part="NOR2_1" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="NAND2_8" gate="G$1" pin="I1"/>
<pinref part="NAND4_2" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="231.14" y1="76.2" x2="218.44" y2="76.2" width="0.1524" layer="91"/>
<pinref part="NAND4_3" gate="G$1" pin="O"/>
<pinref part="NAND2_8" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="205.74" y1="48.26" x2="205.74" y2="45.72" width="0.1524" layer="91"/>
<wire x1="205.74" y1="48.26" x2="215.9" y2="48.26" width="0.1524" layer="91"/>
<wire x1="218.44" y1="48.26" x2="218.44" y2="45.72" width="0.1524" layer="91"/>
<wire x1="215.9" y1="48.26" x2="233.68" y2="48.26" width="0.1524" layer="91"/>
<wire x1="233.68" y1="48.26" x2="233.68" y2="45.72" width="0.1524" layer="91"/>
<wire x1="233.68" y1="48.26" x2="248.92" y2="48.26" width="0.1524" layer="91"/>
<wire x1="248.92" y1="48.26" x2="248.92" y2="45.72" width="0.1524" layer="91"/>
<wire x1="215.9" y1="48.26" x2="215.9" y2="53.34" width="0.1524" layer="91"/>
<pinref part="NAND2_8" gate="G$1" pin="O"/>
<pinref part="AND2_1" gate="G$1" pin="I1"/>
<pinref part="AND2_2" gate="G$1" pin="I1"/>
<pinref part="AND2_3" gate="G$1" pin="I1"/>
<pinref part="NAND2_9" gate="G$1" pin="I1"/>
<junction x="215.9" y="48.26"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="177.8" y1="76.2" x2="177.8" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<wire x1="30.48" y1="33.02" x2="35.56" y2="33.02" width="0.1524" layer="91"/>
<wire x1="35.56" y1="33.02" x2="35.56" y2="60.96" width="0.1524" layer="91"/>
<pinref part="XOR2_3" gate="G$1" pin="O"/>
<pinref part="XOR2_2" gate="G$1" pin="I1"/>
<junction x="30.48" y="33.02"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="XOR2_2" gate="G$1" pin="O"/>
<wire x1="27.94" y1="58.42" x2="27.94" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<wire x1="25.4" y1="33.02" x2="22.86" y2="33.02" width="0.1524" layer="91"/>
<wire x1="22.86" y1="33.02" x2="22.86" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="XOR2_3" gate="G$1" pin="I1"/>
<wire x1="33.02" y1="7.62" x2="33.02" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<wire x1="38.1" y1="0" x2="38.1" y2="33.02" width="0.1524" layer="91"/>
<wire x1="38.1" y1="33.02" x2="38.1" y2="60.96" width="0.1524" layer="91"/>
<wire x1="39.37" y1="31.242" x2="38.1" y2="33.02" width="0.1524" layer="91"/>
<wire x1="38.1" y1="33.02" x2="36.576" y2="31.242" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="INV_6" gate="G$1" pin="I"/>
<wire x1="45.72" y1="20.32" x2="45.72" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<wire x1="45.72" y1="40.64" x2="45.72" y2="60.96" width="0.1524" layer="91"/>
<pinref part="INV_6" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<wire x1="60.96" y1="59.182" x2="60.96" y2="60.96" width="0.1524" layer="91"/>
<pinref part="AND2_4" gate="G$1" pin="I1"/>
<wire x1="60.96" y1="58.42" x2="60.96" y2="59.182" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<wire x1="66.04" y1="76.2" x2="66.04" y2="58.42" width="0.1524" layer="91"/>
<pinref part="NOR3_1" gate="G$1" pin="O"/>
<pinref part="AND2_4" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<pinref part="AND2_4" gate="G$1" pin="O"/>
<pinref part="XOR2_1" gate="G$1" pin="I0"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<wire x1="58.42" y1="35.56" x2="53.34" y2="35.56" width="0.1524" layer="91"/>
<wire x1="53.34" y1="35.56" x2="53.34" y2="2.54" width="0.1524" layer="91"/>
<wire x1="53.34" y1="2.54" x2="27.94" y2="2.54" width="0.1524" layer="91"/>
<wire x1="27.94" y1="2.54" x2="17.78" y2="2.54" width="0.1524" layer="91"/>
<wire x1="27.94" y1="2.54" x2="27.94" y2="7.62" width="0.1524" layer="91"/>
<pinref part="XOR2_1" gate="G$1" pin="I1"/>
<pinref part="XOR2_3" gate="G$1" pin="I0"/>
<junction x="27.94" y="2.54"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="XOR2_1" gate="G$1" pin="O"/>
<wire x1="60.96" y1="10.16" x2="60.96" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<pinref part="INV_2" gate="G$1" pin="I"/>
<wire x1="17.78" y1="139.7" x2="17.78" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<pinref part="INV_3" gate="G$1" pin="I"/>
<wire x1="30.48" y1="137.16" x2="30.48" y2="139.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<pinref part="INV_4" gate="G$1" pin="I"/>
<wire x1="43.18" y1="139.7" x2="43.18" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="INV_5" gate="G$1" pin="I"/>
<wire x1="55.88" y1="137.16" x2="55.88" y2="139.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="INV_5" gate="G$1" pin="O"/>
<pinref part="INV_4" gate="G$1" pin="O"/>
<pinref part="INV_3" gate="G$1" pin="O"/>
<wire x1="302.26" y1="109.22" x2="302.26" y2="106.68" width="0.1524" layer="91"/>
<wire x1="302.26" y1="106.68" x2="302.26" y2="104.14" width="0.1524" layer="91"/>
<wire x1="302.26" y1="104.14" x2="302.26" y2="101.6" width="0.1524" layer="91"/>
<wire x1="30.48" y1="109.22" x2="68.58" y2="109.22" width="0.1524" layer="91"/>
<wire x1="68.58" y1="109.22" x2="99.06" y2="109.22" width="0.1524" layer="91"/>
<wire x1="99.06" y1="109.22" x2="104.14" y2="109.22" width="0.1524" layer="91"/>
<wire x1="104.14" y1="109.22" x2="132.08" y2="109.22" width="0.1524" layer="91"/>
<wire x1="132.08" y1="109.22" x2="165.1" y2="109.22" width="0.1524" layer="91"/>
<wire x1="165.1" y1="109.22" x2="193.04" y2="109.22" width="0.1524" layer="91"/>
<wire x1="193.04" y1="109.22" x2="302.26" y2="109.22" width="0.1524" layer="91"/>
<wire x1="43.18" y1="106.68" x2="157.48" y2="106.68" width="0.1524" layer="91"/>
<wire x1="157.48" y1="106.68" x2="284.48" y2="106.68" width="0.1524" layer="91"/>
<wire x1="284.48" y1="106.68" x2="299.72" y2="106.68" width="0.1524" layer="91"/>
<wire x1="299.72" y1="106.68" x2="302.26" y2="106.68" width="0.1524" layer="91"/>
<wire x1="55.88" y1="104.14" x2="81.28" y2="104.14" width="0.1524" layer="91"/>
<wire x1="81.28" y1="104.14" x2="129.54" y2="104.14" width="0.1524" layer="91"/>
<wire x1="129.54" y1="104.14" x2="154.94" y2="104.14" width="0.1524" layer="91"/>
<wire x1="154.94" y1="104.14" x2="236.22" y2="104.14" width="0.1524" layer="91"/>
<wire x1="236.22" y1="104.14" x2="302.26" y2="104.14" width="0.1524" layer="91"/>
<wire x1="302.26" y1="104.14" x2="304.8" y2="104.14" width="0.1524" layer="91"/>
<wire x1="302.26" y1="106.68" x2="304.8" y2="106.68" width="0.1524" layer="91"/>
<wire x1="302.26" y1="109.22" x2="304.8" y2="109.22" width="0.1524" layer="91"/>
<wire x1="30.48" y1="116.84" x2="30.48" y2="109.22" width="0.1524" layer="91"/>
<wire x1="43.18" y1="116.84" x2="43.18" y2="106.68" width="0.1524" layer="91"/>
<wire x1="55.88" y1="116.84" x2="55.88" y2="104.14" width="0.1524" layer="91"/>
<pinref part="NAND4_5" gate="G$1" pin="A"/>
<wire x1="68.58" y1="101.6" x2="68.58" y2="109.22" width="0.1524" layer="91"/>
<pinref part="NOR3_1" gate="G$1" pin="I0"/>
<junction x="68.58" y="109.22"/>
<wire x1="81.28" y1="101.6" x2="81.28" y2="104.14" width="0.1524" layer="91"/>
<pinref part="NAND3_1" gate="G$1" pin="A"/>
<junction x="81.28" y="104.14"/>
<wire x1="99.06" y1="101.6" x2="99.06" y2="109.22" width="0.1524" layer="91"/>
<pinref part="NAND2_1" gate="G$1" pin="A"/>
<junction x="99.06" y="109.22"/>
<wire x1="104.14" y1="109.22" x2="104.14" y2="78.74" width="0.1524" layer="91"/>
<wire x1="104.14" y1="78.74" x2="101.6" y2="78.74" width="0.1524" layer="91"/>
<pinref part="NAND2_3" gate="G$1" pin="A"/>
<junction x="104.14" y="109.22"/>
<wire x1="132.08" y1="109.22" x2="132.08" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND3_3" gate="G$1" pin="A"/>
<junction x="132.08" y="109.22"/>
<wire x1="129.54" y1="104.14" x2="129.54" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND3_3" gate="G$1" pin="I2"/>
<junction x="129.54" y="104.14"/>
<wire x1="154.94" y1="101.6" x2="154.94" y2="104.14" width="0.1524" layer="91"/>
<pinref part="NOR3_3" gate="G$1" pin="I1"/>
<junction x="154.94" y="104.14"/>
<wire x1="157.48" y1="101.6" x2="157.48" y2="106.68" width="0.1524" layer="91"/>
<pinref part="NOR3_3" gate="G$1" pin="I2"/>
<junction x="157.48" y="106.68"/>
<wire x1="165.1" y1="53.34" x2="165.1" y2="109.22" width="0.1524" layer="91"/>
<wire x1="165.1" y1="53.34" x2="152.4" y2="53.34" width="0.1524" layer="91"/>
<wire x1="152.4" y1="53.34" x2="152.4" y2="50.8" width="0.1524" layer="91"/>
<pinref part="NOR3_4" gate="G$1" pin="I2"/>
<junction x="165.1" y="109.22"/>
<wire x1="193.04" y1="109.22" x2="193.04" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NOR3_5" gate="G$1" pin="I2"/>
<junction x="193.04" y="109.22"/>
<wire x1="236.22" y1="101.6" x2="236.22" y2="104.14" width="0.1524" layer="91"/>
<pinref part="NAND4_3" gate="G$1" pin="A"/>
<junction x="236.22" y="104.14"/>
<wire x1="284.48" y1="101.6" x2="284.48" y2="106.68" width="0.1524" layer="91"/>
<pinref part="NAND3_4" gate="G$1" pin="A"/>
<junction x="284.48" y="106.68"/>
<wire x1="299.72" y1="101.6" x2="299.72" y2="106.68" width="0.1524" layer="91"/>
<pinref part="NAND4_5" gate="G$1" pin="A1"/>
<junction x="299.72" y="106.68"/>
<junction x="302.26" y="109.22"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="INV_1" gate="G$1" pin="O"/>
<wire x1="5.08" y1="116.84" x2="5.08" y2="114.3" width="0.1524" layer="91"/>
<wire x1="5.08" y1="114.3" x2="109.22" y2="114.3" width="0.1524" layer="91"/>
<pinref part="NAND3_5" gate="G$1" pin="A"/>
<wire x1="109.22" y1="114.3" x2="119.38" y2="114.3" width="0.1524" layer="91"/>
<wire x1="119.38" y1="114.3" x2="167.64" y2="114.3" width="0.1524" layer="91"/>
<wire x1="167.64" y1="114.3" x2="195.58" y2="114.3" width="0.1524" layer="91"/>
<wire x1="195.58" y1="114.3" x2="304.8" y2="114.3" width="0.1524" layer="91"/>
<wire x1="104.14" y1="55.88" x2="109.22" y2="55.88" width="0.1524" layer="91"/>
<wire x1="109.22" y1="114.3" x2="109.22" y2="55.88" width="0.1524" layer="91"/>
<junction x="109.22" y="114.3"/>
<wire x1="119.38" y1="101.6" x2="119.38" y2="114.3" width="0.1524" layer="91"/>
<pinref part="NAND3_2" gate="G$1" pin="A"/>
<junction x="119.38" y="114.3"/>
<wire x1="167.64" y1="114.3" x2="167.64" y2="50.8" width="0.1524" layer="91"/>
<wire x1="167.64" y1="50.8" x2="154.94" y2="50.8" width="0.1524" layer="91"/>
<pinref part="NOR3_4" gate="G$1" pin="I0"/>
<junction x="167.64" y="114.3"/>
<wire x1="195.58" y1="114.3" x2="195.58" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NOR3_5" gate="G$1" pin="I0"/>
<junction x="195.58" y="114.3"/>
</segment>
</net>
<net name="N$78" class="0">
<segment>
<wire x1="160.02" y1="101.6" x2="160.02" y2="111.76" width="0.1524" layer="91"/>
<pinref part="NOR3_3" gate="G$1" pin="I0"/>
<wire x1="17.78" y1="111.76" x2="160.02" y2="111.76" width="0.1524" layer="91"/>
<pinref part="INV_2" gate="G$1" pin="O"/>
<wire x1="160.02" y1="111.76" x2="180.34" y2="111.76" width="0.1524" layer="91"/>
<wire x1="180.34" y1="111.76" x2="304.8" y2="111.76" width="0.1524" layer="91"/>
<wire x1="17.78" y1="111.76" x2="17.78" y2="116.84" width="0.1524" layer="91"/>
<junction x="160.02" y="111.76"/>
<wire x1="180.34" y1="111.76" x2="180.34" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_1" gate="G$1" pin="A1"/>
<junction x="180.34" y="111.76"/>
</segment>
</net>
<net name="N$94" class="0">
<segment>
<wire x1="226.06" y1="139.7" x2="226.06" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_3" gate="G$1" pin="I2"/>
<wire x1="55.88" y1="149.86" x2="55.88" y2="152.4" width="0.1524" layer="91"/>
<wire x1="55.88" y1="149.86" x2="93.98" y2="149.86" width="0.1524" layer="91"/>
<wire x1="93.98" y1="149.86" x2="116.84" y2="149.86" width="0.1524" layer="91"/>
<wire x1="116.84" y1="149.86" x2="147.32" y2="149.86" width="0.1524" layer="91"/>
<wire x1="147.32" y1="149.86" x2="203.2" y2="149.86" width="0.1524" layer="91"/>
<wire x1="203.2" y1="149.86" x2="218.44" y2="149.86" width="0.1524" layer="91"/>
<wire x1="218.44" y1="149.86" x2="271.78" y2="149.86" width="0.1524" layer="91"/>
<wire x1="271.78" y1="149.86" x2="304.8" y2="149.86" width="0.1524" layer="91"/>
<wire x1="43.18" y1="147.32" x2="43.18" y2="152.4" width="0.1524" layer="91"/>
<wire x1="43.18" y1="147.32" x2="66.04" y2="147.32" width="0.1524" layer="91"/>
<wire x1="66.04" y1="147.32" x2="78.74" y2="147.32" width="0.1524" layer="91"/>
<wire x1="78.74" y1="147.32" x2="137.16" y2="147.32" width="0.1524" layer="91"/>
<wire x1="137.16" y1="147.32" x2="144.78" y2="147.32" width="0.1524" layer="91"/>
<wire x1="144.78" y1="147.32" x2="200.66" y2="147.32" width="0.1524" layer="91"/>
<wire x1="200.66" y1="147.32" x2="304.8" y2="147.32" width="0.1524" layer="91"/>
<wire x1="30.48" y1="144.78" x2="30.48" y2="152.4" width="0.1524" layer="91"/>
<wire x1="30.48" y1="144.78" x2="114.3" y2="144.78" width="0.1524" layer="91"/>
<wire x1="114.3" y1="144.78" x2="182.88" y2="144.78" width="0.1524" layer="91"/>
<wire x1="182.88" y1="144.78" x2="215.9" y2="144.78" width="0.1524" layer="91"/>
<wire x1="215.9" y1="144.78" x2="233.68" y2="144.78" width="0.1524" layer="91"/>
<wire x1="233.68" y1="144.78" x2="269.24" y2="144.78" width="0.1524" layer="91"/>
<wire x1="269.24" y1="144.78" x2="281.94" y2="144.78" width="0.1524" layer="91"/>
<wire x1="281.94" y1="144.78" x2="304.8" y2="144.78" width="0.1524" layer="91"/>
<wire x1="5.08" y1="137.16" x2="5.08" y2="139.7" width="0.1524" layer="91"/>
<pinref part="INV_1" gate="G$1" pin="I"/>
<wire x1="5.08" y1="139.7" x2="5.08" y2="152.4" width="0.1524" layer="91"/>
<wire x1="5.08" y1="139.7" x2="17.78" y2="139.7" width="0.1524" layer="91"/>
<wire x1="17.78" y1="139.7" x2="30.48" y2="139.7" width="0.1524" layer="91"/>
<wire x1="30.48" y1="139.7" x2="43.18" y2="139.7" width="0.1524" layer="91"/>
<wire x1="43.18" y1="139.7" x2="55.88" y2="139.7" width="0.1524" layer="91"/>
<wire x1="55.88" y1="139.7" x2="63.5" y2="139.7" width="0.1524" layer="91"/>
<wire x1="63.5" y1="139.7" x2="86.36" y2="139.7" width="0.1524" layer="91"/>
<wire x1="86.36" y1="139.7" x2="172.72" y2="139.7" width="0.1524" layer="91"/>
<wire x1="172.72" y1="139.7" x2="210.82" y2="139.7" width="0.1524" layer="91"/>
<wire x1="210.82" y1="139.7" x2="226.06" y2="139.7" width="0.1524" layer="91"/>
<wire x1="226.06" y1="139.7" x2="264.16" y2="139.7" width="0.1524" layer="91"/>
<wire x1="264.16" y1="139.7" x2="279.4" y2="139.7" width="0.1524" layer="91"/>
<wire x1="279.4" y1="139.7" x2="292.1" y2="139.7" width="0.1524" layer="91"/>
<wire x1="292.1" y1="139.7" x2="304.8" y2="139.7" width="0.1524" layer="91"/>
<wire x1="17.78" y1="142.24" x2="17.78" y2="152.4" width="0.1524" layer="91"/>
<wire x1="17.78" y1="142.24" x2="76.2" y2="142.24" width="0.1524" layer="91"/>
<wire x1="76.2" y1="142.24" x2="106.68" y2="142.24" width="0.1524" layer="91"/>
<wire x1="106.68" y1="142.24" x2="127" y2="142.24" width="0.1524" layer="91"/>
<wire x1="127" y1="142.24" x2="142.24" y2="142.24" width="0.1524" layer="91"/>
<wire x1="142.24" y1="142.24" x2="175.26" y2="142.24" width="0.1524" layer="91"/>
<wire x1="175.26" y1="142.24" x2="190.5" y2="142.24" width="0.1524" layer="91"/>
<wire x1="190.5" y1="142.24" x2="208.28" y2="142.24" width="0.1524" layer="91"/>
<wire x1="208.28" y1="142.24" x2="228.6" y2="142.24" width="0.1524" layer="91"/>
<wire x1="228.6" y1="142.24" x2="261.62" y2="142.24" width="0.1524" layer="91"/>
<wire x1="261.62" y1="142.24" x2="294.64" y2="142.24" width="0.1524" layer="91"/>
<wire x1="294.64" y1="142.24" x2="304.8" y2="142.24" width="0.1524" layer="91"/>
<wire x1="17.78" y1="139.7" x2="17.78" y2="142.24" width="0.1524" layer="91"/>
<wire x1="30.48" y1="144.78" x2="30.48" y2="139.7" width="0.1524" layer="91"/>
<wire x1="43.18" y1="147.32" x2="43.18" y2="139.7" width="0.1524" layer="91"/>
<wire x1="55.88" y1="149.86" x2="55.88" y2="139.7" width="0.1524" layer="91"/>
<wire x1="63.5" y1="101.6" x2="63.5" y2="139.7" width="0.1524" layer="91"/>
<pinref part="NOR3_1" gate="G$1" pin="I1"/>
<junction x="63.5" y="139.7"/>
<wire x1="66.04" y1="147.32" x2="66.04" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NOR3_1" gate="G$1" pin="I2"/>
<junction x="66.04" y="147.32"/>
<wire x1="76.2" y1="101.6" x2="76.2" y2="142.24" width="0.1524" layer="91"/>
<pinref part="NAND3_1" gate="G$1" pin="I1"/>
<junction x="76.2" y="142.24"/>
<wire x1="78.74" y1="101.6" x2="78.74" y2="147.32" width="0.1524" layer="91"/>
<pinref part="NAND3_1" gate="G$1" pin="I2"/>
<junction x="78.74" y="147.32"/>
<wire x1="86.36" y1="139.7" x2="86.36" y2="78.74" width="0.1524" layer="91"/>
<wire x1="86.36" y1="78.74" x2="83.82" y2="78.74" width="0.1524" layer="91"/>
<pinref part="NAND2_2" gate="G$1" pin="A"/>
<junction x="86.36" y="139.7"/>
<wire x1="93.98" y1="101.6" x2="93.98" y2="149.86" width="0.1524" layer="91"/>
<pinref part="NAND2_1" gate="G$1" pin="I1"/>
<junction x="93.98" y="149.86"/>
<wire x1="106.68" y1="58.42" x2="106.68" y2="142.24" width="0.1524" layer="91"/>
<wire x1="101.6" y1="55.88" x2="101.6" y2="58.42" width="0.1524" layer="91"/>
<wire x1="101.6" y1="58.42" x2="106.68" y2="58.42" width="0.1524" layer="91"/>
<pinref part="NAND3_5" gate="G$1" pin="I2"/>
<junction x="106.68" y="142.24"/>
<wire x1="114.3" y1="101.6" x2="114.3" y2="144.78" width="0.1524" layer="91"/>
<pinref part="NAND3_2" gate="G$1" pin="I1"/>
<junction x="114.3" y="144.78"/>
<wire x1="116.84" y1="149.86" x2="116.84" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND3_2" gate="G$1" pin="I2"/>
<junction x="116.84" y="149.86"/>
<wire x1="127" y1="101.6" x2="127" y2="142.24" width="0.1524" layer="91"/>
<pinref part="NAND3_3" gate="G$1" pin="I1"/>
<junction x="127" y="142.24"/>
<wire x1="137.16" y1="147.32" x2="137.16" y2="55.88" width="0.1524" layer="91"/>
<wire x1="129.54" y1="55.88" x2="137.16" y2="55.88" width="0.1524" layer="91"/>
<pinref part="NAND2_5" gate="G$1" pin="A"/>
<junction x="137.16" y="147.32"/>
<wire x1="142.24" y1="101.6" x2="142.24" y2="142.24" width="0.1524" layer="91"/>
<pinref part="NOR3_2" gate="G$1" pin="I1"/>
<junction x="142.24" y="142.24"/>
<wire x1="144.78" y1="147.32" x2="144.78" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NOR3_2" gate="G$1" pin="I2"/>
<junction x="144.78" y="147.32"/>
<wire x1="147.32" y1="101.6" x2="147.32" y2="149.86" width="0.1524" layer="91"/>
<pinref part="NOR3_2" gate="G$1" pin="I0"/>
<junction x="147.32" y="149.86"/>
<wire x1="172.72" y1="139.7" x2="172.72" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_1" gate="G$1" pin="I2"/>
<junction x="172.72" y="139.7"/>
<wire x1="175.26" y1="142.24" x2="175.26" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_1" gate="G$1" pin="I1"/>
<junction x="175.26" y="142.24"/>
<wire x1="182.88" y1="144.78" x2="182.88" y2="101.6" width="0.1524" layer="91"/>
<junction x="182.88" y="144.78"/>
<wire x1="190.5" y1="101.6" x2="190.5" y2="142.24" width="0.1524" layer="91"/>
<pinref part="NOR3_5" gate="G$1" pin="I1"/>
<junction x="190.5" y="142.24"/>
<wire x1="200.66" y1="78.74" x2="200.66" y2="147.32" width="0.1524" layer="91"/>
<wire x1="200.66" y1="78.74" x2="195.58" y2="78.74" width="0.1524" layer="91"/>
<pinref part="NAND3_7" gate="G$1" pin="I2"/>
<wire x1="195.58" y1="78.74" x2="195.58" y2="76.2" width="0.1524" layer="91"/>
<junction x="200.66" y="147.32"/>
<wire x1="203.2" y1="149.86" x2="203.2" y2="76.2" width="0.1524" layer="91"/>
<pinref part="NAND3_7" gate="G$1" pin="A"/>
<wire x1="203.2" y1="76.2" x2="198.12" y2="76.2" width="0.1524" layer="91"/>
<junction x="203.2" y="149.86"/>
<wire x1="208.28" y1="142.24" x2="208.28" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_2" gate="G$1" pin="I2"/>
<junction x="208.28" y="142.24"/>
<wire x1="210.82" y1="139.7" x2="210.82" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_2" gate="G$1" pin="I1"/>
<junction x="210.82" y="139.7"/>
<wire x1="215.9" y1="144.78" x2="215.9" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_2" gate="G$1" pin="A1"/>
<junction x="215.9" y="144.78"/>
<wire x1="218.44" y1="149.86" x2="218.44" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_2" gate="G$1" pin="A"/>
<junction x="218.44" y="149.86"/>
<junction x="226.06" y="139.7"/>
<wire x1="228.6" y1="101.6" x2="228.6" y2="142.24" width="0.1524" layer="91"/>
<pinref part="NAND4_3" gate="G$1" pin="I1"/>
<junction x="228.6" y="142.24"/>
<wire x1="233.68" y1="144.78" x2="233.68" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_3" gate="G$1" pin="A1"/>
<junction x="233.68" y="144.78"/>
<wire x1="261.62" y1="142.24" x2="261.62" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_4" gate="G$1" pin="I2"/>
<junction x="261.62" y="142.24"/>
<wire x1="264.16" y1="101.6" x2="264.16" y2="139.7" width="0.1524" layer="91"/>
<pinref part="NAND4_4" gate="G$1" pin="I1"/>
<junction x="264.16" y="139.7"/>
<wire x1="269.24" y1="144.78" x2="269.24" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_4" gate="G$1" pin="A1"/>
<junction x="269.24" y="144.78"/>
<wire x1="271.78" y1="149.86" x2="271.78" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_4" gate="G$1" pin="A"/>
<junction x="271.78" y="149.86"/>
<wire x1="279.4" y1="101.6" x2="279.4" y2="139.7" width="0.1524" layer="91"/>
<pinref part="NAND3_4" gate="G$1" pin="I1"/>
<junction x="279.4" y="139.7"/>
<wire x1="281.94" y1="144.78" x2="281.94" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND3_4" gate="G$1" pin="I2"/>
<junction x="281.94" y="144.78"/>
<wire x1="292.1" y1="101.6" x2="292.1" y2="139.7" width="0.1524" layer="91"/>
<pinref part="NAND4_5" gate="G$1" pin="I2"/>
<junction x="292.1" y="139.7"/>
<wire x1="294.64" y1="142.24" x2="294.64" y2="101.6" width="0.1524" layer="91"/>
<pinref part="NAND4_5" gate="G$1" pin="I1"/>
<junction x="294.64" y="142.24"/>
<junction x="55.88" y="149.86"/>
<junction x="43.18" y="147.32"/>
<junction x="30.48" y="144.78"/>
<junction x="17.78" y="142.24"/>
<junction x="5.08" y="139.7"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="NAND2_1" gate="G$1" pin="O"/>
<pinref part="NAND2_3" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="NAND3_1" gate="G$1" pin="O"/>
<pinref part="NAND2_2" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="NAND2_3" gate="G$1" pin="O"/>
<pinref part="NAND3_5" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="NAND3_5" gate="G$1" pin="O"/>
<wire x1="101.6" y1="33.02" x2="121.92" y2="33.02" width="0.1524" layer="91"/>
<pinref part="NAND2_4" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="NAND2_4" gate="G$1" pin="O"/>
<wire x1="124.46" y1="10.16" x2="124.46" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="NAND2_4" gate="G$1" pin="A"/>
<pinref part="NAND2_5" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<pinref part="NAND2_5" gate="G$1" pin="I1"/>
<pinref part="NAND2_6" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="NOR2_1" gate="G$1" pin="O"/>
<pinref part="NOR3_4" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="NAND4_4" gate="G$1" pin="O"/>
<pinref part="NAND3_6" gate="G$1" pin="I1"/>
<wire x1="266.7" y1="76.2" x2="279.4" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="NAND3_6" gate="G$1" pin="I2"/>
<pinref part="NAND3_4" gate="G$1" pin="O"/>
<wire x1="281.94" y1="76.2" x2="281.94" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="NAND3_6" gate="G$1" pin="A"/>
<pinref part="NAND4_5" gate="G$1" pin="O"/>
<wire x1="284.48" y1="76.2" x2="297.18" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="NAND2_9" gate="G$1" pin="O"/>
<pinref part="NAND2_7" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="NAND3_7" gate="G$1" pin="I1"/>
<pinref part="NOR3_5" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="NAND3_7" gate="G$1" pin="O"/>
<wire x1="195.58" y1="53.34" x2="195.58" y2="22.86" width="0.1524" layer="91"/>
<pinref part="NAND2_7" gate="G$1" pin="I1"/>
<wire x1="195.58" y1="22.86" x2="203.2" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
