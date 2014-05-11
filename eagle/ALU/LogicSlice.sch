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
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
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
</packages>
<symbols>
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
<symbol name="OR2">
<wire x1="-1.27" y1="5.08" x2="-7.62" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-6.096" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-2.54" x2="-6.096" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.2446" y1="-5.0678" x2="7.5439" y2="0.0507" width="0.4064" layer="94" curve="60.147106" cap="flat"/>
<wire x1="-1.2446" y1="5.0678" x2="7.5442" y2="-0.0505" width="0.4064" layer="94" curve="-60.148802" cap="flat"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94" curve="-90"/>
<text x="-7.62" y="5.715" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="O" x="12.7" y="0" visible="off" length="middle" direction="out" rot="R180"/>
<pin name="I0" x="-12.7" y="2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-12.7" y="-2.54" visible="off" length="middle" direction="in" swaplevel="1"/>
</symbol>
<symbol name="TRISBUF">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="I" x="-12.7" y="0" visible="off" direction="in"/>
<pin name="O" x="12.7" y="0" visible="off" direction="oc" rot="R180"/>
<pin name="P$1" x="-2.54" y="-8.89" visible="off" length="middle" rot="R90"/>
</symbol>
<symbol name="INV">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="I" x="-10.16" y="0" visible="off" length="middle" direction="in"/>
<pin name="O" x="10.16" y="0" visible="off" length="middle" direction="oc" function="dot" rot="R180"/>
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
</symbols>
<devicesets>
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
<deviceset name="OR2" prefix="OR2_">
<gates>
<gate name="G$1" symbol="OR2" x="0" y="0"/>
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
<deviceset name="TRISBUF" prefix="TRISBUF_">
<gates>
<gate name="G$1" symbol="TRISBUF" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3PIN">
<connects>
<connect gate="G$1" pin="I" pad="P$1"/>
<connect gate="G$1" pin="O" pad="P$2"/>
<connect gate="G$1" pin="P$1" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
<part name="AND2_2" library="c035u" deviceset="AND2" device=""/>
<part name="TRISBUF_2" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_3" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_4" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_5" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_6" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_7" library="c035u" deviceset="TRISBUF" device=""/>
<part name="OR2_2" library="c035u" deviceset="OR2" device=""/>
<part name="XOR2_2" library="c035u" deviceset="XOR2" device=""/>
<part name="INV_1" library="c035u" deviceset="INV" device=""/>
<part name="NAND2_1" library="c035u" deviceset="NAND2" device=""/>
<part name="NOR2_1" library="c035u" deviceset="NOR2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="17.78" y="63.5" size="1.778" layer="95">ALUBus</text>
<wire x1="88.9" y1="89.916" x2="88.9" y2="88.9" width="0.1524" layer="94"/>
<wire x1="104.14" y1="89.916" x2="104.14" y2="88.9" width="0.1524" layer="94"/>
<text x="17.78" y="116.84" size="1.778" layer="95">A</text>
<text x="17.78" y="114.3" size="1.778" layer="95">B</text>
</plain>
<instances>
<instance part="AND2_2" gate="G$1" x="27.94" y="96.52" rot="R270"/>
<instance part="TRISBUF_2" gate="G$1" x="27.94" y="76.2" rot="R270"/>
<instance part="TRISBUF_3" gate="G$1" x="43.18" y="76.2" rot="R270"/>
<instance part="TRISBUF_4" gate="G$1" x="58.42" y="76.2" rot="R270"/>
<instance part="TRISBUF_5" gate="G$1" x="73.66" y="76.2" rot="R270"/>
<instance part="TRISBUF_6" gate="G$1" x="88.9" y="76.2" rot="R270"/>
<instance part="TRISBUF_7" gate="G$1" x="104.14" y="76.2" rot="R270"/>
<instance part="OR2_2" gate="G$1" x="43.18" y="101.6" rot="R270"/>
<instance part="XOR2_2" gate="G$1" x="58.42" y="101.6" rot="R270"/>
<instance part="INV_1" gate="G$1" x="73.66" y="99.06" rot="R270"/>
<instance part="NAND2_1" gate="G$1" x="88.9" y="96.52" rot="R270"/>
<instance part="NOR2_1" gate="G$1" x="104.14" y="101.6" rot="R270"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="TRISBUF_2" gate="G$1" pin="I"/>
<pinref part="AND2_2" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="TRISBUF_3" gate="G$1" pin="I"/>
<pinref part="OR2_2" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="TRISBUF_4" gate="G$1" pin="I"/>
<pinref part="XOR2_2" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="TRISBUF_5" gate="G$1" pin="I"/>
<pinref part="INV_1" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="TRISBUF_6" gate="G$1" pin="I"/>
<pinref part="NAND2_1" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="TRISBUF_7" gate="G$1" pin="I"/>
<pinref part="NOR2_1" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="17.78" y1="63.5" x2="111.76" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="17.78" y1="116.84" x2="25.4" y2="116.84" width="0.1524" layer="91"/>
<wire x1="25.4" y1="116.84" x2="40.64" y2="116.84" width="0.1524" layer="91"/>
<wire x1="40.64" y1="116.84" x2="55.88" y2="116.84" width="0.1524" layer="91"/>
<wire x1="55.88" y1="116.84" x2="73.66" y2="116.84" width="0.1524" layer="91"/>
<wire x1="73.66" y1="116.84" x2="91.44" y2="116.84" width="0.1524" layer="91"/>
<wire x1="91.44" y1="116.84" x2="106.68" y2="116.84" width="0.1524" layer="91"/>
<wire x1="106.68" y1="116.84" x2="109.22" y2="116.84" width="0.1524" layer="91"/>
<wire x1="109.22" y1="114.3" x2="106.68" y2="114.3" width="0.1524" layer="91"/>
<wire x1="106.68" y1="114.3" x2="86.36" y2="114.3" width="0.1524" layer="91"/>
<wire x1="86.36" y1="114.3" x2="55.88" y2="114.3" width="0.1524" layer="91"/>
<wire x1="55.88" y1="114.3" x2="40.64" y2="114.3" width="0.1524" layer="91"/>
<wire x1="40.64" y1="114.3" x2="30.48" y2="114.3" width="0.1524" layer="91"/>
<wire x1="30.48" y1="114.3" x2="17.78" y2="114.3" width="0.1524" layer="91"/>
<wire x1="106.68" y1="116.84" x2="106.68" y2="114.3" width="0.1524" layer="91"/>
<pinref part="NAND2_1" gate="G$1" pin="A"/>
<wire x1="91.44" y1="116.84" x2="91.44" y2="111.76" width="0.1524" layer="91"/>
<pinref part="NAND2_1" gate="G$1" pin="I1"/>
<wire x1="86.36" y1="114.3" x2="86.36" y2="111.76" width="0.1524" layer="91"/>
<pinref part="INV_1" gate="G$1" pin="I"/>
<wire x1="73.66" y1="116.84" x2="73.66" y2="109.22" width="0.1524" layer="91"/>
<pinref part="XOR2_2" gate="G$1" pin="I1"/>
<wire x1="55.88" y1="116.84" x2="55.88" y2="114.3" width="0.1524" layer="91"/>
<pinref part="OR2_2" gate="G$1" pin="I1"/>
<wire x1="40.64" y1="116.84" x2="40.64" y2="114.3" width="0.1524" layer="91"/>
<pinref part="AND2_2" gate="G$1" pin="I1"/>
<wire x1="25.4" y1="116.84" x2="25.4" y2="111.76" width="0.1524" layer="91"/>
<pinref part="AND2_2" gate="G$1" pin="A"/>
<wire x1="30.48" y1="114.3" x2="30.48" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
