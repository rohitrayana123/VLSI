<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.3">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
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
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
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
<package name="6PIN">
<pad name="P$1" x="-2.54" y="1.27" drill="0.8" shape="square"/>
<pad name="P$2" x="0" y="1.27" drill="0.8" shape="square"/>
<pad name="P$3" x="2.54" y="1.27" drill="0.8" shape="square"/>
<pad name="P$4" x="2.54" y="-1.27" drill="0.8" shape="square"/>
<pad name="P$5" x="0" y="-1.27" drill="0.8" shape="square"/>
<pad name="P$6" x="-2.54" y="-1.27" drill="0.8" shape="square"/>
</package>
<package name="3PIN">
<pad name="P$1" x="-2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$2" x="2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$3" x="0" y="-2.54" drill="0.8" shape="square"/>
</package>
</packages>
<symbols>
<symbol name="SCANREG">
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="-7.62" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-17.78" x2="7.62" y2="-17.78" width="0.254" layer="94"/>
<wire x1="7.62" y1="-17.78" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<pin name="CLOCK" x="-12.7" y="-10.16" visible="off" length="middle" function="clk"/>
<pin name="NRESET" x="-12.7" y="-15.24" visible="off" length="middle" function="dot"/>
<pin name="NQ" x="12.7" y="2.54" visible="off" length="middle" function="dot" rot="R180"/>
<pin name="Q" x="12.7" y="5.08" visible="off" length="middle" rot="R180"/>
<pin name="D" x="-12.7" y="5.08" visible="off" length="middle"/>
<pin name="LOAD" x="-12.7" y="0" visible="off" length="middle"/>
<text x="-6.858" y="8.89" size="1.778" layer="95" font="vector">&gt;Name</text>
<text x="-5.08" y="5.08" size="1.778" layer="94" font="vector" ratio="10">D</text>
<text x="5.08" y="5.08" size="1.778" layer="94" font="vector" ratio="10" align="bottom-right">Q</text>
<text x="-5.08" y="0" size="1.778" layer="94" font="vector" ratio="10">Load</text>
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
<deviceset name="SCANREG" prefix="SCANREG_">
<gates>
<gate name="G$1" symbol="SCANREG" x="0" y="0"/>
</gates>
<devices>
<device name="" package="6PIN">
<connects>
<connect gate="G$1" pin="CLOCK" pad="P$1"/>
<connect gate="G$1" pin="D" pad="P$2"/>
<connect gate="G$1" pin="LOAD" pad="P$3"/>
<connect gate="G$1" pin="NQ" pad="P$4"/>
<connect gate="G$1" pin="NRESET" pad="P$5"/>
<connect gate="G$1" pin="Q" pad="P$6"/>
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
<part name="SCANREG_0" library="c035u" deviceset="SCANREG" device=""/>
<part name="TRISBUF_1" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_0" library="c035u" deviceset="TRISBUF" device=""/>
<part name="SCANREG_1" library="c035u" deviceset="SCANREG" device=""/>
<part name="TRISBUF_2" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_3" library="c035u" deviceset="TRISBUF" device=""/>
<part name="SCANREG_2" library="c035u" deviceset="SCANREG" device=""/>
<part name="TRISBUF_4" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_5" library="c035u" deviceset="TRISBUF" device=""/>
<part name="SCANREG_3" library="c035u" deviceset="SCANREG" device=""/>
<part name="TRISBUF_6" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_7" library="c035u" deviceset="TRISBUF" device=""/>
<part name="SCANREG_4" library="c035u" deviceset="SCANREG" device=""/>
<part name="TRISBUF_8" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_9" library="c035u" deviceset="TRISBUF" device=""/>
<part name="SCANREG_5" library="c035u" deviceset="SCANREG" device=""/>
<part name="SCANREG_6" library="c035u" deviceset="SCANREG" device=""/>
<part name="SCANREG_7" library="c035u" deviceset="SCANREG" device=""/>
<part name="TRISBUF_10" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_11" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_12" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_13" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_14" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_15" library="c035u" deviceset="TRISBUF" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="SCANREG_0" gate="G$1" x="17.78" y="38.1"/>
<instance part="TRISBUF_1" gate="G$1" x="60.96" y="27.94" rot="R270"/>
<instance part="TRISBUF_0" gate="G$1" x="43.18" y="27.94" rot="R270"/>
<instance part="SCANREG_1" gate="G$1" x="86.36" y="38.1"/>
<instance part="TRISBUF_2" gate="G$1" x="129.54" y="27.94" rot="R270"/>
<instance part="TRISBUF_3" gate="G$1" x="111.76" y="27.94" rot="R270"/>
<instance part="SCANREG_2" gate="G$1" x="152.4" y="38.1"/>
<instance part="TRISBUF_4" gate="G$1" x="195.58" y="27.94" rot="R270"/>
<instance part="TRISBUF_5" gate="G$1" x="177.8" y="27.94" rot="R270"/>
<instance part="SCANREG_3" gate="G$1" x="220.98" y="38.1"/>
<instance part="TRISBUF_6" gate="G$1" x="264.16" y="27.94" rot="R270"/>
<instance part="TRISBUF_7" gate="G$1" x="246.38" y="27.94" rot="R270"/>
<instance part="SCANREG_4" gate="G$1" x="17.78" y="-35.56"/>
<instance part="TRISBUF_8" gate="G$1" x="43.18" y="-10.16" rot="MR90"/>
<instance part="TRISBUF_9" gate="G$1" x="60.96" y="-10.16" rot="MR90"/>
<instance part="SCANREG_5" gate="G$1" x="86.36" y="-35.56"/>
<instance part="SCANREG_6" gate="G$1" x="152.4" y="-35.56"/>
<instance part="SCANREG_7" gate="G$1" x="218.44" y="-35.56"/>
<instance part="TRISBUF_10" gate="G$1" x="111.76" y="-10.16" rot="MR90"/>
<instance part="TRISBUF_11" gate="G$1" x="129.54" y="-10.16" rot="MR90"/>
<instance part="TRISBUF_12" gate="G$1" x="177.8" y="-10.16" rot="MR90"/>
<instance part="TRISBUF_13" gate="G$1" x="195.58" y="-10.16" rot="MR90"/>
<instance part="TRISBUF_14" gate="G$1" x="246.38" y="-10.16" rot="MR90"/>
<instance part="TRISBUF_15" gate="G$1" x="264.16" y="-10.16" rot="MR90"/>
</instances>
<busses>
<bus name="RS1">
<segment>
<wire x1="40.64" y1="10.16" x2="274.32" y2="10.16" width="0.762" layer="92"/>
<label x="271.78" y="12.7" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="RS2">
<segment>
<wire x1="58.42" y1="7.62" x2="274.32" y2="7.62" width="0.762" layer="92"/>
<label x="271.78" y="2.54" size="1.778" layer="95"/>
</segment>
</bus>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="SCANREG_0" gate="G$1" pin="Q"/>
<pinref part="TRISBUF_1" gate="G$1" pin="I"/>
<wire x1="30.48" y1="43.18" x2="43.18" y2="43.18" width="0.1524" layer="91"/>
<wire x1="43.18" y1="43.18" x2="60.96" y2="43.18" width="0.1524" layer="91"/>
<wire x1="60.96" y1="43.18" x2="60.96" y2="40.64" width="0.1524" layer="91"/>
<pinref part="TRISBUF_0" gate="G$1" pin="I"/>
<wire x1="43.18" y1="40.64" x2="43.18" y2="43.18" width="0.1524" layer="91"/>
<junction x="43.18" y="43.18"/>
</segment>
</net>
<net name="DATAIN" class="0">
<segment>
<pinref part="SCANREG_1" gate="G$1" pin="D"/>
<wire x1="73.66" y1="43.18" x2="73.66" y2="55.88" width="0.1524" layer="91"/>
<pinref part="SCANREG_0" gate="G$1" pin="D"/>
<wire x1="5.08" y1="43.18" x2="5.08" y2="55.88" width="0.1524" layer="91"/>
<wire x1="5.08" y1="55.88" x2="-2.54" y2="55.88" width="0.1524" layer="91"/>
<label x="-10.16" y="55.88" size="1.778" layer="95"/>
<wire x1="-2.54" y1="55.88" x2="-10.16" y2="55.88" width="0.1524" layer="91"/>
<wire x1="73.66" y1="55.88" x2="5.08" y2="55.88" width="0.1524" layer="91"/>
<junction x="5.08" y="55.88"/>
<pinref part="SCANREG_3" gate="G$1" pin="D"/>
<wire x1="208.28" y1="43.18" x2="208.28" y2="55.88" width="0.1524" layer="91"/>
<pinref part="SCANREG_2" gate="G$1" pin="D"/>
<wire x1="139.7" y1="43.18" x2="139.7" y2="55.88" width="0.1524" layer="91"/>
<wire x1="208.28" y1="55.88" x2="139.7" y2="55.88" width="0.1524" layer="91"/>
<wire x1="73.66" y1="55.88" x2="139.7" y2="55.88" width="0.1524" layer="91"/>
<junction x="73.66" y="55.88"/>
<junction x="139.7" y="55.88"/>
<wire x1="-2.54" y1="-20.32" x2="5.08" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="5.08" y1="-20.32" x2="73.66" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-20.32" x2="139.7" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="139.7" y1="-20.32" x2="205.74" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="55.88" x2="-2.54" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="SCANREG_4" gate="G$1" pin="D"/>
<wire x1="5.08" y1="-30.48" x2="5.08" y2="-20.32" width="0.1524" layer="91"/>
<junction x="5.08" y="-20.32"/>
<pinref part="SCANREG_7" gate="G$1" pin="D"/>
<wire x1="205.74" y1="-20.32" x2="205.74" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="SCANREG_6" gate="G$1" pin="D"/>
<wire x1="139.7" y1="-30.48" x2="139.7" y2="-20.32" width="0.1524" layer="91"/>
<junction x="139.7" y="-20.32"/>
<pinref part="SCANREG_5" gate="G$1" pin="D"/>
<wire x1="73.66" y1="-30.48" x2="73.66" y2="-20.32" width="0.1524" layer="91"/>
<junction x="73.66" y="-20.32"/>
</segment>
</net>
<net name="RW0" class="0">
<segment>
<pinref part="SCANREG_0" gate="G$1" pin="LOAD"/>
<wire x1="5.08" y1="38.1" x2="2.54" y2="38.1" width="0.1524" layer="91"/>
<wire x1="2.54" y1="38.1" x2="2.54" y2="71.12" width="0.1524" layer="91"/>
<label x="2.54" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS1_0" class="0">
<segment>
<wire x1="38.1" y1="30.48" x2="33.02" y2="30.48" width="0.1524" layer="91"/>
<wire x1="33.02" y1="30.48" x2="33.02" y2="71.12" width="0.1524" layer="91"/>
<label x="33.02" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2_0" class="0">
<segment>
<wire x1="55.88" y1="30.48" x2="52.07" y2="30.48" width="0.1524" layer="91"/>
<wire x1="52.07" y1="30.48" x2="50.8" y2="30.48" width="0.1524" layer="91"/>
<wire x1="50.8" y1="30.48" x2="50.8" y2="71.12" width="0.1524" layer="91"/>
<label x="50.8" y="71.12" size="1.778" layer="95"/>
<pinref part="TRISBUF_1" gate="G$1" pin="P$1"/>
<junction x="52.07" y="30.48"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="SCANREG_1" gate="G$1" pin="Q"/>
<pinref part="TRISBUF_2" gate="G$1" pin="I"/>
<wire x1="99.06" y1="43.18" x2="111.76" y2="43.18" width="0.1524" layer="91"/>
<wire x1="111.76" y1="43.18" x2="129.54" y2="43.18" width="0.1524" layer="91"/>
<wire x1="129.54" y1="43.18" x2="129.54" y2="40.64" width="0.1524" layer="91"/>
<pinref part="TRISBUF_3" gate="G$1" pin="I"/>
<wire x1="111.76" y1="40.64" x2="111.76" y2="43.18" width="0.1524" layer="91"/>
<junction x="111.76" y="43.18"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="SCANREG_2" gate="G$1" pin="Q"/>
<pinref part="TRISBUF_4" gate="G$1" pin="I"/>
<wire x1="165.1" y1="43.18" x2="177.8" y2="43.18" width="0.1524" layer="91"/>
<wire x1="177.8" y1="43.18" x2="195.58" y2="43.18" width="0.1524" layer="91"/>
<wire x1="195.58" y1="43.18" x2="195.58" y2="40.64" width="0.1524" layer="91"/>
<pinref part="TRISBUF_5" gate="G$1" pin="I"/>
<wire x1="177.8" y1="40.64" x2="177.8" y2="43.18" width="0.1524" layer="91"/>
<junction x="177.8" y="43.18"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="SCANREG_3" gate="G$1" pin="Q"/>
<pinref part="TRISBUF_6" gate="G$1" pin="I"/>
<wire x1="233.68" y1="43.18" x2="246.38" y2="43.18" width="0.1524" layer="91"/>
<wire x1="246.38" y1="43.18" x2="264.16" y2="43.18" width="0.1524" layer="91"/>
<wire x1="264.16" y1="43.18" x2="264.16" y2="40.64" width="0.1524" layer="91"/>
<pinref part="TRISBUF_7" gate="G$1" pin="I"/>
<wire x1="246.38" y1="40.64" x2="246.38" y2="43.18" width="0.1524" layer="91"/>
<junction x="246.38" y="43.18"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="SCANREG_4" gate="G$1" pin="Q"/>
<pinref part="TRISBUF_9" gate="G$1" pin="I"/>
<wire x1="30.48" y1="-30.48" x2="43.18" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="43.18" y1="-30.48" x2="60.96" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-30.48" x2="60.96" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="TRISBUF_8" gate="G$1" pin="I"/>
<wire x1="43.18" y1="-22.86" x2="43.18" y2="-30.48" width="0.1524" layer="91"/>
<junction x="43.18" y="-30.48"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="SCANREG_5" gate="G$1" pin="Q"/>
<wire x1="99.06" y1="-30.48" x2="111.76" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-30.48" x2="129.54" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="129.54" y1="-30.48" x2="129.54" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="TRISBUF_11" gate="G$1" pin="I"/>
<pinref part="TRISBUF_10" gate="G$1" pin="I"/>
<wire x1="111.76" y1="-22.86" x2="111.76" y2="-30.48" width="0.1524" layer="91"/>
<junction x="111.76" y="-30.48"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="SCANREG_6" gate="G$1" pin="Q"/>
<pinref part="TRISBUF_13" gate="G$1" pin="I"/>
<wire x1="165.1" y1="-30.48" x2="177.8" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-30.48" x2="195.58" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-30.48" x2="195.58" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="TRISBUF_12" gate="G$1" pin="I"/>
<wire x1="177.8" y1="-22.86" x2="177.8" y2="-30.48" width="0.1524" layer="91"/>
<junction x="177.8" y="-30.48"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="SCANREG_7" gate="G$1" pin="Q"/>
<pinref part="TRISBUF_14" gate="G$1" pin="I"/>
<wire x1="231.14" y1="-30.48" x2="246.38" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="246.38" y1="-30.48" x2="246.38" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="246.38" y1="-30.48" x2="264.16" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="264.16" y1="-30.48" x2="264.16" y2="-20.32" width="0.1524" layer="91"/>
<junction x="246.38" y="-30.48"/>
</segment>
</net>
<net name="B$2" class="0">
<segment>
<pinref part="TRISBUF_1" gate="G$1" pin="O"/>
<wire x1="60.96" y1="15.24" x2="60.96" y2="10.16" width="0.1524" layer="91"/>
<wire x1="60.96" y1="10.16" x2="63.5" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_9" gate="G$1" pin="O"/>
<wire x1="60.96" y1="2.54" x2="60.96" y2="5.08" width="0.1524" layer="91"/>
<wire x1="60.96" y1="5.08" x2="58.42" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_11" gate="G$1" pin="O"/>
<wire x1="129.54" y1="2.54" x2="129.54" y2="5.08" width="0.1524" layer="91"/>
<wire x1="129.54" y1="5.08" x2="127" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_2" gate="G$1" pin="O"/>
<wire x1="129.54" y1="15.24" x2="129.54" y2="10.16" width="0.1524" layer="91"/>
<wire x1="129.54" y1="10.16" x2="132.08" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_13" gate="G$1" pin="O"/>
<wire x1="195.58" y1="2.54" x2="195.58" y2="5.08" width="0.1524" layer="91"/>
<wire x1="195.58" y1="5.08" x2="193.04" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_4" gate="G$1" pin="O"/>
<wire x1="195.58" y1="15.24" x2="195.58" y2="10.16" width="0.1524" layer="91"/>
<wire x1="195.58" y1="10.16" x2="198.12" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_6" gate="G$1" pin="O"/>
<wire x1="264.16" y1="15.24" x2="264.16" y2="10.16" width="0.1524" layer="91"/>
<wire x1="264.16" y1="10.16" x2="266.7" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_15" gate="G$1" pin="O"/>
<wire x1="264.16" y1="2.54" x2="264.16" y2="5.08" width="0.1524" layer="91"/>
<wire x1="264.16" y1="5.08" x2="261.62" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="B$1" class="0">
<segment>
<pinref part="TRISBUF_8" gate="G$1" pin="O"/>
<wire x1="43.18" y1="2.54" x2="43.18" y2="7.62" width="0.1524" layer="91"/>
<wire x1="43.18" y1="7.62" x2="40.64" y2="10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_0" gate="G$1" pin="O"/>
<wire x1="43.18" y1="15.24" x2="43.18" y2="12.7" width="0.1524" layer="91"/>
<wire x1="43.18" y1="12.7" x2="45.72" y2="10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_10" gate="G$1" pin="O"/>
<wire x1="111.76" y1="2.54" x2="111.76" y2="7.62" width="0.1524" layer="91"/>
<wire x1="111.76" y1="7.62" x2="109.22" y2="10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_3" gate="G$1" pin="O"/>
<wire x1="111.76" y1="15.24" x2="111.76" y2="12.7" width="0.1524" layer="91"/>
<wire x1="111.76" y1="12.7" x2="114.3" y2="10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_5" gate="G$1" pin="O"/>
<wire x1="177.8" y1="15.24" x2="177.8" y2="12.7" width="0.1524" layer="91"/>
<wire x1="177.8" y1="12.7" x2="180.34" y2="10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_12" gate="G$1" pin="O"/>
<wire x1="177.8" y1="2.54" x2="177.8" y2="7.62" width="0.1524" layer="91"/>
<wire x1="177.8" y1="7.62" x2="175.26" y2="10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_14" gate="G$1" pin="O"/>
<wire x1="246.38" y1="2.54" x2="246.38" y2="7.62" width="0.1524" layer="91"/>
<wire x1="246.38" y1="7.62" x2="243.84" y2="10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_7" gate="G$1" pin="O"/>
<wire x1="246.38" y1="15.24" x2="246.38" y2="12.7" width="0.1524" layer="91"/>
<wire x1="246.38" y1="12.7" x2="248.92" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="RW1" class="0">
<segment>
<pinref part="SCANREG_1" gate="G$1" pin="LOAD"/>
<wire x1="73.66" y1="38.1" x2="71.12" y2="38.1" width="0.1524" layer="91"/>
<wire x1="71.12" y1="38.1" x2="71.12" y2="71.12" width="0.1524" layer="91"/>
<label x="71.12" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS1_1" class="0">
<segment>
<wire x1="104.14" y1="30.48" x2="101.6" y2="30.48" width="0.1524" layer="91"/>
<wire x1="101.6" y1="30.48" x2="101.6" y2="71.12" width="0.1524" layer="91"/>
<label x="101.6" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2_1" class="0">
<segment>
<wire x1="120.65" y1="30.48" x2="119.38" y2="30.48" width="0.1524" layer="91"/>
<wire x1="119.38" y1="30.48" x2="119.38" y2="71.12" width="0.1524" layer="91"/>
<label x="119.38" y="71.12" size="1.778" layer="95"/>
<pinref part="TRISBUF_2" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="RW2" class="0">
<segment>
<pinref part="SCANREG_2" gate="G$1" pin="LOAD"/>
<wire x1="139.7" y1="38.1" x2="137.16" y2="38.1" width="0.1524" layer="91"/>
<wire x1="137.16" y1="38.1" x2="137.16" y2="71.12" width="0.1524" layer="91"/>
<label x="137.16" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS1_2" class="0">
<segment>
<wire x1="172.72" y1="30.48" x2="167.64" y2="30.48" width="0.1524" layer="91"/>
<wire x1="167.64" y1="30.48" x2="167.64" y2="71.12" width="0.1524" layer="91"/>
<label x="167.64" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2_2" class="0">
<segment>
<wire x1="190.5" y1="30.48" x2="186.69" y2="30.48" width="0.1524" layer="91"/>
<wire x1="186.69" y1="30.48" x2="185.42" y2="30.48" width="0.1524" layer="91"/>
<wire x1="185.42" y1="30.48" x2="185.42" y2="71.12" width="0.1524" layer="91"/>
<label x="185.42" y="71.12" size="1.778" layer="95"/>
<pinref part="TRISBUF_4" gate="G$1" pin="P$1"/>
<junction x="186.69" y="30.48"/>
</segment>
</net>
<net name="RW3" class="0">
<segment>
<pinref part="SCANREG_3" gate="G$1" pin="LOAD"/>
<wire x1="208.28" y1="38.1" x2="205.74" y2="38.1" width="0.1524" layer="91"/>
<wire x1="205.74" y1="38.1" x2="205.74" y2="71.12" width="0.1524" layer="91"/>
<label x="205.74" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS1_3" class="0">
<segment>
<wire x1="238.76" y1="30.48" x2="236.22" y2="30.48" width="0.1524" layer="91"/>
<wire x1="236.22" y1="30.48" x2="236.22" y2="71.12" width="0.1524" layer="91"/>
<label x="236.22" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2_3" class="0">
<segment>
<wire x1="255.27" y1="30.48" x2="254" y2="30.48" width="0.1524" layer="91"/>
<wire x1="254" y1="30.48" x2="254" y2="71.12" width="0.1524" layer="91"/>
<label x="254" y="71.12" size="1.778" layer="95"/>
<pinref part="TRISBUF_6" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="RS1_4" class="0">
<segment>
<wire x1="35.56" y1="-12.7" x2="33.02" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-12.7" x2="33.02" y2="-60.96" width="0.1524" layer="91"/>
<label x="33.02" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2_4" class="0">
<segment>
<wire x1="53.34" y1="-12.7" x2="50.8" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="50.8" y1="-12.7" x2="50.8" y2="-60.96" width="0.1524" layer="91"/>
<label x="50.8" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RW4" class="0">
<segment>
<pinref part="SCANREG_4" gate="G$1" pin="LOAD"/>
<wire x1="5.08" y1="-35.56" x2="2.54" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="2.54" y1="-35.56" x2="2.54" y2="-60.96" width="0.1524" layer="91"/>
<label x="2.54" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RW5" class="0">
<segment>
<pinref part="SCANREG_5" gate="G$1" pin="LOAD"/>
<wire x1="73.66" y1="-35.56" x2="71.12" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-35.56" x2="71.12" y2="-60.96" width="0.1524" layer="91"/>
<label x="71.12" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS1_5" class="0">
<segment>
<wire x1="106.68" y1="-12.7" x2="101.6" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="101.6" y1="-12.7" x2="101.6" y2="-60.96" width="0.1524" layer="91"/>
<label x="101.6" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2_5" class="0">
<segment>
<wire x1="121.92" y1="-12.7" x2="119.38" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="119.38" y1="-12.7" x2="119.38" y2="-60.96" width="0.1524" layer="91"/>
<label x="119.38" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RW6" class="0">
<segment>
<pinref part="SCANREG_6" gate="G$1" pin="LOAD"/>
<wire x1="139.7" y1="-35.56" x2="137.16" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="137.16" y1="-35.56" x2="137.16" y2="-60.96" width="0.1524" layer="91"/>
<label x="137.16" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS1_6" class="0">
<segment>
<wire x1="170.18" y1="-12.7" x2="167.64" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="167.64" y1="-12.7" x2="167.64" y2="-60.96" width="0.1524" layer="91"/>
<label x="167.64" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2_6" class="0">
<segment>
<wire x1="187.96" y1="-12.7" x2="185.42" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="185.42" y1="-12.7" x2="185.42" y2="-60.96" width="0.1524" layer="91"/>
<label x="185.42" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RW7" class="0">
<segment>
<pinref part="SCANREG_7" gate="G$1" pin="LOAD"/>
<wire x1="205.74" y1="-35.56" x2="203.2" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="203.2" y1="-35.56" x2="203.2" y2="-60.96" width="0.1524" layer="91"/>
<label x="203.2" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS1_7" class="0">
<segment>
<wire x1="238.76" y1="-12.7" x2="236.22" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="236.22" y1="-12.7" x2="236.22" y2="-60.96" width="0.1524" layer="91"/>
<label x="236.22" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2_7" class="0">
<segment>
<wire x1="256.54" y1="-12.7" x2="254" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="254" y1="-12.7" x2="254" y2="-60.96" width="0.1524" layer="91"/>
<label x="254" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
