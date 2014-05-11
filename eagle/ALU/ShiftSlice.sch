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
<part name="MUX2_1" library="c035u" deviceset="MUX2" device=""/>
<part name="MUX2_2" library="c035u" deviceset="MUX2" device=""/>
<part name="AND2_1" library="c035u" deviceset="AND2" device=""/>
<part name="AND2_2" library="c035u" deviceset="AND2" device=""/>
<part name="MUX2_3" library="c035u" deviceset="MUX2" device=""/>
<part name="MUX2_4" library="c035u" deviceset="MUX2" device=""/>
<part name="AND2_4" library="c035u" deviceset="AND2" device=""/>
<part name="MUX2_5" library="c035u" deviceset="MUX2" device=""/>
<part name="AND2_3" library="c035u" deviceset="AND2" device=""/>
<part name="MUX2_6" library="c035u" deviceset="MUX2" device=""/>
<part name="AND2_5" library="c035u" deviceset="AND2" device=""/>
<part name="MUX2_7" library="c035u" deviceset="MUX2" device=""/>
<part name="AND2_6" library="c035u" deviceset="AND2" device=""/>
<part name="MUX2_8" library="c035u" deviceset="MUX2" device=""/>
<part name="AND2_7" library="c035u" deviceset="AND2" device=""/>
<part name="MUX2_9" library="c035u" deviceset="MUX2" device=""/>
<part name="AND2_8" library="c035u" deviceset="AND2" device=""/>
<part name="TRISBUF_1" library="c035u" deviceset="TRISBUF" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-73.66" y="152.4" size="1.778" layer="95">A</text>
<text x="-73.66" y="149.86" size="1.778" layer="95">B</text>
<text x="-73.66" y="78.74" size="1.778" layer="95">ALUBus</text>
<text x="-17.78" y="154.94" size="1.27" layer="95">ShL</text>
<text x="88.9" y="154.94" size="1.27" layer="95">ShR</text>
<text x="-10.16" y="154.94" size="1.27" layer="95">Sh8</text>
<text x="12.7" y="154.94" size="1.27" layer="95">Sh4</text>
<text x="33.02" y="154.94" size="1.27" layer="95">Sh2</text>
<text x="50.8" y="154.94" size="1.27" layer="95">Sh1</text>
<text x="-55.88" y="76.2" size="1.27" layer="95" rot="R180">ShB</text>
<wire x1="-76.2" y1="154.94" x2="-48.26" y2="154.94" width="0.1524" layer="98" style="longdash"/>
<wire x1="-48.26" y1="154.94" x2="-48.26" y2="73.66" width="0.1524" layer="98" style="longdash"/>
<wire x1="-48.26" y1="73.66" x2="-76.2" y2="73.66" width="0.1524" layer="98" style="longdash"/>
<wire x1="-76.2" y1="73.66" x2="-76.2" y2="154.94" width="0.1524" layer="98" style="longdash"/>
<text x="-74.422" y="74.168" size="1.27" layer="98">LUI</text>
<text x="170.18" y="91.44" size="1.778" layer="95" font="vector" rot="R180">ShOut</text>
</plain>
<instances>
<instance part="MUX2_1" gate="G$1" x="-53.34" y="104.14"/>
<instance part="MUX2_2" gate="G$1" x="-12.7" y="93.98" rot="MR180"/>
<instance part="AND2_1" gate="G$1" x="-15.24" y="119.38" rot="R270"/>
<instance part="AND2_2" gate="G$1" x="10.16" y="119.38" rot="R270"/>
<instance part="MUX2_3" gate="G$1" x="12.7" y="93.98" rot="MR180"/>
<instance part="MUX2_4" gate="G$1" x="33.02" y="93.98" rot="MR180"/>
<instance part="AND2_4" gate="G$1" x="30.48" y="119.38" rot="R270"/>
<instance part="MUX2_5" gate="G$1" x="50.8" y="93.98" rot="MR180"/>
<instance part="AND2_3" gate="G$1" x="48.26" y="119.38" rot="R270"/>
<instance part="MUX2_6" gate="G$1" x="88.9" y="93.98" rot="MR180"/>
<instance part="AND2_5" gate="G$1" x="86.36" y="119.38" rot="R270"/>
<instance part="MUX2_7" gate="G$1" x="116.84" y="93.98" rot="MR180"/>
<instance part="AND2_6" gate="G$1" x="114.3" y="119.38" rot="R270"/>
<instance part="MUX2_8" gate="G$1" x="139.7" y="93.98" rot="MR180"/>
<instance part="AND2_7" gate="G$1" x="137.16" y="119.38" rot="R270"/>
<instance part="MUX2_9" gate="G$1" x="160.02" y="93.98" rot="MR180"/>
<instance part="AND2_8" gate="G$1" x="157.48" y="119.38" rot="R270"/>
<instance part="TRISBUF_1" gate="G$1" x="180.34" y="91.44" rot="R270"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="-17.78" y1="134.62" x2="-17.78" y2="137.16" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="137.16" x2="-17.78" y2="154.94" width="0.1524" layer="91"/>
<wire x1="7.62" y1="134.62" x2="7.62" y2="137.16" width="0.1524" layer="91"/>
<wire x1="7.62" y1="137.16" x2="-17.78" y2="137.16" width="0.1524" layer="91"/>
<wire x1="7.62" y1="137.16" x2="27.94" y2="137.16" width="0.1524" layer="91"/>
<wire x1="27.94" y1="134.62" x2="27.94" y2="137.16" width="0.1524" layer="91"/>
<wire x1="27.94" y1="137.16" x2="45.72" y2="137.16" width="0.1524" layer="91"/>
<pinref part="AND2_1" gate="G$1" pin="I1"/>
<pinref part="AND2_2" gate="G$1" pin="I1"/>
<pinref part="AND2_4" gate="G$1" pin="I1"/>
<pinref part="AND2_3" gate="G$1" pin="I1"/>
<wire x1="45.72" y1="134.62" x2="45.72" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="88.9" y1="134.62" x2="88.9" y2="137.16" width="0.1524" layer="91"/>
<wire x1="88.9" y1="154.94" x2="88.9" y2="137.16" width="0.1524" layer="91"/>
<wire x1="88.9" y1="137.16" x2="111.76" y2="137.16" width="0.1524" layer="91"/>
<wire x1="111.76" y1="134.62" x2="111.76" y2="137.16" width="0.1524" layer="91"/>
<wire x1="111.76" y1="137.16" x2="134.62" y2="137.16" width="0.1524" layer="91"/>
<wire x1="134.62" y1="134.62" x2="134.62" y2="137.16" width="0.1524" layer="91"/>
<wire x1="134.62" y1="137.16" x2="154.94" y2="137.16" width="0.1524" layer="91"/>
<pinref part="AND2_5" gate="G$1" pin="A"/>
<pinref part="AND2_6" gate="G$1" pin="I1"/>
<pinref part="AND2_7" gate="G$1" pin="I1"/>
<pinref part="AND2_8" gate="G$1" pin="I1"/>
<wire x1="154.94" y1="134.62" x2="154.94" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="-7.62" y1="93.98" x2="-7.62" y2="154.94" width="0.1524" layer="91"/>
<pinref part="MUX2_2" gate="G$1" pin="P$3"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="17.78" y1="93.98" x2="17.78" y2="154.94" width="0.1524" layer="91"/>
<pinref part="MUX2_3" gate="G$1" pin="P$3"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="38.1" y1="93.98" x2="38.1" y2="154.94" width="0.1524" layer="91"/>
<pinref part="MUX2_4" gate="G$1" pin="P$3"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="121.92" y1="88.9" x2="124.46" y2="88.9" width="0.1524" layer="91"/>
<wire x1="124.46" y1="88.9" x2="124.46" y2="76.2" width="0.1524" layer="91"/>
<pinref part="MUX2_8" gate="G$1" pin="P$1"/>
<wire x1="129.54" y1="93.98" x2="129.54" y2="88.9" width="0.1524" layer="91"/>
<wire x1="121.92" y1="93.98" x2="129.54" y2="93.98" width="0.1524" layer="91"/>
<pinref part="MUX2_7" gate="G$1" pin="P$3"/>
<wire x1="121.92" y1="88.9" x2="121.92" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="-25.4" y1="92.964" x2="-25.4" y2="76.2" width="0.1524" layer="91"/>
<pinref part="MUX2_2" gate="G$1" pin="P$2"/>
<wire x1="-22.86" y1="99.06" x2="-22.86" y2="92.964" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="92.964" x2="-25.4" y2="92.964" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="-25.4" y1="154.94" x2="-25.4" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-25.4" y1="93.98" x2="-26.67" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-26.67" y1="93.98" x2="-26.67" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="76.2" x2="-27.94" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-26.67" y1="91.44" x2="-27.94" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="-27.94" y1="154.94" x2="-27.94" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="93.98" x2="-29.21" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-29.21" y1="93.98" x2="-29.21" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="76.2" x2="-30.48" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-29.21" y1="91.44" x2="-30.48" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="-30.48" y1="154.94" x2="-30.48" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="93.98" x2="-31.75" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-31.75" y1="93.98" x2="-31.75" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-33.02" y1="76.2" x2="-33.02" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-31.75" y1="91.44" x2="-33.02" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="-33.02" y1="154.94" x2="-33.02" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-33.02" y1="93.98" x2="-34.29" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-34.29" y1="93.98" x2="-34.29" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="76.2" x2="-35.56" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-34.29" y1="91.44" x2="-35.56" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="-35.56" y1="154.94" x2="-35.56" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="93.98" x2="-36.83" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-36.83" y1="93.98" x2="-36.83" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="76.2" x2="-38.1" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-36.83" y1="91.44" x2="-38.1" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="-38.1" y1="154.94" x2="-38.1" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="93.98" x2="-39.37" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-39.37" y1="93.98" x2="-39.37" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="76.2" x2="-40.64" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-39.37" y1="91.44" x2="-40.64" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="-40.64" y1="154.94" x2="-40.64" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="93.98" x2="-41.91" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-41.91" y1="93.98" x2="-41.91" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="76.2" x2="-43.18" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-41.91" y1="91.44" x2="-43.18" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="0" y1="154.94" x2="0" y2="93.98" width="0.1524" layer="91"/>
<wire x1="0" y1="93.98" x2="-1.27" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-1.27" y1="93.98" x2="-1.27" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="76.2" x2="-2.54" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-1.27" y1="91.44" x2="-2.54" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="-2.54" y1="154.94" x2="-2.54" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="93.98" x2="-3.81" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-3.81" y1="93.98" x2="-3.81" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="76.2" x2="-5.08" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-3.81" y1="91.44" x2="-5.08" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="-5.08" y1="154.94" x2="-5.08" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="93.98" x2="-6.35" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-6.35" y1="93.98" x2="-6.35" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="76.2" x2="-7.62" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-6.35" y1="91.44" x2="-7.62" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<wire x1="0" y1="92.964" x2="0" y2="76.2" width="0.1524" layer="91"/>
<pinref part="MUX2_3" gate="G$1" pin="P$2"/>
<wire x1="2.54" y1="99.06" x2="2.54" y2="92.964" width="0.1524" layer="91"/>
<wire x1="2.54" y1="92.964" x2="0" y2="92.964" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="-43.18" y1="154.94" x2="-43.18" y2="104.14" width="0.1524" layer="91"/>
<pinref part="MUX2_2" gate="G$1" pin="P$1"/>
<wire x1="-22.86" y1="88.9" x2="-45.72" y2="88.9" width="0.1524" layer="91"/>
<pinref part="MUX2_1" gate="G$1" pin="P$3"/>
<wire x1="-43.18" y1="104.14" x2="-45.72" y2="104.14" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="104.14" x2="-48.26" y2="104.14" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="88.9" x2="-45.72" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="20.32" y1="154.94" x2="20.32" y2="93.98" width="0.1524" layer="91"/>
<wire x1="20.32" y1="93.98" x2="19.05" y2="93.98" width="0.1524" layer="91"/>
<wire x1="19.05" y1="93.98" x2="19.05" y2="91.44" width="0.1524" layer="91"/>
<wire x1="17.78" y1="76.2" x2="17.78" y2="91.44" width="0.1524" layer="91"/>
<wire x1="19.05" y1="91.44" x2="17.78" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="20.32" y1="76.2" x2="20.32" y2="92.71" width="0.1524" layer="91"/>
<pinref part="MUX2_4" gate="G$1" pin="P$2"/>
<wire x1="22.86" y1="99.06" x2="22.86" y2="92.71" width="0.1524" layer="91"/>
<wire x1="22.86" y1="92.71" x2="20.32" y2="92.71" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<wire x1="38.1" y1="91.44" x2="38.1" y2="76.2" width="0.1524" layer="91"/>
<pinref part="MUX2_5" gate="G$1" pin="P$2"/>
<wire x1="40.64" y1="99.06" x2="40.64" y2="91.44" width="0.1524" layer="91"/>
<wire x1="40.64" y1="91.44" x2="38.1" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<wire x1="60.96" y1="76.2" x2="60.96" y2="88.9" width="0.1524" layer="91"/>
<wire x1="60.96" y1="88.9" x2="59.69" y2="88.9" width="0.1524" layer="91"/>
<wire x1="59.69" y1="88.9" x2="59.69" y2="91.44" width="0.1524" layer="91"/>
<wire x1="58.42" y1="154.94" x2="58.42" y2="91.44" width="0.1524" layer="91"/>
<wire x1="59.69" y1="91.44" x2="58.42" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="63.5" y1="76.2" x2="63.5" y2="88.9" width="0.1524" layer="91"/>
<wire x1="63.5" y1="88.9" x2="62.23" y2="88.9" width="0.1524" layer="91"/>
<wire x1="62.23" y1="88.9" x2="62.23" y2="91.44" width="0.1524" layer="91"/>
<wire x1="60.96" y1="154.94" x2="60.96" y2="91.44" width="0.1524" layer="91"/>
<wire x1="62.23" y1="91.44" x2="60.96" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<wire x1="66.04" y1="76.2" x2="66.04" y2="88.9" width="0.1524" layer="91"/>
<wire x1="66.04" y1="88.9" x2="64.77" y2="88.9" width="0.1524" layer="91"/>
<wire x1="64.77" y1="88.9" x2="64.77" y2="91.44" width="0.1524" layer="91"/>
<wire x1="63.5" y1="154.94" x2="63.5" y2="91.44" width="0.1524" layer="91"/>
<wire x1="64.77" y1="91.44" x2="63.5" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<wire x1="68.58" y1="76.2" x2="68.58" y2="88.9" width="0.1524" layer="91"/>
<wire x1="68.58" y1="88.9" x2="67.31" y2="88.9" width="0.1524" layer="91"/>
<wire x1="67.31" y1="88.9" x2="67.31" y2="91.44" width="0.1524" layer="91"/>
<wire x1="66.04" y1="154.94" x2="66.04" y2="91.44" width="0.1524" layer="91"/>
<wire x1="67.31" y1="91.44" x2="66.04" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<wire x1="71.12" y1="76.2" x2="71.12" y2="88.9" width="0.1524" layer="91"/>
<wire x1="71.12" y1="88.9" x2="69.85" y2="88.9" width="0.1524" layer="91"/>
<wire x1="69.85" y1="88.9" x2="69.85" y2="91.44" width="0.1524" layer="91"/>
<wire x1="68.58" y1="154.94" x2="68.58" y2="91.44" width="0.1524" layer="91"/>
<wire x1="69.85" y1="91.44" x2="68.58" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<wire x1="73.66" y1="76.2" x2="73.66" y2="88.9" width="0.1524" layer="91"/>
<wire x1="73.66" y1="88.9" x2="72.39" y2="88.9" width="0.1524" layer="91"/>
<wire x1="72.39" y1="88.9" x2="72.39" y2="91.44" width="0.1524" layer="91"/>
<wire x1="71.12" y1="154.94" x2="71.12" y2="91.44" width="0.1524" layer="91"/>
<wire x1="72.39" y1="91.44" x2="71.12" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<wire x1="76.2" y1="76.2" x2="76.2" y2="88.9" width="0.1524" layer="91"/>
<wire x1="76.2" y1="88.9" x2="74.93" y2="88.9" width="0.1524" layer="91"/>
<wire x1="74.93" y1="88.9" x2="74.93" y2="91.44" width="0.1524" layer="91"/>
<wire x1="73.66" y1="154.94" x2="73.66" y2="91.44" width="0.1524" layer="91"/>
<wire x1="74.93" y1="91.44" x2="73.66" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<wire x1="76.2" y1="154.94" x2="76.2" y2="99.06" width="0.1524" layer="91"/>
<pinref part="MUX2_6" gate="G$1" pin="P$2"/>
<wire x1="78.74" y1="99.06" x2="76.2" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<wire x1="99.06" y1="76.2" x2="99.06" y2="88.9" width="0.1524" layer="91"/>
<wire x1="99.06" y1="88.9" x2="97.79" y2="88.9" width="0.1524" layer="91"/>
<wire x1="97.79" y1="88.9" x2="97.79" y2="91.44" width="0.1524" layer="91"/>
<wire x1="96.52" y1="154.94" x2="96.52" y2="91.44" width="0.1524" layer="91"/>
<wire x1="97.79" y1="91.44" x2="96.52" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<wire x1="101.6" y1="76.2" x2="101.6" y2="88.9" width="0.1524" layer="91"/>
<wire x1="101.6" y1="88.9" x2="100.33" y2="88.9" width="0.1524" layer="91"/>
<wire x1="100.33" y1="88.9" x2="100.33" y2="91.44" width="0.1524" layer="91"/>
<wire x1="99.06" y1="154.94" x2="99.06" y2="91.44" width="0.1524" layer="91"/>
<wire x1="100.33" y1="91.44" x2="99.06" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<wire x1="104.14" y1="76.2" x2="104.14" y2="88.9" width="0.1524" layer="91"/>
<wire x1="104.14" y1="88.9" x2="102.87" y2="88.9" width="0.1524" layer="91"/>
<wire x1="102.87" y1="88.9" x2="102.87" y2="91.44" width="0.1524" layer="91"/>
<wire x1="101.6" y1="154.94" x2="101.6" y2="91.44" width="0.1524" layer="91"/>
<wire x1="102.87" y1="91.44" x2="101.6" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="MUX2_7" gate="G$1" pin="P$2"/>
<wire x1="104.14" y1="99.06" x2="104.14" y2="154.94" width="0.1524" layer="91"/>
<wire x1="106.68" y1="99.06" x2="104.14" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<wire x1="127" y1="76.2" x2="127" y2="88.9" width="0.1524" layer="91"/>
<wire x1="127" y1="88.9" x2="125.73" y2="88.9" width="0.1524" layer="91"/>
<wire x1="125.73" y1="88.9" x2="125.73" y2="91.44" width="0.1524" layer="91"/>
<wire x1="124.46" y1="154.94" x2="124.46" y2="91.44" width="0.1524" layer="91"/>
<wire x1="125.73" y1="91.44" x2="124.46" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<wire x1="127" y1="154.94" x2="127" y2="99.06" width="0.1524" layer="91"/>
<pinref part="MUX2_8" gate="G$1" pin="P$2"/>
<wire x1="129.54" y1="99.06" x2="127" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<wire x1="147.32" y1="154.94" x2="147.32" y2="99.06" width="0.1524" layer="91"/>
<pinref part="MUX2_9" gate="G$1" pin="P$2"/>
<wire x1="149.86" y1="99.06" x2="147.32" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="144.78" y1="88.9" x2="147.32" y2="88.9" width="0.1524" layer="91"/>
<wire x1="147.32" y1="88.9" x2="147.32" y2="76.2" width="0.1524" layer="91"/>
<pinref part="MUX2_9" gate="G$1" pin="P$1"/>
<wire x1="149.86" y1="93.98" x2="149.86" y2="88.9" width="0.1524" layer="91"/>
<wire x1="149.86" y1="93.98" x2="144.78" y2="93.98" width="0.1524" layer="91"/>
<pinref part="MUX2_8" gate="G$1" pin="P$3"/>
<wire x1="144.78" y1="88.9" x2="144.78" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<wire x1="-12.7" y1="134.62" x2="-12.7" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="139.7" x2="-10.16" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="139.7" x2="83.82" y2="139.7" width="0.1524" layer="91"/>
<wire x1="83.82" y1="139.7" x2="83.82" y2="134.62" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="139.7" x2="-10.16" y2="154.94" width="0.1524" layer="91"/>
<pinref part="AND2_1" gate="G$1" pin="A"/>
<pinref part="AND2_5" gate="G$1" pin="I1"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<wire x1="12.7" y1="134.62" x2="12.7" y2="142.24" width="0.1524" layer="91"/>
<wire x1="12.7" y1="142.24" x2="116.84" y2="142.24" width="0.1524" layer="91"/>
<wire x1="116.84" y1="142.24" x2="116.84" y2="134.62" width="0.1524" layer="91"/>
<wire x1="12.7" y1="142.24" x2="12.7" y2="154.94" width="0.1524" layer="91"/>
<pinref part="AND2_2" gate="G$1" pin="A"/>
<pinref part="AND2_6" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<wire x1="33.02" y1="134.62" x2="33.02" y2="144.78" width="0.1524" layer="91"/>
<wire x1="33.02" y1="144.78" x2="33.02" y2="154.94" width="0.1524" layer="91"/>
<wire x1="33.02" y1="144.78" x2="139.7" y2="144.78" width="0.1524" layer="91"/>
<wire x1="139.7" y1="144.78" x2="139.7" y2="134.62" width="0.1524" layer="91"/>
<pinref part="AND2_4" gate="G$1" pin="A"/>
<pinref part="AND2_7" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<wire x1="50.8" y1="134.62" x2="50.8" y2="147.32" width="0.1524" layer="91"/>
<wire x1="50.8" y1="147.32" x2="50.8" y2="154.94" width="0.1524" layer="91"/>
<wire x1="50.8" y1="147.32" x2="160.02" y2="147.32" width="0.1524" layer="91"/>
<wire x1="160.02" y1="147.32" x2="160.02" y2="134.62" width="0.1524" layer="91"/>
<pinref part="AND2_3" gate="G$1" pin="A"/>
<pinref part="AND2_8" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$4"/>
<wire x1="-55.88" y1="86.36" x2="-55.88" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$1"/>
<wire x1="-63.5" y1="109.22" x2="-63.5" y2="152.4" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="152.4" x2="-73.66" y2="152.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="MUX2_1" gate="G$1" pin="P$2"/>
<wire x1="-63.5" y1="99.06" x2="-66.04" y2="99.06" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="99.06" x2="-66.04" y2="149.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<wire x1="-73.66" y1="149.86" x2="185.42" y2="149.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="MUX2_2" gate="G$1" pin="P$4"/>
<pinref part="AND2_1" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="AND2_2" gate="G$1" pin="O"/>
<pinref part="MUX2_3" gate="G$1" pin="P$4"/>
</segment>
</net>
<net name="N$54" class="0">
<segment>
<pinref part="MUX2_4" gate="G$1" pin="P$4"/>
<pinref part="AND2_4" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$55" class="0">
<segment>
<pinref part="MUX2_5" gate="G$1" pin="P$4"/>
<pinref part="AND2_3" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$56" class="0">
<segment>
<pinref part="MUX2_6" gate="G$1" pin="P$4"/>
<pinref part="AND2_5" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$57" class="0">
<segment>
<pinref part="MUX2_7" gate="G$1" pin="P$4"/>
<pinref part="AND2_6" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$58" class="0">
<segment>
<pinref part="MUX2_8" gate="G$1" pin="P$4"/>
<pinref part="AND2_7" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$59" class="0">
<segment>
<pinref part="MUX2_9" gate="G$1" pin="P$4"/>
<pinref part="AND2_8" gate="G$1" pin="O"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<pinref part="MUX2_9" gate="G$1" pin="P$3"/>
<wire x1="165.1" y1="93.98" x2="165.1" y2="104.14" width="0.1524" layer="91"/>
<pinref part="TRISBUF_1" gate="G$1" pin="I"/>
<wire x1="165.1" y1="104.14" x2="180.34" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="TRISBUF_1" gate="G$1" pin="P$1"/>
<wire x1="171.45" y1="93.98" x2="170.18" y2="93.98" width="0.1524" layer="91"/>
<wire x1="170.18" y1="93.98" x2="170.18" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$60" class="0">
<segment>
<wire x1="185.42" y1="78.74" x2="180.34" y2="78.74" width="0.1524" layer="91"/>
<pinref part="TRISBUF_1" gate="G$1" pin="O"/>
<wire x1="180.34" y1="78.74" x2="-73.66" y2="78.74" width="0.1524" layer="91"/>
<junction x="180.34" y="78.74"/>
</segment>
</net>
<net name="N$61" class="0">
<segment>
<pinref part="MUX2_5" gate="G$1" pin="P$1"/>
<wire x1="40.64" y1="88.9" x2="35.56" y2="88.9" width="0.1524" layer="91"/>
<wire x1="35.56" y1="88.9" x2="35.56" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<pinref part="MUX2_4" gate="G$1" pin="P$1"/>
<wire x1="22.86" y1="88.9" x2="15.24" y2="88.9" width="0.1524" layer="91"/>
<wire x1="15.24" y1="88.9" x2="15.24" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$62" class="0">
<segment>
<pinref part="MUX2_3" gate="G$1" pin="P$1"/>
<wire x1="2.54" y1="88.9" x2="-10.16" y2="88.9" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="88.9" x2="-10.16" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$63" class="0">
<segment>
<wire x1="58.42" y1="88.9" x2="55.88" y2="88.9" width="0.1524" layer="91"/>
<wire x1="58.42" y1="88.9" x2="58.42" y2="76.2" width="0.1524" layer="91"/>
<wire x1="55.88" y1="93.98" x2="78.74" y2="93.98" width="0.1524" layer="91"/>
<pinref part="MUX2_6" gate="G$1" pin="P$1"/>
<wire x1="78.74" y1="93.98" x2="78.74" y2="88.9" width="0.1524" layer="91"/>
<pinref part="MUX2_5" gate="G$1" pin="P$3"/>
<wire x1="55.88" y1="88.9" x2="55.88" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="93.98" y1="88.9" x2="96.52" y2="88.9" width="0.1524" layer="91"/>
<wire x1="96.52" y1="88.9" x2="96.52" y2="76.2" width="0.1524" layer="91"/>
<wire x1="93.98" y1="93.98" x2="106.68" y2="93.98" width="0.1524" layer="91"/>
<pinref part="MUX2_7" gate="G$1" pin="P$1"/>
<wire x1="106.68" y1="93.98" x2="106.68" y2="88.9" width="0.1524" layer="91"/>
<pinref part="MUX2_6" gate="G$1" pin="P$3"/>
<wire x1="93.98" y1="88.9" x2="93.98" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
