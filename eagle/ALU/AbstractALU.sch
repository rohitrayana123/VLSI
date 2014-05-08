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
<wire x1="5.08" y1="78.74" x2="15.24" y2="78.74" width="0.1524" layer="94"/>
<wire x1="15.24" y1="78.74" x2="15.24" y2="71.12" width="0.1524" layer="94"/>
<wire x1="15.24" y1="71.12" x2="5.08" y2="71.12" width="0.1524" layer="94"/>
<wire x1="5.08" y1="71.12" x2="5.08" y2="78.74" width="0.1524" layer="94"/>
<wire x1="17.78" y1="78.74" x2="17.78" y2="71.12" width="0.1524" layer="94"/>
<wire x1="17.78" y1="71.12" x2="27.94" y2="71.12" width="0.1524" layer="94"/>
<wire x1="27.94" y1="71.12" x2="27.94" y2="78.74" width="0.1524" layer="94"/>
<wire x1="27.94" y1="78.74" x2="17.78" y2="78.74" width="0.1524" layer="94"/>
<wire x1="30.48" y1="78.74" x2="30.48" y2="71.12" width="0.1524" layer="94"/>
<wire x1="30.48" y1="71.12" x2="43.18" y2="71.12" width="0.1524" layer="94"/>
<wire x1="43.18" y1="78.74" x2="30.48" y2="78.74" width="0.1524" layer="94"/>
<text x="7.62" y="73.66" size="1.778" layer="94">Arith</text>
<text x="7.62" y="73.66" size="1.778" layer="94">Arith</text>
<text x="20.32" y="73.66" size="1.778" layer="94">Logic</text>
<text x="20.32" y="73.66" size="1.778" layer="94">Logic</text>
<text x="33.02" y="73.66" size="1.778" layer="94">Shifting</text>
<text x="33.02" y="73.66" size="1.778" layer="94">Shifting</text>
<wire x1="43.18" y1="78.74" x2="43.18" y2="71.12" width="0.1524" layer="94"/>
<wire x1="48.26" y1="78.74" x2="48.26" y2="71.12" width="0.1524" layer="94"/>
<wire x1="48.26" y1="71.12" x2="55.88" y2="71.12" width="0.1524" layer="94"/>
<wire x1="55.88" y1="78.74" x2="48.26" y2="78.74" width="0.1524" layer="94"/>
<text x="50.8" y="73.66" size="1.778" layer="94">LLI</text>
<wire x1="55.88" y1="71.12" x2="55.88" y2="78.74" width="0.1524" layer="94"/>
<text x="2.54" y="76.2" size="1.778" layer="91">A</text>
<text x="2.54" y="76.2" size="1.778" layer="91">A</text>
<text x="2.54" y="73.66" size="1.778" layer="91">B</text>
<text x="2.54" y="73.66" size="1.778" layer="91">B</text>
<text x="50.8" y="66.04" size="1.778" layer="92">SysBus</text>
<text x="12.7" y="66.04" size="1.778" layer="92">ALUBus</text>
</plain>
<instances>
</instances>
<busses>
<bus name="B$1">
<segment>
<wire x1="50.8" y1="68.58" x2="50.8" y2="71.12" width="0.1524" layer="92"/>
<wire x1="50.8" y1="68.58" x2="55.88" y2="68.58" width="0.1524" layer="92"/>
</segment>
<segment>
<wire x1="12.7" y1="71.12" x2="12.7" y2="68.58" width="0.1524" layer="92"/>
<wire x1="12.7" y1="68.58" x2="25.4" y2="68.58" width="0.1524" layer="92"/>
<wire x1="25.4" y1="68.58" x2="40.64" y2="68.58" width="0.1524" layer="92"/>
<wire x1="25.4" y1="68.58" x2="25.4" y2="71.12" width="0.1524" layer="92"/>
<wire x1="40.64" y1="68.58" x2="40.64" y2="71.12" width="0.1524" layer="92"/>
<wire x1="40.64" y1="68.58" x2="45.72" y2="68.58" width="0.1524" layer="92"/>
<wire x1="45.72" y1="68.58" x2="45.72" y2="73.66" width="0.1524" layer="92"/>
<wire x1="45.72" y1="73.66" x2="48.26" y2="73.66" width="0.1524" layer="92"/>
</segment>
</bus>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="2.54" y1="76.2" x2="5.08" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="15.24" y1="76.2" x2="17.78" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="27.94" y1="76.2" x2="30.48" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="2.54" y1="73.66" x2="5.08" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="15.24" y1="73.66" x2="17.78" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="27.94" y1="73.66" x2="30.48" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="43.18" y1="76.2" x2="48.26" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
