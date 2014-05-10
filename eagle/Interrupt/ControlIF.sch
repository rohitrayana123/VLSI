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
<symbol name="BUFFER">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="I" x="-10.16" y="0" visible="off" length="middle" direction="in"/>
<pin name="O" x="10.16" y="0" visible="off" length="middle" direction="oc" rot="R180"/>
</symbol>
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
</symbols>
<devicesets>
<deviceset name="BUFFER" prefix="BUFFER_">
<gates>
<gate name="G$1" symbol="BUFFER" x="0" y="0"/>
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
<part name="BUFFER_0" library="c035u" deviceset="BUFFER" device=""/>
<part name="BUFFER_1" library="c035u" deviceset="BUFFER" device=""/>
<part name="BUFFER_2" library="c035u" deviceset="BUFFER" device=""/>
<part name="BUFFER_3" library="c035u" deviceset="BUFFER" device=""/>
<part name="BUFFER_4" library="c035u" deviceset="BUFFER" device=""/>
<part name="BUFFER_15" library="c035u" deviceset="BUFFER" device=""/>
<part name="U$1" library="c035u" deviceset="TIELOW" device=""/>
<part name="MUX2_1" library="c035u" deviceset="MUX2" device=""/>
<part name="STATUS_REG" library="c035u" deviceset="SCANREG" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="-33.02" y1="-10.16" x2="17.78" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="17.78" y1="-10.16" x2="17.78" y2="68.58" width="0.4064" layer="94"/>
<wire x1="17.78" y1="68.58" x2="-33.02" y2="68.58" width="0.4064" layer="94"/>
<wire x1="60.96" y1="66.04" x2="60.96" y2="50.8" width="0.4064" layer="94"/>
<wire x1="60.96" y1="50.8" x2="81.28" y2="50.8" width="0.4064" layer="94"/>
<wire x1="60.96" y1="66.04" x2="81.28" y2="66.04" width="0.4064" layer="94"/>
<wire x1="81.28" y1="66.04" x2="81.28" y2="50.8" width="0.4064" layer="94"/>
<text x="-15.24" y="71.12" size="1.778" layer="95">CONTROL</text>
<text x="68.58" y="58.42" size="1.778" layer="95">ALU</text>
</plain>
<instances>
<instance part="BUFFER_0" gate="G$1" x="60.96" y="12.7" smashed="yes"/>
<instance part="BUFFER_1" gate="G$1" x="58.42" y="15.24" smashed="yes"/>
<instance part="BUFFER_2" gate="G$1" x="55.88" y="17.78" smashed="yes"/>
<instance part="BUFFER_3" gate="G$1" x="53.34" y="20.32" smashed="yes"/>
<instance part="BUFFER_4" gate="G$1" x="50.8" y="22.86" smashed="yes"/>
<instance part="BUFFER_15" gate="G$1" x="43.18" y="30.48" smashed="yes"/>
<instance part="U$1" gate="G$1" x="30.48" y="7.62"/>
<instance part="MUX2_1" gate="G$1" x="5.08" y="53.34" smashed="yes" rot="MR0"/>
<instance part="STATUS_REG" gate="G$1" x="0" y="12.7"/>
</instances>
<busses>
<bus name="SYSBUS">
<segment>
<wire x1="58.42" y1="30.48" x2="93.98" y2="30.48" width="0.762" layer="92"/>
<label x="83.82" y="33.02" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="B$1">
<segment>
<wire x1="15.24" y1="48.26" x2="81.28" y2="48.26" width="0.762" layer="92"/>
</segment>
</bus>
<bus name="FLAGS">
<segment>
<wire x1="15.24" y1="58.42" x2="60.96" y2="58.42" width="0.762" layer="92"/>
<label x="20.32" y="60.96" size="1.778" layer="95"/>
</segment>
</bus>
<bus name="B$2">
<segment>
<wire x1="12.7" y1="17.78" x2="15.24" y2="17.78" width="0.762" layer="92"/>
<wire x1="15.24" y1="20.32" x2="15.24" y2="17.78" width="0.762" layer="92"/>
<wire x1="15.24" y1="17.78" x2="15.24" y2="12.7" width="0.762" layer="92"/>
</segment>
</bus>
<bus name="STATUS_REG_IN">
<segment>
<wire x1="0" y1="53.34" x2="-15.24" y2="53.34" width="0.762" layer="92"/>
<wire x1="-15.24" y1="53.34" x2="-15.24" y2="17.78" width="0.762" layer="92"/>
<wire x1="-15.24" y1="17.78" x2="-12.7" y2="17.78" width="0.762" layer="92"/>
<label x="-17.78" y="55.88" size="1.778" layer="95"/>
</segment>
</bus>
</busses>
<nets>
<net name="FLAG_Z" class="0">
<segment>
<pinref part="BUFFER_0" gate="G$1" pin="I"/>
<wire x1="50.8" y1="12.7" x2="15.24" y2="12.7" width="0.1524" layer="91"/>
<label x="20.32" y="12.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="FLAG_C" class="0">
<segment>
<pinref part="BUFFER_1" gate="G$1" pin="I"/>
<wire x1="48.26" y1="15.24" x2="15.24" y2="15.24" width="0.1524" layer="91"/>
<label x="20.32" y="15.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="FLAG_V" class="0">
<segment>
<pinref part="BUFFER_2" gate="G$1" pin="I"/>
<wire x1="45.72" y1="17.78" x2="15.24" y2="17.78" width="0.1524" layer="91"/>
<label x="20.32" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="FLAG_N" class="0">
<segment>
<pinref part="BUFFER_3" gate="G$1" pin="I"/>
<wire x1="43.18" y1="20.32" x2="15.24" y2="20.32" width="0.1524" layer="91"/>
<label x="20.32" y="20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="PE" class="0">
<segment>
<pinref part="BUFFER_4" gate="G$1" pin="I"/>
<wire x1="40.64" y1="22.86" x2="30.48" y2="22.86" width="0.1524" layer="91"/>
<wire x1="30.48" y1="22.86" x2="30.48" y2="10.16" width="0.1524" layer="91"/>
<pinref part="BUFFER_15" gate="G$1" pin="I"/>
<wire x1="33.02" y1="30.48" x2="30.48" y2="30.48" width="0.1524" layer="91"/>
<wire x1="30.48" y1="30.48" x2="30.48" y2="27.94" width="0.1524" layer="91"/>
<junction x="30.48" y="22.86"/>
<wire x1="30.48" y1="27.94" x2="30.48" y2="25.4" width="0.1524" layer="91"/>
<wire x1="30.48" y1="25.4" x2="30.48" y2="22.86" width="0.1524" layer="91"/>
<wire x1="30.48" y1="27.94" x2="35.56" y2="27.94" width="0.1524" layer="91"/>
<junction x="30.48" y="27.94"/>
<wire x1="30.48" y1="25.4" x2="35.56" y2="25.4" width="0.1524" layer="91"/>
<junction x="30.48" y="25.4"/>
<pinref part="U$1" gate="G$1" pin="PE"/>
</segment>
</net>
<net name="15" class="0">
<segment>
<pinref part="BUFFER_15" gate="G$1" pin="O"/>
<wire x1="53.34" y1="30.48" x2="58.42" y2="30.48" width="0.1524" layer="91"/>
<label x="53.34" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="0" class="0">
<segment>
<pinref part="BUFFER_0" gate="G$1" pin="O"/>
<wire x1="71.12" y1="12.7" x2="71.12" y2="30.48" width="0.1524" layer="91"/>
<label x="71.12" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="73.66" y1="30.48" x2="73.66" y2="48.26" width="0.1524" layer="91"/>
<label x="73.66" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="1" class="0">
<segment>
<pinref part="BUFFER_1" gate="G$1" pin="O"/>
<wire x1="68.58" y1="15.24" x2="68.58" y2="30.48" width="0.1524" layer="91"/>
<label x="68.58" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="76.2" y1="30.48" x2="76.2" y2="48.26" width="0.1524" layer="91"/>
<label x="76.2" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="2" class="0">
<segment>
<pinref part="BUFFER_2" gate="G$1" pin="O"/>
<wire x1="66.04" y1="17.78" x2="66.04" y2="30.48" width="0.1524" layer="91"/>
<label x="66.04" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="78.74" y1="30.48" x2="78.74" y2="48.26" width="0.1524" layer="91"/>
<label x="78.74" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="3" class="0">
<segment>
<pinref part="BUFFER_3" gate="G$1" pin="O"/>
<wire x1="63.5" y1="20.32" x2="63.5" y2="30.48" width="0.1524" layer="91"/>
<label x="63.5" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="81.28" y1="30.48" x2="81.28" y2="48.26" width="0.1524" layer="91"/>
<label x="81.28" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="4" class="0">
<segment>
<pinref part="BUFFER_4" gate="G$1" pin="O"/>
<wire x1="60.96" y1="22.86" x2="60.96" y2="30.48" width="0.1524" layer="91"/>
<label x="60.96" y="25.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="FLAG_SEL" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$4"/>
<wire x1="7.62" y1="35.56" x2="7.62" y2="33.02" width="0.1524" layer="91"/>
<wire x1="7.62" y1="33.02" x2="-33.02" y2="33.02" width="0.1524" layer="91"/>
<label x="-33.02" y="33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="NRESET" class="0">
<segment>
<pinref part="STATUS_REG" gate="G$1" pin="NRESET"/>
<wire x1="-12.7" y1="-2.54" x2="-33.02" y2="-2.54" width="0.1524" layer="91"/>
<label x="-33.02" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="CLOCK" class="0">
<segment>
<pinref part="STATUS_REG" gate="G$1" pin="CLOCK"/>
<wire x1="-12.7" y1="2.54" x2="-33.02" y2="2.54" width="0.1524" layer="91"/>
<label x="-33.02" y="2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="STATUS_REG_WE" class="0">
<segment>
<pinref part="STATUS_REG" gate="G$1" pin="LOAD"/>
<wire x1="-12.7" y1="12.7" x2="-33.02" y2="12.7" width="0.1524" layer="91"/>
<label x="-33.02" y="12.7" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
