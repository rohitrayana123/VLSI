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
<part name="NOR3_1" library="c035u" deviceset="NOR3" device=""/>
<part name="NOR2_1" library="c035u" deviceset="NOR2" device=""/>
<part name="NOR2_2" library="c035u" deviceset="NOR2" device=""/>
<part name="NOR2_3" library="c035u" deviceset="NOR2" device=""/>
<part name="NOR2_4" library="c035u" deviceset="NOR2" device=""/>
<part name="NOR2_5" library="c035u" deviceset="NOR2" device=""/>
<part name="NOR2_6" library="c035u" deviceset="NOR2" device=""/>
<part name="NAND2_1" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_2" library="c035u" deviceset="NAND2" device=""/>
<part name="NAND2_3" library="c035u" deviceset="NAND2" device=""/>
<part name="AND2_1" library="c035u" deviceset="AND2" device=""/>
<part name="AND2_2" library="c035u" deviceset="AND2" device=""/>
<part name="AND2_3" library="c035u" deviceset="AND2" device=""/>
<part name="AND2_4" library="c035u" deviceset="AND2" device=""/>
<part name="AND2_5" library="c035u" deviceset="AND2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="2.54" y1="38.1" x2="17.78" y2="38.1" width="0.1524" layer="97" style="shortdash"/>
<wire x1="17.78" y1="38.1" x2="17.78" y2="15.24" width="0.1524" layer="97" style="shortdash"/>
<wire x1="17.78" y1="15.24" x2="2.54" y2="15.24" width="0.1524" layer="97" style="shortdash"/>
<wire x1="2.54" y1="15.24" x2="2.54" y2="38.1" width="0.1524" layer="97" style="shortdash"/>
<wire x1="22.86" y1="50.8" x2="40.64" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="40.64" y1="50.8" x2="40.64" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="40.64" y1="7.62" x2="22.86" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="22.86" y1="7.62" x2="22.86" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="45.72" y1="50.8" x2="63.5" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="63.5" y1="50.8" x2="63.5" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="63.5" y1="7.62" x2="45.72" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="45.72" y1="7.62" x2="45.72" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="71.12" y1="50.8" x2="88.9" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="88.9" y1="50.8" x2="88.9" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="88.9" y1="7.62" x2="71.12" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="71.12" y1="7.62" x2="71.12" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="93.98" y1="50.8" x2="111.76" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="111.76" y1="50.8" x2="111.76" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="111.76" y1="7.62" x2="93.98" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="93.98" y1="7.62" x2="93.98" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="119.38" y1="50.8" x2="137.16" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="137.16" y1="50.8" x2="137.16" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="137.16" y1="7.62" x2="119.38" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="119.38" y1="7.62" x2="119.38" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="142.24" y1="50.8" x2="160.02" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="160.02" y1="50.8" x2="160.02" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="160.02" y1="7.62" x2="142.24" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="142.24" y1="7.62" x2="142.24" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="165.1" y1="50.8" x2="182.88" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
<wire x1="182.88" y1="50.8" x2="182.88" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="182.88" y1="7.62" x2="165.1" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="165.1" y1="7.62" x2="165.1" y2="50.8" width="0.1524" layer="97" style="shortdash"/>
</plain>
<instances>
<instance part="NOR3_1" gate="G$1" x="10.16" y="25.4" smashed="yes" rot="R270">
<attribute name="NAME" x="8.255" y="30.48" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NOR2_1" gate="G$1" x="30.48" y="40.64" smashed="yes" rot="R270">
<attribute name="NAME" x="28.575" y="45.72" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NOR2_2" gate="G$1" x="53.34" y="40.64" smashed="yes" rot="R270">
<attribute name="NAME" x="51.435" y="45.72" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NOR2_3" gate="G$1" x="81.28" y="20.32" smashed="yes" rot="R270">
<attribute name="NAME" x="79.375" y="25.4" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NOR2_4" gate="G$1" x="101.6" y="40.64" smashed="yes" rot="R270">
<attribute name="NAME" x="99.695" y="45.72" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NOR2_5" gate="G$1" x="129.54" y="17.78" smashed="yes" rot="R270">
<attribute name="NAME" x="127.635" y="22.86" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NOR2_6" gate="G$1" x="152.4" y="17.78" smashed="yes" rot="R270">
<attribute name="NAME" x="150.495" y="22.86" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NAND2_1" gate="G$1" x="78.74" y="38.1" smashed="yes" rot="R270">
<attribute name="NAME" x="76.835" y="48.26" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NAND2_2" gate="G$1" x="127" y="38.1" smashed="yes" rot="R270">
<attribute name="NAME" x="125.095" y="48.26" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="NAND2_3" gate="G$1" x="149.86" y="38.1" smashed="yes" rot="R270">
<attribute name="NAME" x="147.955" y="48.26" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="AND2_1" gate="G$1" x="33.02" y="12.7" smashed="yes" rot="R270">
<attribute name="NAME" x="31.115" y="20.32" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="AND2_2" gate="G$1" x="55.88" y="15.24" smashed="yes" rot="R270">
<attribute name="NAME" x="53.975" y="25.4" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="AND2_3" gate="G$1" x="104.14" y="15.24" smashed="yes" rot="R270">
<attribute name="NAME" x="102.235" y="25.4" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="AND2_4" gate="G$1" x="172.72" y="38.1" smashed="yes" rot="R270">
<attribute name="NAME" x="173.355" y="48.26" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
<instance part="AND2_5" gate="G$1" x="175.26" y="15.24" smashed="yes" rot="R270">
<attribute name="NAME" x="175.895" y="25.4" size="1.778" layer="95" font="vector" rot="R270"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="RS[0]" class="0">
<segment>
<wire x1="5.08" y1="60.96" x2="7.62" y2="60.96" width="0.1524" layer="91"/>
<label x="0" y="60.96" size="1.778" layer="95"/>
<pinref part="NOR3_1" gate="G$1" pin="I1"/>
<wire x1="7.62" y1="60.96" x2="38.1" y2="60.96" width="0.1524" layer="91"/>
<wire x1="38.1" y1="60.96" x2="50.8" y2="60.96" width="0.1524" layer="91"/>
<wire x1="50.8" y1="60.96" x2="76.2" y2="60.96" width="0.1524" layer="91"/>
<wire x1="76.2" y1="60.96" x2="99.06" y2="60.96" width="0.1524" layer="91"/>
<wire x1="99.06" y1="60.96" x2="124.46" y2="60.96" width="0.1524" layer="91"/>
<wire x1="124.46" y1="60.96" x2="147.32" y2="60.96" width="0.1524" layer="91"/>
<wire x1="147.32" y1="60.96" x2="170.18" y2="60.96" width="0.1524" layer="91"/>
<wire x1="7.62" y1="38.1" x2="7.62" y2="60.96" width="0.1524" layer="91"/>
<junction x="7.62" y="60.96"/>
<pinref part="AND2_1" gate="G$1" pin="A"/>
<wire x1="35.56" y1="27.94" x2="38.1" y2="27.94" width="0.1524" layer="91"/>
<wire x1="38.1" y1="27.94" x2="38.1" y2="60.96" width="0.1524" layer="91"/>
<junction x="38.1" y="60.96"/>
<pinref part="NOR2_2" gate="G$1" pin="I1"/>
<wire x1="50.8" y1="53.34" x2="50.8" y2="60.96" width="0.1524" layer="91"/>
<junction x="50.8" y="60.96"/>
<pinref part="NAND2_1" gate="G$1" pin="I1"/>
<wire x1="76.2" y1="53.34" x2="76.2" y2="60.96" width="0.1524" layer="91"/>
<junction x="76.2" y="60.96"/>
<pinref part="NOR2_4" gate="G$1" pin="I1"/>
<wire x1="99.06" y1="53.34" x2="99.06" y2="60.96" width="0.1524" layer="91"/>
<junction x="99.06" y="60.96"/>
<pinref part="NAND2_2" gate="G$1" pin="I1"/>
<wire x1="124.46" y1="53.34" x2="124.46" y2="60.96" width="0.1524" layer="91"/>
<junction x="124.46" y="60.96"/>
<pinref part="AND2_4" gate="G$1" pin="I1"/>
<wire x1="170.18" y1="53.34" x2="170.18" y2="60.96" width="0.1524" layer="91"/>
<pinref part="NAND2_3" gate="G$1" pin="I1"/>
<wire x1="147.32" y1="53.34" x2="147.32" y2="60.96" width="0.1524" layer="91"/>
<junction x="147.32" y="60.96"/>
</segment>
</net>
<net name="RS[1]" class="0">
<segment>
<wire x1="5.08" y1="58.42" x2="10.16" y2="58.42" width="0.1524" layer="91"/>
<label x="0" y="58.42" size="1.778" layer="95"/>
<pinref part="NOR3_1" gate="G$1" pin="I2"/>
<wire x1="10.16" y1="58.42" x2="33.02" y2="58.42" width="0.1524" layer="91"/>
<wire x1="33.02" y1="58.42" x2="60.96" y2="58.42" width="0.1524" layer="91"/>
<wire x1="60.96" y1="58.42" x2="81.28" y2="58.42" width="0.1524" layer="91"/>
<wire x1="81.28" y1="58.42" x2="104.14" y2="58.42" width="0.1524" layer="91"/>
<wire x1="104.14" y1="58.42" x2="134.62" y2="58.42" width="0.1524" layer="91"/>
<wire x1="10.16" y1="38.1" x2="10.16" y2="58.42" width="0.1524" layer="91"/>
<junction x="10.16" y="58.42"/>
<pinref part="NOR2_1" gate="G$1" pin="I0"/>
<wire x1="33.02" y1="53.34" x2="33.02" y2="58.42" width="0.1524" layer="91"/>
<junction x="33.02" y="58.42"/>
<pinref part="AND2_2" gate="G$1" pin="A"/>
<wire x1="58.42" y1="30.48" x2="60.96" y2="30.48" width="0.1524" layer="91"/>
<wire x1="60.96" y1="30.48" x2="60.96" y2="58.42" width="0.1524" layer="91"/>
<junction x="60.96" y="58.42"/>
<pinref part="NAND2_1" gate="G$1" pin="A"/>
<wire x1="81.28" y1="53.34" x2="81.28" y2="58.42" width="0.1524" layer="91"/>
<junction x="81.28" y="58.42"/>
<pinref part="NOR2_4" gate="G$1" pin="I0"/>
<wire x1="104.14" y1="53.34" x2="104.14" y2="58.42" width="0.1524" layer="91"/>
<junction x="104.14" y="58.42"/>
<pinref part="NOR2_5" gate="G$1" pin="I0"/>
<wire x1="132.08" y1="30.48" x2="134.62" y2="30.48" width="0.1524" layer="91"/>
<wire x1="134.62" y1="30.48" x2="134.62" y2="58.42" width="0.1524" layer="91"/>
<junction x="134.62" y="58.42"/>
<pinref part="AND2_4" gate="G$1" pin="A"/>
<wire x1="175.26" y1="53.34" x2="175.26" y2="58.42" width="0.1524" layer="91"/>
<wire x1="175.26" y1="58.42" x2="152.4" y2="58.42" width="0.1524" layer="91"/>
<pinref part="NAND2_3" gate="G$1" pin="A"/>
<wire x1="152.4" y1="58.42" x2="134.62" y2="58.42" width="0.1524" layer="91"/>
<wire x1="152.4" y1="53.34" x2="152.4" y2="58.42" width="0.1524" layer="91"/>
<junction x="152.4" y="58.42"/>
</segment>
</net>
<net name="RS[2]" class="0">
<segment>
<wire x1="5.08" y1="55.88" x2="12.7" y2="55.88" width="0.1524" layer="91"/>
<label x="0" y="55.88" size="1.778" layer="95"/>
<pinref part="NOR3_1" gate="G$1" pin="I0"/>
<wire x1="12.7" y1="55.88" x2="27.94" y2="55.88" width="0.1524" layer="91"/>
<wire x1="27.94" y1="55.88" x2="55.88" y2="55.88" width="0.1524" layer="91"/>
<wire x1="55.88" y1="55.88" x2="86.36" y2="55.88" width="0.1524" layer="91"/>
<wire x1="86.36" y1="55.88" x2="109.22" y2="55.88" width="0.1524" layer="91"/>
<wire x1="109.22" y1="55.88" x2="129.54" y2="55.88" width="0.1524" layer="91"/>
<wire x1="12.7" y1="38.1" x2="12.7" y2="55.88" width="0.1524" layer="91"/>
<junction x="12.7" y="55.88"/>
<pinref part="NOR2_1" gate="G$1" pin="I1"/>
<wire x1="27.94" y1="53.34" x2="27.94" y2="55.88" width="0.1524" layer="91"/>
<junction x="27.94" y="55.88"/>
<pinref part="NOR2_2" gate="G$1" pin="I0"/>
<wire x1="55.88" y1="53.34" x2="55.88" y2="55.88" width="0.1524" layer="91"/>
<junction x="55.88" y="55.88"/>
<pinref part="NOR2_3" gate="G$1" pin="I0"/>
<wire x1="83.82" y1="33.02" x2="86.36" y2="33.02" width="0.1524" layer="91"/>
<wire x1="86.36" y1="33.02" x2="86.36" y2="55.88" width="0.1524" layer="91"/>
<junction x="86.36" y="55.88"/>
<pinref part="AND2_3" gate="G$1" pin="A"/>
<wire x1="106.68" y1="30.48" x2="109.22" y2="30.48" width="0.1524" layer="91"/>
<wire x1="109.22" y1="30.48" x2="109.22" y2="55.88" width="0.1524" layer="91"/>
<junction x="109.22" y="55.88"/>
<pinref part="NAND2_2" gate="G$1" pin="A"/>
<wire x1="129.54" y1="53.34" x2="129.54" y2="55.88" width="0.1524" layer="91"/>
<junction x="129.54" y="55.88"/>
<wire x1="129.54" y1="55.88" x2="157.48" y2="55.88" width="0.1524" layer="91"/>
<wire x1="157.48" y1="55.88" x2="180.34" y2="55.88" width="0.1524" layer="91"/>
<wire x1="180.34" y1="55.88" x2="180.34" y2="30.48" width="0.1524" layer="91"/>
<pinref part="AND2_5" gate="G$1" pin="A"/>
<wire x1="180.34" y1="30.48" x2="177.8" y2="30.48" width="0.1524" layer="91"/>
<pinref part="NOR2_6" gate="G$1" pin="I0"/>
<wire x1="154.94" y1="30.48" x2="157.48" y2="30.48" width="0.1524" layer="91"/>
<wire x1="157.48" y1="30.48" x2="157.48" y2="55.88" width="0.1524" layer="91"/>
<junction x="157.48" y="55.88"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="NOR2_1" gate="G$1" pin="O"/>
<pinref part="AND2_1" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="NOR2_2" gate="G$1" pin="O"/>
<pinref part="AND2_2" gate="G$1" pin="I1"/>
<wire x1="53.34" y1="27.94" x2="53.34" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="NAND2_1" gate="G$1" pin="O"/>
<pinref part="NOR2_3" gate="G$1" pin="I1"/>
<wire x1="78.74" y1="30.48" x2="78.74" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="NOR2_4" gate="G$1" pin="O"/>
<pinref part="AND2_3" gate="G$1" pin="I1"/>
<wire x1="101.6" y1="27.94" x2="101.6" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="NAND2_2" gate="G$1" pin="O"/>
<pinref part="NOR2_5" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="NAND2_3" gate="G$1" pin="O"/>
<pinref part="NOR2_6" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="AND2_4" gate="G$1" pin="O"/>
<pinref part="AND2_5" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="RS0" class="0">
<segment>
<pinref part="NOR3_1" gate="G$1" pin="O"/>
<wire x1="10.16" y1="12.7" x2="10.16" y2="0" width="0.1524" layer="91"/>
<label x="10.16" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS1" class="0">
<segment>
<pinref part="AND2_1" gate="G$1" pin="O"/>
<wire x1="33.02" y1="5.08" x2="33.02" y2="0" width="0.1524" layer="91"/>
<label x="33.02" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS2" class="0">
<segment>
<pinref part="AND2_2" gate="G$1" pin="O"/>
<wire x1="55.88" y1="7.62" x2="55.88" y2="0" width="0.1524" layer="91"/>
<label x="55.88" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS3" class="0">
<segment>
<pinref part="NOR2_3" gate="G$1" pin="O"/>
<wire x1="81.28" y1="7.62" x2="81.28" y2="0" width="0.1524" layer="91"/>
<label x="81.28" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS4" class="0">
<segment>
<pinref part="AND2_3" gate="G$1" pin="O"/>
<wire x1="104.14" y1="7.62" x2="104.14" y2="0" width="0.1524" layer="91"/>
<label x="104.14" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS5" class="0">
<segment>
<pinref part="NOR2_5" gate="G$1" pin="O"/>
<wire x1="129.54" y1="5.08" x2="129.54" y2="0" width="0.1524" layer="91"/>
<label x="129.54" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS6" class="0">
<segment>
<pinref part="NOR2_6" gate="G$1" pin="O"/>
<wire x1="152.4" y1="5.08" x2="152.4" y2="0" width="0.1524" layer="91"/>
<label x="152.4" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="RS7" class="0">
<segment>
<pinref part="AND2_5" gate="G$1" pin="O"/>
<wire x1="175.26" y1="7.62" x2="175.26" y2="0" width="0.1524" layer="91"/>
<label x="175.26" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
