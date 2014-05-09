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
</packages>
<symbols>
<symbol name="SCANDTYPE">
<wire x1="-10.16" y1="-5.08" x2="-10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="-10.16" y1="10.16" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="-10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-15.24" x2="10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<pin name="D" x="-15.24" y="5.08" length="middle"/>
<pin name="Q" x="15.24" y="5.08" length="middle" rot="R180"/>
<pin name="NRESET" x="-15.24" y="-12.7" length="middle" function="dot"/>
<pin name="NQ" x="15.24" y="2.54" length="middle" function="dot" rot="R180"/>
<pin name="CLOCK" x="-15.24" y="-10.16" length="middle" function="clk"/>
<text x="-10.16" y="10.16" size="1.778" layer="95">&gt;Name</text>
</symbol>
<symbol name="AND2">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94" curve="-180"/>
<text x="2.54" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<pin name="A" x="-15.24" y="2.54" visible="pad" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-15.24" y="-2.54" visible="pad" length="middle" direction="in" swaplevel="1"/>
<pin name="O" x="7.62" y="0" visible="pad" length="middle" direction="out" rot="R180"/>
<wire x1="-2.54" y1="5.08" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
</symbol>
<symbol name="INV">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<pin name="I" x="-10.16" y="0" visible="pad" length="middle" direction="in"/>
<pin name="O" x="10.16" y="0" visible="pad" length="middle" direction="oc" function="dot" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SCANDTYPE" prefix="SCANDTYPE_">
<gates>
<gate name="G$1" symbol="SCANDTYPE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="5PIN">
<connects>
<connect gate="G$1" pin="CLOCK" pad="P$1"/>
<connect gate="G$1" pin="D" pad="P$2"/>
<connect gate="G$1" pin="NQ" pad="P$3"/>
<connect gate="G$1" pin="NRESET" pad="P$4"/>
<connect gate="G$1" pin="Q" pad="P$5"/>
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
<part name="BUFFER_1" library="c035u" deviceset="SCANDTYPE" device=""/>
<part name="BUFFER_2" library="c035u" deviceset="SCANDTYPE" device=""/>
<part name="SCANDTYPE_3" library="c035u" deviceset="SCANDTYPE" device=""/>
<part name="AND2_1" library="c035u" deviceset="AND2" device=""/>
<part name="INV_1" library="c035u" deviceset="INV" device=""/>
<part name="AND2_2" library="c035u" deviceset="AND2" device=""/>
<part name="INV_2" library="c035u" deviceset="INV" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="BUFFER_1" gate="G$1" x="30.48" y="68.58" smashed="yes">
<attribute name="NAME" x="20.32" y="81.28" size="1.778" layer="95"/>
</instance>
<instance part="BUFFER_2" gate="G$1" x="73.66" y="68.58" smashed="yes">
<attribute name="NAME" x="63.5" y="81.28" size="1.778" layer="95"/>
</instance>
<instance part="SCANDTYPE_3" gate="G$1" x="73.66" y="27.94" smashed="yes">
<attribute name="NAME" x="63.5" y="40.64" size="1.778" layer="95"/>
</instance>
<instance part="AND2_1" gate="G$1" x="43.18" y="33.02"/>
<instance part="INV_1" gate="G$1" x="10.16" y="35.56"/>
<instance part="AND2_2" gate="G$1" x="114.3" y="48.26"/>
<instance part="INV_2" gate="G$1" x="-2.54" y="73.66"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="BUFFER_1" gate="G$1" pin="Q"/>
<pinref part="BUFFER_2" gate="G$1" pin="D"/>
<wire x1="45.72" y1="73.66" x2="58.42" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="BUFFER_2" gate="G$1" pin="Q"/>
<wire x1="88.9" y1="73.66" x2="93.98" y2="73.66" width="0.1524" layer="91"/>
<wire x1="93.98" y1="73.66" x2="93.98" y2="50.8" width="0.1524" layer="91"/>
<pinref part="AND2_2" gate="G$1" pin="A"/>
<wire x1="93.98" y1="50.8" x2="99.06" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="SCANDTYPE_3" gate="G$1" pin="Q"/>
<wire x1="88.9" y1="33.02" x2="93.98" y2="33.02" width="0.1524" layer="91"/>
<wire x1="93.98" y1="33.02" x2="93.98" y2="45.72" width="0.1524" layer="91"/>
<pinref part="AND2_2" gate="G$1" pin="I1"/>
<wire x1="93.98" y1="45.72" x2="99.06" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="INV_1" gate="G$1" pin="I"/>
<wire x1="0" y1="35.56" x2="-22.86" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="AND2_1" gate="G$1" pin="I1"/>
<wire x1="27.94" y1="30.48" x2="27.94" y2="22.86" width="0.1524" layer="91"/>
<wire x1="27.94" y1="22.86" x2="-22.86" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="AND2_1" gate="G$1" pin="O"/>
<pinref part="SCANDTYPE_3" gate="G$1" pin="D"/>
<wire x1="50.8" y1="33.02" x2="58.42" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="BUFFER_1" gate="G$1" pin="CLOCK"/>
<wire x1="15.24" y1="58.42" x2="-2.54" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="58.42" x2="-2.54" y2="48.26" width="0.1524" layer="91"/>
<pinref part="BUFFER_2" gate="G$1" pin="CLOCK"/>
<wire x1="58.42" y1="58.42" x2="45.72" y2="58.42" width="0.1524" layer="91"/>
<wire x1="45.72" y1="58.42" x2="45.72" y2="48.26" width="0.1524" layer="91"/>
<wire x1="45.72" y1="48.26" x2="-2.54" y2="48.26" width="0.1524" layer="91"/>
<pinref part="SCANDTYPE_3" gate="G$1" pin="CLOCK"/>
<wire x1="58.42" y1="17.78" x2="-2.54" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="17.78" x2="-2.54" y2="48.26" width="0.1524" layer="91"/>
<junction x="-2.54" y="48.26"/>
<wire x1="-22.86" y1="17.78" x2="-2.54" y2="17.78" width="0.1524" layer="91"/>
<junction x="-2.54" y="17.78"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="BUFFER_2" gate="G$1" pin="NRESET"/>
<wire x1="58.42" y1="55.88" x2="48.26" y2="55.88" width="0.1524" layer="91"/>
<wire x1="48.26" y1="55.88" x2="48.26" y2="45.72" width="0.1524" layer="91"/>
<wire x1="48.26" y1="45.72" x2="0" y2="45.72" width="0.1524" layer="91"/>
<wire x1="0" y1="45.72" x2="0" y2="55.88" width="0.1524" layer="91"/>
<pinref part="BUFFER_1" gate="G$1" pin="NRESET"/>
<wire x1="0" y1="55.88" x2="15.24" y2="55.88" width="0.1524" layer="91"/>
<pinref part="SCANDTYPE_3" gate="G$1" pin="NRESET"/>
<wire x1="58.42" y1="15.24" x2="0" y2="15.24" width="0.1524" layer="91"/>
<wire x1="0" y1="15.24" x2="0" y2="45.72" width="0.1524" layer="91"/>
<junction x="0" y="45.72"/>
<wire x1="0" y1="15.24" x2="-22.86" y2="15.24" width="0.1524" layer="91"/>
<junction x="0" y="15.24"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="INV_1" gate="G$1" pin="O"/>
<pinref part="AND2_1" gate="G$1" pin="A"/>
<wire x1="20.32" y1="35.56" x2="27.94" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="INV_2" gate="G$1" pin="O"/>
<pinref part="BUFFER_1" gate="G$1" pin="D"/>
<wire x1="7.62" y1="73.66" x2="15.24" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="INV_2" gate="G$1" pin="I"/>
<wire x1="-12.7" y1="73.66" x2="-22.86" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
