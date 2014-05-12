<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.3">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
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
<package name="5PIN">
<pad name="P$1" x="0" y="0" drill="0.8" shape="square"/>
<pad name="P$2" x="2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$3" x="2.54" y="-2.54" drill="0.8" shape="square"/>
<pad name="P$4" x="0" y="-2.54" drill="0.8" shape="square"/>
<pad name="P$5" x="1.27" y="-1.27" drill="0.8" shape="square"/>
</package>
<package name="3PIN">
<pad name="P$1" x="-2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$2" x="2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$3" x="0" y="-2.54" drill="0.8" shape="square"/>
</package>
<package name="6PIN">
<pad name="P$1" x="-2.54" y="1.27" drill="0.8" shape="square"/>
<pad name="P$2" x="0" y="1.27" drill="0.8" shape="square"/>
<pad name="P$3" x="2.54" y="1.27" drill="0.8" shape="square"/>
<pad name="P$4" x="2.54" y="-1.27" drill="0.8" shape="square"/>
<pad name="P$5" x="0" y="-1.27" drill="0.8" shape="square"/>
<pad name="P$6" x="-2.54" y="-1.27" drill="0.8" shape="square"/>
</package>
</packages>
<symbols>
<symbol name="TIELOW">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<wire x1="-1.0922" y1="-0.508" x2="1.0922" y2="-0.508" width="0.254" layer="94"/>
<wire x1="-0.6223" y1="-1.016" x2="0.6223" y2="-1.016" width="0.254" layer="94"/>
<wire x1="-0.3048" y1="-1.524" x2="0.3302" y2="-1.524" width="0.254" layer="94"/>
<pin name="PE" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="MUX2">
<wire x1="-5.08" y1="-12.7" x2="-5.08" y2="12.7" width="0.254" layer="94"/>
<wire x1="-5.08" y1="12.7" x2="0" y2="7.62" width="0.254" layer="94"/>
<wire x1="0" y1="7.62" x2="0" y2="-7.62" width="0.254" layer="94"/>
<pin name="P$1" x="-10.16" y="5.08" visible="off" length="middle"/>
<pin name="P$2" x="-10.16" y="-5.08" visible="off" length="middle"/>
<pin name="P$3" x="5.08" y="0" visible="off" length="middle" rot="R180"/>
<pin name="P$4" x="-2.54" y="-17.78" visible="off" rot="R90"/>
<text x="-2.54" y="5.08" size="1.778" layer="94" font="vector" align="center">0</text>
<text x="-2.54" y="-5.08" size="1.778" layer="94" font="vector" align="center">1</text>
<text x="-2.54" y="10.16" size="1.778" layer="95" font="vector">&gt;Name</text>
<wire x1="-5.08" y1="-12.7" x2="0" y2="-7.62" width="0.254" layer="94"/>
</symbol>
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
<deviceset name="TIELOW">
<gates>
<gate name="G$1" symbol="TIELOW" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MUX2" prefix="MUX2_">
<gates>
<gate name="G$1" symbol="MUX2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="5PIN">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
<connect gate="G$1" pin="P$4" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
<part name="U$1" library="c035u" deviceset="TIELOW" device=""/>
<part name="MUX2_1" library="c035u" deviceset="MUX2" device=""/>
<part name="STATUS_REG" library="c035u" deviceset="SCANREG" device=""/>
<part name="TRISBUF_1" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_2" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_3" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_4" library="c035u" deviceset="TRISBUF" device=""/>
<part name="TRISBUF_5" library="c035u" deviceset="TRISBUF" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="-15.24" y1="-30.48" x2="38.1" y2="-30.48" width="0.4064" layer="94"/>
<wire x1="38.1" y1="-30.48" x2="38.1" y2="86.36" width="0.4064" layer="94"/>
<wire x1="38.1" y1="86.36" x2="-15.24" y2="86.36" width="0.4064" layer="94"/>
<text x="22.86" y="88.9" size="1.778" layer="95">CONTROL</text>
<text x="83.82" y="76.2" size="1.778" layer="95">ALU</text>
<wire x1="40.64" y1="-30.48" x2="106.68" y2="-30.48" width="0.4064" layer="94"/>
<wire x1="40.64" y1="-30.48" x2="40.64" y2="86.36" width="0.4064" layer="94"/>
<wire x1="73.66" y1="83.82" x2="78.74" y2="71.12" width="0.4064" layer="94"/>
<wire x1="78.74" y1="71.12" x2="93.98" y2="71.12" width="0.4064" layer="94"/>
<wire x1="93.98" y1="71.12" x2="99.06" y2="83.82" width="0.4064" layer="94"/>
<wire x1="73.66" y1="83.82" x2="83.82" y2="83.82" width="0.4064" layer="94"/>
<wire x1="83.82" y1="83.82" x2="86.36" y2="81.28" width="0.4064" layer="94"/>
<wire x1="88.9" y1="83.82" x2="86.36" y2="81.28" width="0.4064" layer="94"/>
<wire x1="88.9" y1="83.82" x2="99.06" y2="83.82" width="0.4064" layer="94"/>
<wire x1="40.64" y1="86.36" x2="106.68" y2="86.36" width="0.4064" layer="94"/>
<text x="45.72" y="88.9" size="1.778" layer="95">DATAPATH</text>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="58.42" y="-35.56"/>
<instance part="MUX2_1" gate="G$1" x="25.4" y="71.12" smashed="yes" rot="MR0"/>
<instance part="STATUS_REG" gate="G$1" x="20.32" y="7.62"/>
<instance part="TRISBUF_1" gate="G$1" x="73.66" y="-17.78" smashed="yes"/>
<instance part="TRISBUF_2" gate="G$1" x="73.66" y="0" smashed="yes"/>
<instance part="TRISBUF_3" gate="G$1" x="73.66" y="17.78" smashed="yes"/>
<instance part="TRISBUF_4" gate="G$1" x="73.66" y="35.56" smashed="yes"/>
<instance part="TRISBUF_5" gate="G$1" x="73.66" y="53.34" smashed="yes"/>
</instances>
<busses>
<bus name="15..4">
<segment>
<wire x1="83.82" y1="53.34" x2="104.14" y2="53.34" width="0.762" layer="92"/>
<label x="91.44" y="53.34" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="B$1">
<segment>
<wire x1="35.56" y1="66.04" x2="91.44" y2="66.04" width="0.762" layer="92"/>
</segment>
</bus>
<bus name="FLAGS">
<segment>
<wire x1="35.56" y1="76.2" x2="76.2" y2="76.2" width="0.762" layer="92"/>
<label x="48.26" y="78.74" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="STATUS_REG">
<segment>
<wire x1="43.18" y1="35.56" x2="43.18" y2="12.7" width="0.762" layer="92"/>
<wire x1="43.18" y1="12.7" x2="43.18" y2="-17.78" width="0.762" layer="92"/>
<wire x1="33.02" y1="12.7" x2="35.56" y2="12.7" width="0.762" layer="92"/>
<wire x1="35.56" y1="12.7" x2="43.18" y2="12.7" width="0.762" layer="92"/>
<wire x1="35.56" y1="12.7" x2="35.56" y2="-20.32" width="0.762" layer="92"/>
<wire x1="35.56" y1="-20.32" x2="-15.24" y2="-20.32" width="0.762" layer="92"/>
<label x="-15.24" y="-20.32" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="STATUS_REG_IN">
<segment>
<wire x1="20.32" y1="71.12" x2="0" y2="71.12" width="0.762" layer="92"/>
<wire x1="0" y1="71.12" x2="0" y2="12.7" width="0.762" layer="92"/>
<label x="0" y="73.66" size="1.778" layer="95"/>
<wire x1="0" y1="12.7" x2="7.62" y2="12.7" width="0.762" layer="92"/>
</segment>
</bus>
<bus name="B$3">
<segment>
<wire x1="58.42" y1="-33.02" x2="58.42" y2="53.34" width="0.762" layer="92"/>
<wire x1="58.42" y1="53.34" x2="60.96" y2="53.34" width="0.762" layer="92"/>
</segment>
</bus>
<bus name="SYSBUS">
<segment>
<wire x1="104.14" y1="76.2" x2="104.14" y2="-25.4" width="0.762" layer="92"/>
<label x="106.68" y="20.32" size="1.778" layer="95"/>
</segment>
</bus>
</busses>
<nets>
<net name="FLAG_Z" class="0">
<segment>
<wire x1="60.96" y1="-17.78" x2="43.18" y2="-17.78" width="0.1524" layer="91"/>
<label x="45.72" y="-17.78" size="1.778" layer="95"/>
<pinref part="TRISBUF_1" gate="G$1" pin="I"/>
</segment>
</net>
<net name="FLAG_C" class="0">
<segment>
<wire x1="60.96" y1="0" x2="43.18" y2="0" width="0.1524" layer="91"/>
<label x="45.72" y="0" size="1.778" layer="95"/>
<pinref part="TRISBUF_2" gate="G$1" pin="I"/>
</segment>
</net>
<net name="FLAG_V" class="0">
<segment>
<wire x1="60.96" y1="17.78" x2="43.18" y2="17.78" width="0.1524" layer="91"/>
<label x="45.72" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="FLAG_N" class="0">
<segment>
<wire x1="60.96" y1="35.56" x2="43.18" y2="35.56" width="0.1524" layer="91"/>
<label x="45.72" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="0" class="0">
<segment>
<wire x1="104.14" y1="66.04" x2="91.44" y2="66.04" width="0.1524" layer="91"/>
<label x="88.9" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="TRISBUF_4" gate="G$1" pin="O"/>
<wire x1="86.36" y1="35.56" x2="104.14" y2="35.56" width="0.1524" layer="91"/>
<label x="91.44" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="1" class="0">
<segment>
<wire x1="83.82" y1="58.42" x2="83.82" y2="66.04" width="0.1524" layer="91"/>
<label x="91.44" y="60.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="TRISBUF_3" gate="G$1" pin="O"/>
<wire x1="86.36" y1="17.78" x2="104.14" y2="17.78" width="0.1524" layer="91"/>
<label x="91.44" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="2" class="0">
<segment>
<wire x1="86.36" y1="60.96" x2="86.36" y2="66.04" width="0.1524" layer="91"/>
<label x="93.98" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="TRISBUF_2" gate="G$1" pin="O"/>
<wire x1="86.36" y1="0" x2="104.14" y2="0" width="0.1524" layer="91"/>
<label x="91.44" y="0" size="1.778" layer="95"/>
</segment>
</net>
<net name="3" class="0">
<segment>
<wire x1="88.9" y1="63.5" x2="88.9" y2="66.04" width="0.1524" layer="91"/>
<label x="96.52" y="66.04" size="1.778" layer="95"/>
<wire x1="88.9" y1="63.5" x2="104.14" y2="63.5" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TRISBUF_1" gate="G$1" pin="O"/>
<wire x1="86.36" y1="-17.78" x2="104.14" y2="-17.78" width="0.1524" layer="91"/>
<label x="91.44" y="-17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="FLAG_SEL" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$4"/>
<wire x1="27.94" y1="53.34" x2="27.94" y2="35.56" width="0.1524" layer="91"/>
<wire x1="27.94" y1="35.56" x2="-15.24" y2="35.56" width="0.1524" layer="91"/>
<label x="-15.24" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="NRESET" class="0">
<segment>
<pinref part="STATUS_REG" gate="G$1" pin="NRESET"/>
<wire x1="7.62" y1="-7.62" x2="-15.24" y2="-7.62" width="0.1524" layer="91"/>
<label x="-15.24" y="-7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="CLOCK" class="0">
<segment>
<pinref part="STATUS_REG" gate="G$1" pin="CLOCK"/>
<wire x1="7.62" y1="-2.54" x2="-15.24" y2="-2.54" width="0.1524" layer="91"/>
<label x="-15.24" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="STATUS_REG_WE" class="0">
<segment>
<pinref part="STATUS_REG" gate="G$1" pin="LOAD"/>
<wire x1="7.62" y1="7.62" x2="-15.24" y2="7.62" width="0.1524" layer="91"/>
<label x="-15.24" y="7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="STATUS_REG_EN" class="0">
<segment>
<wire x1="71.12" y1="45.72" x2="71.12" y2="43.18" width="0.1524" layer="91"/>
<wire x1="71.12" y1="43.18" x2="66.04" y2="43.18" width="0.1524" layer="91"/>
<wire x1="66.04" y1="43.18" x2="66.04" y2="25.4" width="0.1524" layer="91"/>
<wire x1="66.04" y1="25.4" x2="66.04" y2="7.62" width="0.1524" layer="91"/>
<wire x1="66.04" y1="7.62" x2="66.04" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-10.16" x2="66.04" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-27.94" x2="-15.24" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="71.12" y1="27.94" x2="71.12" y2="25.4" width="0.1524" layer="91"/>
<wire x1="71.12" y1="25.4" x2="66.04" y2="25.4" width="0.1524" layer="91"/>
<junction x="66.04" y="25.4"/>
<wire x1="71.12" y1="10.16" x2="71.12" y2="7.62" width="0.1524" layer="91"/>
<wire x1="71.12" y1="7.62" x2="66.04" y2="7.62" width="0.1524" layer="91"/>
<junction x="66.04" y="7.62"/>
<wire x1="71.12" y1="-7.62" x2="71.12" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-10.16" x2="66.04" y2="-10.16" width="0.1524" layer="91"/>
<junction x="66.04" y="-10.16"/>
<wire x1="71.12" y1="-25.4" x2="71.12" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-27.94" x2="66.04" y2="-27.94" width="0.1524" layer="91"/>
<junction x="66.04" y="-27.94"/>
<label x="-15.24" y="-27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<wire x1="104.14" y1="60.96" x2="86.36" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="104.14" y1="58.42" x2="83.82" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
