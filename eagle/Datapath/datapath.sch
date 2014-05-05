<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="1" unitdist="mm" unit="mm" style="lines" multiple="1" display="yes" altdistance="1" altunitdist="mm" altunit="mm"/>
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
<wire x1="0" y1="0" x2="0" y2="160" width="0.1524" layer="94"/>
<wire x1="0" y1="160" x2="20" y2="160" width="0.1524" layer="94"/>
<wire x1="40" y1="160" x2="50" y2="160" width="0.1524" layer="94"/>
<wire x1="50" y1="160" x2="130" y2="160" width="0.1524" layer="94"/>
<wire x1="130" y1="160" x2="140" y2="160" width="0.1524" layer="94"/>
<wire x1="140" y1="160" x2="160" y2="160" width="0.1524" layer="94"/>
<wire x1="160" y1="160" x2="160" y2="40" width="0.1524" layer="94"/>
<wire x1="160" y1="40" x2="160" y2="0" width="0.1524" layer="94"/>
<wire x1="160" y1="0" x2="140" y2="0" width="0.1524" layer="94"/>
<wire x1="140" y1="0" x2="130" y2="0" width="0.1524" layer="94"/>
<wire x1="130" y1="0" x2="50" y2="0" width="0.1524" layer="94"/>
<wire x1="50" y1="0" x2="40" y2="0" width="0.1524" layer="94"/>
<wire x1="40" y1="0" x2="20" y2="0" width="0.1524" layer="94"/>
<wire x1="20" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="20" y1="0" x2="20" y2="50" width="0.1524" layer="94"/>
<wire x1="20" y1="50" x2="20" y2="80" width="0.1524" layer="94"/>
<wire x1="20" y1="80" x2="20" y2="160" width="0.1524" layer="94"/>
<wire x1="20" y1="160" x2="40" y2="160" width="0.1524" layer="94"/>
<wire x1="40" y1="160" x2="40" y2="80" width="0.1524" layer="94"/>
<wire x1="40" y1="80" x2="40" y2="50" width="0.1524" layer="94"/>
<wire x1="40" y1="40" x2="40" y2="0" width="0.1524" layer="94"/>
<wire x1="50" y1="0" x2="50" y2="40" width="0.1524" layer="94"/>
<wire x1="50" y1="40" x2="50" y2="50" width="0.1524" layer="94"/>
<wire x1="50" y1="50" x2="50" y2="160" width="0.1524" layer="94"/>
<wire x1="130" y1="160" x2="130" y2="80" width="0.1524" layer="94"/>
<wire x1="130" y1="80" x2="130" y2="0" width="0.1524" layer="94"/>
<wire x1="140" y1="0" x2="140" y2="40" width="0.1524" layer="94"/>
<wire x1="140" y1="40" x2="140" y2="80" width="0.1524" layer="94"/>
<wire x1="140" y1="80" x2="140" y2="160" width="0.1524" layer="94"/>
<wire x1="140" y1="40" x2="160" y2="40" width="0.1524" layer="94"/>
<wire x1="50" y1="40" x2="40" y2="40" width="0.1524" layer="94"/>
<wire x1="40" y1="40" x2="40" y2="50" width="0.1524" layer="94"/>
<wire x1="40" y1="50" x2="50" y2="50" width="0.1524" layer="94"/>
<wire x1="20" y1="50" x2="40" y2="50" width="0.1524" layer="94"/>
<wire x1="20" y1="80" x2="40" y2="80" width="0.1524" layer="94"/>
<wire x1="0" y1="170" x2="0" y2="160" width="0.1524" layer="94"/>
<wire x1="0" y1="170" x2="160" y2="170" width="0.1524" layer="94"/>
<wire x1="160" y1="170" x2="160" y2="160" width="0.1524" layer="94"/>
<text x="13" y="60" size="6.4516" layer="94" rot="R90">Left Buffers</text>
<text x="34" y="111" size="6.4516" layer="94" rot="R90">IrAA</text>
<text x="34" y="56" size="6.4516" layer="94" rot="R90">IrBA</text>
<text x="34" y="12" size="6.4516" layer="94" rot="R90">IrBB</text>
<text x="48" y="5" size="6.4516" layer="94" rot="R90">Tie Low</text>
<text x="48" y="80" size="6.4516" layer="94" rot="R90">Tie Low</text>
<text x="52" y="42" size="6.4516" layer="94">Tie High</text>
<text x="59" y="77" size="6.4516" layer="94">Datapath slices</text>
<text x="139" y="103" size="6.4516" layer="94" rot="R90">LUI Cell</text>
<text x="139" y="25" size="6.4516" layer="94" rot="R90">LLI Cell</text>
<text x="154" y="65" size="6.4516" layer="94" rot="R90">Datapath High Slice</text>
<text x="159" y="1" size="6.4516" layer="94" rot="R90">Datapath 
Low Slice</text>
<wire x1="130" y1="80" x2="140" y2="80" width="0.1524" layer="94"/>
<wire x1="53" y1="45" x2="46" y2="43" width="0.1524" layer="94"/>
<text x="63" y="162" size="6.4516" layer="94">Slice17</text>
</plain>
<instances>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
