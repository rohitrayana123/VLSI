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
</parts>
<sheets>
<sheet>
<plain>
<text x="-38.1" y="124.46" size="1.778" layer="92">A</text>
<text x="-38.1" y="121.92" size="1.778" layer="92">B</text>
<text x="-38.1" y="73.66" size="1.778" layer="92">ALUBus</text>
<wire x1="7.62" y1="88.9" x2="7.62" y2="86.36" width="0.4064" layer="94"/>
<wire x1="7.62" y1="86.36" x2="7.62" y2="83.82" width="0.4064" layer="94"/>
<wire x1="7.62" y1="83.82" x2="5.08" y2="81.28" width="0.4064" layer="94"/>
<wire x1="5.08" y1="81.28" x2="5.08" y2="83.82" width="0.4064" layer="94"/>
<wire x1="5.08" y1="83.82" x2="5.08" y2="88.9" width="0.4064" layer="94"/>
<wire x1="5.08" y1="88.9" x2="5.08" y2="91.44" width="0.4064" layer="94"/>
<wire x1="5.08" y1="91.44" x2="6.35" y2="90.17" width="0.4064" layer="94"/>
<wire x1="6.35" y1="90.17" x2="7.62" y2="88.9" width="0.4064" layer="94"/>
<wire x1="7.62" y1="86.36" x2="10.16" y2="86.36" width="0.1524" layer="94"/>
<wire x1="5.08" y1="88.9" x2="2.54" y2="88.9" width="0.1524" layer="94"/>
<wire x1="5.08" y1="83.82" x2="2.54" y2="83.82" width="0.1524" layer="94"/>
<wire x1="6.35" y1="90.17" x2="6.35" y2="92.964" width="0.1524" layer="94"/>
<text x="5.842" y="87.63" size="1.27" layer="94">0</text>
<text x="5.842" y="83.82" size="1.27" layer="94">1</text>
<wire x1="27.94" y1="88.9" x2="27.94" y2="86.36" width="0.4064" layer="94"/>
<wire x1="27.94" y1="86.36" x2="27.94" y2="83.82" width="0.4064" layer="94"/>
<wire x1="27.94" y1="83.82" x2="25.4" y2="81.28" width="0.4064" layer="94"/>
<wire x1="25.4" y1="81.28" x2="25.4" y2="83.82" width="0.4064" layer="94"/>
<wire x1="25.4" y1="83.82" x2="25.4" y2="88.9" width="0.4064" layer="94"/>
<wire x1="25.4" y1="88.9" x2="25.4" y2="91.44" width="0.4064" layer="94"/>
<wire x1="25.4" y1="91.44" x2="26.67" y2="90.17" width="0.4064" layer="94"/>
<wire x1="26.67" y1="90.17" x2="27.94" y2="88.9" width="0.4064" layer="94"/>
<wire x1="27.94" y1="86.36" x2="30.48" y2="86.36" width="0.1524" layer="94"/>
<wire x1="25.4" y1="88.9" x2="22.86" y2="88.9" width="0.1524" layer="94"/>
<wire x1="25.4" y1="83.82" x2="22.86" y2="83.82" width="0.1524" layer="94"/>
<wire x1="26.67" y1="90.17" x2="26.67" y2="92.964" width="0.1524" layer="94"/>
<text x="26.162" y="87.63" size="1.27" layer="94">0</text>
<text x="26.162" y="83.82" size="1.27" layer="94">1</text>
<wire x1="43.18" y1="88.9" x2="43.18" y2="86.36" width="0.4064" layer="94"/>
<wire x1="43.18" y1="86.36" x2="43.18" y2="83.82" width="0.4064" layer="94"/>
<wire x1="43.18" y1="83.82" x2="40.64" y2="81.28" width="0.4064" layer="94"/>
<wire x1="40.64" y1="81.28" x2="40.64" y2="83.82" width="0.4064" layer="94"/>
<wire x1="40.64" y1="83.82" x2="40.64" y2="88.9" width="0.4064" layer="94"/>
<wire x1="40.64" y1="88.9" x2="40.64" y2="91.44" width="0.4064" layer="94"/>
<wire x1="40.64" y1="91.44" x2="41.91" y2="90.17" width="0.4064" layer="94"/>
<wire x1="41.91" y1="90.17" x2="43.18" y2="88.9" width="0.4064" layer="94"/>
<wire x1="43.18" y1="86.36" x2="45.72" y2="86.36" width="0.1524" layer="94"/>
<wire x1="40.64" y1="88.9" x2="38.1" y2="88.9" width="0.1524" layer="94"/>
<wire x1="40.64" y1="83.82" x2="38.1" y2="83.82" width="0.1524" layer="94"/>
<wire x1="41.91" y1="90.17" x2="41.91" y2="92.964" width="0.1524" layer="94"/>
<text x="41.402" y="87.63" size="1.27" layer="94">0</text>
<text x="41.402" y="83.82" size="1.27" layer="94">1</text>
<wire x1="55.88" y1="88.9" x2="55.88" y2="86.36" width="0.4064" layer="94"/>
<wire x1="55.88" y1="86.36" x2="55.88" y2="83.82" width="0.4064" layer="94"/>
<wire x1="55.88" y1="83.82" x2="53.34" y2="81.28" width="0.4064" layer="94"/>
<wire x1="53.34" y1="81.28" x2="53.34" y2="83.82" width="0.4064" layer="94"/>
<wire x1="53.34" y1="83.82" x2="53.34" y2="88.9" width="0.4064" layer="94"/>
<wire x1="53.34" y1="88.9" x2="53.34" y2="91.44" width="0.4064" layer="94"/>
<wire x1="53.34" y1="91.44" x2="54.61" y2="90.17" width="0.4064" layer="94"/>
<wire x1="54.61" y1="90.17" x2="55.88" y2="88.9" width="0.4064" layer="94"/>
<wire x1="55.88" y1="86.36" x2="58.42" y2="86.36" width="0.1524" layer="94"/>
<wire x1="53.34" y1="88.9" x2="50.8" y2="88.9" width="0.1524" layer="94"/>
<wire x1="53.34" y1="83.82" x2="50.8" y2="83.82" width="0.1524" layer="94"/>
<wire x1="54.61" y1="90.17" x2="54.61" y2="92.964" width="0.1524" layer="94"/>
<text x="54.102" y="87.63" size="1.27" layer="94">0</text>
<text x="54.102" y="83.82" size="1.27" layer="94">1</text>
<wire x1="86.36" y1="88.9" x2="86.36" y2="86.36" width="0.4064" layer="94"/>
<wire x1="86.36" y1="86.36" x2="86.36" y2="83.82" width="0.4064" layer="94"/>
<wire x1="86.36" y1="83.82" x2="83.82" y2="81.28" width="0.4064" layer="94"/>
<wire x1="83.82" y1="81.28" x2="83.82" y2="83.82" width="0.4064" layer="94"/>
<wire x1="83.82" y1="83.82" x2="83.82" y2="88.9" width="0.4064" layer="94"/>
<wire x1="83.82" y1="88.9" x2="83.82" y2="91.44" width="0.4064" layer="94"/>
<wire x1="83.82" y1="91.44" x2="85.09" y2="90.17" width="0.4064" layer="94"/>
<wire x1="85.09" y1="90.17" x2="86.36" y2="88.9" width="0.4064" layer="94"/>
<wire x1="86.36" y1="86.36" x2="88.9" y2="86.36" width="0.1524" layer="94"/>
<wire x1="83.82" y1="88.9" x2="81.28" y2="88.9" width="0.1524" layer="94"/>
<wire x1="83.82" y1="83.82" x2="81.28" y2="83.82" width="0.1524" layer="94"/>
<wire x1="85.09" y1="90.17" x2="85.09" y2="92.964" width="0.1524" layer="94"/>
<text x="84.582" y="87.63" size="1.27" layer="94">0</text>
<text x="84.582" y="83.82" size="1.27" layer="94">1</text>
<wire x1="106.68" y1="88.9" x2="106.68" y2="86.36" width="0.4064" layer="94"/>
<wire x1="106.68" y1="86.36" x2="106.68" y2="83.82" width="0.4064" layer="94"/>
<wire x1="106.68" y1="83.82" x2="104.14" y2="81.28" width="0.4064" layer="94"/>
<wire x1="104.14" y1="81.28" x2="104.14" y2="83.82" width="0.4064" layer="94"/>
<wire x1="104.14" y1="83.82" x2="104.14" y2="88.9" width="0.4064" layer="94"/>
<wire x1="104.14" y1="88.9" x2="104.14" y2="91.44" width="0.4064" layer="94"/>
<wire x1="104.14" y1="91.44" x2="105.41" y2="90.17" width="0.4064" layer="94"/>
<wire x1="105.41" y1="90.17" x2="106.68" y2="88.9" width="0.4064" layer="94"/>
<wire x1="106.68" y1="86.36" x2="109.22" y2="86.36" width="0.1524" layer="94"/>
<wire x1="104.14" y1="88.9" x2="101.6" y2="88.9" width="0.1524" layer="94"/>
<wire x1="104.14" y1="83.82" x2="101.6" y2="83.82" width="0.1524" layer="94"/>
<wire x1="105.41" y1="90.17" x2="105.41" y2="92.964" width="0.1524" layer="94"/>
<text x="104.902" y="87.63" size="1.27" layer="94">0</text>
<text x="104.902" y="83.82" size="1.27" layer="94">1</text>
<wire x1="121.92" y1="88.9" x2="121.92" y2="86.36" width="0.4064" layer="94"/>
<wire x1="121.92" y1="86.36" x2="121.92" y2="83.82" width="0.4064" layer="94"/>
<wire x1="121.92" y1="83.82" x2="119.38" y2="81.28" width="0.4064" layer="94"/>
<wire x1="119.38" y1="81.28" x2="119.38" y2="83.82" width="0.4064" layer="94"/>
<wire x1="119.38" y1="83.82" x2="119.38" y2="88.9" width="0.4064" layer="94"/>
<wire x1="119.38" y1="88.9" x2="119.38" y2="91.44" width="0.4064" layer="94"/>
<wire x1="119.38" y1="91.44" x2="120.65" y2="90.17" width="0.4064" layer="94"/>
<wire x1="120.65" y1="90.17" x2="121.92" y2="88.9" width="0.4064" layer="94"/>
<wire x1="121.92" y1="86.36" x2="124.46" y2="86.36" width="0.1524" layer="94"/>
<wire x1="119.38" y1="88.9" x2="116.84" y2="88.9" width="0.1524" layer="94"/>
<wire x1="119.38" y1="83.82" x2="116.84" y2="83.82" width="0.1524" layer="94"/>
<wire x1="120.65" y1="90.17" x2="120.65" y2="92.964" width="0.1524" layer="94"/>
<text x="120.142" y="87.63" size="1.27" layer="94">0</text>
<text x="120.142" y="83.82" size="1.27" layer="94">1</text>
<wire x1="134.62" y1="88.9" x2="134.62" y2="86.36" width="0.4064" layer="94"/>
<wire x1="134.62" y1="86.36" x2="134.62" y2="83.82" width="0.4064" layer="94"/>
<wire x1="134.62" y1="83.82" x2="132.08" y2="81.28" width="0.4064" layer="94"/>
<wire x1="132.08" y1="81.28" x2="132.08" y2="83.82" width="0.4064" layer="94"/>
<wire x1="132.08" y1="83.82" x2="132.08" y2="88.9" width="0.4064" layer="94"/>
<wire x1="132.08" y1="88.9" x2="132.08" y2="91.44" width="0.4064" layer="94"/>
<wire x1="132.08" y1="91.44" x2="133.35" y2="90.17" width="0.4064" layer="94"/>
<wire x1="133.35" y1="90.17" x2="134.62" y2="88.9" width="0.4064" layer="94"/>
<wire x1="134.62" y1="86.36" x2="137.16" y2="86.36" width="0.1524" layer="94"/>
<wire x1="132.08" y1="88.9" x2="129.54" y2="88.9" width="0.1524" layer="94"/>
<wire x1="132.08" y1="83.82" x2="129.54" y2="83.82" width="0.1524" layer="94"/>
<wire x1="133.35" y1="90.17" x2="133.35" y2="92.964" width="0.1524" layer="94"/>
<text x="132.842" y="87.63" size="1.27" layer="94">0</text>
<text x="132.842" y="83.82" size="1.27" layer="94">1</text>
<wire x1="10.16" y1="104.14" x2="6.35" y2="94.996" width="0.4064" layer="94" curve="-57.994617"/>
<wire x1="2.54" y1="104.14" x2="6.35" y2="94.996" width="0.4064" layer="94" curve="57.994617"/>
<wire x1="10.16" y1="104.14" x2="7.62" y2="104.14" width="0.4064" layer="94"/>
<wire x1="7.62" y1="104.14" x2="5.08" y2="104.14" width="0.4064" layer="94"/>
<wire x1="5.08" y1="104.14" x2="2.54" y2="104.14" width="0.4064" layer="94"/>
<wire x1="6.35" y1="94.996" x2="6.35" y2="93.218" width="0.1524" layer="94"/>
<wire x1="7.62" y1="104.14" x2="7.62" y2="106.68" width="0.1524" layer="94"/>
<wire x1="5.08" y1="104.14" x2="5.08" y2="106.68" width="0.1524" layer="94"/>
<wire x1="30.48" y1="104.14" x2="26.67" y2="94.996" width="0.4064" layer="94" curve="-57.994617"/>
<wire x1="22.86" y1="104.14" x2="26.67" y2="94.996" width="0.4064" layer="94" curve="57.994617"/>
<wire x1="30.48" y1="104.14" x2="27.94" y2="104.14" width="0.4064" layer="94"/>
<wire x1="27.94" y1="104.14" x2="25.4" y2="104.14" width="0.4064" layer="94"/>
<wire x1="25.4" y1="104.14" x2="22.86" y2="104.14" width="0.4064" layer="94"/>
<wire x1="26.67" y1="94.996" x2="26.67" y2="93.218" width="0.1524" layer="94"/>
<wire x1="27.94" y1="104.14" x2="27.94" y2="106.68" width="0.1524" layer="94"/>
<wire x1="25.4" y1="104.14" x2="25.4" y2="106.68" width="0.1524" layer="94"/>
<wire x1="45.72" y1="104.14" x2="41.91" y2="94.996" width="0.4064" layer="94" curve="-57.994617"/>
<wire x1="38.1" y1="104.14" x2="41.91" y2="94.996" width="0.4064" layer="94" curve="57.994617"/>
<wire x1="45.72" y1="104.14" x2="43.18" y2="104.14" width="0.4064" layer="94"/>
<wire x1="43.18" y1="104.14" x2="40.64" y2="104.14" width="0.4064" layer="94"/>
<wire x1="40.64" y1="104.14" x2="38.1" y2="104.14" width="0.4064" layer="94"/>
<wire x1="41.91" y1="94.996" x2="41.91" y2="93.218" width="0.1524" layer="94"/>
<wire x1="43.18" y1="104.14" x2="43.18" y2="106.68" width="0.1524" layer="94"/>
<wire x1="40.64" y1="104.14" x2="40.64" y2="106.68" width="0.1524" layer="94"/>
<wire x1="58.42" y1="104.14" x2="54.61" y2="94.996" width="0.4064" layer="94" curve="-57.994617"/>
<wire x1="50.8" y1="104.14" x2="54.61" y2="94.996" width="0.4064" layer="94" curve="57.994617"/>
<wire x1="58.42" y1="104.14" x2="55.88" y2="104.14" width="0.4064" layer="94"/>
<wire x1="55.88" y1="104.14" x2="53.34" y2="104.14" width="0.4064" layer="94"/>
<wire x1="53.34" y1="104.14" x2="50.8" y2="104.14" width="0.4064" layer="94"/>
<wire x1="54.61" y1="94.996" x2="54.61" y2="93.218" width="0.1524" layer="94"/>
<wire x1="55.88" y1="104.14" x2="55.88" y2="106.68" width="0.1524" layer="94"/>
<wire x1="53.34" y1="104.14" x2="53.34" y2="106.68" width="0.1524" layer="94"/>
<wire x1="88.9" y1="104.14" x2="85.09" y2="94.996" width="0.4064" layer="94" curve="-57.994617"/>
<wire x1="81.28" y1="104.14" x2="85.09" y2="94.996" width="0.4064" layer="94" curve="57.994617"/>
<wire x1="88.9" y1="104.14" x2="86.36" y2="104.14" width="0.4064" layer="94"/>
<wire x1="86.36" y1="104.14" x2="83.82" y2="104.14" width="0.4064" layer="94"/>
<wire x1="83.82" y1="104.14" x2="81.28" y2="104.14" width="0.4064" layer="94"/>
<wire x1="85.09" y1="94.996" x2="85.09" y2="93.218" width="0.1524" layer="94"/>
<wire x1="86.36" y1="104.14" x2="86.36" y2="106.68" width="0.1524" layer="94"/>
<wire x1="83.82" y1="104.14" x2="83.82" y2="106.68" width="0.1524" layer="94"/>
<wire x1="109.22" y1="104.14" x2="105.41" y2="94.996" width="0.4064" layer="94" curve="-57.994617"/>
<wire x1="101.6" y1="104.14" x2="105.41" y2="94.996" width="0.4064" layer="94" curve="57.994617"/>
<wire x1="109.22" y1="104.14" x2="106.68" y2="104.14" width="0.4064" layer="94"/>
<wire x1="106.68" y1="104.14" x2="104.14" y2="104.14" width="0.4064" layer="94"/>
<wire x1="104.14" y1="104.14" x2="101.6" y2="104.14" width="0.4064" layer="94"/>
<wire x1="105.41" y1="94.996" x2="105.41" y2="93.218" width="0.1524" layer="94"/>
<wire x1="106.68" y1="104.14" x2="106.68" y2="106.68" width="0.1524" layer="94"/>
<wire x1="104.14" y1="104.14" x2="104.14" y2="106.68" width="0.1524" layer="94"/>
<wire x1="124.46" y1="104.14" x2="120.65" y2="94.996" width="0.4064" layer="94" curve="-57.994617"/>
<wire x1="116.84" y1="104.14" x2="120.65" y2="94.996" width="0.4064" layer="94" curve="57.994617"/>
<wire x1="124.46" y1="104.14" x2="121.92" y2="104.14" width="0.4064" layer="94"/>
<wire x1="121.92" y1="104.14" x2="119.38" y2="104.14" width="0.4064" layer="94"/>
<wire x1="119.38" y1="104.14" x2="116.84" y2="104.14" width="0.4064" layer="94"/>
<wire x1="120.65" y1="94.996" x2="120.65" y2="93.218" width="0.1524" layer="94"/>
<wire x1="121.92" y1="104.14" x2="121.92" y2="106.68" width="0.1524" layer="94"/>
<wire x1="119.38" y1="104.14" x2="119.38" y2="106.68" width="0.1524" layer="94"/>
<wire x1="137.16" y1="104.14" x2="133.35" y2="94.996" width="0.4064" layer="94" curve="-57.994617"/>
<wire x1="129.54" y1="104.14" x2="133.35" y2="94.996" width="0.4064" layer="94" curve="57.994617"/>
<wire x1="137.16" y1="104.14" x2="134.62" y2="104.14" width="0.4064" layer="94"/>
<wire x1="134.62" y1="104.14" x2="132.08" y2="104.14" width="0.4064" layer="94"/>
<wire x1="132.08" y1="104.14" x2="129.54" y2="104.14" width="0.4064" layer="94"/>
<wire x1="133.35" y1="94.996" x2="133.35" y2="93.218" width="0.1524" layer="94"/>
<wire x1="134.62" y1="104.14" x2="134.62" y2="106.68" width="0.1524" layer="94"/>
<wire x1="132.08" y1="104.14" x2="132.08" y2="106.68" width="0.1524" layer="94"/>
<text x="5.08" y="127" size="1.27" layer="91">ShL</text>
<text x="83.82" y="127" size="1.27" layer="91">ShR</text>
<text x="7.62" y="129.54" size="1.27" layer="91">Sh8</text>
<text x="27.94" y="127" size="1.27" layer="91">Sh4</text>
<text x="43.18" y="127" size="1.27" layer="91">Sh2</text>
<text x="55.88" y="127" size="1.27" layer="91">Sh1</text>
<wire x1="-27.94" y1="101.6" x2="-27.94" y2="99.06" width="0.4064" layer="94"/>
<wire x1="-27.94" y1="99.06" x2="-27.94" y2="96.52" width="0.4064" layer="94"/>
<wire x1="-27.94" y1="96.52" x2="-30.48" y2="93.98" width="0.4064" layer="94"/>
<wire x1="-30.48" y1="93.98" x2="-30.48" y2="96.52" width="0.4064" layer="94"/>
<wire x1="-30.48" y1="96.52" x2="-30.48" y2="101.6" width="0.4064" layer="94"/>
<wire x1="-30.48" y1="101.6" x2="-30.48" y2="104.14" width="0.4064" layer="94"/>
<wire x1="-30.48" y1="104.14" x2="-29.21" y2="102.87" width="0.4064" layer="94"/>
<wire x1="-29.21" y1="102.87" x2="-27.94" y2="101.6" width="0.4064" layer="94"/>
<wire x1="-27.94" y1="99.06" x2="-25.4" y2="99.06" width="0.1524" layer="94"/>
<wire x1="-30.48" y1="101.6" x2="-33.02" y2="101.6" width="0.1524" layer="94"/>
<wire x1="-30.48" y1="96.52" x2="-33.02" y2="96.52" width="0.1524" layer="94"/>
<wire x1="-29.21" y1="102.87" x2="-29.21" y2="105.664" width="0.1524" layer="94"/>
<text x="-29.718" y="100.33" size="1.27" layer="94">0</text>
<text x="-29.718" y="96.52" size="1.27" layer="94">1</text>
<text x="-29.21" y="127" size="1.27" layer="91">ShB</text>
<wire x1="139.7" y1="86.36" x2="143.51" y2="86.36" width="0.4064" layer="94"/>
<wire x1="143.51" y1="86.36" x2="147.32" y2="86.36" width="0.4064" layer="94"/>
<wire x1="147.32" y1="86.36" x2="145.542" y2="82.804" width="0.4064" layer="94"/>
<wire x1="145.542" y1="82.804" x2="144.78" y2="81.28" width="0.4064" layer="94"/>
<wire x1="144.78" y1="81.28" x2="143.51" y2="78.994" width="0.4064" layer="94"/>
<wire x1="143.51" y1="78.994" x2="139.7" y2="86.36" width="0.4064" layer="94"/>
<wire x1="143.51" y1="86.36" x2="143.51" y2="88.9" width="0.1524" layer="94"/>
<wire x1="143.51" y1="78.994" x2="143.51" y2="76.454" width="0.1524" layer="94"/>
<text x="149.86" y="81.28" size="1.27" layer="91" rot="R180">ShOut</text>
<wire x1="-40.64" y1="129.54" x2="-22.86" y2="129.54" width="0.1524" layer="98" style="longdash"/>
<wire x1="-22.86" y1="129.54" x2="-22.86" y2="71.12" width="0.1524" layer="98" style="longdash"/>
<wire x1="-22.86" y1="71.12" x2="-40.64" y2="71.12" width="0.1524" layer="98" style="longdash"/>
<wire x1="-40.64" y1="71.12" x2="-40.64" y2="129.54" width="0.1524" layer="98" style="longdash"/>
<text x="-26.162" y="71.628" size="1.27" layer="98">LUI</text>
<wire x1="145.542" y1="82.804" x2="147.574" y2="82.804" width="0.1524" layer="94" style="longdash"/>
</plain>
<instances>
</instances>
<busses>
<bus name="B$1">
<segment>
<wire x1="-38.1" y1="124.46" x2="-33.02" y2="124.46" width="0.1524" layer="92"/>
<wire x1="-33.02" y1="124.46" x2="-33.02" y2="101.6" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$2">
<segment>
<wire x1="-38.1" y1="121.92" x2="-35.56" y2="121.92" width="0.1524" layer="92"/>
<wire x1="-35.56" y1="121.92" x2="-35.56" y2="96.52" width="0.1524" layer="92"/>
<wire x1="-35.56" y1="96.52" x2="-33.02" y2="96.52" width="0.1524" layer="92"/>
<wire x1="-35.56" y1="121.92" x2="152.4" y2="121.92" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$3">
<segment>
<wire x1="-38.1" y1="73.66" x2="143.51" y2="73.66" width="0.1524" layer="92"/>
<wire x1="143.51" y1="73.66" x2="152.4" y2="73.66" width="0.1524" layer="92"/>
<wire x1="143.51" y1="73.66" x2="143.51" y2="76.454" width="0.1524" layer="92" style="longdash"/>
</segment>
</bus>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="5.08" y1="106.68" x2="5.08" y2="109.22" width="0.1524" layer="91"/>
<wire x1="5.08" y1="109.22" x2="5.08" y2="127" width="0.1524" layer="91"/>
<wire x1="25.4" y1="106.68" x2="25.4" y2="109.22" width="0.1524" layer="91"/>
<wire x1="25.4" y1="109.22" x2="5.08" y2="109.22" width="0.1524" layer="91"/>
<wire x1="25.4" y1="109.22" x2="40.64" y2="109.22" width="0.1524" layer="91"/>
<wire x1="40.64" y1="106.68" x2="40.64" y2="109.22" width="0.1524" layer="91"/>
<wire x1="40.64" y1="109.22" x2="53.34" y2="109.22" width="0.1524" layer="91"/>
<wire x1="53.34" y1="106.68" x2="53.34" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="83.82" y1="106.68" x2="83.82" y2="109.22" width="0.1524" layer="91"/>
<wire x1="83.82" y1="127" x2="83.82" y2="109.22" width="0.1524" layer="91"/>
<wire x1="83.82" y1="109.22" x2="104.14" y2="109.22" width="0.1524" layer="91"/>
<wire x1="104.14" y1="106.68" x2="104.14" y2="109.22" width="0.1524" layer="91"/>
<wire x1="104.14" y1="109.22" x2="119.38" y2="109.22" width="0.1524" layer="91"/>
<wire x1="119.38" y1="106.68" x2="119.38" y2="109.22" width="0.1524" layer="91"/>
<wire x1="119.38" y1="109.22" x2="132.08" y2="109.22" width="0.1524" layer="91"/>
<wire x1="132.08" y1="106.68" x2="132.08" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="22.86" y1="88.9" x2="12.7" y2="88.9" width="0.1524" layer="91"/>
<wire x1="12.7" y1="88.9" x2="10.16" y2="88.9" width="0.1524" layer="91"/>
<wire x1="10.16" y1="88.9" x2="10.16" y2="86.36" width="0.1524" layer="91"/>
<wire x1="12.7" y1="88.9" x2="12.7" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="30.48" y1="86.36" x2="30.48" y2="88.9" width="0.1524" layer="91"/>
<wire x1="30.48" y1="88.9" x2="33.02" y2="88.9" width="0.1524" layer="91"/>
<wire x1="33.02" y1="88.9" x2="38.1" y2="88.9" width="0.1524" layer="91"/>
<wire x1="33.02" y1="88.9" x2="33.02" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="45.72" y1="86.36" x2="45.72" y2="88.9" width="0.1524" layer="91"/>
<wire x1="45.72" y1="88.9" x2="48.26" y2="88.9" width="0.1524" layer="91"/>
<wire x1="48.26" y1="88.9" x2="50.8" y2="88.9" width="0.1524" layer="91"/>
<wire x1="48.26" y1="88.9" x2="48.26" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="58.42" y1="88.9" x2="81.28" y2="88.9" width="0.1524" layer="91"/>
<wire x1="60.96" y1="83.82" x2="58.42" y2="83.82" width="0.1524" layer="91"/>
<wire x1="58.42" y1="83.82" x2="58.42" y2="88.9" width="0.1524" layer="91"/>
<wire x1="60.96" y1="83.82" x2="60.96" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="88.9" y1="88.9" x2="101.6" y2="88.9" width="0.1524" layer="91"/>
<wire x1="88.9" y1="88.9" x2="88.9" y2="83.82" width="0.1524" layer="91"/>
<wire x1="88.9" y1="83.82" x2="91.44" y2="83.82" width="0.1524" layer="91"/>
<wire x1="91.44" y1="83.82" x2="91.44" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="109.22" y1="88.9" x2="116.84" y2="88.9" width="0.1524" layer="91"/>
<wire x1="109.22" y1="88.9" x2="109.22" y2="83.82" width="0.1524" layer="91"/>
<wire x1="109.22" y1="83.82" x2="111.76" y2="83.82" width="0.1524" layer="91"/>
<wire x1="111.76" y1="83.82" x2="111.76" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="2.54" y1="83.82" x2="-2.54" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="83.82" x2="-2.54" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="-2.54" y1="127" x2="-2.54" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="86.36" x2="-3.81" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-3.81" y1="86.36" x2="-3.81" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="71.12" x2="-5.08" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-3.81" y1="83.82" x2="-5.08" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="-5.08" y1="127" x2="-5.08" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="86.36" x2="-6.35" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-6.35" y1="86.36" x2="-6.35" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="71.12" x2="-7.62" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-6.35" y1="83.82" x2="-7.62" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="-7.62" y1="127" x2="-7.62" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="86.36" x2="-8.89" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-8.89" y1="86.36" x2="-8.89" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="71.12" x2="-10.16" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-8.89" y1="83.82" x2="-10.16" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="-10.16" y1="127" x2="-10.16" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="86.36" x2="-11.43" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-11.43" y1="86.36" x2="-11.43" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="71.12" x2="-12.7" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-11.43" y1="83.82" x2="-12.7" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="-12.7" y1="127" x2="-12.7" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="86.36" x2="-13.97" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-13.97" y1="86.36" x2="-13.97" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="71.12" x2="-15.24" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-13.97" y1="83.82" x2="-15.24" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="-15.24" y1="127" x2="-15.24" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="86.36" x2="-16.51" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-16.51" y1="86.36" x2="-16.51" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="71.12" x2="-17.78" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-16.51" y1="83.82" x2="-17.78" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="-17.78" y1="127" x2="-17.78" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="86.36" x2="-19.05" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-19.05" y1="86.36" x2="-19.05" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="71.12" x2="-20.32" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-19.05" y1="83.82" x2="-20.32" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="20.32" y1="127" x2="20.32" y2="86.36" width="0.1524" layer="91"/>
<wire x1="20.32" y1="86.36" x2="19.05" y2="86.36" width="0.1524" layer="91"/>
<wire x1="19.05" y1="86.36" x2="19.05" y2="83.82" width="0.1524" layer="91"/>
<wire x1="17.78" y1="71.12" x2="17.78" y2="83.82" width="0.1524" layer="91"/>
<wire x1="19.05" y1="83.82" x2="17.78" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="17.78" y1="127" x2="17.78" y2="86.36" width="0.1524" layer="91"/>
<wire x1="17.78" y1="86.36" x2="16.51" y2="86.36" width="0.1524" layer="91"/>
<wire x1="16.51" y1="86.36" x2="16.51" y2="83.82" width="0.1524" layer="91"/>
<wire x1="15.24" y1="71.12" x2="15.24" y2="83.82" width="0.1524" layer="91"/>
<wire x1="16.51" y1="83.82" x2="15.24" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="15.24" y1="127" x2="15.24" y2="86.36" width="0.1524" layer="91"/>
<wire x1="15.24" y1="86.36" x2="13.97" y2="86.36" width="0.1524" layer="91"/>
<wire x1="13.97" y1="86.36" x2="13.97" y2="83.82" width="0.1524" layer="91"/>
<wire x1="12.7" y1="71.12" x2="12.7" y2="83.82" width="0.1524" layer="91"/>
<wire x1="13.97" y1="83.82" x2="12.7" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<wire x1="22.86" y1="83.82" x2="20.32" y2="83.82" width="0.1524" layer="91"/>
<wire x1="20.32" y1="83.82" x2="20.32" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="-20.32" y1="127" x2="-20.32" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="35.56" y1="127" x2="35.56" y2="86.36" width="0.1524" layer="91"/>
<wire x1="35.56" y1="86.36" x2="34.29" y2="86.36" width="0.1524" layer="91"/>
<wire x1="34.29" y1="86.36" x2="34.29" y2="83.82" width="0.1524" layer="91"/>
<wire x1="33.02" y1="71.12" x2="33.02" y2="83.82" width="0.1524" layer="91"/>
<wire x1="34.29" y1="83.82" x2="33.02" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="35.56" y1="71.12" x2="35.56" y2="83.82" width="0.1524" layer="91"/>
<wire x1="35.56" y1="83.82" x2="38.1" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<wire x1="48.26" y1="83.82" x2="48.26" y2="71.12" width="0.1524" layer="91"/>
<wire x1="48.26" y1="83.82" x2="50.8" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<wire x1="63.5" y1="71.12" x2="63.5" y2="83.82" width="0.1524" layer="91"/>
<wire x1="63.5" y1="83.82" x2="62.23" y2="83.82" width="0.1524" layer="91"/>
<wire x1="62.23" y1="83.82" x2="62.23" y2="86.36" width="0.1524" layer="91"/>
<wire x1="60.96" y1="127" x2="60.96" y2="86.36" width="0.1524" layer="91"/>
<wire x1="62.23" y1="86.36" x2="60.96" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="66.04" y1="71.12" x2="66.04" y2="83.82" width="0.1524" layer="91"/>
<wire x1="66.04" y1="83.82" x2="64.77" y2="83.82" width="0.1524" layer="91"/>
<wire x1="64.77" y1="83.82" x2="64.77" y2="86.36" width="0.1524" layer="91"/>
<wire x1="63.5" y1="127" x2="63.5" y2="86.36" width="0.1524" layer="91"/>
<wire x1="64.77" y1="86.36" x2="63.5" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<wire x1="68.58" y1="71.12" x2="68.58" y2="83.82" width="0.1524" layer="91"/>
<wire x1="68.58" y1="83.82" x2="67.31" y2="83.82" width="0.1524" layer="91"/>
<wire x1="67.31" y1="83.82" x2="67.31" y2="86.36" width="0.1524" layer="91"/>
<wire x1="66.04" y1="127" x2="66.04" y2="86.36" width="0.1524" layer="91"/>
<wire x1="67.31" y1="86.36" x2="66.04" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<wire x1="71.12" y1="71.12" x2="71.12" y2="83.82" width="0.1524" layer="91"/>
<wire x1="71.12" y1="83.82" x2="69.85" y2="83.82" width="0.1524" layer="91"/>
<wire x1="69.85" y1="83.82" x2="69.85" y2="86.36" width="0.1524" layer="91"/>
<wire x1="68.58" y1="127" x2="68.58" y2="86.36" width="0.1524" layer="91"/>
<wire x1="69.85" y1="86.36" x2="68.58" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<wire x1="73.66" y1="71.12" x2="73.66" y2="83.82" width="0.1524" layer="91"/>
<wire x1="73.66" y1="83.82" x2="72.39" y2="83.82" width="0.1524" layer="91"/>
<wire x1="72.39" y1="83.82" x2="72.39" y2="86.36" width="0.1524" layer="91"/>
<wire x1="71.12" y1="127" x2="71.12" y2="86.36" width="0.1524" layer="91"/>
<wire x1="72.39" y1="86.36" x2="71.12" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<wire x1="76.2" y1="71.12" x2="76.2" y2="83.82" width="0.1524" layer="91"/>
<wire x1="76.2" y1="83.82" x2="74.93" y2="83.82" width="0.1524" layer="91"/>
<wire x1="74.93" y1="83.82" x2="74.93" y2="86.36" width="0.1524" layer="91"/>
<wire x1="73.66" y1="127" x2="73.66" y2="86.36" width="0.1524" layer="91"/>
<wire x1="74.93" y1="86.36" x2="73.66" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<wire x1="78.74" y1="71.12" x2="78.74" y2="83.82" width="0.1524" layer="91"/>
<wire x1="78.74" y1="83.82" x2="77.47" y2="83.82" width="0.1524" layer="91"/>
<wire x1="77.47" y1="83.82" x2="77.47" y2="86.36" width="0.1524" layer="91"/>
<wire x1="76.2" y1="127" x2="76.2" y2="86.36" width="0.1524" layer="91"/>
<wire x1="77.47" y1="86.36" x2="76.2" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<wire x1="78.74" y1="127" x2="78.74" y2="86.36" width="0.1524" layer="91"/>
<wire x1="78.74" y1="86.36" x2="81.28" y2="86.36" width="0.1524" layer="91"/>
<wire x1="81.28" y1="86.36" x2="81.28" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<wire x1="93.98" y1="71.12" x2="93.98" y2="83.82" width="0.1524" layer="91"/>
<wire x1="93.98" y1="83.82" x2="92.71" y2="83.82" width="0.1524" layer="91"/>
<wire x1="92.71" y1="83.82" x2="92.71" y2="86.36" width="0.1524" layer="91"/>
<wire x1="91.44" y1="127" x2="91.44" y2="86.36" width="0.1524" layer="91"/>
<wire x1="92.71" y1="86.36" x2="91.44" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<wire x1="96.52" y1="71.12" x2="96.52" y2="83.82" width="0.1524" layer="91"/>
<wire x1="96.52" y1="83.82" x2="95.25" y2="83.82" width="0.1524" layer="91"/>
<wire x1="95.25" y1="83.82" x2="95.25" y2="86.36" width="0.1524" layer="91"/>
<wire x1="93.98" y1="127" x2="93.98" y2="86.36" width="0.1524" layer="91"/>
<wire x1="95.25" y1="86.36" x2="93.98" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<wire x1="99.06" y1="71.12" x2="99.06" y2="83.82" width="0.1524" layer="91"/>
<wire x1="99.06" y1="83.82" x2="97.79" y2="83.82" width="0.1524" layer="91"/>
<wire x1="97.79" y1="83.82" x2="97.79" y2="86.36" width="0.1524" layer="91"/>
<wire x1="96.52" y1="127" x2="96.52" y2="86.36" width="0.1524" layer="91"/>
<wire x1="97.79" y1="86.36" x2="96.52" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<wire x1="99.06" y1="86.36" x2="99.06" y2="127" width="0.1524" layer="91"/>
<wire x1="99.06" y1="86.36" x2="101.6" y2="86.36" width="0.1524" layer="91"/>
<wire x1="101.6" y1="86.36" x2="101.6" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<wire x1="114.3" y1="71.12" x2="114.3" y2="83.82" width="0.1524" layer="91"/>
<wire x1="114.3" y1="83.82" x2="113.03" y2="83.82" width="0.1524" layer="91"/>
<wire x1="113.03" y1="83.82" x2="113.03" y2="86.36" width="0.1524" layer="91"/>
<wire x1="111.76" y1="127" x2="111.76" y2="86.36" width="0.1524" layer="91"/>
<wire x1="113.03" y1="86.36" x2="111.76" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<wire x1="114.3" y1="127" x2="114.3" y2="86.36" width="0.1524" layer="91"/>
<wire x1="114.3" y1="86.36" x2="116.84" y2="86.36" width="0.1524" layer="91"/>
<wire x1="116.84" y1="86.36" x2="116.84" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<wire x1="127" y1="127" x2="127" y2="86.36" width="0.1524" layer="91"/>
<wire x1="129.54" y1="83.82" x2="129.54" y2="86.36" width="0.1524" layer="91"/>
<wire x1="129.54" y1="86.36" x2="127" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="129.54" y1="88.9" x2="124.46" y2="88.9" width="0.1524" layer="91"/>
<wire x1="124.46" y1="88.9" x2="124.46" y2="83.82" width="0.1524" layer="91"/>
<wire x1="124.46" y1="83.82" x2="127" y2="83.82" width="0.1524" layer="91"/>
<wire x1="127" y1="83.82" x2="127" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<wire x1="7.62" y1="106.68" x2="7.62" y2="111.76" width="0.1524" layer="91"/>
<wire x1="7.62" y1="111.76" x2="86.36" y2="111.76" width="0.1524" layer="91"/>
<wire x1="86.36" y1="111.76" x2="86.36" y2="106.68" width="0.1524" layer="91"/>
<wire x1="7.62" y1="111.76" x2="7.62" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<wire x1="27.94" y1="106.68" x2="27.94" y2="114.3" width="0.1524" layer="91"/>
<wire x1="27.94" y1="114.3" x2="106.68" y2="114.3" width="0.1524" layer="91"/>
<wire x1="106.68" y1="114.3" x2="106.68" y2="106.68" width="0.1524" layer="91"/>
<wire x1="27.94" y1="114.3" x2="27.94" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<wire x1="43.18" y1="106.68" x2="43.18" y2="116.84" width="0.1524" layer="91"/>
<wire x1="43.18" y1="116.84" x2="43.18" y2="127" width="0.1524" layer="91"/>
<wire x1="43.18" y1="116.84" x2="121.92" y2="116.84" width="0.1524" layer="91"/>
<wire x1="121.92" y1="116.84" x2="121.92" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<wire x1="55.88" y1="106.68" x2="55.88" y2="119.38" width="0.1524" layer="91"/>
<wire x1="55.88" y1="119.38" x2="55.88" y2="127" width="0.1524" layer="91"/>
<wire x1="55.88" y1="119.38" x2="134.62" y2="119.38" width="0.1524" layer="91"/>
<wire x1="134.62" y1="119.38" x2="134.62" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<wire x1="-29.21" y1="105.664" x2="-29.21" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<wire x1="-25.4" y1="99.06" x2="0" y2="99.06" width="0.1524" layer="91"/>
<wire x1="0" y1="99.06" x2="0" y2="88.9" width="0.1524" layer="91"/>
<wire x1="0" y1="88.9" x2="2.54" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<wire x1="143.51" y1="88.9" x2="137.16" y2="88.9" width="0.1524" layer="91"/>
<wire x1="137.16" y1="88.9" x2="137.16" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<wire x1="149.86" y1="81.28" x2="149.86" y2="82.804" width="0.1524" layer="91"/>
<wire x1="149.86" y1="82.804" x2="147.574" y2="82.804" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
