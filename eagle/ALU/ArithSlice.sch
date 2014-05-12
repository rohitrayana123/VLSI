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
<package name="5PIN">
<pad name="P$1" x="0" y="0" drill="0.8" shape="square"/>
<pad name="P$2" x="2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$3" x="2.54" y="-2.54" drill="0.8" shape="square"/>
<pad name="P$4" x="0" y="-2.54" drill="0.8" shape="square"/>
<pad name="P$5" x="1.27" y="-1.27" drill="0.8" shape="square"/>
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
<symbol name="FULLADDER">
<wire x1="-7.62" y1="-7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<text x="-1.524" y="-0.762" size="2.794" layer="94" font="vector" ratio="12">FA</text>
<pin name="CIN" x="0" y="-12.7" visible="off" length="middle" rot="R90"/>
<pin name="S" x="12.7" y="0" visible="off" length="middle" rot="R180"/>
<pin name="COUT" x="0" y="12.7" visible="off" length="middle" rot="R270"/>
<pin name="A" x="-12.7" y="2.54" visible="off" length="middle"/>
<pin name="B" x="-12.7" y="-2.54" visible="off" length="middle"/>
<text x="-5.842" y="2.032" size="1.778" layer="94" font="vector" ratio="10">A</text>
<text x="-5.842" y="-3.302" size="1.778" layer="94" font="vector" ratio="10">B</text>
<text x="4.826" y="-0.762" size="1.778" layer="94" font="vector" ratio="10">S</text>
<text x="-2.54" y="5.08" size="1.778" layer="94" font="vector" ratio="10">Cout</text>
<text x="-1.778" y="-6.604" size="1.778" layer="94" font="vector" ratio="10">Cin</text>
<text x="2.54" y="10.16" size="1.778" layer="95" font="vector">&gt;Name</text>
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
<deviceset name="FULLADDER" prefix="FA_">
<gates>
<gate name="G$1" symbol="FULLADDER" x="0" y="0"/>
</gates>
<devices>
<device name="" package="5PIN">
<connects>
<connect gate="G$1" pin="A" pad="P$1"/>
<connect gate="G$1" pin="B" pad="P$2"/>
<connect gate="G$1" pin="CIN" pad="P$3"/>
<connect gate="G$1" pin="COUT" pad="P$4"/>
<connect gate="G$1" pin="S" pad="P$5"/>
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
<part name="AND2_1" library="c035u" deviceset="AND2" device=""/>
<part name="XOR2_1" library="c035u" deviceset="XOR2" device=""/>
<part name="FA_1" library="c035u" deviceset="FULLADDER" device=""/>
<part name="OR2_1" library="c035u" deviceset="OR2" device=""/>
<part name="TRISBUF_1" library="c035u" deviceset="TRISBUF" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-20.32" y="139.7" size="1.778" layer="95">A</text>
<text x="-20.32" y="137.16" size="1.778" layer="95">B</text>
<text x="-20.32" y="86.36" size="1.778" layer="95">ALUBus</text>
<text x="-12.7" y="99.06" size="1.778" layer="95">SUB</text>
<text x="-19.304" y="111.76" size="1.778" layer="95">ZeroA</text>
<text x="27.94" y="142.24" size="1.778" layer="95">COut</text>
<text x="27.94" y="83.82" size="1.778" layer="95" rot="R180">CIn</text>
<text x="55.88" y="83.82" size="1.778" layer="95">Zprev</text>
<text x="48.26" y="142.24" size="1.778" layer="95">nZ</text>
<text x="40.64" y="142.24" size="1.778" layer="95">Sum</text>
<text x="17.78" y="142.24" size="1.778" layer="95">prevCin</text>
<text x="35.56" y="101.6" size="1.778" layer="95">FAOut</text>
</plain>
<instances>
<instance part="AND2_1" gate="G$1" x="7.62" y="114.3"/>
<instance part="XOR2_1" gate="G$1" x="2.54" y="101.6"/>
<instance part="FA_1" gate="G$1" x="27.94" y="111.76"/>
<instance part="OR2_1" gate="G$1" x="48.26" y="124.46" rot="R90"/>
<instance part="TRISBUF_1" gate="G$1" x="48.26" y="99.06" rot="R270"/>
</instances>
<busses>
<bus name="B$1">
<segment>
<wire x1="-20.32" y1="86.36" x2="58.42" y2="86.36" width="0.1524" layer="92"/>
</segment>
</bus>
</busses>
<nets>
<net name="N$13" class="0">
<segment>
<pinref part="AND2_1" gate="G$1" pin="O"/>
<pinref part="FA_1" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="15.24" y1="109.22" x2="15.24" y2="101.6" width="0.1524" layer="91"/>
<pinref part="XOR2_1" gate="G$1" pin="O"/>
<pinref part="FA_1" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="XOR2_1" gate="G$1" pin="I1"/>
<wire x1="-10.16" y1="99.06" x2="-12.7" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="FA_1" gate="G$1" pin="COUT"/>
<wire x1="27.94" y1="124.46" x2="27.94" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="40.64" y1="111.76" x2="40.64" y2="142.24" width="0.1524" layer="91"/>
<pinref part="FA_1" gate="G$1" pin="S"/>
<pinref part="TRISBUF_1" gate="G$1" pin="I"/>
<pinref part="OR2_1" gate="G$1" pin="I0"/>
<wire x1="48.26" y1="111.76" x2="45.72" y2="111.76" width="0.1524" layer="91"/>
<wire x1="40.64" y1="111.76" x2="45.72" y2="111.76" width="0.1524" layer="91"/>
<junction x="45.72" y="111.76"/>
<junction x="40.64" y="111.76"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="50.8" y1="111.76" x2="55.88" y2="111.76" width="0.1524" layer="91"/>
<wire x1="55.88" y1="111.76" x2="55.88" y2="83.82" width="0.1524" layer="91"/>
<pinref part="OR2_1" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="48.26" y1="137.16" x2="48.26" y2="142.24" width="0.1524" layer="91"/>
<pinref part="OR2_1" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="-7.62" y1="111.76" x2="-18.796" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="XOR2_1" gate="G$1" pin="I0"/>
<wire x1="-10.16" y1="104.14" x2="-10.16" y2="137.16" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="137.16" x2="-10.16" y2="137.16" width="0.1524" layer="91"/>
<junction x="-10.16" y="137.16"/>
<wire x1="-10.16" y1="137.16" x2="55.88" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="AND2_1" gate="G$1" pin="A"/>
<wire x1="-7.62" y1="116.84" x2="-7.62" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="139.7" x2="-7.62" y2="139.7" width="0.1524" layer="91"/>
<junction x="-7.62" y="139.7"/>
<wire x1="-7.62" y1="139.7" x2="55.88" y2="139.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="FA_1" gate="G$1" pin="CIN"/>
<wire x1="27.94" y1="99.06" x2="27.94" y2="83.82" width="0.1524" layer="91"/>
<wire x1="27.94" y1="99.06" x2="17.78" y2="99.06" width="0.1524" layer="91"/>
<wire x1="17.78" y1="99.06" x2="17.78" y2="142.24" width="0.1524" layer="91"/>
<junction x="27.94" y="99.06"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="35.56" y1="101.6" x2="39.37" y2="101.6" width="0.1524" layer="91"/>
<pinref part="TRISBUF_1" gate="G$1" pin="P$1"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
