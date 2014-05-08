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
<wire x1="-7.62" y1="101.6" x2="-2.54" y2="101.6" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="101.6" x2="2.54" y2="101.6" width="0.4064" layer="94"/>
<wire x1="2.54" y1="101.6" x2="-2.54" y2="91.44" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="91.44" x2="-7.62" y2="101.6" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="101.6" x2="-2.54" y2="104.14" width="0.1524" layer="94"/>
<circle x="-2.54" y="90.678" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="89.916" x2="-2.54" y2="88.9" width="0.1524" layer="94"/>
<wire x1="5.08" y1="101.6" x2="10.16" y2="101.6" width="0.4064" layer="94"/>
<wire x1="10.16" y1="101.6" x2="15.24" y2="101.6" width="0.4064" layer="94"/>
<wire x1="15.24" y1="101.6" x2="10.16" y2="91.44" width="0.4064" layer="94"/>
<wire x1="10.16" y1="91.44" x2="5.08" y2="101.6" width="0.4064" layer="94"/>
<wire x1="10.16" y1="101.6" x2="10.16" y2="104.14" width="0.1524" layer="94"/>
<circle x="10.16" y="90.678" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="10.16" y1="89.916" x2="10.16" y2="88.9" width="0.1524" layer="94"/>
<wire x1="17.78" y1="101.6" x2="22.86" y2="101.6" width="0.4064" layer="94"/>
<wire x1="22.86" y1="101.6" x2="27.94" y2="101.6" width="0.4064" layer="94"/>
<wire x1="27.94" y1="101.6" x2="22.86" y2="91.44" width="0.4064" layer="94"/>
<wire x1="22.86" y1="91.44" x2="17.78" y2="101.6" width="0.4064" layer="94"/>
<wire x1="22.86" y1="101.6" x2="22.86" y2="104.14" width="0.1524" layer="94"/>
<circle x="22.86" y="90.678" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="22.86" y1="89.916" x2="22.86" y2="88.9" width="0.1524" layer="94"/>
<wire x1="30.48" y1="101.6" x2="35.56" y2="101.6" width="0.4064" layer="94"/>
<wire x1="35.56" y1="101.6" x2="40.64" y2="101.6" width="0.4064" layer="94"/>
<wire x1="40.64" y1="101.6" x2="35.56" y2="91.44" width="0.4064" layer="94"/>
<wire x1="35.56" y1="91.44" x2="30.48" y2="101.6" width="0.4064" layer="94"/>
<wire x1="35.56" y1="101.6" x2="35.56" y2="104.14" width="0.1524" layer="94"/>
<circle x="35.56" y="90.678" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="35.56" y1="89.916" x2="35.56" y2="88.9" width="0.1524" layer="94"/>
<wire x1="43.18" y1="101.6" x2="48.26" y2="101.6" width="0.4064" layer="94"/>
<wire x1="48.26" y1="101.6" x2="53.34" y2="101.6" width="0.4064" layer="94"/>
<wire x1="53.34" y1="101.6" x2="48.26" y2="91.44" width="0.4064" layer="94"/>
<wire x1="48.26" y1="91.44" x2="43.18" y2="101.6" width="0.4064" layer="94"/>
<wire x1="48.26" y1="101.6" x2="48.26" y2="104.14" width="0.1524" layer="94"/>
<circle x="48.26" y="90.678" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="48.26" y1="89.916" x2="48.26" y2="88.9" width="0.1524" layer="94"/>
<wire x1="66.04" y1="101.6" x2="60.96" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="55.88" y1="101.6" x2="60.96" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="63.5" y1="104.902" x2="63.5" y2="101.6" width="0.1524" layer="94"/>
<wire x1="58.42" y1="104.902" x2="58.42" y2="101.6" width="0.1524" layer="94"/>
<wire x1="66.04" y1="101.6" x2="63.5" y2="101.6" width="0.4064" layer="94"/>
<wire x1="63.5" y1="101.6" x2="60.96" y2="101.6" width="0.4064" layer="94"/>
<wire x1="60.96" y1="101.6" x2="58.42" y2="101.6" width="0.4064" layer="94"/>
<wire x1="58.42" y1="101.6" x2="55.88" y2="101.6" width="0.4064" layer="94"/>
<circle x="60.96" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="60.96" y1="87.376" x2="60.96" y2="86.36" width="0.1524" layer="94"/>
<wire x1="60.96" y1="101.6" x2="60.96" y2="104.902" width="0.1524" layer="94"/>
<wire x1="68.58" y1="83.82" x2="63.5" y2="71.12" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="58.42" y1="83.82" x2="63.5" y2="71.12" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="66.04" y1="87.122" x2="66.04" y2="83.82" width="0.1524" layer="94"/>
<wire x1="60.96" y1="87.122" x2="60.96" y2="83.82" width="0.1524" layer="94"/>
<wire x1="68.58" y1="83.82" x2="66.04" y2="83.82" width="0.4064" layer="94"/>
<wire x1="66.04" y1="83.82" x2="60.96" y2="83.82" width="0.4064" layer="94"/>
<wire x1="60.96" y1="83.82" x2="58.42" y2="83.82" width="0.4064" layer="94"/>
<circle x="63.5" y="70.358" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="63.5" y1="69.596" x2="63.5" y2="68.58" width="0.1524" layer="94"/>
<text x="63.5" y="7.62" size="1.27" layer="91" rot="R180">FAOut</text>
<text x="48.26" y="132.08" size="1.27" layer="91">OpCode[0]</text>
<text x="35.56" y="132.08" size="1.27" layer="91">OpCode[1]</text>
<text x="22.86" y="132.08" size="1.27" layer="91">OpCode[2]</text>
<text x="10.16" y="132.08" size="1.27" layer="91">OpCode[3]</text>
<text x="-2.54" y="132.08" size="1.27" layer="91">OpCode[4]</text>
<text x="50.8" y="116.84" size="1.27" layer="92">A</text>
<text x="50.8" y="119.38" size="1.27" layer="92">B</text>
<text x="50.8" y="121.92" size="1.27" layer="92">C</text>
<text x="50.8" y="124.46" size="1.27" layer="92">D</text>
<text x="50.8" y="127" size="1.27" layer="92">E</text>
<text x="50.8" y="20.32" size="1.27" layer="92">!A</text>
<text x="50.8" y="17.78" size="1.27" layer="92">!B</text>
<text x="50.8" y="17.78" size="1.27" layer="92">!B</text>
<text x="50.8" y="15.24" size="1.27" layer="92">!C</text>
<text x="50.8" y="12.7" size="1.27" layer="92">!D</text>
<text x="50.8" y="10.16" size="1.27" layer="92">!E</text>
<wire x1="83.82" y1="101.6" x2="78.74" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="73.66" y1="101.6" x2="78.74" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="81.28" y1="104.902" x2="81.28" y2="101.6" width="0.1524" layer="94"/>
<wire x1="76.2" y1="104.902" x2="76.2" y2="101.6" width="0.1524" layer="94"/>
<wire x1="83.82" y1="101.6" x2="81.28" y2="101.6" width="0.4064" layer="94"/>
<wire x1="81.28" y1="101.6" x2="76.2" y2="101.6" width="0.4064" layer="94"/>
<wire x1="76.2" y1="101.6" x2="73.66" y2="101.6" width="0.4064" layer="94"/>
<circle x="78.74" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="78.74" y1="87.376" x2="78.74" y2="86.36" width="0.1524" layer="94"/>
<wire x1="86.36" y1="83.82" x2="81.28" y2="71.12" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="76.2" y1="83.82" x2="81.28" y2="71.12" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="83.82" y1="87.122" x2="83.82" y2="83.82" width="0.1524" layer="94"/>
<wire x1="78.74" y1="87.122" x2="78.74" y2="83.82" width="0.1524" layer="94"/>
<wire x1="86.36" y1="83.82" x2="83.82" y2="83.82" width="0.4064" layer="94"/>
<wire x1="83.82" y1="83.82" x2="78.74" y2="83.82" width="0.4064" layer="94"/>
<wire x1="78.74" y1="83.82" x2="76.2" y2="83.82" width="0.4064" layer="94"/>
<circle x="81.28" y="70.358" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="81.28" y1="69.596" x2="81.28" y2="68.58" width="0.1524" layer="94"/>
<wire x1="88.9" y1="66.04" x2="83.82" y2="53.34" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="78.74" y1="66.04" x2="83.82" y2="53.34" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="86.36" y1="69.342" x2="86.36" y2="66.04" width="0.1524" layer="94"/>
<wire x1="81.28" y1="69.342" x2="81.28" y2="66.04" width="0.1524" layer="94"/>
<wire x1="88.9" y1="66.04" x2="86.36" y2="66.04" width="0.4064" layer="94"/>
<wire x1="86.36" y1="66.04" x2="83.82" y2="66.04" width="0.4064" layer="94"/>
<wire x1="83.82" y1="66.04" x2="81.28" y2="66.04" width="0.4064" layer="94"/>
<wire x1="81.28" y1="66.04" x2="78.74" y2="66.04" width="0.4064" layer="94"/>
<circle x="83.82" y="52.578" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="83.82" y1="51.816" x2="83.82" y2="50.8" width="0.1524" layer="94"/>
<wire x1="83.82" y1="66.04" x2="83.82" y2="69.342" width="0.1524" layer="94"/>
<wire x1="109.22" y1="101.6" x2="104.14" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="99.06" y1="101.6" x2="104.14" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="106.68" y1="104.902" x2="106.68" y2="101.6" width="0.1524" layer="94"/>
<wire x1="101.6" y1="104.902" x2="101.6" y2="101.6" width="0.1524" layer="94"/>
<wire x1="109.22" y1="101.6" x2="106.68" y2="101.6" width="0.4064" layer="94"/>
<wire x1="106.68" y1="101.6" x2="104.14" y2="101.6" width="0.4064" layer="94"/>
<wire x1="104.14" y1="101.6" x2="101.6" y2="101.6" width="0.4064" layer="94"/>
<wire x1="101.6" y1="101.6" x2="99.06" y2="101.6" width="0.4064" layer="94"/>
<circle x="104.14" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="104.14" y1="87.376" x2="104.14" y2="86.36" width="0.1524" layer="94"/>
<wire x1="104.14" y1="101.6" x2="104.14" y2="104.902" width="0.1524" layer="94"/>
<wire x1="121.92" y1="101.6" x2="116.84" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="111.76" y1="101.6" x2="116.84" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="119.38" y1="104.902" x2="119.38" y2="101.6" width="0.1524" layer="94"/>
<wire x1="114.3" y1="104.902" x2="114.3" y2="101.6" width="0.1524" layer="94"/>
<wire x1="121.92" y1="101.6" x2="119.38" y2="101.6" width="0.4064" layer="94"/>
<wire x1="119.38" y1="101.6" x2="116.84" y2="101.6" width="0.4064" layer="94"/>
<wire x1="116.84" y1="101.6" x2="114.3" y2="101.6" width="0.4064" layer="94"/>
<wire x1="114.3" y1="101.6" x2="111.76" y2="101.6" width="0.4064" layer="94"/>
<circle x="116.84" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="116.84" y1="87.376" x2="116.84" y2="86.36" width="0.1524" layer="94"/>
<wire x1="116.84" y1="101.6" x2="116.84" y2="104.902" width="0.1524" layer="94"/>
<wire x1="116.84" y1="81.28" x2="111.76" y2="68.58" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="106.68" y1="81.28" x2="111.76" y2="68.58" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="114.3" y1="84.582" x2="114.3" y2="81.28" width="0.1524" layer="94"/>
<wire x1="109.22" y1="84.582" x2="109.22" y2="81.28" width="0.1524" layer="94"/>
<wire x1="116.84" y1="81.28" x2="114.3" y2="81.28" width="0.4064" layer="94"/>
<wire x1="114.3" y1="81.28" x2="109.22" y2="81.28" width="0.4064" layer="94"/>
<wire x1="109.22" y1="81.28" x2="106.68" y2="81.28" width="0.4064" layer="94"/>
<circle x="111.76" y="67.818" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="111.76" y1="67.056" x2="111.76" y2="66.04" width="0.1524" layer="94"/>
<wire x1="119.38" y1="63.5" x2="114.3" y2="50.8" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="109.22" y1="63.5" x2="114.3" y2="50.8" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="116.84" y1="66.802" x2="116.84" y2="63.5" width="0.1524" layer="94"/>
<wire x1="111.76" y1="66.802" x2="111.76" y2="63.5" width="0.1524" layer="94"/>
<wire x1="119.38" y1="63.5" x2="116.84" y2="63.5" width="0.4064" layer="94"/>
<wire x1="116.84" y1="63.5" x2="111.76" y2="63.5" width="0.4064" layer="94"/>
<wire x1="111.76" y1="63.5" x2="109.22" y2="63.5" width="0.4064" layer="94"/>
<circle x="114.3" y="50.038" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="116.84" y1="45.72" x2="111.76" y2="33.02" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="106.68" y1="45.72" x2="111.76" y2="33.02" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="109.22" y1="49.022" x2="109.22" y2="45.72" width="0.1524" layer="94"/>
<wire x1="116.84" y1="45.72" x2="114.3" y2="45.72" width="0.4064" layer="94"/>
<wire x1="114.3" y1="45.72" x2="109.22" y2="45.72" width="0.4064" layer="94"/>
<wire x1="109.22" y1="45.72" x2="106.68" y2="45.72" width="0.4064" layer="94"/>
<circle x="111.76" y="32.258" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="111.76" y1="31.496" x2="111.76" y2="30.48" width="0.1524" layer="94"/>
<text x="111.76" y="7.62" size="1.27" layer="91" rot="R180">SUB</text>
<wire x1="144.78" y1="101.6" x2="139.7" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="134.62" y1="101.6" x2="139.7" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="139.7" y1="99.06" x2="134.62" y2="101.6" width="0.4064" layer="94" curve="-45"/>
<wire x1="139.7" y1="99.06" x2="144.78" y2="101.6" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="142.24" y1="104.14" x2="142.24" y2="99.822" width="0.1524" layer="94"/>
<wire x1="137.16" y1="104.14" x2="137.16" y2="99.822" width="0.1524" layer="94"/>
<circle x="139.7" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="139.7" y1="87.376" x2="139.7" y2="86.36" width="0.1524" layer="94"/>
<wire x1="139.7" y1="99.06" x2="139.7" y2="104.14" width="0.1524" layer="94"/>
<wire x1="157.48" y1="101.6" x2="152.4" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="147.32" y1="101.6" x2="152.4" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="152.4" y1="99.06" x2="147.32" y2="101.6" width="0.4064" layer="94" curve="-45"/>
<wire x1="152.4" y1="99.06" x2="157.48" y2="101.6" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="154.94" y1="104.14" x2="154.94" y2="99.822" width="0.1524" layer="94"/>
<wire x1="149.86" y1="104.14" x2="149.86" y2="99.822" width="0.1524" layer="94"/>
<circle x="152.4" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="152.4" y1="87.376" x2="152.4" y2="86.36" width="0.1524" layer="94"/>
<wire x1="152.4" y1="99.06" x2="152.4" y2="104.14" width="0.1524" layer="94"/>
<wire x1="149.86" y1="83.82" x2="144.78" y2="71.12" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="139.7" y1="83.82" x2="144.78" y2="71.12" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="144.78" y1="81.28" x2="139.7" y2="83.82" width="0.4064" layer="94" curve="-45"/>
<wire x1="144.78" y1="81.28" x2="149.86" y2="83.82" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="147.32" y1="86.36" x2="147.32" y2="82.042" width="0.1524" layer="94"/>
<wire x1="142.24" y1="86.36" x2="142.24" y2="82.042" width="0.1524" layer="94"/>
<circle x="144.78" y="70.358" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="144.78" y1="69.596" x2="144.78" y2="68.58" width="0.1524" layer="94"/>
<wire x1="152.4" y1="63.5" x2="147.32" y2="50.8" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="142.24" y1="63.5" x2="147.32" y2="50.8" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="147.32" y1="60.96" x2="142.24" y2="63.5" width="0.4064" layer="94" curve="-45"/>
<wire x1="147.32" y1="60.96" x2="152.4" y2="63.5" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="149.86" y1="66.04" x2="149.86" y2="61.722" width="0.1524" layer="94"/>
<wire x1="144.78" y1="66.04" x2="144.78" y2="61.722" width="0.1524" layer="94"/>
<circle x="147.32" y="50.038" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="147.32" y1="49.276" x2="147.32" y2="48.26" width="0.1524" layer="94"/>
<wire x1="147.32" y1="60.96" x2="147.32" y2="66.04" width="0.1524" layer="94"/>
<text x="147.32" y="7.62" size="1.27" layer="91" rot="R180">ShL</text>
<wire x1="200.66" y1="101.6" x2="195.58" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="190.5" y1="101.6" x2="195.58" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="200.66" y1="101.6" x2="198.12" y2="101.6" width="0.4064" layer="94"/>
<wire x1="198.12" y1="101.6" x2="196.342" y2="101.6" width="0.4064" layer="94"/>
<wire x1="196.342" y1="101.6" x2="195.58" y2="101.6" width="0.4064" layer="94"/>
<wire x1="195.58" y1="101.6" x2="194.056" y2="101.6" width="0.4064" layer="94"/>
<wire x1="194.056" y1="101.6" x2="193.04" y2="101.6" width="0.4064" layer="94"/>
<wire x1="193.04" y1="101.6" x2="190.5" y2="101.6" width="0.4064" layer="94"/>
<circle x="195.58" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="195.58" y1="87.376" x2="195.58" y2="86.36" width="0.1524" layer="94"/>
<wire x1="195.58" y1="101.6" x2="194.31" y2="101.6" width="0.1524" layer="94"/>
<wire x1="193.04" y1="101.6" x2="192.278" y2="101.6" width="0.1524" layer="94"/>
<wire x1="192.278" y1="101.6" x2="192.278" y2="104.394" width="0.1524" layer="94"/>
<wire x1="194.056" y1="101.6" x2="194.056" y2="104.394" width="0.1524" layer="94"/>
<wire x1="196.342" y1="101.6" x2="196.342" y2="104.394" width="0.1524" layer="94"/>
<wire x1="198.12" y1="101.6" x2="198.374" y2="101.6" width="0.1524" layer="94"/>
<wire x1="198.374" y1="101.6" x2="198.374" y2="104.394" width="0.1524" layer="94"/>
<wire x1="213.36" y1="101.6" x2="208.28" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="203.2" y1="101.6" x2="208.28" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="213.36" y1="101.6" x2="210.82" y2="101.6" width="0.4064" layer="94"/>
<wire x1="210.82" y1="101.6" x2="209.042" y2="101.6" width="0.4064" layer="94"/>
<wire x1="209.042" y1="101.6" x2="208.28" y2="101.6" width="0.4064" layer="94"/>
<wire x1="208.28" y1="101.6" x2="206.756" y2="101.6" width="0.4064" layer="94"/>
<wire x1="206.756" y1="101.6" x2="205.74" y2="101.6" width="0.4064" layer="94"/>
<wire x1="205.74" y1="101.6" x2="203.2" y2="101.6" width="0.4064" layer="94"/>
<circle x="208.28" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="208.28" y1="87.376" x2="208.28" y2="86.36" width="0.1524" layer="94"/>
<wire x1="208.28" y1="101.6" x2="207.01" y2="101.6" width="0.1524" layer="94"/>
<wire x1="205.74" y1="101.6" x2="204.978" y2="101.6" width="0.1524" layer="94"/>
<wire x1="204.978" y1="101.6" x2="204.978" y2="104.394" width="0.1524" layer="94"/>
<wire x1="206.756" y1="101.6" x2="206.756" y2="104.394" width="0.1524" layer="94"/>
<wire x1="209.042" y1="101.6" x2="209.042" y2="104.394" width="0.1524" layer="94"/>
<wire x1="210.82" y1="101.6" x2="211.074" y2="101.6" width="0.1524" layer="94"/>
<wire x1="211.074" y1="101.6" x2="211.074" y2="104.394" width="0.1524" layer="94"/>
<wire x1="208.28" y1="81.28" x2="203.2" y2="68.58" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="198.12" y1="81.28" x2="203.2" y2="68.58" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="205.74" y1="84.582" x2="205.74" y2="81.28" width="0.1524" layer="94"/>
<wire x1="200.66" y1="84.582" x2="200.66" y2="81.28" width="0.1524" layer="94"/>
<wire x1="208.28" y1="81.28" x2="205.74" y2="81.28" width="0.4064" layer="94"/>
<wire x1="205.74" y1="81.28" x2="200.66" y2="81.28" width="0.4064" layer="94"/>
<wire x1="200.66" y1="81.28" x2="198.12" y2="81.28" width="0.4064" layer="94"/>
<circle x="203.2" y="67.818" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="203.2" y1="67.056" x2="203.2" y2="66.04" width="0.1524" layer="94"/>
<wire x1="182.88" y1="101.6" x2="177.8" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="172.72" y1="101.6" x2="177.8" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="177.8" y1="99.06" x2="172.72" y2="101.6" width="0.4064" layer="94" curve="-45"/>
<wire x1="177.8" y1="99.06" x2="182.88" y2="101.6" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="180.34" y1="104.14" x2="180.34" y2="99.822" width="0.1524" layer="94"/>
<wire x1="175.26" y1="104.14" x2="175.26" y2="99.822" width="0.1524" layer="94"/>
<wire x1="177.8" y1="88.9" x2="177.8" y2="86.36" width="0.1524" layer="94"/>
<wire x1="177.8" y1="99.06" x2="177.8" y2="104.14" width="0.1524" layer="94"/>
<wire x1="185.42" y1="81.28" x2="180.34" y2="68.58" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="175.26" y1="81.28" x2="180.34" y2="68.58" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="180.34" y1="78.74" x2="175.26" y2="81.28" width="0.4064" layer="94" curve="-45"/>
<wire x1="180.34" y1="78.74" x2="185.42" y2="81.28" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="182.88" y1="83.82" x2="182.88" y2="79.502" width="0.1524" layer="94"/>
<wire x1="177.8" y1="83.82" x2="177.8" y2="79.502" width="0.1524" layer="94"/>
<wire x1="180.34" y1="68.58" x2="180.34" y2="66.04" width="0.1524" layer="94"/>
<wire x1="180.34" y1="78.74" x2="180.34" y2="83.82" width="0.1524" layer="94"/>
<wire x1="195.58" y1="53.34" x2="190.5" y2="40.64" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="185.42" y1="53.34" x2="190.5" y2="40.64" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="193.04" y1="56.642" x2="193.04" y2="53.34" width="0.1524" layer="94"/>
<wire x1="187.96" y1="56.642" x2="187.96" y2="53.34" width="0.1524" layer="94"/>
<wire x1="195.58" y1="53.34" x2="193.04" y2="53.34" width="0.4064" layer="94"/>
<wire x1="193.04" y1="53.34" x2="187.96" y2="53.34" width="0.4064" layer="94"/>
<wire x1="187.96" y1="53.34" x2="185.42" y2="53.34" width="0.4064" layer="94"/>
<circle x="190.5" y="39.878" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="190.5" y1="39.116" x2="190.5" y2="38.1" width="0.1524" layer="94"/>
<wire x1="193.04" y1="35.56" x2="187.96" y2="22.86" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="182.88" y1="35.56" x2="187.96" y2="22.86" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="190.5" y1="38.862" x2="190.5" y2="35.56" width="0.1524" layer="94"/>
<wire x1="185.42" y1="38.862" x2="185.42" y2="35.56" width="0.1524" layer="94"/>
<wire x1="193.04" y1="35.56" x2="190.5" y2="35.56" width="0.4064" layer="94"/>
<wire x1="190.5" y1="35.56" x2="185.42" y2="35.56" width="0.4064" layer="94"/>
<wire x1="185.42" y1="35.56" x2="182.88" y2="35.56" width="0.4064" layer="94"/>
<circle x="187.96" y="22.098" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="187.96" y1="21.336" x2="187.96" y2="20.32" width="0.1524" layer="94"/>
<text x="187.96" y="7.62" size="1.27" layer="91" rot="R180">Sh8</text>
<text x="187.96" y="7.62" size="1.27" layer="91" rot="R180">Sh8</text>
<wire x1="208.28" y1="53.34" x2="203.2" y2="40.64" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="198.12" y1="53.34" x2="203.2" y2="40.64" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="205.74" y1="56.642" x2="205.74" y2="53.34" width="0.1524" layer="94"/>
<wire x1="200.66" y1="56.642" x2="200.66" y2="53.34" width="0.1524" layer="94"/>
<wire x1="203.2" y1="40.64" x2="203.2" y2="38.1" width="0.1524" layer="94"/>
<wire x1="208.28" y1="53.34" x2="205.74" y2="53.34" width="0.4064" layer="94"/>
<wire x1="205.74" y1="53.34" x2="200.66" y2="53.34" width="0.4064" layer="94"/>
<wire x1="200.66" y1="53.34" x2="198.12" y2="53.34" width="0.4064" layer="94"/>
<wire x1="223.52" y1="53.34" x2="218.44" y2="40.64" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="213.36" y1="53.34" x2="218.44" y2="40.64" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="220.98" y1="56.642" x2="220.98" y2="53.34" width="0.1524" layer="94"/>
<wire x1="215.9" y1="56.642" x2="215.9" y2="53.34" width="0.1524" layer="94"/>
<wire x1="218.44" y1="40.64" x2="218.44" y2="38.1" width="0.1524" layer="94"/>
<wire x1="223.52" y1="53.34" x2="220.98" y2="53.34" width="0.4064" layer="94"/>
<wire x1="220.98" y1="53.34" x2="215.9" y2="53.34" width="0.4064" layer="94"/>
<wire x1="215.9" y1="53.34" x2="213.36" y2="53.34" width="0.4064" layer="94"/>
<wire x1="238.76" y1="53.34" x2="233.68" y2="40.64" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="228.6" y1="53.34" x2="233.68" y2="40.64" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="236.22" y1="56.642" x2="236.22" y2="53.34" width="0.1524" layer="94"/>
<wire x1="231.14" y1="56.642" x2="231.14" y2="53.34" width="0.1524" layer="94"/>
<wire x1="233.68" y1="40.64" x2="233.68" y2="38.1" width="0.1524" layer="94"/>
<wire x1="238.76" y1="53.34" x2="236.22" y2="53.34" width="0.4064" layer="94"/>
<wire x1="236.22" y1="53.34" x2="231.14" y2="53.34" width="0.4064" layer="94"/>
<wire x1="231.14" y1="53.34" x2="228.6" y2="53.34" width="0.4064" layer="94"/>
<text x="203.2" y="7.62" size="1.27" layer="91" rot="R180">Sh4</text>
<text x="218.44" y="7.62" size="1.27" layer="91" rot="R180">Sh2</text>
<text x="233.68" y="7.62" size="1.27" layer="91" rot="R180">Sh1</text>
<text x="238.76" y="129.54" size="1.27" layer="91">imm4[0]</text>
<text x="231.14" y="129.54" size="1.27" layer="91">imm4[1]</text>
<text x="223.52" y="129.54" size="1.27" layer="91">imm4[2]</text>
<text x="215.9" y="129.54" size="1.27" layer="91">imm4[3]</text>
<wire x1="254" y1="101.6" x2="248.92" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="243.84" y1="101.6" x2="248.92" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="254" y1="101.6" x2="251.46" y2="101.6" width="0.4064" layer="94"/>
<wire x1="251.46" y1="101.6" x2="249.682" y2="101.6" width="0.4064" layer="94"/>
<wire x1="249.682" y1="101.6" x2="248.92" y2="101.6" width="0.4064" layer="94"/>
<wire x1="248.92" y1="101.6" x2="247.396" y2="101.6" width="0.4064" layer="94"/>
<wire x1="247.396" y1="101.6" x2="246.38" y2="101.6" width="0.4064" layer="94"/>
<wire x1="246.38" y1="101.6" x2="243.84" y2="101.6" width="0.4064" layer="94"/>
<circle x="248.92" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="248.92" y1="87.376" x2="248.92" y2="86.36" width="0.1524" layer="94"/>
<wire x1="248.92" y1="101.6" x2="247.65" y2="101.6" width="0.1524" layer="94"/>
<wire x1="246.38" y1="101.6" x2="245.618" y2="101.6" width="0.1524" layer="94"/>
<wire x1="245.618" y1="101.6" x2="245.618" y2="104.394" width="0.1524" layer="94"/>
<wire x1="247.396" y1="101.6" x2="247.396" y2="104.394" width="0.1524" layer="94"/>
<wire x1="249.682" y1="101.6" x2="249.682" y2="104.394" width="0.1524" layer="94"/>
<wire x1="251.46" y1="101.6" x2="251.714" y2="101.6" width="0.1524" layer="94"/>
<wire x1="251.714" y1="101.6" x2="251.714" y2="104.394" width="0.1524" layer="94"/>
<wire x1="266.7" y1="101.6" x2="261.62" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="256.54" y1="101.6" x2="261.62" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="264.16" y1="104.902" x2="264.16" y2="101.6" width="0.1524" layer="94"/>
<wire x1="259.08" y1="104.902" x2="259.08" y2="101.6" width="0.1524" layer="94"/>
<wire x1="266.7" y1="101.6" x2="264.16" y2="101.6" width="0.4064" layer="94"/>
<wire x1="264.16" y1="101.6" x2="261.62" y2="101.6" width="0.4064" layer="94"/>
<wire x1="261.62" y1="101.6" x2="259.08" y2="101.6" width="0.4064" layer="94"/>
<wire x1="259.08" y1="101.6" x2="256.54" y2="101.6" width="0.4064" layer="94"/>
<circle x="261.62" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="261.62" y1="87.376" x2="261.62" y2="86.36" width="0.1524" layer="94"/>
<wire x1="261.62" y1="101.6" x2="261.62" y2="104.902" width="0.1524" layer="94"/>
<wire x1="281.94" y1="101.6" x2="276.86" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="271.78" y1="101.6" x2="276.86" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="281.94" y1="101.6" x2="279.4" y2="101.6" width="0.4064" layer="94"/>
<wire x1="279.4" y1="101.6" x2="277.622" y2="101.6" width="0.4064" layer="94"/>
<wire x1="277.622" y1="101.6" x2="276.86" y2="101.6" width="0.4064" layer="94"/>
<wire x1="276.86" y1="101.6" x2="275.336" y2="101.6" width="0.4064" layer="94"/>
<wire x1="275.336" y1="101.6" x2="274.32" y2="101.6" width="0.4064" layer="94"/>
<wire x1="274.32" y1="101.6" x2="271.78" y2="101.6" width="0.4064" layer="94"/>
<circle x="276.86" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="276.86" y1="87.376" x2="276.86" y2="86.36" width="0.1524" layer="94"/>
<wire x1="276.86" y1="101.6" x2="275.59" y2="101.6" width="0.1524" layer="94"/>
<wire x1="274.32" y1="101.6" x2="273.558" y2="101.6" width="0.1524" layer="94"/>
<wire x1="273.558" y1="101.6" x2="273.558" y2="104.394" width="0.1524" layer="94"/>
<wire x1="275.336" y1="101.6" x2="275.336" y2="104.394" width="0.1524" layer="94"/>
<wire x1="277.622" y1="101.6" x2="277.622" y2="104.394" width="0.1524" layer="94"/>
<wire x1="279.4" y1="101.6" x2="279.654" y2="101.6" width="0.1524" layer="94"/>
<wire x1="279.654" y1="101.6" x2="279.654" y2="104.394" width="0.1524" layer="94"/>
<wire x1="266.7" y1="81.28" x2="261.62" y2="68.58" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="256.54" y1="81.28" x2="261.62" y2="68.58" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="264.16" y1="84.582" x2="264.16" y2="81.28" width="0.1524" layer="94"/>
<wire x1="259.08" y1="84.582" x2="259.08" y2="81.28" width="0.1524" layer="94"/>
<wire x1="266.7" y1="81.28" x2="264.16" y2="81.28" width="0.4064" layer="94"/>
<wire x1="264.16" y1="81.28" x2="261.62" y2="81.28" width="0.4064" layer="94"/>
<wire x1="261.62" y1="81.28" x2="259.08" y2="81.28" width="0.4064" layer="94"/>
<wire x1="259.08" y1="81.28" x2="256.54" y2="81.28" width="0.4064" layer="94"/>
<circle x="261.62" y="67.818" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="261.62" y1="67.056" x2="261.62" y2="66.04" width="0.1524" layer="94"/>
<wire x1="261.62" y1="81.28" x2="261.62" y2="84.582" width="0.1524" layer="94"/>
<text x="261.62" y="7.62" size="1.27" layer="91" rot="R180">ShOut</text>
<wire x1="299.72" y1="101.6" x2="294.64" y2="88.9" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="289.56" y1="101.6" x2="294.64" y2="88.9" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="294.64" y1="99.06" x2="289.56" y2="101.6" width="0.4064" layer="94" curve="-45"/>
<wire x1="294.64" y1="99.06" x2="299.72" y2="101.6" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="297.18" y1="104.14" x2="297.18" y2="99.822" width="0.1524" layer="94"/>
<wire x1="292.1" y1="104.14" x2="292.1" y2="99.822" width="0.1524" layer="94"/>
<circle x="294.64" y="88.138" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="294.64" y1="87.376" x2="294.64" y2="86.36" width="0.1524" layer="94"/>
<wire x1="294.64" y1="99.06" x2="294.64" y2="104.14" width="0.1524" layer="94"/>
<text x="294.64" y="78.74" size="1.27" layer="91" rot="R180">UseC</text>
<wire x1="114.3" y1="49.276" x2="114.3" y2="45.72" width="0.1524" layer="94"/>
</plain>
<instances>
</instances>
<busses>
<bus name="B$1">
<segment>
<wire x1="48.26" y1="127" x2="76.2" y2="127" width="0.1524" layer="92"/>
<wire x1="76.2" y1="127" x2="104.14" y2="127" width="0.1524" layer="92"/>
<wire x1="104.14" y1="127" x2="142.24" y2="127" width="0.1524" layer="92"/>
<wire x1="142.24" y1="127" x2="187.96" y2="127" width="0.1524" layer="92"/>
<wire x1="198.374" y1="127" x2="187.96" y2="127" width="0.1524" layer="92"/>
<wire x1="198.374" y1="127" x2="251.714" y2="127" width="0.1524" layer="92"/>
<wire x1="251.714" y1="127" x2="304.8" y2="127" width="0.1524" layer="92"/>
<wire x1="48.26" y1="127" x2="48.26" y2="104.14" width="0.1524" layer="92"/>
<wire x1="76.2" y1="127" x2="76.2" y2="104.14" width="0.1524" layer="92"/>
<wire x1="104.14" y1="127" x2="104.14" y2="104.14" width="0.1524" layer="92"/>
<wire x1="142.24" y1="127" x2="142.24" y2="104.14" width="0.1524" layer="92"/>
<wire x1="198.374" y1="127" x2="198.374" y2="104.14" width="0.1524" layer="92"/>
<wire x1="251.714" y1="127" x2="251.714" y2="104.394" width="0.1524" layer="92"/>
<wire x1="187.96" y1="127" x2="187.96" y2="86.36" width="0.1524" layer="92"/>
<wire x1="187.96" y1="86.36" x2="182.88" y2="86.36" width="0.1524" layer="92"/>
<wire x1="182.88" y1="86.36" x2="182.88" y2="83.82" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="-2.54" y1="20.32" x2="91.44" y2="20.32" width="0.1524" layer="92"/>
<wire x1="91.44" y1="20.32" x2="129.54" y2="20.32" width="0.1524" layer="92"/>
<wire x1="129.54" y1="20.32" x2="154.94" y2="20.32" width="0.1524" layer="92"/>
<wire x1="154.94" y1="20.32" x2="170.18" y2="20.32" width="0.1524" layer="92"/>
<wire x1="170.18" y1="20.32" x2="304.8" y2="20.32" width="0.1524" layer="92"/>
<wire x1="-2.54" y1="20.32" x2="-2.54" y2="88.9" width="0.1524" layer="92"/>
<wire x1="91.44" y1="20.32" x2="91.44" y2="69.342" width="0.1524" layer="92"/>
<wire x1="154.94" y1="20.32" x2="154.94" y2="68.58" width="0.1524" layer="92"/>
<wire x1="154.94" y1="68.58" x2="149.86" y2="68.58" width="0.1524" layer="92"/>
<wire x1="149.86" y1="68.58" x2="149.86" y2="66.04" width="0.1524" layer="92"/>
<wire x1="170.18" y1="20.32" x2="170.18" y2="106.68" width="0.1524" layer="92"/>
<wire x1="170.18" y1="106.68" x2="180.34" y2="106.68" width="0.1524" layer="92"/>
<wire x1="180.34" y1="106.68" x2="180.34" y2="104.14" width="0.1524" layer="92"/>
<wire x1="91.44" y1="69.342" x2="86.36" y2="69.342" width="0.1524" layer="92"/>
<wire x1="106.68" y1="111.76" x2="106.68" y2="104.14" width="0.1524" layer="92"/>
<wire x1="129.54" y1="111.76" x2="106.68" y2="111.76" width="0.1524" layer="92"/>
<wire x1="129.54" y1="20.32" x2="129.54" y2="111.76" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$2">
<segment>
<wire x1="35.56" y1="124.46" x2="60.96" y2="124.46" width="0.1524" layer="92"/>
<wire x1="60.96" y1="124.46" x2="132.08" y2="124.46" width="0.1524" layer="92"/>
<wire x1="132.08" y1="124.46" x2="139.7" y2="124.46" width="0.1524" layer="92"/>
<wire x1="139.7" y1="124.46" x2="185.42" y2="124.46" width="0.1524" layer="92"/>
<wire x1="185.42" y1="124.46" x2="294.64" y2="124.46" width="0.1524" layer="92"/>
<wire x1="294.64" y1="124.46" x2="304.8" y2="124.46" width="0.1524" layer="92"/>
<wire x1="35.56" y1="124.46" x2="35.56" y2="104.14" width="0.1524" layer="92"/>
<wire x1="60.96" y1="124.46" x2="60.96" y2="104.14" width="0.1524" layer="92"/>
<wire x1="139.7" y1="124.46" x2="139.7" y2="104.14" width="0.1524" layer="92"/>
<wire x1="294.64" y1="124.46" x2="294.64" y2="104.14" width="0.1524" layer="92"/>
<wire x1="132.08" y1="124.46" x2="132.08" y2="73.66" width="0.1524" layer="92"/>
<wire x1="132.08" y1="73.66" x2="116.84" y2="73.66" width="0.1524" layer="92"/>
<wire x1="116.84" y1="73.66" x2="116.84" y2="66.04" width="0.1524" layer="92"/>
<wire x1="185.42" y1="124.46" x2="185.42" y2="88.9" width="0.1524" layer="92"/>
<wire x1="185.42" y1="88.9" x2="180.34" y2="88.9" width="0.1524" layer="92"/>
<wire x1="180.34" y1="88.9" x2="180.34" y2="83.82" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="10.16" y1="17.78" x2="160.02" y2="17.78" width="0.1524" layer="92"/>
<wire x1="160.02" y1="17.78" x2="304.8" y2="17.78" width="0.1524" layer="92"/>
<wire x1="10.16" y1="17.78" x2="10.16" y2="88.9" width="0.1524" layer="92"/>
<wire x1="160.02" y1="17.78" x2="160.02" y2="106.68" width="0.1524" layer="92"/>
<wire x1="160.02" y1="106.68" x2="154.94" y2="106.68" width="0.1524" layer="92"/>
<wire x1="154.94" y1="106.68" x2="154.94" y2="104.14" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$3">
<segment>
<wire x1="304.8" y1="121.92" x2="261.62" y2="121.92" width="0.1524" layer="92"/>
<wire x1="261.62" y1="121.92" x2="249.682" y2="121.92" width="0.1524" layer="92"/>
<wire x1="249.682" y1="121.92" x2="209.042" y2="121.92" width="0.1524" layer="92"/>
<wire x1="209.042" y1="121.92" x2="196.342" y2="121.92" width="0.1524" layer="92"/>
<wire x1="196.342" y1="121.92" x2="101.6" y2="121.92" width="0.1524" layer="92"/>
<wire x1="101.6" y1="121.92" x2="22.86" y2="121.92" width="0.1524" layer="92"/>
<wire x1="22.86" y1="121.92" x2="22.86" y2="104.14" width="0.1524" layer="92"/>
<wire x1="101.6" y1="121.92" x2="101.6" y2="104.14" width="0.1524" layer="92"/>
<wire x1="196.342" y1="121.92" x2="196.342" y2="104.394" width="0.1524" layer="92"/>
<wire x1="209.042" y1="121.92" x2="209.042" y2="104.394" width="0.1524" layer="92"/>
<wire x1="249.682" y1="121.92" x2="249.682" y2="104.394" width="0.1524" layer="92"/>
<wire x1="261.62" y1="121.92" x2="261.62" y2="104.14" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="304.8" y1="15.24" x2="302.26" y2="15.24" width="0.1524" layer="92"/>
<wire x1="302.26" y1="15.24" x2="284.48" y2="15.24" width="0.1524" layer="92"/>
<wire x1="284.48" y1="15.24" x2="167.64" y2="15.24" width="0.1524" layer="92"/>
<wire x1="167.64" y1="15.24" x2="157.48" y2="15.24" width="0.1524" layer="92"/>
<wire x1="157.48" y1="15.24" x2="124.46" y2="15.24" width="0.1524" layer="92"/>
<wire x1="124.46" y1="15.24" x2="96.52" y2="15.24" width="0.1524" layer="92"/>
<wire x1="96.52" y1="15.24" x2="22.86" y2="15.24" width="0.1524" layer="92"/>
<wire x1="22.86" y1="15.24" x2="22.86" y2="88.9" width="0.1524" layer="92"/>
<wire x1="96.52" y1="15.24" x2="96.52" y2="111.76" width="0.1524" layer="92"/>
<wire x1="96.52" y1="111.76" x2="81.28" y2="111.76" width="0.1524" layer="92"/>
<wire x1="81.28" y1="111.76" x2="81.28" y2="104.14" width="0.1524" layer="92"/>
<wire x1="93.98" y1="15.24" x2="93.98" y2="88.9" width="0.1524" layer="92"/>
<wire x1="93.98" y1="88.9" x2="83.82" y2="88.9" width="0.1524" layer="92"/>
<wire x1="83.82" y1="88.9" x2="83.82" y2="86.36" width="0.1524" layer="92"/>
<wire x1="124.46" y1="15.24" x2="124.46" y2="106.68" width="0.1524" layer="92"/>
<wire x1="124.46" y1="106.68" x2="119.38" y2="106.68" width="0.1524" layer="92"/>
<wire x1="119.38" y1="106.68" x2="119.38" y2="104.14" width="0.1524" layer="92"/>
<wire x1="157.48" y1="15.24" x2="157.48" y2="71.12" width="0.1524" layer="92"/>
<wire x1="157.48" y1="71.12" x2="147.32" y2="71.12" width="0.1524" layer="92"/>
<wire x1="147.32" y1="71.12" x2="147.32" y2="66.04" width="0.1524" layer="92"/>
<wire x1="167.64" y1="15.24" x2="167.64" y2="109.22" width="0.1524" layer="92"/>
<wire x1="167.64" y1="109.22" x2="177.8" y2="109.22" width="0.1524" layer="92"/>
<wire x1="177.8" y1="109.22" x2="177.8" y2="104.14" width="0.1524" layer="92"/>
<wire x1="284.48" y1="15.24" x2="284.48" y2="106.68" width="0.1524" layer="92"/>
<wire x1="284.48" y1="106.68" x2="279.654" y2="106.68" width="0.1524" layer="92"/>
<wire x1="279.654" y1="106.68" x2="279.654" y2="104.394" width="0.1524" layer="92"/>
<wire x1="302.26" y1="15.24" x2="302.26" y2="106.68" width="0.1524" layer="92"/>
<wire x1="302.26" y1="106.68" x2="297.18" y2="106.68" width="0.1524" layer="92"/>
<wire x1="297.18" y1="106.68" x2="297.18" y2="104.14" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$4">
<segment>
<wire x1="10.16" y1="119.38" x2="58.42" y2="119.38" width="0.1524" layer="92"/>
<wire x1="58.42" y1="119.38" x2="88.9" y2="119.38" width="0.1524" layer="92"/>
<wire x1="88.9" y1="119.38" x2="114.3" y2="119.38" width="0.1524" layer="92"/>
<wire x1="114.3" y1="119.38" x2="137.16" y2="119.38" width="0.1524" layer="92"/>
<wire x1="137.16" y1="119.38" x2="175.26" y2="119.38" width="0.1524" layer="92"/>
<wire x1="194.056" y1="119.38" x2="206.756" y2="119.38" width="0.1524" layer="92"/>
<wire x1="194.056" y1="119.38" x2="175.26" y2="119.38" width="0.1524" layer="92"/>
<wire x1="206.756" y1="119.38" x2="247.396" y2="119.38" width="0.1524" layer="92"/>
<wire x1="247.396" y1="119.38" x2="275.336" y2="119.38" width="0.1524" layer="92"/>
<wire x1="275.336" y1="119.38" x2="304.8" y2="119.38" width="0.1524" layer="92"/>
<wire x1="10.16" y1="119.38" x2="10.16" y2="104.14" width="0.1524" layer="92"/>
<wire x1="58.42" y1="119.38" x2="58.42" y2="104.14" width="0.1524" layer="92"/>
<wire x1="114.3" y1="119.38" x2="114.3" y2="104.14" width="0.1524" layer="92"/>
<wire x1="137.16" y1="119.38" x2="137.16" y2="104.14" width="0.1524" layer="92"/>
<wire x1="194.056" y1="119.38" x2="194.056" y2="104.394" width="0.1524" layer="92"/>
<wire x1="206.756" y1="119.38" x2="206.756" y2="104.394" width="0.1524" layer="92"/>
<wire x1="175.26" y1="119.38" x2="175.26" y2="104.14" width="0.1524" layer="92"/>
<wire x1="247.396" y1="119.38" x2="247.396" y2="104.394" width="0.1524" layer="92"/>
<wire x1="275.336" y1="119.38" x2="275.336" y2="104.394" width="0.1524" layer="92"/>
<wire x1="88.9" y1="119.38" x2="88.9" y2="71.12" width="0.1524" layer="92"/>
<wire x1="88.9" y1="71.12" x2="83.82" y2="71.12" width="0.1524" layer="92"/>
<wire x1="83.82" y1="71.12" x2="83.82" y2="69.342" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="35.56" y1="12.7" x2="162.56" y2="12.7" width="0.1524" layer="92"/>
<wire x1="162.56" y1="12.7" x2="269.24" y2="12.7" width="0.1524" layer="92"/>
<wire x1="269.24" y1="12.7" x2="287.02" y2="12.7" width="0.1524" layer="92"/>
<wire x1="287.02" y1="12.7" x2="304.8" y2="12.7" width="0.1524" layer="92"/>
<wire x1="35.56" y1="12.7" x2="35.56" y2="88.9" width="0.1524" layer="92"/>
<wire x1="162.56" y1="12.7" x2="162.56" y2="109.22" width="0.1524" layer="92"/>
<wire x1="162.56" y1="109.22" x2="152.4" y2="109.22" width="0.1524" layer="92"/>
<wire x1="152.4" y1="109.22" x2="152.4" y2="104.14" width="0.1524" layer="92"/>
<wire x1="269.24" y1="12.7" x2="269.24" y2="106.68" width="0.1524" layer="92"/>
<wire x1="269.24" y1="106.68" x2="264.16" y2="106.68" width="0.1524" layer="92"/>
<wire x1="264.16" y1="106.68" x2="264.16" y2="104.14" width="0.1524" layer="92"/>
<wire x1="287.02" y1="12.7" x2="287.02" y2="109.22" width="0.1524" layer="92"/>
<wire x1="287.02" y1="109.22" x2="277.622" y2="109.22" width="0.1524" layer="92"/>
<wire x1="277.622" y1="109.22" x2="277.622" y2="104.14" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$5">
<segment>
<wire x1="304.8" y1="116.84" x2="292.1" y2="116.84" width="0.1524" layer="92"/>
<wire x1="292.1" y1="116.84" x2="273.558" y2="116.84" width="0.1524" layer="92"/>
<wire x1="273.558" y1="116.84" x2="259.08" y2="116.84" width="0.1524" layer="92"/>
<wire x1="259.08" y1="116.84" x2="245.618" y2="116.84" width="0.1524" layer="92"/>
<wire x1="245.618" y1="116.84" x2="204.978" y2="116.84" width="0.1524" layer="92"/>
<wire x1="204.978" y1="116.84" x2="192.278" y2="116.84" width="0.1524" layer="92"/>
<wire x1="192.278" y1="116.84" x2="68.58" y2="116.84" width="0.1524" layer="92"/>
<wire x1="68.58" y1="116.84" x2="-2.54" y2="116.84" width="0.1524" layer="92"/>
<wire x1="-2.54" y1="116.84" x2="-2.54" y2="104.14" width="0.1524" layer="92"/>
<wire x1="192.278" y1="116.84" x2="192.278" y2="104.394" width="0.1524" layer="92"/>
<wire x1="204.978" y1="116.84" x2="204.978" y2="104.394" width="0.1524" layer="92"/>
<wire x1="245.618" y1="116.84" x2="245.618" y2="104.394" width="0.1524" layer="92"/>
<wire x1="259.08" y1="116.84" x2="259.08" y2="104.902" width="0.1524" layer="92"/>
<wire x1="273.558" y1="116.84" x2="273.558" y2="104.394" width="0.1524" layer="92"/>
<wire x1="292.1" y1="116.84" x2="292.1" y2="104.14" width="0.1524" layer="92"/>
<wire x1="68.58" y1="116.84" x2="68.58" y2="88.9" width="0.1524" layer="92"/>
<wire x1="68.58" y1="88.9" x2="66.04" y2="88.9" width="0.1524" layer="92"/>
<wire x1="66.04" y1="88.9" x2="66.04" y2="86.36" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="304.8" y1="10.16" x2="241.3" y2="10.16" width="0.1524" layer="92"/>
<wire x1="241.3" y1="10.16" x2="165.1" y2="10.16" width="0.1524" layer="92"/>
<wire x1="165.1" y1="10.16" x2="127" y2="10.16" width="0.1524" layer="92"/>
<wire x1="127" y1="10.16" x2="71.12" y2="10.16" width="0.1524" layer="92"/>
<wire x1="71.12" y1="10.16" x2="48.26" y2="10.16" width="0.1524" layer="92"/>
<wire x1="48.26" y1="10.16" x2="48.26" y2="88.9" width="0.1524" layer="92"/>
<wire x1="71.12" y1="10.16" x2="71.12" y2="109.22" width="0.1524" layer="92"/>
<wire x1="71.12" y1="109.22" x2="63.5" y2="109.22" width="0.1524" layer="92"/>
<wire x1="63.5" y1="109.22" x2="63.5" y2="104.14" width="0.1524" layer="92"/>
<wire x1="127" y1="10.16" x2="127" y2="109.22" width="0.1524" layer="92"/>
<wire x1="127" y1="109.22" x2="116.84" y2="109.22" width="0.1524" layer="92"/>
<wire x1="116.84" y1="109.22" x2="116.84" y2="104.14" width="0.1524" layer="92"/>
<wire x1="165.1" y1="10.16" x2="165.1" y2="111.76" width="0.1524" layer="92"/>
<wire x1="165.1" y1="111.76" x2="149.86" y2="111.76" width="0.1524" layer="92"/>
<wire x1="149.86" y1="111.76" x2="149.86" y2="104.14" width="0.1524" layer="92"/>
<wire x1="241.3" y1="10.16" x2="241.3" y2="106.68" width="0.1524" layer="92"/>
<wire x1="241.3" y1="106.68" x2="211.074" y2="106.68" width="0.1524" layer="92"/>
<wire x1="211.074" y1="106.68" x2="211.074" y2="104.394" width="0.1524" layer="92"/>
</segment>
</bus>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="-2.54" y1="116.84" x2="-2.54" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="48.26" y1="127" x2="48.26" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="35.56" y1="124.46" x2="35.56" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="22.86" y1="121.92" x2="22.86" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="10.16" y1="119.38" x2="10.16" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="63.5" y1="68.58" x2="63.5" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="83.82" y1="50.8" x2="109.22" y2="50.8" width="0.1524" layer="91"/>
<wire x1="109.22" y1="50.8" x2="109.22" y2="48.514" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="111.76" y1="30.48" x2="111.76" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="147.32" y1="48.26" x2="147.32" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="177.8" y1="86.36" x2="177.8" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="193.04" y1="55.88" x2="193.04" y2="66.04" width="0.1524" layer="91"/>
<wire x1="193.04" y1="66.04" x2="215.9" y2="66.04" width="0.1524" layer="91"/>
<wire x1="215.9" y1="66.04" x2="215.9" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<wire x1="187.96" y1="20.32" x2="187.96" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<wire x1="180.34" y1="66.04" x2="180.34" y2="38.862" width="0.1524" layer="91"/>
<wire x1="180.34" y1="38.862" x2="185.42" y2="38.862" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="205.74" y1="55.88" x2="205.74" y2="63.5" width="0.1524" layer="91"/>
<wire x1="205.74" y1="63.5" x2="223.52" y2="63.5" width="0.1524" layer="91"/>
<wire x1="223.52" y1="63.5" x2="223.52" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<wire x1="220.98" y1="55.88" x2="220.98" y2="60.96" width="0.1524" layer="91"/>
<wire x1="220.98" y1="60.96" x2="231.14" y2="60.96" width="0.1524" layer="91"/>
<wire x1="231.14" y1="60.96" x2="231.14" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<wire x1="238.76" y1="58.42" x2="238.76" y2="129.54" width="0.1524" layer="91"/>
<wire x1="238.76" y1="58.42" x2="236.22" y2="58.42" width="0.1524" layer="91"/>
<wire x1="236.22" y1="58.42" x2="236.22" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<wire x1="203.2" y1="38.1" x2="203.2" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<wire x1="218.44" y1="38.1" x2="218.44" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<wire x1="233.68" y1="38.1" x2="233.68" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<wire x1="261.62" y1="66.04" x2="261.62" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<wire x1="294.64" y1="86.36" x2="294.64" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="109.22" y1="83.82" x2="109.22" y2="86.36" width="0.1524" layer="91"/>
<wire x1="109.22" y1="86.36" x2="104.14" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="116.84" y1="86.36" x2="114.3" y2="86.36" width="0.1524" layer="91"/>
<wire x1="114.3" y1="86.36" x2="114.3" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="152.4" y1="86.36" x2="147.32" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="139.7" y1="86.36" x2="142.24" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="144.78" y1="68.58" x2="144.78" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="195.58" y1="86.36" x2="200.66" y2="86.36" width="0.1524" layer="91"/>
<wire x1="200.66" y1="86.36" x2="200.66" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="208.28" y1="86.36" x2="205.74" y2="86.36" width="0.1524" layer="91"/>
<wire x1="205.74" y1="86.36" x2="205.74" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="187.96" y1="58.42" x2="187.96" y2="55.88" width="0.1524" layer="91"/>
<wire x1="187.96" y1="58.42" x2="200.66" y2="58.42" width="0.1524" layer="91"/>
<wire x1="200.66" y1="58.42" x2="200.66" y2="55.88" width="0.1524" layer="91"/>
<wire x1="200.66" y1="58.42" x2="203.2" y2="58.42" width="0.1524" layer="91"/>
<wire x1="203.2" y1="58.42" x2="215.9" y2="58.42" width="0.1524" layer="91"/>
<wire x1="215.9" y1="58.42" x2="215.9" y2="55.88" width="0.1524" layer="91"/>
<wire x1="215.9" y1="58.42" x2="231.14" y2="58.42" width="0.1524" layer="91"/>
<wire x1="231.14" y1="58.42" x2="231.14" y2="55.88" width="0.1524" layer="91"/>
<wire x1="203.2" y1="58.42" x2="203.2" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="261.62" y1="86.36" x2="261.62" y2="84.582" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="264.16" y1="84.582" x2="276.86" y2="84.582" width="0.1524" layer="91"/>
<wire x1="276.86" y1="84.582" x2="276.86" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="259.08" y1="84.582" x2="248.92" y2="84.582" width="0.1524" layer="91"/>
<wire x1="248.92" y1="84.582" x2="248.92" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
