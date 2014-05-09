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
<wire x1="-7.62" y1="127" x2="-2.54" y2="127" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="127" x2="2.54" y2="127" width="0.4064" layer="94"/>
<wire x1="2.54" y1="127" x2="-2.54" y2="116.84" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="116.84" x2="-7.62" y2="127" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="127" x2="-2.54" y2="129.54" width="0.1524" layer="94"/>
<circle x="-2.54" y="116.078" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="115.316" x2="-2.54" y2="114.3" width="0.1524" layer="94"/>
<wire x1="5.08" y1="127" x2="10.16" y2="127" width="0.4064" layer="94"/>
<wire x1="10.16" y1="127" x2="15.24" y2="127" width="0.4064" layer="94"/>
<wire x1="15.24" y1="127" x2="10.16" y2="116.84" width="0.4064" layer="94"/>
<wire x1="10.16" y1="116.84" x2="5.08" y2="127" width="0.4064" layer="94"/>
<wire x1="10.16" y1="127" x2="10.16" y2="129.54" width="0.1524" layer="94"/>
<circle x="10.16" y="116.078" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="10.16" y1="115.316" x2="10.16" y2="114.3" width="0.1524" layer="94"/>
<wire x1="17.78" y1="127" x2="22.86" y2="127" width="0.4064" layer="94"/>
<wire x1="22.86" y1="127" x2="27.94" y2="127" width="0.4064" layer="94"/>
<wire x1="27.94" y1="127" x2="22.86" y2="116.84" width="0.4064" layer="94"/>
<wire x1="22.86" y1="116.84" x2="17.78" y2="127" width="0.4064" layer="94"/>
<wire x1="22.86" y1="127" x2="22.86" y2="129.54" width="0.1524" layer="94"/>
<circle x="22.86" y="116.078" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="22.86" y1="115.316" x2="22.86" y2="114.3" width="0.1524" layer="94"/>
<wire x1="30.48" y1="127" x2="35.56" y2="127" width="0.4064" layer="94"/>
<wire x1="35.56" y1="127" x2="40.64" y2="127" width="0.4064" layer="94"/>
<wire x1="40.64" y1="127" x2="35.56" y2="116.84" width="0.4064" layer="94"/>
<wire x1="35.56" y1="116.84" x2="30.48" y2="127" width="0.4064" layer="94"/>
<wire x1="35.56" y1="127" x2="35.56" y2="129.54" width="0.1524" layer="94"/>
<circle x="35.56" y="116.078" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="35.56" y1="115.316" x2="35.56" y2="114.3" width="0.1524" layer="94"/>
<wire x1="43.18" y1="127" x2="48.26" y2="127" width="0.4064" layer="94"/>
<wire x1="48.26" y1="127" x2="53.34" y2="127" width="0.4064" layer="94"/>
<wire x1="53.34" y1="127" x2="48.26" y2="116.84" width="0.4064" layer="94"/>
<wire x1="48.26" y1="116.84" x2="43.18" y2="127" width="0.4064" layer="94"/>
<wire x1="48.26" y1="127" x2="48.26" y2="129.54" width="0.1524" layer="94"/>
<circle x="48.26" y="116.078" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="48.26" y1="115.316" x2="48.26" y2="114.3" width="0.1524" layer="94"/>
<wire x1="66.04" y1="99.06" x2="60.96" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="55.88" y1="99.06" x2="60.96" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="63.5" y1="102.362" x2="63.5" y2="99.06" width="0.1524" layer="94"/>
<wire x1="58.42" y1="102.362" x2="58.42" y2="99.06" width="0.1524" layer="94"/>
<wire x1="66.04" y1="99.06" x2="63.5" y2="99.06" width="0.4064" layer="94"/>
<wire x1="63.5" y1="99.06" x2="60.96" y2="99.06" width="0.4064" layer="94"/>
<wire x1="60.96" y1="99.06" x2="58.42" y2="99.06" width="0.4064" layer="94"/>
<wire x1="58.42" y1="99.06" x2="55.88" y2="99.06" width="0.4064" layer="94"/>
<circle x="60.96" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="60.96" y1="84.836" x2="60.96" y2="83.82" width="0.1524" layer="94"/>
<wire x1="60.96" y1="99.06" x2="60.96" y2="102.362" width="0.1524" layer="94"/>
<wire x1="68.58" y1="81.28" x2="63.5" y2="68.58" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="58.42" y1="81.28" x2="63.5" y2="68.58" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="66.04" y1="84.582" x2="66.04" y2="81.28" width="0.1524" layer="94"/>
<wire x1="60.96" y1="84.582" x2="60.96" y2="81.28" width="0.1524" layer="94"/>
<wire x1="68.58" y1="81.28" x2="66.04" y2="81.28" width="0.4064" layer="94"/>
<wire x1="66.04" y1="81.28" x2="60.96" y2="81.28" width="0.4064" layer="94"/>
<wire x1="60.96" y1="81.28" x2="58.42" y2="81.28" width="0.4064" layer="94"/>
<circle x="63.5" y="67.818" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="63.5" y1="67.056" x2="63.5" y2="66.04" width="0.1524" layer="94"/>
<text x="63.5" y="17.78" size="1.27" layer="91" rot="R180">FAOut</text>
<text x="48.26" y="142.24" size="1.27" layer="91">OpCode[0]</text>
<text x="35.56" y="142.24" size="1.27" layer="91">OpCode[1]</text>
<text x="22.86" y="142.24" size="1.27" layer="91">OpCode[2]</text>
<text x="10.16" y="142.24" size="1.27" layer="91">OpCode[3]</text>
<text x="-2.54" y="142.24" size="1.27" layer="91">OpCode[4]</text>
<text x="50.8" y="129.54" size="1.27" layer="92">A</text>
<text x="50.8" y="132.08" size="1.27" layer="92">B</text>
<text x="50.8" y="134.62" size="1.27" layer="92">C</text>
<text x="50.8" y="137.16" size="1.27" layer="92">D</text>
<text x="50.8" y="139.7" size="1.27" layer="92">E</text>
<text x="50.8" y="114.3" size="1.27" layer="92">!A</text>
<text x="50.8" y="111.76" size="1.27" layer="92">!B</text>
<text x="50.8" y="111.76" size="1.27" layer="92">!B</text>
<text x="50.8" y="109.22" size="1.27" layer="92">!C</text>
<text x="50.8" y="106.68" size="1.27" layer="92">!D</text>
<text x="50.8" y="104.14" size="1.27" layer="92">!E</text>
<wire x1="83.82" y1="99.06" x2="78.74" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="73.66" y1="99.06" x2="78.74" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="81.28" y1="102.362" x2="81.28" y2="99.06" width="0.1524" layer="94"/>
<wire x1="76.2" y1="102.362" x2="76.2" y2="99.06" width="0.1524" layer="94"/>
<wire x1="83.82" y1="99.06" x2="81.28" y2="99.06" width="0.4064" layer="94"/>
<wire x1="81.28" y1="99.06" x2="76.2" y2="99.06" width="0.4064" layer="94"/>
<wire x1="76.2" y1="99.06" x2="73.66" y2="99.06" width="0.4064" layer="94"/>
<circle x="78.74" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="78.74" y1="84.836" x2="78.74" y2="83.82" width="0.1524" layer="94"/>
<wire x1="86.36" y1="81.28" x2="81.28" y2="68.58" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="76.2" y1="81.28" x2="81.28" y2="68.58" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="83.82" y1="84.582" x2="83.82" y2="81.28" width="0.1524" layer="94"/>
<wire x1="78.74" y1="84.582" x2="78.74" y2="81.28" width="0.1524" layer="94"/>
<wire x1="86.36" y1="81.28" x2="83.82" y2="81.28" width="0.4064" layer="94"/>
<wire x1="83.82" y1="81.28" x2="78.74" y2="81.28" width="0.4064" layer="94"/>
<wire x1="78.74" y1="81.28" x2="76.2" y2="81.28" width="0.4064" layer="94"/>
<circle x="81.28" y="67.818" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="81.28" y1="67.056" x2="81.28" y2="66.04" width="0.1524" layer="94"/>
<wire x1="88.9" y1="63.5" x2="83.82" y2="50.8" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="78.74" y1="63.5" x2="83.82" y2="50.8" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="86.36" y1="66.802" x2="86.36" y2="63.5" width="0.1524" layer="94"/>
<wire x1="81.28" y1="66.802" x2="81.28" y2="63.5" width="0.1524" layer="94"/>
<wire x1="88.9" y1="63.5" x2="86.36" y2="63.5" width="0.4064" layer="94"/>
<wire x1="86.36" y1="63.5" x2="83.82" y2="63.5" width="0.4064" layer="94"/>
<wire x1="83.82" y1="63.5" x2="81.28" y2="63.5" width="0.4064" layer="94"/>
<wire x1="81.28" y1="63.5" x2="78.74" y2="63.5" width="0.4064" layer="94"/>
<circle x="83.82" y="50.038" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="83.82" y1="49.276" x2="83.82" y2="48.26" width="0.1524" layer="94"/>
<wire x1="83.82" y1="63.5" x2="83.82" y2="66.802" width="0.1524" layer="94"/>
<wire x1="104.14" y1="99.06" x2="99.06" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="93.98" y1="99.06" x2="99.06" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="101.6" y1="102.362" x2="101.6" y2="99.06" width="0.1524" layer="94"/>
<wire x1="96.52" y1="102.362" x2="96.52" y2="99.06" width="0.1524" layer="94"/>
<wire x1="104.14" y1="99.06" x2="101.6" y2="99.06" width="0.4064" layer="94"/>
<wire x1="101.6" y1="99.06" x2="99.06" y2="99.06" width="0.4064" layer="94"/>
<wire x1="99.06" y1="99.06" x2="96.52" y2="99.06" width="0.4064" layer="94"/>
<wire x1="96.52" y1="99.06" x2="93.98" y2="99.06" width="0.4064" layer="94"/>
<circle x="99.06" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="99.06" y1="84.836" x2="99.06" y2="83.82" width="0.1524" layer="94"/>
<wire x1="99.06" y1="99.06" x2="99.06" y2="102.362" width="0.1524" layer="94"/>
<wire x1="116.84" y1="99.06" x2="111.76" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="106.68" y1="99.06" x2="111.76" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="114.3" y1="102.362" x2="114.3" y2="99.06" width="0.1524" layer="94"/>
<wire x1="109.22" y1="102.362" x2="109.22" y2="99.06" width="0.1524" layer="94"/>
<wire x1="116.84" y1="99.06" x2="114.3" y2="99.06" width="0.4064" layer="94"/>
<wire x1="114.3" y1="99.06" x2="111.76" y2="99.06" width="0.4064" layer="94"/>
<wire x1="111.76" y1="99.06" x2="109.22" y2="99.06" width="0.4064" layer="94"/>
<wire x1="109.22" y1="99.06" x2="106.68" y2="99.06" width="0.4064" layer="94"/>
<circle x="111.76" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="111.76" y1="84.836" x2="111.76" y2="83.82" width="0.1524" layer="94"/>
<wire x1="111.76" y1="99.06" x2="111.76" y2="102.362" width="0.1524" layer="94"/>
<wire x1="111.76" y1="78.74" x2="106.68" y2="66.04" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="101.6" y1="78.74" x2="106.68" y2="66.04" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="109.22" y1="82.042" x2="109.22" y2="78.74" width="0.1524" layer="94"/>
<wire x1="104.14" y1="82.042" x2="104.14" y2="78.74" width="0.1524" layer="94"/>
<wire x1="111.76" y1="78.74" x2="109.22" y2="78.74" width="0.4064" layer="94"/>
<wire x1="109.22" y1="78.74" x2="104.14" y2="78.74" width="0.4064" layer="94"/>
<wire x1="104.14" y1="78.74" x2="101.6" y2="78.74" width="0.4064" layer="94"/>
<circle x="106.68" y="65.278" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="106.68" y1="64.516" x2="106.68" y2="63.5" width="0.1524" layer="94"/>
<wire x1="114.3" y1="60.96" x2="109.22" y2="48.26" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="104.14" y1="60.96" x2="109.22" y2="48.26" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="111.76" y1="64.262" x2="111.76" y2="60.96" width="0.1524" layer="94"/>
<wire x1="106.68" y1="64.262" x2="106.68" y2="60.96" width="0.1524" layer="94"/>
<wire x1="114.3" y1="60.96" x2="111.76" y2="60.96" width="0.4064" layer="94"/>
<wire x1="111.76" y1="60.96" x2="106.68" y2="60.96" width="0.4064" layer="94"/>
<wire x1="106.68" y1="60.96" x2="104.14" y2="60.96" width="0.4064" layer="94"/>
<circle x="109.22" y="47.498" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="111.76" y1="43.18" x2="106.68" y2="30.48" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="101.6" y1="43.18" x2="106.68" y2="30.48" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="104.14" y1="46.482" x2="104.14" y2="43.18" width="0.1524" layer="94"/>
<wire x1="111.76" y1="43.18" x2="109.22" y2="43.18" width="0.4064" layer="94"/>
<wire x1="109.22" y1="43.18" x2="104.14" y2="43.18" width="0.4064" layer="94"/>
<wire x1="104.14" y1="43.18" x2="101.6" y2="43.18" width="0.4064" layer="94"/>
<circle x="106.68" y="29.718" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="106.68" y1="28.956" x2="106.68" y2="27.94" width="0.1524" layer="94"/>
<text x="106.68" y="17.78" size="1.27" layer="91" rot="R180">SUB</text>
<wire x1="132.08" y1="99.06" x2="127" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="121.92" y1="99.06" x2="127" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="127" y1="96.52" x2="121.92" y2="99.06" width="0.4064" layer="94" curve="-45"/>
<wire x1="127" y1="96.52" x2="132.08" y2="99.06" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="129.54" y1="101.6" x2="129.54" y2="97.282" width="0.1524" layer="94"/>
<wire x1="124.46" y1="101.6" x2="124.46" y2="97.282" width="0.1524" layer="94"/>
<circle x="127" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="127" y1="84.836" x2="127" y2="83.82" width="0.1524" layer="94"/>
<wire x1="127" y1="96.52" x2="127" y2="101.6" width="0.1524" layer="94"/>
<wire x1="144.78" y1="99.06" x2="139.7" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="134.62" y1="99.06" x2="139.7" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="139.7" y1="96.52" x2="134.62" y2="99.06" width="0.4064" layer="94" curve="-45"/>
<wire x1="139.7" y1="96.52" x2="144.78" y2="99.06" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="142.24" y1="101.6" x2="142.24" y2="97.282" width="0.1524" layer="94"/>
<wire x1="137.16" y1="101.6" x2="137.16" y2="97.282" width="0.1524" layer="94"/>
<circle x="139.7" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="139.7" y1="84.836" x2="139.7" y2="83.82" width="0.1524" layer="94"/>
<wire x1="139.7" y1="96.52" x2="139.7" y2="101.6" width="0.1524" layer="94"/>
<wire x1="137.16" y1="81.28" x2="132.08" y2="68.58" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="127" y1="81.28" x2="132.08" y2="68.58" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="132.08" y1="78.74" x2="127" y2="81.28" width="0.4064" layer="94" curve="-45"/>
<wire x1="132.08" y1="78.74" x2="137.16" y2="81.28" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="134.62" y1="83.82" x2="134.62" y2="79.502" width="0.1524" layer="94"/>
<wire x1="129.54" y1="83.82" x2="129.54" y2="79.502" width="0.1524" layer="94"/>
<circle x="132.08" y="67.818" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="132.08" y1="67.056" x2="132.08" y2="66.04" width="0.1524" layer="94"/>
<wire x1="139.7" y1="60.96" x2="134.62" y2="48.26" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="129.54" y1="60.96" x2="134.62" y2="48.26" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="134.62" y1="58.42" x2="129.54" y2="60.96" width="0.4064" layer="94" curve="-45"/>
<wire x1="134.62" y1="58.42" x2="139.7" y2="60.96" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="137.16" y1="63.5" x2="137.16" y2="59.182" width="0.1524" layer="94"/>
<wire x1="132.08" y1="63.5" x2="132.08" y2="59.182" width="0.1524" layer="94"/>
<circle x="134.62" y="47.498" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="134.62" y1="46.736" x2="134.62" y2="45.72" width="0.1524" layer="94"/>
<wire x1="134.62" y1="58.42" x2="134.62" y2="63.5" width="0.1524" layer="94"/>
<text x="134.62" y="17.78" size="1.27" layer="91" rot="R180">ShL</text>
<wire x1="195.58" y1="99.06" x2="190.5" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="185.42" y1="99.06" x2="190.5" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="195.58" y1="99.06" x2="193.04" y2="99.06" width="0.4064" layer="94"/>
<wire x1="193.04" y1="99.06" x2="191.262" y2="99.06" width="0.4064" layer="94"/>
<wire x1="191.262" y1="99.06" x2="190.5" y2="99.06" width="0.4064" layer="94"/>
<wire x1="190.5" y1="99.06" x2="188.976" y2="99.06" width="0.4064" layer="94"/>
<wire x1="188.976" y1="99.06" x2="187.96" y2="99.06" width="0.4064" layer="94"/>
<wire x1="187.96" y1="99.06" x2="185.42" y2="99.06" width="0.4064" layer="94"/>
<circle x="190.5" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="190.5" y1="84.836" x2="190.5" y2="83.82" width="0.1524" layer="94"/>
<wire x1="190.5" y1="99.06" x2="189.23" y2="99.06" width="0.1524" layer="94"/>
<wire x1="187.96" y1="99.06" x2="187.198" y2="99.06" width="0.1524" layer="94"/>
<wire x1="187.198" y1="99.06" x2="187.198" y2="101.854" width="0.1524" layer="94"/>
<wire x1="188.976" y1="99.06" x2="188.976" y2="101.854" width="0.1524" layer="94"/>
<wire x1="191.262" y1="99.06" x2="191.262" y2="101.854" width="0.1524" layer="94"/>
<wire x1="193.04" y1="99.06" x2="193.294" y2="99.06" width="0.1524" layer="94"/>
<wire x1="193.294" y1="99.06" x2="193.294" y2="101.854" width="0.1524" layer="94"/>
<wire x1="208.28" y1="99.06" x2="203.2" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="198.12" y1="99.06" x2="203.2" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="208.28" y1="99.06" x2="205.74" y2="99.06" width="0.4064" layer="94"/>
<wire x1="205.74" y1="99.06" x2="203.962" y2="99.06" width="0.4064" layer="94"/>
<wire x1="203.962" y1="99.06" x2="203.2" y2="99.06" width="0.4064" layer="94"/>
<wire x1="203.2" y1="99.06" x2="201.676" y2="99.06" width="0.4064" layer="94"/>
<wire x1="201.676" y1="99.06" x2="200.66" y2="99.06" width="0.4064" layer="94"/>
<wire x1="200.66" y1="99.06" x2="198.12" y2="99.06" width="0.4064" layer="94"/>
<circle x="203.2" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="203.2" y1="84.836" x2="203.2" y2="83.82" width="0.1524" layer="94"/>
<wire x1="203.2" y1="99.06" x2="201.93" y2="99.06" width="0.1524" layer="94"/>
<wire x1="200.66" y1="99.06" x2="199.898" y2="99.06" width="0.1524" layer="94"/>
<wire x1="199.898" y1="99.06" x2="199.898" y2="101.854" width="0.1524" layer="94"/>
<wire x1="201.676" y1="99.06" x2="201.676" y2="101.854" width="0.1524" layer="94"/>
<wire x1="203.962" y1="99.06" x2="203.962" y2="101.854" width="0.1524" layer="94"/>
<wire x1="205.74" y1="99.06" x2="205.994" y2="99.06" width="0.1524" layer="94"/>
<wire x1="205.994" y1="99.06" x2="205.994" y2="101.854" width="0.1524" layer="94"/>
<wire x1="203.2" y1="78.74" x2="198.12" y2="66.04" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="193.04" y1="78.74" x2="198.12" y2="66.04" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="200.66" y1="82.042" x2="200.66" y2="78.74" width="0.1524" layer="94"/>
<wire x1="195.58" y1="82.042" x2="195.58" y2="78.74" width="0.1524" layer="94"/>
<wire x1="203.2" y1="78.74" x2="200.66" y2="78.74" width="0.4064" layer="94"/>
<wire x1="200.66" y1="78.74" x2="195.58" y2="78.74" width="0.4064" layer="94"/>
<wire x1="195.58" y1="78.74" x2="193.04" y2="78.74" width="0.4064" layer="94"/>
<circle x="198.12" y="65.278" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="198.12" y1="64.516" x2="198.12" y2="63.5" width="0.1524" layer="94"/>
<wire x1="177.8" y1="99.06" x2="172.72" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="167.64" y1="99.06" x2="172.72" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="172.72" y1="96.52" x2="167.64" y2="99.06" width="0.4064" layer="94" curve="-45"/>
<wire x1="172.72" y1="96.52" x2="177.8" y2="99.06" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="175.26" y1="101.6" x2="175.26" y2="97.282" width="0.1524" layer="94"/>
<wire x1="170.18" y1="101.6" x2="170.18" y2="97.282" width="0.1524" layer="94"/>
<wire x1="172.72" y1="86.36" x2="172.72" y2="83.82" width="0.1524" layer="94"/>
<wire x1="172.72" y1="96.52" x2="172.72" y2="101.6" width="0.1524" layer="94"/>
<wire x1="180.34" y1="78.74" x2="175.26" y2="66.04" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="170.18" y1="78.74" x2="175.26" y2="66.04" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="175.26" y1="76.2" x2="170.18" y2="78.74" width="0.4064" layer="94" curve="-45"/>
<wire x1="175.26" y1="76.2" x2="180.34" y2="78.74" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="177.8" y1="81.28" x2="177.8" y2="76.962" width="0.1524" layer="94"/>
<wire x1="172.72" y1="81.28" x2="172.72" y2="76.962" width="0.1524" layer="94"/>
<wire x1="175.26" y1="66.04" x2="175.26" y2="63.5" width="0.1524" layer="94"/>
<wire x1="175.26" y1="76.2" x2="175.26" y2="81.28" width="0.1524" layer="94"/>
<wire x1="190.5" y1="50.8" x2="185.42" y2="38.1" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="180.34" y1="50.8" x2="185.42" y2="38.1" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="187.96" y1="54.102" x2="187.96" y2="50.8" width="0.1524" layer="94"/>
<wire x1="182.88" y1="54.102" x2="182.88" y2="50.8" width="0.1524" layer="94"/>
<wire x1="190.5" y1="50.8" x2="187.96" y2="50.8" width="0.4064" layer="94"/>
<wire x1="187.96" y1="50.8" x2="182.88" y2="50.8" width="0.4064" layer="94"/>
<wire x1="182.88" y1="50.8" x2="180.34" y2="50.8" width="0.4064" layer="94"/>
<circle x="185.42" y="37.338" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="185.42" y1="36.576" x2="185.42" y2="35.56" width="0.1524" layer="94"/>
<wire x1="187.96" y1="33.02" x2="182.88" y2="20.32" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="177.8" y1="33.02" x2="182.88" y2="20.32" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="185.42" y1="36.322" x2="185.42" y2="33.02" width="0.1524" layer="94"/>
<wire x1="180.34" y1="36.322" x2="180.34" y2="33.02" width="0.1524" layer="94"/>
<wire x1="187.96" y1="33.02" x2="185.42" y2="33.02" width="0.4064" layer="94"/>
<wire x1="185.42" y1="33.02" x2="180.34" y2="33.02" width="0.4064" layer="94"/>
<wire x1="180.34" y1="33.02" x2="177.8" y2="33.02" width="0.4064" layer="94"/>
<circle x="182.88" y="19.558" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="182.88" y1="17.526" x2="182.88" y2="19.05" width="0.1524" layer="94"/>
<text x="182.88" y="17.78" size="1.27" layer="91" rot="R180">Sh8</text>
<wire x1="203.2" y1="50.8" x2="198.12" y2="38.1" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="193.04" y1="50.8" x2="198.12" y2="38.1" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="200.66" y1="54.102" x2="200.66" y2="50.8" width="0.1524" layer="94"/>
<wire x1="195.58" y1="54.102" x2="195.58" y2="50.8" width="0.1524" layer="94"/>
<wire x1="198.12" y1="38.1" x2="198.12" y2="35.56" width="0.1524" layer="94"/>
<wire x1="203.2" y1="50.8" x2="200.66" y2="50.8" width="0.4064" layer="94"/>
<wire x1="200.66" y1="50.8" x2="195.58" y2="50.8" width="0.4064" layer="94"/>
<wire x1="195.58" y1="50.8" x2="193.04" y2="50.8" width="0.4064" layer="94"/>
<wire x1="218.44" y1="50.8" x2="213.36" y2="38.1" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="208.28" y1="50.8" x2="213.36" y2="38.1" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="215.9" y1="54.102" x2="215.9" y2="50.8" width="0.1524" layer="94"/>
<wire x1="210.82" y1="54.102" x2="210.82" y2="50.8" width="0.1524" layer="94"/>
<wire x1="213.36" y1="38.1" x2="213.36" y2="35.56" width="0.1524" layer="94"/>
<wire x1="218.44" y1="50.8" x2="215.9" y2="50.8" width="0.4064" layer="94"/>
<wire x1="215.9" y1="50.8" x2="210.82" y2="50.8" width="0.4064" layer="94"/>
<wire x1="210.82" y1="50.8" x2="208.28" y2="50.8" width="0.4064" layer="94"/>
<wire x1="233.68" y1="50.8" x2="228.6" y2="38.1" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="223.52" y1="50.8" x2="228.6" y2="38.1" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="231.14" y1="54.102" x2="231.14" y2="50.8" width="0.1524" layer="94"/>
<wire x1="226.06" y1="54.102" x2="226.06" y2="50.8" width="0.1524" layer="94"/>
<wire x1="228.6" y1="38.1" x2="228.6" y2="35.56" width="0.1524" layer="94"/>
<wire x1="233.68" y1="50.8" x2="231.14" y2="50.8" width="0.4064" layer="94"/>
<wire x1="231.14" y1="50.8" x2="226.06" y2="50.8" width="0.4064" layer="94"/>
<wire x1="226.06" y1="50.8" x2="223.52" y2="50.8" width="0.4064" layer="94"/>
<text x="198.12" y="17.78" size="1.27" layer="91" rot="R180">Sh4</text>
<text x="213.36" y="17.78" size="1.27" layer="91" rot="R180">Sh2</text>
<text x="228.6" y="17.78" size="1.27" layer="91" rot="R180">Sh1</text>
<text x="233.68" y="142.24" size="1.27" layer="91">imm4[0]</text>
<text x="226.06" y="142.24" size="1.27" layer="91">imm4[1]</text>
<text x="218.44" y="142.24" size="1.27" layer="91">imm4[2]</text>
<text x="210.82" y="142.24" size="1.27" layer="91">imm4[3]</text>
<wire x1="246.38" y1="99.06" x2="241.3" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="236.22" y1="99.06" x2="241.3" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="246.38" y1="99.06" x2="243.84" y2="99.06" width="0.4064" layer="94"/>
<wire x1="243.84" y1="99.06" x2="242.062" y2="99.06" width="0.4064" layer="94"/>
<wire x1="242.062" y1="99.06" x2="241.3" y2="99.06" width="0.4064" layer="94"/>
<wire x1="241.3" y1="99.06" x2="239.776" y2="99.06" width="0.4064" layer="94"/>
<wire x1="239.776" y1="99.06" x2="238.76" y2="99.06" width="0.4064" layer="94"/>
<wire x1="238.76" y1="99.06" x2="236.22" y2="99.06" width="0.4064" layer="94"/>
<circle x="241.3" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="241.3" y1="84.836" x2="241.3" y2="83.82" width="0.1524" layer="94"/>
<wire x1="241.3" y1="99.06" x2="240.03" y2="99.06" width="0.1524" layer="94"/>
<wire x1="238.76" y1="99.06" x2="237.998" y2="99.06" width="0.1524" layer="94"/>
<wire x1="237.998" y1="99.06" x2="237.998" y2="101.854" width="0.1524" layer="94"/>
<wire x1="239.776" y1="99.06" x2="239.776" y2="101.854" width="0.1524" layer="94"/>
<wire x1="242.062" y1="99.06" x2="242.062" y2="101.854" width="0.1524" layer="94"/>
<wire x1="243.84" y1="99.06" x2="244.094" y2="99.06" width="0.1524" layer="94"/>
<wire x1="244.094" y1="99.06" x2="244.094" y2="101.854" width="0.1524" layer="94"/>
<wire x1="259.08" y1="99.06" x2="254" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="248.92" y1="99.06" x2="254" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="256.54" y1="102.362" x2="256.54" y2="99.06" width="0.1524" layer="94"/>
<wire x1="251.46" y1="102.362" x2="251.46" y2="99.06" width="0.1524" layer="94"/>
<wire x1="259.08" y1="99.06" x2="256.54" y2="99.06" width="0.4064" layer="94"/>
<wire x1="256.54" y1="99.06" x2="254" y2="99.06" width="0.4064" layer="94"/>
<wire x1="254" y1="99.06" x2="251.46" y2="99.06" width="0.4064" layer="94"/>
<wire x1="251.46" y1="99.06" x2="248.92" y2="99.06" width="0.4064" layer="94"/>
<circle x="254" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="254" y1="84.836" x2="254" y2="83.82" width="0.1524" layer="94"/>
<wire x1="254" y1="99.06" x2="254" y2="102.362" width="0.1524" layer="94"/>
<wire x1="274.32" y1="99.06" x2="269.24" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="264.16" y1="99.06" x2="269.24" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="274.32" y1="99.06" x2="271.78" y2="99.06" width="0.4064" layer="94"/>
<wire x1="271.78" y1="99.06" x2="270.002" y2="99.06" width="0.4064" layer="94"/>
<wire x1="270.002" y1="99.06" x2="269.24" y2="99.06" width="0.4064" layer="94"/>
<wire x1="269.24" y1="99.06" x2="267.716" y2="99.06" width="0.4064" layer="94"/>
<wire x1="267.716" y1="99.06" x2="266.7" y2="99.06" width="0.4064" layer="94"/>
<wire x1="266.7" y1="99.06" x2="264.16" y2="99.06" width="0.4064" layer="94"/>
<circle x="269.24" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="269.24" y1="84.836" x2="269.24" y2="83.82" width="0.1524" layer="94"/>
<wire x1="269.24" y1="99.06" x2="267.97" y2="99.06" width="0.1524" layer="94"/>
<wire x1="266.7" y1="99.06" x2="265.938" y2="99.06" width="0.1524" layer="94"/>
<wire x1="265.938" y1="99.06" x2="265.938" y2="101.854" width="0.1524" layer="94"/>
<wire x1="267.716" y1="99.06" x2="267.716" y2="101.854" width="0.1524" layer="94"/>
<wire x1="270.002" y1="99.06" x2="270.002" y2="101.854" width="0.1524" layer="94"/>
<wire x1="271.78" y1="99.06" x2="272.034" y2="99.06" width="0.1524" layer="94"/>
<wire x1="272.034" y1="99.06" x2="272.034" y2="101.854" width="0.1524" layer="94"/>
<wire x1="259.08" y1="78.74" x2="254" y2="66.04" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="248.92" y1="78.74" x2="254" y2="66.04" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="256.54" y1="82.042" x2="256.54" y2="78.74" width="0.1524" layer="94"/>
<wire x1="251.46" y1="82.042" x2="251.46" y2="78.74" width="0.1524" layer="94"/>
<wire x1="259.08" y1="78.74" x2="256.54" y2="78.74" width="0.4064" layer="94"/>
<wire x1="256.54" y1="78.74" x2="254" y2="78.74" width="0.4064" layer="94"/>
<wire x1="254" y1="78.74" x2="251.46" y2="78.74" width="0.4064" layer="94"/>
<wire x1="251.46" y1="78.74" x2="248.92" y2="78.74" width="0.4064" layer="94"/>
<circle x="254" y="65.278" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="254" y1="64.516" x2="254" y2="63.5" width="0.1524" layer="94"/>
<wire x1="254" y1="78.74" x2="254" y2="82.042" width="0.1524" layer="94"/>
<text x="254" y="17.78" size="1.27" layer="91" rot="R180">ShOut</text>
<wire x1="287.02" y1="99.06" x2="281.94" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="276.86" y1="99.06" x2="281.94" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="281.94" y1="96.52" x2="276.86" y2="99.06" width="0.4064" layer="94" curve="-45"/>
<wire x1="281.94" y1="96.52" x2="287.02" y2="99.06" width="0.4064" layer="94" curve="38.659808"/>
<wire x1="284.48" y1="101.6" x2="284.48" y2="97.282" width="0.1524" layer="94"/>
<wire x1="279.4" y1="101.6" x2="279.4" y2="97.282" width="0.1524" layer="94"/>
<circle x="281.94" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="281.94" y1="84.836" x2="281.94" y2="83.82" width="0.1524" layer="94"/>
<wire x1="281.94" y1="96.52" x2="281.94" y2="101.6" width="0.1524" layer="94"/>
<text x="281.94" y="76.2" size="1.27" layer="91" rot="R180">UseC</text>
<wire x1="109.22" y1="46.736" x2="109.22" y2="43.18" width="0.1524" layer="94"/>
<wire x1="162.56" y1="99.06" x2="157.48" y2="86.36" width="0.4064" layer="94" curve="-63.434949"/>
<wire x1="152.4" y1="99.06" x2="157.48" y2="86.36" width="0.4064" layer="94" curve="53.130102"/>
<wire x1="162.56" y1="99.06" x2="160.02" y2="99.06" width="0.4064" layer="94"/>
<wire x1="160.02" y1="99.06" x2="158.242" y2="99.06" width="0.4064" layer="94"/>
<wire x1="158.242" y1="99.06" x2="157.48" y2="99.06" width="0.4064" layer="94"/>
<wire x1="157.48" y1="99.06" x2="155.956" y2="99.06" width="0.4064" layer="94"/>
<wire x1="155.956" y1="99.06" x2="154.94" y2="99.06" width="0.4064" layer="94"/>
<wire x1="154.94" y1="99.06" x2="152.4" y2="99.06" width="0.4064" layer="94"/>
<circle x="157.48" y="85.598" radius="0.71841875" width="0.4064" layer="94"/>
<wire x1="157.48" y1="84.836" x2="157.48" y2="83.82" width="0.1524" layer="94"/>
<wire x1="157.48" y1="99.06" x2="156.21" y2="99.06" width="0.1524" layer="94"/>
<wire x1="154.94" y1="99.06" x2="154.178" y2="99.06" width="0.1524" layer="94"/>
<wire x1="154.178" y1="99.06" x2="154.178" y2="101.854" width="0.1524" layer="94"/>
<wire x1="155.956" y1="99.06" x2="155.956" y2="101.854" width="0.1524" layer="94"/>
<wire x1="158.242" y1="99.06" x2="158.242" y2="101.854" width="0.1524" layer="94"/>
<wire x1="160.02" y1="99.06" x2="160.274" y2="99.06" width="0.1524" layer="94"/>
<wire x1="160.274" y1="99.06" x2="160.274" y2="101.854" width="0.1524" layer="94"/>
<text x="157.48" y="17.78" size="1.27" layer="91" rot="R180">ShR</text>
</plain>
<instances>
</instances>
<busses>
<bus name="B$1">
<segment>
<wire x1="48.26" y1="139.7" x2="76.2" y2="139.7" width="0.1524" layer="92"/>
<wire x1="76.2" y1="139.7" x2="99.06" y2="139.7" width="0.1524" layer="92"/>
<wire x1="99.06" y1="139.7" x2="129.54" y2="139.7" width="0.1524" layer="92"/>
<wire x1="129.54" y1="139.7" x2="182.88" y2="139.7" width="0.1524" layer="92"/>
<wire x1="193.294" y1="139.7" x2="182.88" y2="139.7" width="0.1524" layer="92"/>
<wire x1="193.294" y1="139.7" x2="244.094" y2="139.7" width="0.1524" layer="92"/>
<wire x1="244.094" y1="139.7" x2="292.1" y2="139.7" width="0.1524" layer="92"/>
<wire x1="48.26" y1="139.7" x2="48.26" y2="129.54" width="0.1524" layer="92"/>
<wire x1="76.2" y1="139.7" x2="76.2" y2="101.6" width="0.1524" layer="92"/>
<wire x1="99.06" y1="139.7" x2="99.06" y2="101.6" width="0.1524" layer="92"/>
<wire x1="129.54" y1="139.7" x2="129.54" y2="101.6" width="0.1524" layer="92"/>
<wire x1="193.294" y1="139.7" x2="193.294" y2="101.6" width="0.1524" layer="92"/>
<wire x1="244.094" y1="139.7" x2="244.094" y2="101.854" width="0.1524" layer="92"/>
<wire x1="182.88" y1="139.7" x2="182.88" y2="83.82" width="0.1524" layer="92"/>
<wire x1="182.88" y1="83.82" x2="177.8" y2="83.82" width="0.1524" layer="92"/>
<wire x1="177.8" y1="83.82" x2="177.8" y2="81.28" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="-2.54" y1="114.3" x2="91.44" y2="114.3" width="0.1524" layer="92"/>
<wire x1="91.44" y1="114.3" x2="101.6" y2="114.3" width="0.1524" layer="92"/>
<wire x1="101.6" y1="114.3" x2="149.86" y2="114.3" width="0.1524" layer="92"/>
<wire x1="149.86" y1="114.3" x2="175.26" y2="114.3" width="0.1524" layer="92"/>
<wire x1="175.26" y1="114.3" x2="292.1" y2="114.3" width="0.1524" layer="92"/>
<wire x1="91.44" y1="114.3" x2="91.44" y2="66.802" width="0.1524" layer="92"/>
<wire x1="149.86" y1="114.3" x2="149.86" y2="66.04" width="0.1524" layer="92"/>
<wire x1="149.86" y1="66.04" x2="137.16" y2="66.04" width="0.1524" layer="92"/>
<wire x1="137.16" y1="66.04" x2="137.16" y2="63.5" width="0.1524" layer="92"/>
<wire x1="175.26" y1="114.3" x2="175.26" y2="101.6" width="0.1524" layer="92"/>
<wire x1="91.44" y1="66.802" x2="86.36" y2="66.802" width="0.1524" layer="92"/>
<wire x1="101.6" y1="114.3" x2="101.6" y2="101.6" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$2">
<segment>
<wire x1="35.56" y1="137.16" x2="60.96" y2="137.16" width="0.1524" layer="92"/>
<wire x1="60.96" y1="137.16" x2="119.38" y2="137.16" width="0.1524" layer="92"/>
<wire x1="119.38" y1="137.16" x2="127" y2="137.16" width="0.1524" layer="92"/>
<wire x1="127" y1="137.16" x2="180.34" y2="137.16" width="0.1524" layer="92"/>
<wire x1="180.34" y1="137.16" x2="281.94" y2="137.16" width="0.1524" layer="92"/>
<wire x1="281.94" y1="137.16" x2="292.1" y2="137.16" width="0.1524" layer="92"/>
<wire x1="35.56" y1="137.16" x2="35.56" y2="129.54" width="0.1524" layer="92"/>
<wire x1="60.96" y1="137.16" x2="60.96" y2="101.6" width="0.1524" layer="92"/>
<wire x1="127" y1="137.16" x2="127" y2="101.6" width="0.1524" layer="92"/>
<wire x1="281.94" y1="137.16" x2="281.94" y2="101.6" width="0.1524" layer="92"/>
<wire x1="119.38" y1="137.16" x2="119.38" y2="71.12" width="0.1524" layer="92"/>
<wire x1="119.38" y1="71.12" x2="111.76" y2="71.12" width="0.1524" layer="92"/>
<wire x1="111.76" y1="71.12" x2="111.76" y2="63.5" width="0.1524" layer="92"/>
<wire x1="180.34" y1="137.16" x2="180.34" y2="86.36" width="0.1524" layer="92"/>
<wire x1="180.34" y1="86.36" x2="175.26" y2="86.36" width="0.1524" layer="92"/>
<wire x1="175.26" y1="86.36" x2="175.26" y2="81.28" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="10.16" y1="111.76" x2="142.24" y2="111.76" width="0.1524" layer="92"/>
<wire x1="142.24" y1="111.76" x2="160.274" y2="111.76" width="0.1524" layer="92"/>
<wire x1="160.274" y1="111.76" x2="292.1" y2="111.76" width="0.1524" layer="92"/>
<wire x1="10.16" y1="111.76" x2="10.16" y2="114.3" width="0.1524" layer="92"/>
<wire x1="142.24" y1="111.76" x2="142.24" y2="101.6" width="0.1524" layer="92"/>
<wire x1="160.274" y1="111.76" x2="160.274" y2="101.854" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$3">
<segment>
<wire x1="292.1" y1="134.62" x2="254" y2="134.62" width="0.1524" layer="92"/>
<wire x1="254" y1="134.62" x2="242.062" y2="134.62" width="0.1524" layer="92"/>
<wire x1="242.062" y1="134.62" x2="203.962" y2="134.62" width="0.1524" layer="92"/>
<wire x1="203.962" y1="134.62" x2="191.262" y2="134.62" width="0.1524" layer="92"/>
<wire x1="191.262" y1="134.62" x2="158.242" y2="134.62" width="0.1524" layer="92"/>
<wire x1="158.242" y1="134.62" x2="96.52" y2="134.62" width="0.1524" layer="92"/>
<wire x1="96.52" y1="134.62" x2="22.86" y2="134.62" width="0.1524" layer="92"/>
<wire x1="22.86" y1="134.62" x2="22.86" y2="129.54" width="0.1524" layer="92"/>
<wire x1="96.52" y1="134.62" x2="96.52" y2="101.6" width="0.1524" layer="92"/>
<wire x1="191.262" y1="134.62" x2="191.262" y2="101.854" width="0.1524" layer="92"/>
<wire x1="203.962" y1="134.62" x2="203.962" y2="101.854" width="0.1524" layer="92"/>
<wire x1="242.062" y1="134.62" x2="242.062" y2="101.854" width="0.1524" layer="92"/>
<wire x1="254" y1="134.62" x2="254" y2="101.6" width="0.1524" layer="92"/>
<wire x1="158.242" y1="134.62" x2="158.242" y2="101.854" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="292.1" y1="109.22" x2="284.48" y2="109.22" width="0.1524" layer="92"/>
<wire x1="284.48" y1="109.22" x2="272.034" y2="109.22" width="0.1524" layer="92"/>
<wire x1="272.034" y1="109.22" x2="172.72" y2="109.22" width="0.1524" layer="92"/>
<wire x1="172.72" y1="109.22" x2="147.32" y2="109.22" width="0.1524" layer="92"/>
<wire x1="147.32" y1="109.22" x2="114.3" y2="109.22" width="0.1524" layer="92"/>
<wire x1="114.3" y1="109.22" x2="86.36" y2="109.22" width="0.1524" layer="92"/>
<wire x1="86.36" y1="109.22" x2="81.28" y2="109.22" width="0.1524" layer="92"/>
<wire x1="81.28" y1="109.22" x2="22.86" y2="109.22" width="0.1524" layer="92"/>
<wire x1="22.86" y1="109.22" x2="22.86" y2="114.3" width="0.1524" layer="92"/>
<wire x1="81.28" y1="109.22" x2="81.28" y2="101.6" width="0.1524" layer="92"/>
<wire x1="86.36" y1="109.22" x2="86.36" y2="86.36" width="0.1524" layer="92"/>
<wire x1="86.36" y1="86.36" x2="83.82" y2="86.36" width="0.1524" layer="92"/>
<wire x1="83.82" y1="86.36" x2="83.82" y2="83.82" width="0.1524" layer="92"/>
<wire x1="114.3" y1="109.22" x2="114.3" y2="101.6" width="0.1524" layer="92"/>
<wire x1="147.32" y1="109.22" x2="147.32" y2="68.58" width="0.1524" layer="92"/>
<wire x1="147.32" y1="68.58" x2="134.62" y2="68.58" width="0.1524" layer="92"/>
<wire x1="134.62" y1="68.58" x2="134.62" y2="63.5" width="0.1524" layer="92"/>
<wire x1="172.72" y1="109.22" x2="172.72" y2="101.6" width="0.1524" layer="92"/>
<wire x1="272.034" y1="109.22" x2="272.034" y2="101.854" width="0.1524" layer="92"/>
<wire x1="284.48" y1="109.22" x2="284.48" y2="101.6" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$4">
<segment>
<wire x1="10.16" y1="132.08" x2="58.42" y2="132.08" width="0.1524" layer="92"/>
<wire x1="58.42" y1="132.08" x2="88.9" y2="132.08" width="0.1524" layer="92"/>
<wire x1="88.9" y1="132.08" x2="109.22" y2="132.08" width="0.1524" layer="92"/>
<wire x1="109.22" y1="132.08" x2="124.46" y2="132.08" width="0.1524" layer="92"/>
<wire x1="124.46" y1="132.08" x2="155.956" y2="132.08" width="0.1524" layer="92"/>
<wire x1="155.956" y1="132.08" x2="170.18" y2="132.08" width="0.1524" layer="92"/>
<wire x1="188.976" y1="132.08" x2="201.676" y2="132.08" width="0.1524" layer="92"/>
<wire x1="188.976" y1="132.08" x2="170.18" y2="132.08" width="0.1524" layer="92"/>
<wire x1="201.676" y1="132.08" x2="239.776" y2="132.08" width="0.1524" layer="92"/>
<wire x1="239.776" y1="132.08" x2="267.716" y2="132.08" width="0.1524" layer="92"/>
<wire x1="267.716" y1="132.08" x2="292.1" y2="132.08" width="0.1524" layer="92"/>
<wire x1="10.16" y1="132.08" x2="10.16" y2="129.54" width="0.1524" layer="92"/>
<wire x1="58.42" y1="132.08" x2="58.42" y2="101.6" width="0.1524" layer="92"/>
<wire x1="109.22" y1="132.08" x2="109.22" y2="101.6" width="0.1524" layer="92"/>
<wire x1="124.46" y1="132.08" x2="124.46" y2="101.6" width="0.1524" layer="92"/>
<wire x1="188.976" y1="132.08" x2="188.976" y2="101.854" width="0.1524" layer="92"/>
<wire x1="201.676" y1="132.08" x2="201.676" y2="101.854" width="0.1524" layer="92"/>
<wire x1="170.18" y1="132.08" x2="170.18" y2="101.6" width="0.1524" layer="92"/>
<wire x1="239.776" y1="132.08" x2="239.776" y2="101.854" width="0.1524" layer="92"/>
<wire x1="267.716" y1="132.08" x2="267.716" y2="101.854" width="0.1524" layer="92"/>
<wire x1="88.9" y1="132.08" x2="88.9" y2="68.58" width="0.1524" layer="92"/>
<wire x1="88.9" y1="68.58" x2="83.82" y2="68.58" width="0.1524" layer="92"/>
<wire x1="83.82" y1="68.58" x2="83.82" y2="66.802" width="0.1524" layer="92"/>
<wire x1="155.956" y1="132.08" x2="155.956" y2="101.854" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="35.56" y1="106.68" x2="139.7" y2="106.68" width="0.1524" layer="92"/>
<wire x1="139.7" y1="106.68" x2="256.54" y2="106.68" width="0.1524" layer="92"/>
<wire x1="256.54" y1="106.68" x2="270.002" y2="106.68" width="0.1524" layer="92"/>
<wire x1="270.002" y1="106.68" x2="292.1" y2="106.68" width="0.1524" layer="92"/>
<wire x1="35.56" y1="106.68" x2="35.56" y2="114.3" width="0.1524" layer="92"/>
<wire x1="139.7" y1="106.68" x2="139.7" y2="101.6" width="0.1524" layer="92"/>
<wire x1="256.54" y1="106.68" x2="256.54" y2="101.6" width="0.1524" layer="92"/>
<wire x1="270.002" y1="106.68" x2="270.002" y2="101.6" width="0.1524" layer="92"/>
</segment>
</bus>
<bus name="B$5">
<segment>
<wire x1="292.1" y1="129.54" x2="279.4" y2="129.54" width="0.1524" layer="92"/>
<wire x1="279.4" y1="129.54" x2="265.938" y2="129.54" width="0.1524" layer="92"/>
<wire x1="265.938" y1="129.54" x2="251.46" y2="129.54" width="0.1524" layer="92"/>
<wire x1="251.46" y1="129.54" x2="237.998" y2="129.54" width="0.1524" layer="92"/>
<wire x1="237.998" y1="129.54" x2="199.898" y2="129.54" width="0.1524" layer="92"/>
<wire x1="199.898" y1="129.54" x2="187.198" y2="129.54" width="0.1524" layer="92"/>
<wire x1="187.198" y1="129.54" x2="154.178" y2="129.54" width="0.1524" layer="92"/>
<wire x1="154.178" y1="129.54" x2="68.58" y2="129.54" width="0.1524" layer="92"/>
<wire x1="68.58" y1="129.54" x2="-2.54" y2="129.54" width="0.1524" layer="92"/>
<wire x1="187.198" y1="129.54" x2="187.198" y2="101.854" width="0.1524" layer="92"/>
<wire x1="199.898" y1="129.54" x2="199.898" y2="101.854" width="0.1524" layer="92"/>
<wire x1="237.998" y1="129.54" x2="237.998" y2="101.854" width="0.1524" layer="92"/>
<wire x1="251.46" y1="129.54" x2="251.46" y2="102.362" width="0.1524" layer="92"/>
<wire x1="265.938" y1="129.54" x2="265.938" y2="101.854" width="0.1524" layer="92"/>
<wire x1="279.4" y1="129.54" x2="279.4" y2="101.6" width="0.1524" layer="92"/>
<wire x1="68.58" y1="129.54" x2="68.58" y2="86.36" width="0.1524" layer="92"/>
<wire x1="68.58" y1="86.36" x2="66.04" y2="86.36" width="0.1524" layer="92"/>
<wire x1="66.04" y1="86.36" x2="66.04" y2="83.82" width="0.1524" layer="92"/>
<wire x1="154.178" y1="129.54" x2="154.178" y2="101.854" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="292.1" y1="104.14" x2="205.994" y2="104.14" width="0.1524" layer="92"/>
<wire x1="205.994" y1="104.14" x2="137.16" y2="104.14" width="0.1524" layer="92"/>
<wire x1="137.16" y1="104.14" x2="111.76" y2="104.14" width="0.1524" layer="92"/>
<wire x1="111.76" y1="104.14" x2="63.5" y2="104.14" width="0.1524" layer="92"/>
<wire x1="63.5" y1="104.14" x2="48.26" y2="104.14" width="0.1524" layer="92"/>
<wire x1="48.26" y1="104.14" x2="48.26" y2="114.3" width="0.1524" layer="92"/>
<wire x1="63.5" y1="104.14" x2="63.5" y2="101.6" width="0.1524" layer="92"/>
<wire x1="111.76" y1="104.14" x2="111.76" y2="101.6" width="0.1524" layer="92"/>
<wire x1="137.16" y1="104.14" x2="137.16" y2="101.6" width="0.1524" layer="92"/>
<wire x1="205.994" y1="104.14" x2="205.994" y2="101.854" width="0.1524" layer="92"/>
</segment>
</bus>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="-2.54" y1="129.54" x2="-2.54" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="48.26" y1="139.7" x2="48.26" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="35.56" y1="137.16" x2="35.56" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="22.86" y1="134.62" x2="22.86" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="10.16" y1="132.08" x2="10.16" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="63.5" y1="66.04" x2="63.5" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="83.82" y1="48.26" x2="104.14" y2="48.26" width="0.1524" layer="91"/>
<wire x1="104.14" y1="48.26" x2="104.14" y2="45.974" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="106.68" y1="27.94" x2="106.68" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="134.62" y1="45.72" x2="134.62" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="172.72" y1="83.82" x2="172.72" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="187.96" y1="53.34" x2="187.96" y2="60.96" width="0.1524" layer="91"/>
<wire x1="187.96" y1="60.96" x2="210.82" y2="60.96" width="0.1524" layer="91"/>
<wire x1="210.82" y1="60.96" x2="210.82" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<wire x1="175.26" y1="63.5" x2="175.26" y2="36.322" width="0.1524" layer="91"/>
<wire x1="175.26" y1="36.322" x2="180.34" y2="36.322" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="213.36" y1="58.42" x2="213.36" y2="60.96" width="0.1524" layer="91"/>
<wire x1="213.36" y1="60.96" x2="218.44" y2="60.96" width="0.1524" layer="91"/>
<wire x1="218.44" y1="60.96" x2="218.44" y2="142.24" width="0.1524" layer="91"/>
<wire x1="213.36" y1="58.42" x2="200.66" y2="58.42" width="0.1524" layer="91"/>
<wire x1="200.66" y1="58.42" x2="200.66" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<wire x1="215.9" y1="53.34" x2="215.9" y2="58.42" width="0.1524" layer="91"/>
<wire x1="215.9" y1="58.42" x2="226.06" y2="58.42" width="0.1524" layer="91"/>
<wire x1="226.06" y1="58.42" x2="226.06" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<wire x1="233.68" y1="55.88" x2="233.68" y2="142.24" width="0.1524" layer="91"/>
<wire x1="233.68" y1="55.88" x2="231.14" y2="55.88" width="0.1524" layer="91"/>
<wire x1="231.14" y1="55.88" x2="231.14" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<wire x1="198.12" y1="35.56" x2="198.12" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<wire x1="213.36" y1="35.56" x2="213.36" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<wire x1="228.6" y1="35.56" x2="228.6" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<wire x1="254" y1="17.78" x2="254" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<wire x1="281.94" y1="83.82" x2="281.94" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="104.14" y1="81.28" x2="104.14" y2="83.82" width="0.1524" layer="91"/>
<wire x1="104.14" y1="83.82" x2="99.06" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="111.76" y1="83.82" x2="109.22" y2="83.82" width="0.1524" layer="91"/>
<wire x1="109.22" y1="83.82" x2="109.22" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="139.7" y1="83.82" x2="134.62" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="127" y1="83.82" x2="129.54" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="132.08" y1="66.04" x2="132.08" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="190.5" y1="83.82" x2="195.58" y2="83.82" width="0.1524" layer="91"/>
<wire x1="195.58" y1="83.82" x2="195.58" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="203.2" y1="83.82" x2="200.66" y2="83.82" width="0.1524" layer="91"/>
<wire x1="200.66" y1="83.82" x2="200.66" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="182.88" y1="55.88" x2="182.88" y2="53.34" width="0.1524" layer="91"/>
<wire x1="182.88" y1="55.88" x2="195.58" y2="55.88" width="0.1524" layer="91"/>
<wire x1="195.58" y1="55.88" x2="195.58" y2="53.34" width="0.1524" layer="91"/>
<wire x1="195.58" y1="55.88" x2="198.12" y2="55.88" width="0.1524" layer="91"/>
<wire x1="198.12" y1="55.88" x2="210.82" y2="55.88" width="0.1524" layer="91"/>
<wire x1="210.82" y1="55.88" x2="210.82" y2="53.34" width="0.1524" layer="91"/>
<wire x1="210.82" y1="55.88" x2="226.06" y2="55.88" width="0.1524" layer="91"/>
<wire x1="226.06" y1="55.88" x2="226.06" y2="53.34" width="0.1524" layer="91"/>
<wire x1="198.12" y1="55.88" x2="198.12" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="254" y1="83.82" x2="254" y2="82.042" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="256.54" y1="82.042" x2="269.24" y2="82.042" width="0.1524" layer="91"/>
<wire x1="269.24" y1="82.042" x2="269.24" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="251.46" y1="82.042" x2="241.3" y2="82.042" width="0.1524" layer="91"/>
<wire x1="241.3" y1="82.042" x2="241.3" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="157.48" y1="83.82" x2="157.48" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
