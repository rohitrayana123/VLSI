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
<package name="5PIN">
<pad name="P$1" x="0" y="0" drill="0.8" shape="square"/>
<pad name="P$2" x="2.54" y="0" drill="0.8" shape="square"/>
<pad name="P$3" x="2.54" y="-2.54" drill="0.8" shape="square"/>
<pad name="P$4" x="0" y="-2.54" drill="0.8" shape="square"/>
<pad name="P$5" x="1.27" y="-1.27" drill="0.8" shape="square"/>
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
<part name="IR" library="c035u" deviceset="SCANREG" device=""/>
<part name="MUX2_1" library="c035u" deviceset="MUX2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IR" gate="G$1" x="22.86" y="20.32"/>
<instance part="MUX2_1" gate="G$1" x="60.96" y="20.32"/>
</instances>
<busses>
<bus name="SYSBUS">
<segment>
<wire x1="0" y1="0" x2="7.62" y2="0" width="0.762" layer="92"/>
<label x="-2.54" y="-2.54" size="1.778" layer="95"/>
</segment>
</bus>
</busses>
<nets>
<net name="IR" class="0">
<segment>
<pinref part="IR" gate="G$1" pin="Q"/>
<wire x1="35.56" y1="25.4" x2="40.64" y2="25.4" width="0.1524" layer="91"/>
<wire x1="40.64" y1="25.4" x2="40.64" y2="35.56" width="0.1524" layer="91"/>
<wire x1="40.64" y1="35.56" x2="5.08" y2="35.56" width="0.1524" layer="91"/>
<label x="2.54" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="IR" gate="G$1" pin="D"/>
<wire x1="10.16" y1="25.4" x2="5.08" y2="25.4" width="0.1524" layer="91"/>
<wire x1="5.08" y1="25.4" x2="5.08" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="IRWE" class="0">
<segment>
<pinref part="IR" gate="G$1" pin="LOAD"/>
<wire x1="10.16" y1="20.32" x2="10.16" y2="38.1" width="0.1524" layer="91"/>
<label x="10.16" y="40.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="IMM8" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$2"/>
<wire x1="50.8" y1="15.24" x2="48.26" y2="15.24" width="0.1524" layer="91"/>
<wire x1="48.26" y1="15.24" x2="48.26" y2="0" width="0.1524" layer="91"/>
<wire x1="48.26" y1="15.24" x2="48.26" y2="38.1" width="0.1524" layer="91"/>
<junction x="48.26" y="15.24"/>
<label x="48.26" y="38.1" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="IMM5" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$1"/>
<wire x1="50.8" y1="25.4" x2="45.72" y2="25.4" width="0.1524" layer="91"/>
<wire x1="45.72" y1="25.4" x2="45.72" y2="0" width="0.1524" layer="91"/>
<wire x1="45.72" y1="25.4" x2="45.72" y2="38.1" width="0.1524" layer="91"/>
<junction x="45.72" y="25.4"/>
<label x="45.72" y="38.1" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="IMM" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$3"/>
<wire x1="66.04" y1="20.32" x2="73.66" y2="20.32" width="0.1524" layer="91"/>
<label x="73.66" y="20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="IMMSEL" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$4"/>
<wire x1="58.42" y1="2.54" x2="58.42" y2="0" width="0.1524" layer="91"/>
<label x="58.42" y="0" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
